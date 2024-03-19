import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/flavor/flavor_model.dart';
import 'config/router/go_router_provider.dart';
import 'config/theme/provider/provider.dart';

class MyApp extends ConsumerWidget {
  final FlavorModel flavorModel;
  const MyApp({
    super.key,
    required this.flavorModel,
  });

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
      debugShowCheckedModeBanner: flavorModel.debugShowCheckedModeBanner,
      routerConfig: goRouter,
      title: flavorModel.name,
      theme: myThemeState.myThemeData.light,
      darkTheme: myThemeState.myThemeData.dark,
      themeMode: myThemeState.themeMode,
      themeAnimationCurve: Curves.easeInOutCubicEmphasized,
      themeAnimationDuration: const Duration(milliseconds: 500),
    );
  }
}
