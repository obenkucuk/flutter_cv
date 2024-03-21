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

  final firebase = !kIsWeb
      ? await Firebase.initializeApp()
      : await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyD0Ga_rTkdy-O7dyk_tP3peVtH5vuw0Mwk',
            appId: '1:119079047250:web:1b2103f90c00cbcf308f8b',
            messagingSenderId: '119079047250',
            projectId: 'obenkucuk-cv-prod',
            measurementId: 'G-TPKX6FSW72',
            authDomain: 'obenkucuk-cv-prod.firebaseapp.com',
            storageBucket: 'obenkucuk-cv-prod.appspot.com',
          ),
        );

  // ignore: avoid_print
  print(
    'App Name: ${packageInfo.appName}, Version: ${packageInfo.version}, Bundle ID: ${packageInfo.packageName}, Firebase: ${firebase.options.apiKey}, Firebase ID: ${firebase.options.projectId}',
  );

  const flavorModel = FlavorModel(
    flavor: Flavors.PRODUCTION,
    name: 'Github CV',
  );

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 100,
              ),
              Text(
                'Oops... something went wrong',
              ),
            ],
          ),
        ),
      ),
    );
  };

  runApp(
    const ProviderScope(child: MyApp(flavorModel: flavorModel)),
  );
}
