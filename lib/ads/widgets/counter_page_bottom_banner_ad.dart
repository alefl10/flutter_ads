import 'package:flutter/material.dart';
import 'package:flutter_ads/ads/ads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CounterPageBottomBannerAd extends StatefulWidget {
  const CounterPageBottomBannerAd({super.key});

  static const height = 72.0;

  @override
  State<CounterPageBottomBannerAd> createState() =>
      _CounterPageBottomBannerAdState();
}

class _CounterPageBottomBannerAdState extends State<CounterPageBottomBannerAd> {
  late AdsBloc adsBloc;

  @override
  void dispose() {
    adsBloc.add(AdsCounterPageBottomBannerAdDisposed());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adsBloc = context.read<AdsBloc>()
      ..add(AdsCounterPageBottomBannerAdRequested());

    return BlocBuilder<AdsBloc, AdsState>(
      buildWhen: (pre, cur) =>
          pre.counterPageBottomBannerAd != cur.counterPageBottomBannerAd,
      builder: (context, state) {
        if (!state.didCounterPageBottomBannerAdLoad) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          width: double.infinity,
          height: CounterPageBottomBannerAd.height,
          child: Stack(
            children: [
              AdWidget(ad: state.counterPageBottomBannerAd!),
              RemoveAdButton(
                onTap: () {
                  adsBloc.add(AdsCounterPageBottomBannerAdDisposed());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
