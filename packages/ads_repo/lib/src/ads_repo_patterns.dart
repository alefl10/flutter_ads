import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Base pattern for all return patterns at the Repository level.
typedef RepoPattern<O, S> = ({RepoFailure<O>? failure, S? value});

/// Pattern representing a failure returned a given Repository.
typedef RepoFailure<O> = ({Object error, StackTrace stackTrace, O? optional});

/// Pattern returned by any AdsRepo method that returns a [BannerAd].
typedef BannerAdPattern = RepoPattern<void, BannerAd>;

/// Pattern returned by any AdsRepo method that returns a [InterstitialAd].
typedef InterstitialAdPattern = RepoPattern<void, InterstitialAd>;

/// Pattern returned by any AdsRepo method that returns a [NativeAd].
typedef NativeAdPattern = RepoPattern<void, NativeAd>;
