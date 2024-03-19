import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'config/flavor/flavor_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) usePathUrlStrategy();

  const flavorModel = FlavorModel(
    flavorType: FlavorType.DEVELOPMENT,
    name: 'Github CV Development',
    debugShowCheckedModeBanner: true,
  );

  runApp(
    const ProviderScope(
      child: MyApp(flavorModel: flavorModel),
    ),
  );
}
