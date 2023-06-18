// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ads_bloc.dart';

class AdsState extends Equatable {
  const AdsState({
    this.counterPageBottomBannerAd,
    this.counterPageTopBannerAd,
    this.counterPageNativeAd,
    this.counterPagePlusCheckInterstitialAd,
    this.counterPageMinusCheckInterstitialAd,
  });

  final BannerAd? counterPageBottomBannerAd;
  final BannerAd? counterPageTopBannerAd;
  final NativeAd? counterPageNativeAd;
  final InterstitialAd? counterPagePlusCheckInterstitialAd;
  final InterstitialAd? counterPageMinusCheckInterstitialAd;

  bool get didCounterPageBottomBannerAdLoad =>
      counterPageBottomBannerAd != null;
  bool get didCounterPageTopBannerAdLoad => counterPageTopBannerAd != null;
  bool get didCounterPagePlusCheckInterstitialAdAdLoad =>
      counterPagePlusCheckInterstitialAd != null;
  bool get didCounterPageMinusCheckInterstitialAdAdLoad =>
      counterPageMinusCheckInterstitialAd != null;
  bool get didCounterPageNativeAdLoad => counterPageNativeAd != null;

  @override
  List<Object?> get props => [
        counterPageBottomBannerAd,
        counterPageTopBannerAd,
        counterPageNativeAd,
        counterPagePlusCheckInterstitialAd,
        counterPageMinusCheckInterstitialAd,
      ];

  AdsState copyWith({
    BannerAd? counterPageBottomBannerAd,
    BannerAd? counterPageTopBannerAd,
    NativeAd? counterPageNativeAd,
    InterstitialAd? counterPagePlusCheckInterstitialAd,
    InterstitialAd? counterPageMinusCheckInterstitialAd,
  }) {
    return AdsState(
      counterPageBottomBannerAd:
          counterPageBottomBannerAd ?? this.counterPageBottomBannerAd,
      counterPageTopBannerAd:
          counterPageTopBannerAd ?? this.counterPageTopBannerAd,
      counterPageNativeAd: counterPageNativeAd ?? this.counterPageNativeAd,
      counterPagePlusCheckInterstitialAd: counterPagePlusCheckInterstitialAd ??
          this.counterPagePlusCheckInterstitialAd,
      counterPageMinusCheckInterstitialAd:
          counterPageMinusCheckInterstitialAd ??
              this.counterPageMinusCheckInterstitialAd,
    );
  }

  AdsState copyWithoutCounterPageBottomBannerAd() {
    return AdsState(
      counterPageTopBannerAd: counterPageTopBannerAd,
      counterPageNativeAd: counterPageNativeAd,
      counterPagePlusCheckInterstitialAd: counterPagePlusCheckInterstitialAd,
      counterPageMinusCheckInterstitialAd: counterPageMinusCheckInterstitialAd,
    );
  }

  AdsState copyWithoutCounterPageTopBannerAd() {
    return AdsState(
      counterPageBottomBannerAd: counterPageBottomBannerAd,
      counterPageNativeAd: counterPageNativeAd,
      counterPagePlusCheckInterstitialAd: counterPagePlusCheckInterstitialAd,
      counterPageMinusCheckInterstitialAd: counterPageMinusCheckInterstitialAd,
    );
  }

  AdsState copyWithoutCounterPageNativeAd() {
    return AdsState(
      counterPageTopBannerAd: counterPageTopBannerAd,
      counterPageBottomBannerAd: counterPageBottomBannerAd,
      counterPagePlusCheckInterstitialAd: counterPagePlusCheckInterstitialAd,
      counterPageMinusCheckInterstitialAd: counterPageMinusCheckInterstitialAd,
    );
  }

  AdsState copyWithoutCounterPagePlusCheckInterstitialAd() {
    return AdsState(
      counterPageBottomBannerAd: counterPageBottomBannerAd,
      counterPageTopBannerAd: counterPageTopBannerAd,
      counterPageNativeAd: counterPageNativeAd,
      counterPageMinusCheckInterstitialAd: counterPageMinusCheckInterstitialAd,
    );
  }

  AdsState copyWithoutCounterPageMinusCheckInterstitialAd() {
    return AdsState(
      counterPageBottomBannerAd: counterPageBottomBannerAd,
      counterPageTopBannerAd: counterPageTopBannerAd,
      counterPageNativeAd: counterPageNativeAd,
      counterPagePlusCheckInterstitialAd: counterPagePlusCheckInterstitialAd,
    );
  }
}
