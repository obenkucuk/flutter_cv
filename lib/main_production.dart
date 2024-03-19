import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'app.dart';
import 'config/flavor/flavor_model.dart';
import 'config/flavor/flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) usePathUrlStrategy();

  final packageInfo = await PackageInfo.fromPlatform();

  final firebase = await Firebase.initializeApp();

  // ignore: avoid_print
  print(
    'App Name: ${packageInfo.appName}, Version: ${packageInfo.version}, Bundle ID: ${packageInfo.packageName}, Firebase: ${firebase.options.apiKey}, Firebase ID: ${firebase.options.projectId}',
  );

  const flavorModel = FlavorModel(
    flavor: Flavors.PRODUCTION,
    name: 'Github CV',
  );

  runApp(
    const ProviderScope(child: MyApp(flavorModel: flavorModel)),
  );
}
