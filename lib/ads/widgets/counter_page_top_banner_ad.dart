import 'package:flutter/material.dart';
import 'package:flutter_ads/ads/ads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CounterPageTopBannerAd extends StatefulWidget {
  const CounterPageTopBannerAd({super.key});

  static const height = 72.0;

  @override
  State<CounterPageTopBannerAd> createState() => _CounterPageTopBannerAdState();
}

class _CounterPageTopBannerAdState extends State<CounterPageTopBannerAd> {
  late AdsBloc adsBloc;

  @override
  void dispose() {
    adsBloc.add(AdsCounterPageTopBannerAdDisposed());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adsBloc = context.read<AdsBloc>()
      ..add(AdsCounterPageTopBannerAdRequested());

    return BlocBuilder<AdsBloc, AdsState>(
      buildWhen: (pre, cur) =>
          pre.counterPageTopBannerAd != cur.counterPageTopBannerAd,
      builder: (context, state) {
        if (!state.didCounterPageTopBannerAdLoad) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          width: double.infinity,
          height: CounterPageTopBannerAd.height,
          child: Stack(
            children: [
              AdWidget(ad: state.counterPageTopBannerAd!),
              RemoveAdButton(
                onTap: () {
                  adsBloc.add(AdsCounterPageTopBannerAdDisposed());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
