import 'dart:async';
import 'dart:io';

import 'package:ads_client/ads_client.dart';
import 'package:ads_client/src/ads.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// {@template ads_client}
/// Client class to manage [Ad] serving.
/// {@endtemplate}
class AdsClient {
  /// {@macro ads_client}
  AdsClient() {
    _ads = _initializeAds();
  }

  late final Map<Ads, String> _ads;

  Map<Ads, String> _initializeAds() {
    final ads = <Ads, String>{};
    for (final ad in Ads.values) {
      if (Platform.isIOS) {
        if (kDebugMode) {
          ads[ad] = ad.iOSTest;
        } else {
          ads[ad] = ad.iOS;
        }
      } else {
        if (kDebugMode) {
          ads[ad] = ad.androidTest;
        } else {
          ads[ad] = ad.android;
        }
      }
    }

    return ads;
  }

  Future<BannerAd> _populateBannerAd({
    required String adUnitId,
    AdSize? size,
  }) async {
    try {
      final adCompleter = Completer<Ad?>();
      await BannerAd(
        adUnitId: adUnitId,
        size: size ?? AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: adCompleter.complete,
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            adCompleter.completeError(error);
          },
        ),
      ).load();

      final bannerAd = await adCompleter.future;
      if (bannerAd == null) {
        throw const AdsClientException('Banner Ad was null');
      }
      return bannerAd as BannerAd;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  Future<NativeAd> _populateNativeAd({
    required String adUnitId,
    TemplateType? templateType,
  }) async {
    try {
      final adCompleter = Completer<Ad?>();
      await NativeAd(
        adUnitId: adUnitId,
        listener: NativeAdListener(
          onAdLoaded: adCompleter.complete,
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            adCompleter.completeError(error);
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(
          templateType: templateType ?? TemplateType.medium,
        ),
      ).load();
      final nativeAd = await adCompleter.future;
      if (nativeAd == null) {
        throw const AdsClientException('Native Ad was null');
      }
      return nativeAd as NativeAd;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  Future<InterstitialAd> _populateInterstitialAd({
    required String adUnitId,
    required VoidCallback onAdDismissedFullScreenContent,
  }) async {
    try {
      final adCompleter = Completer<Ad?>();
      await InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                onAdDismissedFullScreenContent();
              },
            );
            adCompleter.complete(ad);
          },
          onAdFailedToLoad: adCompleter.completeError,
        ),
      );

      final interstitialAd = await adCompleter.future;
      if (interstitialAd == null) {
        throw const AdsClientException('Interstitial Ad was null');
      }
      return interstitialAd as InterstitialAd;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  /// Gets a banner Ad positioned at the top of the Counter Page.
  Future<BannerAd> getCounterPageTopBannerAd() async {
    try {
      return await _populateBannerAd(adUnitId: _ads[Ads.counterPageTopBanner]!);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  /// Gets a banner Ad positioned at the bottom of the Counter Page.
  Future<BannerAd> getCounterPageBottomBannerAd() async {
    try {
      return await _populateBannerAd(
        adUnitId: _ads[Ads.counterPageBottomBanner]!,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  /// Gets an interstitial Ad displayed in the Counter Page
  ///  when users increment the counter to a given positive threshold.
  Future<InterstitialAd> getCounterPagePlusCheckInterstitialAd({
    required VoidCallback onAdDismissedFullScreenContent,
  }) async {
    try {
      return await _populateInterstitialAd(
        adUnitId: _ads[Ads.counterPagePlusCheckInterstitial]!,
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  /// Gets an interstitial Ad displayed in the Counter Page
  /// when users increment the counter to a given negative threshold.
  Future<InterstitialAd> getCounterPageMinusCheckInterstitialAd({
    required VoidCallback onAdDismissedFullScreenContent,
  }) async {
    try {
      return await _populateInterstitialAd(
        adUnitId: _ads[Ads.counterPageMinusCheckInterstitial]!,
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }

  /// Gets a native Ad displayed in the Counter Page.
  Future<NativeAd> getCounterPageNativeAd() async {
    try {
      return await _populateNativeAd(adUnitId: _ads[Ads.counterPageNative]!);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AdsClientException(error), stackTrace);
    }
  }
}
