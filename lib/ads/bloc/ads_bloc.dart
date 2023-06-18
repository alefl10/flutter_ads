import 'dart:async';

import 'package:ads_repo/ads_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  AdsBloc({
    required AdsRepo adsRepo,
  })  : _adsRepo = adsRepo,
        super(const AdsState()) {
    on<AdsCounterPageBottomBannerAdRequested>(
      _counterPageBottomBannerAdRequested,
    );
    on<AdsCounterPageBottomBannerAdDisposed>(
      _counterPageBottomBannerAdDisposed,
    );
    on<AdsCounterPageTopBannerAdRequested>(_counterPageTopBannerAdRequested);
    on<AdsCounterPageTopBannerAdDisposed>(_counterPageTopBannerAdDisposed);
    on<AdsCounterPageNativeAdRequested>(_counterPageNativeAdRequested);
    on<AdsCounterPageNativeAdDisposed>(_counterPageNativeAdDisposed);
    on<AdsCounterPagePlusCheckInterstitialAdRequested>(
      _counterPagePlusCheckInterstitialAdRequested,
    );
    on<AdsCounterPagePlusCheckInterstitialAdDisposed>(
      _counterPagePlusCheckInterstitialAdDisposed,
    );
    on<AdsCounterPageMinusCheckInterstitialAdRequested>(
      _counterPageMinusCheckInterstitialAdRequested,
    );
    on<AdsCounterPageMinusCheckInterstitialAdDisposed>(
      _counterPageMinusCheckInterstitialAdDisposed,
    );
  }
  final AdsRepo _adsRepo;

  FutureOr<void> _counterPageBottomBannerAdRequested(
    AdsCounterPageBottomBannerAdRequested event,
    Emitter<AdsState> emit,
  ) async {
    final pattern = await _adsRepo.getCounterPageBottomBannerAd();
    switch (pattern) {
      case (failure: null, value: final BannerAd ad):
        return emit(state.copyWith(counterPageBottomBannerAd: ad));
      case (failure: final RepoFailure<String> failure, value: null):
        addError(failure.error, failure.stackTrace);
    }
  }

  FutureOr<void> _counterPageBottomBannerAdDisposed(
    AdsCounterPageBottomBannerAdDisposed event,
    Emitter<AdsState> emit,
  ) {
    state.counterPageTopBannerAd?.dispose();
    emit(state.copyWithoutCounterPageBottomBannerAd());
  }

  FutureOr<void> _counterPageTopBannerAdRequested(
    AdsCounterPageTopBannerAdRequested event,
    Emitter<AdsState> emit,
  ) async {
    final pattern = await _adsRepo.getCounterPageTopBannerAd();
    switch (pattern) {
      case (failure: null, value: final BannerAd ad):
        return emit(state.copyWith(counterPageTopBannerAd: ad));
      case (failure: final RepoFailure<String> failure, value: null):
        addError(failure.error, failure.stackTrace);
    }
  }

  FutureOr<void> _counterPageTopBannerAdDisposed(
    AdsCounterPageTopBannerAdDisposed event,
    Emitter<AdsState> emit,
  ) {
    state.counterPageTopBannerAd?.dispose();
    emit(state.copyWithoutCounterPageTopBannerAd());
  }

  FutureOr<void> _counterPagePlusCheckInterstitialAdRequested(
    AdsCounterPagePlusCheckInterstitialAdRequested event,
    Emitter<AdsState> emit,
  ) async {
    if (state.didCounterPagePlusCheckInterstitialAdAdLoad) return;
    final pattern = await _adsRepo.getCounterPagePlusCheckInterstitialAd(
      onAdDismissedFullScreenContent: event.onAdDismissedFullScreenContent,
    );
    switch (pattern) {
      case (failure: null, value: final InterstitialAd ad):
        return emit(state.copyWith(counterPagePlusCheckInterstitialAd: ad));
      case (failure: final RepoFailure<String> failure, value: null):
        addError(failure.error, failure.stackTrace);
    }
  }

  FutureOr<void> _counterPagePlusCheckInterstitialAdDisposed(
    AdsCounterPagePlusCheckInterstitialAdDisposed event,
    Emitter<AdsState> emit,
  ) {
    state.counterPageMinusCheckInterstitialAd?.dispose();
    emit(state.copyWithoutCounterPagePlusCheckInterstitialAd());
  }

  FutureOr<void> _counterPageMinusCheckInterstitialAdRequested(
    AdsCounterPageMinusCheckInterstitialAdRequested event,
    Emitter<AdsState> emit,
  ) async {
    if (state.didCounterPageMinusCheckInterstitialAdAdLoad) return;
    final pattern = await _adsRepo.getCounterPageMinusCheckInterstitialAd(
      onAdDismissedFullScreenContent: event.onAdDismissedFullScreenContent,
    );
    switch (pattern) {
      case (failure: null, value: final InterstitialAd ad):
        return emit(state.copyWith(counterPageMinusCheckInterstitialAd: ad));
      case (failure: final RepoFailure<String> failure, value: null):
        addError(failure.error, failure.stackTrace);
    }
  }

  FutureOr<void> _counterPageMinusCheckInterstitialAdDisposed(
    AdsCounterPageMinusCheckInterstitialAdDisposed event,
    Emitter<AdsState> emit,
  ) {
    state.counterPageMinusCheckInterstitialAd?.dispose();
    emit(state.copyWithoutCounterPageMinusCheckInterstitialAd());
  }

  FutureOr<void> _counterPageNativeAdRequested(
    AdsCounterPageNativeAdRequested event,
    Emitter<AdsState> emit,
  ) async {
    final pattern = await _adsRepo.getCounterPageNativeAd();
    switch (pattern) {
      case (failure: null, value: final NativeAd ad):
        return emit(state.copyWith(counterPageNativeAd: ad));
      case (failure: final RepoFailure<String> failure, value: null):
        addError(failure.error, failure.stackTrace);
    }
  }

  FutureOr<void> _counterPageNativeAdDisposed(
    AdsCounterPageNativeAdDisposed event,
    Emitter<AdsState> emit,
  ) {
    state.counterPageNativeAd?.dispose();
    emit(state.copyWithoutCounterPageNativeAd());
  }
}
