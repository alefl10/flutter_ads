import 'package:ads_client/ads_client.dart';
import 'package:ads_repo/ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ads/app/app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<Widget> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  final adsClient = AdsClient();
  final adsRepo = AdsRepo(adsClient: adsClient);

  return App(adsRepo: adsRepo);
}
