/// {@template ads_client_exception}
/// Exception from the AdsClient.
/// {@endtemplate}
class AdsClientException implements Exception {
  /// {@macro ads_client_exception}
  const AdsClientException(this.error);

  /// The error which was caught.
  final Object error;
}
