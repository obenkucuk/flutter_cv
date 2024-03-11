import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/router/routes/main_shell.dart';

class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future<void>.delayed(const Duration(milliseconds: 100))
            .then((_) => const AboutRoute().go(context));
        return null;
      },
      const [],
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash'),
            MaterialButton(
              onPressed: () => const AboutRoute().go(context),
              child: const Text('Go to main'),
            ),
          ],
        ),
      ),
    );
  }
}
