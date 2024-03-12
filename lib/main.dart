import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/router/go_router_provider.dart';
import 'config/theme/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) usePathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: const Size(430, 932),
    );

    final myThemeState = ref.watch(myThemeProvider);
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: myThemeState.myThemeData.light,
      darkTheme: myThemeState.myThemeData.dark,
      themeMode: myThemeState.themeMode,
      themeAnimationCurve: Curves.easeInOutCubicEmphasized,
      themeAnimationDuration: const Duration(milliseconds: 500),
    );
  }
}
