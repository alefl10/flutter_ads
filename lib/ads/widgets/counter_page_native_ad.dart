import 'package:flutter/material.dart';
import 'package:flutter_ads/ads/ads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CounterPageNativeAd extends StatefulWidget {
  const CounterPageNativeAd({super.key});

  @override
  State<CounterPageNativeAd> createState() => _CounterPageNativeAdState();
}

class _CounterPageNativeAdState extends State<CounterPageNativeAd> {
  late AdsBloc adsBloc;

  @override
  void dispose() {
    adsBloc.add(AdsCounterPageNativeAdDisposed());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adsBloc = context.read<AdsBloc>()..add(AdsCounterPageNativeAdRequested());

    return BlocBuilder<AdsBloc, AdsState>(
      buildWhen: (pre, cur) =>
          pre.counterPageNativeAd != cur.counterPageNativeAd,
      builder: (context, state) {
        if (!state.didCounterPageNativeAdLoad) return const SizedBox.shrink();
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 320, // minimum recommended width
            minHeight: 320, // minimum recommended height
            maxHeight: 320,
          ),
          child: Stack(
            children: [
              AdWidget(ad: state.counterPageNativeAd!),
              RemoveAdButton(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 16, top: 16),
                onTap: () {
                  adsBloc.add(AdsCounterPageNativeAdDisposed());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
