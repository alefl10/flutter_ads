import 'package:ads_repo/ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ads/ads/ads.dart';
import 'package:flutter_ads/counter/counter.dart';
import 'package:flutter_ads/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => AdsBloc(adsRepo: context.read<AdsRepo>()),
        ),
      ],
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: CounterPageTopBannerAd(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CounterPageBottomBannerAd(),
          ),
          Center(
            child: CounterPageNativeAd(),
          ),
          Center(child: CounterText()),
        ],
      ),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PlusCounterButton(),
          SizedBox(height: 8),
          MinusCounterButton(),
        ],
      ),
    );
  }
}

class MinusCounterButton extends StatelessWidget {
  const MinusCounterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final adsBloc = context.read<AdsBloc>();
    final count = context.select((CounterCubit cubit) => cubit.state);

    return BlocListener<AdsBloc, AdsState>(
      listenWhen: (pre, cur) =>
          pre.counterPageMinusCheckInterstitialAd == null &&
          cur.counterPageMinusCheckInterstitialAd != null,
      listener: (context, state) {
        state.counterPageMinusCheckInterstitialAd?.show();
      },
      child: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().decrement();
          if (count % 5 == 0 && count < 0) {
            adsBloc.add(
              AdsCounterPageMinusCheckInterstitialAdRequested(
                onAdDismissedFullScreenContent: () {
                  adsBloc.add(
                    AdsCounterPageMinusCheckInterstitialAdDisposed(),
                  );
                },
              ),
            );
          }
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}

class PlusCounterButton extends StatelessWidget {
  const PlusCounterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final adsBloc = context.read<AdsBloc>();
    final count = context.select((CounterCubit cubit) => cubit.state);

    return BlocListener<AdsBloc, AdsState>(
      listenWhen: (pre, cur) =>
          pre.counterPagePlusCheckInterstitialAd == null &&
          cur.counterPagePlusCheckInterstitialAd != null,
      listener: (context, state) {
        state.counterPagePlusCheckInterstitialAd?.show();
      },
      child: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().increment();
          if (count % 5 == 0 && count > 0) {
            adsBloc.add(
              AdsCounterPagePlusCheckInterstitialAdRequested(
                onAdDismissedFullScreenContent: () {
                  adsBloc.add(AdsCounterPagePlusCheckInterstitialAdDisposed());
                },
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);

    return ClipOval(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 200,
          minHeight: 200,
        ),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$count',
              style: theme.textTheme.displayLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
