/// {@template ads}
/// Helper enum listing all the Counter Ads to be displayed.
///
/// It supports iOS and Android ads for both production and debug builds.
/// {@endtemplate}
enum Ads {
  /// Banner Ad positioned at the bottom of the Counter Page.
  counterPageBottomBanner(
    iOS: 'ca-app-pub-7287154298486616/4742754588',
    android: 'ca-app-pub-7287154298486616/1278152293',
    iOSTest: 'ca-app-pub-3940256099942544/2934735716',
    androidTest: 'ca-app-pub-3940256099942544/6300978111',
  ),

  /// Banner Ad positioned at the top of the Counter Page.
  counterPageTopBanner(
    iOS: 'ca-app-pub-7287154298486616/6438979635',
    android: 'ca-app-pub-7287154298486616/6054221858',
    iOSTest: 'ca-app-pub-3940256099942544/2934735716',
    androidTest: 'ca-app-pub-3940256099942544/6300978111',
  ),

  /// Interstitial Ad displayed in the Counter Page
  /// when users increment the counter to a given positive threshold.
  counterPagePlusCheckInterstitial(
    iOS: 'ca-app-pub-7287154298486616/5864264568',
    android: 'ca-app-pub-7287154298486616/8488813505',
    iOSTest: 'ca-app-pub-3940256099942544/4411468910',
    androidTest: 'ca-app-pub-3940256099942544/1033173712',
  ),

  /// Interstitial Ad displayed in the Counter Page
  /// when users increment the counter to a given negative threshold.
  counterPageMinusCheckInterstitial(
    iOS: 'ca-app-pub-7287154298486616/2498120224',
    android: 'ca-app-pub-7287154298486616/9228794506',
    iOSTest: 'ca-app-pub-3940256099942544/4411468910',
    androidTest: 'ca-app-pub-3940256099942544/1033173712',
  ),

  /// Native Ad displayed in the Counter Page.
  counterPageNative(
    iOS: 'ca-app-pub-7287154298486616/6454457353',
    android: 'ca-app-pub-7287154298486616/1923405151',
    iOSTest: 'ca-app-pub-3940256099942544/3986624511',
    androidTest: 'ca-app-pub-3940256099942544/2247696110',
  );

  const Ads({
    required this.iOS,
    required this.android,
    required this.iOSTest,
    required this.androidTest,
  });

  /// iOS Ad id.
  final String iOS;

  /// Android Ad id.
  final String android;

  /// iOS Ad id for testing.
  final String iOSTest;

  /// Android Ad id for testing.
  final String androidTest;
}
