import 'package:cv/config/flavor/flavors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'config/flavor/flavor_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) usePathUrlStrategy();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  print(
      'App Name: ${packageInfo.appName}, Version: ${packageInfo.version}, Bundle ID: ${packageInfo.packageName}');

  const flavorModel = FlavorModel(
    flavor: Flavors.DEVELOPMENT,
    name: 'Github CV Development',
  );

  runApp(
    const ProviderScope(child: MyApp(flavorModel: flavorModel)),
  );
}
