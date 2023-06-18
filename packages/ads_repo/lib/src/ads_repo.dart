import 'package:ads_client/ads_client.dart';
import 'package:ads_repo/ads_repo.dart';
import 'package:flutter/foundation.dart';

/// {@template ads_repo}
/// Repository class handling Ad serving
/// by leveraging the lower level [AdsClient].
/// {@endtemplate}
class AdsRepo {
  /// {@macro ads_repo}
  const AdsRepo({required AdsClient adsClient}) : _adsClient = adsClient;

  final AdsClient _adsClient;

  /// Gets a banner Ad positioned at the top of the Counter Page.
  Future<BannerAdPattern> getCounterPageTopBannerAd() async {
    try {
      final bannerAd = await _adsClient.getCounterPageTopBannerAd();
      return (failure: null, value: bannerAd);
    } catch (e, st) {
      return (
        failure: (
          error: e,
          stackTrace: st,
          optional: 'Exception caught in getCounterPageTopBannerAd'
        ),
        value: null,
      );
    }
  }

  /// Gets a banner Ad positioned at the bottom of the Counter Page.
  Future<BannerAdPattern> getCounterPageBottomBannerAd() async {
    try {
      final bannerAd = await _adsClient.getCounterPageBottomBannerAd();
      return (failure: null, value: bannerAd);
    } catch (e, st) {
      return (
        failure: (
          error: e,
          stackTrace: st,
          optional: 'Exception caught in getCounterPageBottomBannerAd'
        ),
        value: null,
      );
    }
  }

  /// Gets an interstitial Ad displayed in the Counter Page
  ///  when users increment the counter to a given positive threshold.
  Future<InterstitialAdPattern> getCounterPagePlusCheckInterstitialAd({
    required VoidCallback onAdDismissedFullScreenContent,
  }) async {
    try {
      final interstitialAd =
          await _adsClient.getCounterPagePlusCheckInterstitialAd(
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      );
      return (failure: null, value: interstitialAd);
    } catch (e, st) {
      return (
        failure: (
          error: e,
          stackTrace: st,
          optional: 'Exception caught in getCounterPagePlusCheckInterstitialAd',
        ),
        value: null,
      );
    }
  }

  /// Gets an interstitial Ad displayed in the Counter Page
  /// when users increment the counter to a given negative threshold.
  Future<InterstitialAdPattern> getCounterPageMinusCheckInterstitialAd({
    required VoidCallback onAdDismissedFullScreenContent,
  }) async {
    try {
      final interstitialAd =
          await _adsClient.getCounterPageMinusCheckInterstitialAd(
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      );
      return (failure: null, value: interstitialAd);
    } catch (e, st) {
      return (
        failure: (
          error: e,
          stackTrace: st,
          optional:
              'Exception caught in getCounterPageMinusCheckInterstitialAd',
        ),
        value: null,
      );
    }
  }

  /// Gets a native Ad displayed in the Counter Page.
  Future<NativeAdPattern> getCounterPageNativeAd() async {
    try {
      final nativeAd = await _adsClient.getCounterPageNativeAd();
      return (failure: null, value: nativeAd);
    } catch (e, st) {
      return (
        failure: (
          error: e,
          stackTrace: st,
          optional: 'Exception caught in getCounterPageNativeAd'
        ),
        value: null,
      );
    }
  }
}
