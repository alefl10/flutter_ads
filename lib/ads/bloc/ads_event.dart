part of 'ads_bloc.dart';

@immutable
abstract class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class AdsCounterPageBottomBannerAdRequested extends AdsEvent {}

class AdsCounterPageBottomBannerAdDisposed extends AdsEvent {}

class AdsCounterPageTopBannerAdRequested extends AdsEvent {}

class AdsCounterPageTopBannerAdDisposed extends AdsEvent {}

class AdsCounterPageNativeAdRequested extends AdsEvent {}

class AdsCounterPageNativeAdDisposed extends AdsEvent {}

class AdsCounterPagePlusCheckInterstitialAdRequested extends AdsEvent {
  const AdsCounterPagePlusCheckInterstitialAdRequested({
    required this.onAdDismissedFullScreenContent,
  });

  final VoidCallback onAdDismissedFullScreenContent;

  @override
  List<Object> get props => [onAdDismissedFullScreenContent];
}

class AdsCounterPagePlusCheckInterstitialAdDisposed extends AdsEvent {}

class AdsCounterPageMinusCheckInterstitialAdRequested extends AdsEvent {
  const AdsCounterPageMinusCheckInterstitialAdRequested({
    required this.onAdDismissedFullScreenContent,
  });

  final VoidCallback onAdDismissedFullScreenContent;

  @override
  List<Object> get props => [onAdDismissedFullScreenContent];
}

class AdsCounterPageMinusCheckInterstitialAdDisposed extends AdsEvent {}
