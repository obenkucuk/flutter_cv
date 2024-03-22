import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/flavor/flavor_model.dart';
import 'config/router/go_router_provider.dart';
import 'config/theme/provider/provider.dart';

class MyApp extends ConsumerWidget {
  final FlavorModel flavorModel;
  const MyApp({super.key, required this.flavorModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: const Size(430, 932),
    );

    final myThemeState = ref.watch(myThemeProvider);
    final goRouter = ref.watch(goRouterProvider);

    final bannerPainter = BannerPainter(
      message: flavorModel.flavor.bannerName,
      textDirection: TextDirection.ltr,
      location: BannerLocation.topEnd,
      layoutDirection: TextDirection.ltr,
      color: flavorModel.flavor.bannerColor,
    );

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: CustomPaint(
        foregroundPainter: flavorModel.flavor.debugShowCheckedModeBanner ? bannerPainter : null,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: flavorModel.flavor.debugShowCheckedModeBanner,
          routerConfig: goRouter,
          title: flavorModel.name,
          theme: myThemeState.myThemeData.light,
          darkTheme: myThemeState.myThemeData.dark,
          themeMode: myThemeState.themeMode,
          themeAnimationCurve: Curves.easeInOutCubicEmphasized,
          themeAnimationDuration: const Duration(milliseconds: 500),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: CustomScrollBehaviour(),
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    if (kIsWeb) return super.getScrollPhysics(context);

    if (Platform.isAndroid) {
      return const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      );
    } else if (Platform.isIOS) {
      return super.getScrollPhysics(context);
    } else {
      return super.getScrollPhysics(context);
    }
  }
}
