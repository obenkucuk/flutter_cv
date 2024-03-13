import 'package:flutter/material.dart';
// import 'dart:ui' as UI;

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Planets();

    // return Scaffold(
    //   body: Builder(
    //     builder: (context) {
    //       return const Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           // MyIcons.qr404
    //           //     .toWidget(size: 400, isColorful: true)
    //           //     .animate(
    //           //       onPlay: (controller) => controller.repeat(),
    //           //     )
    //           //     .shimmer(
    //           //       duration: const Duration(seconds: 2),
    //           //       color: Theme.of(context).primaryColor,
    //           //     ),

    //           // Column(
    //           //   mainAxisAlignment: MainAxisAlignment.center,
    //           //   crossAxisAlignment: CrossAxisAlignment.start,
    //           //   children: [
    //           //     ColoredBox(
    //           //       color: Colors.indigo,
    //           //       child: Row(
    //           //         textBaseline: TextBaseline.ideographic,
    //           //         crossAxisAlignment: CrossAxisAlignment.baseline,
    //           //         children: [
    //           //           Text('4', style: s24W300.copyWith(fontSize: 80)),
    //           //           Text('0', style: s24W300.copyWith(fontSize: 60)),
    //           //           Text('4', style: s24W300.copyWith(fontSize: 80)),
    //           //         ],
    //           //       ),
    //           //     ),
    //           //     Text('Oppps!\nPage not found', style: s24W700.copyWith(fontSize: 30)),
    //           //     CupertinoButton(
    //           //       padding: EdgeInsets.zero,
    //           //       child: DecoratedBox(
    //           //         decoration: BoxDecoration(
    //           //           borderRadius: BorderRadius.circular(500),
    //           //           border: Border.all(color: Theme.of(context).primaryColor),
    //           //         ),
    //           //         child: const Padding(
    //           //           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //           //           child: Text('Take me home'),
    //           //         ),
    //           //       ),
    //           //       onPressed: () => const AboutRoute().go(context),
    //           //     ),
    //           //   ],
    //           // ),
    //         ],
    //       );
    //     },
    //   ),
    // );
  }
}

class Planets extends StatefulWidget {
  const Planets({
    super.key,
  });

  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Center(
            child: CustomPaint(
              painter: AtomPaint(
                value: _controller.value,
                value1: _controller1.value,
                value2: _controller2.value,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _controller.reset();
          _controller1.reset();
          _controller2.reset();
          _controller.repeat();
          _controller1.repeat();
          _controller2.repeat();
        },
      ),
    );
  }
}

class AtomPaint extends CustomPainter {
  AtomPaint({
    required this.value,
    required this.value1,
    required this.value2,
  });

  final double value;
  final double value1;
  final double value2;

  final _axisPaint = Paint()
    ..color = Colors.amber
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 20, Paint()..color = Colors.yellow);
    drawAxis(value, canvas, 60, Paint()..color = Colors.grey);
    drawAxis(value1, canvas, 120, Paint()..color = Colors.brown);
    drawAxis(value2, canvas, 140, Paint()..color = Colors.blueAccent);
    drawAxis(value, canvas, 160, Paint()..color = Colors.redAccent);
    drawAxis(value1, canvas, 180, Paint()..color = Colors.lightGreen);
    drawAxis(value2, canvas, 200, Paint()..color = Colors.purpleAccent);
  }

  void drawAxis(double value, Canvas canvas, double radius, Paint paint) {
    final firstAxis = getCirclePath(radius);
    canvas.drawPath(firstAxis, _axisPaint);
    final pathMetrics = firstAxis.computeMetrics();
    for (final pathMetric in pathMetrics) {
      final extractPath = pathMetric.extractPath(0, pathMetric.length * value);
      try {
        final metric = extractPath.computeMetrics().first;
        final offset = metric.getTangentForOffset(metric.length)!.position;
        canvas.drawCircle(offset, 12, paint);
      } catch (_) {}
    }
  }

  Path getCirclePath(double radius) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: radius * 2, height: radius * 2),
        const Radius.circular(10),
      ),
    );

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


// class BorderPainter extends CustomPainter {
//   BorderPainter({
//     this.dotLength = 10,
//     this.strokeWidth = 2,
//     this.radius = 20,
//     this.dotColor = Colors.white,
//     required this.animation,
//   }) : super(repaint: animation);

//   final double dotLength;
//   final double strokeWidth;
//   final double radius;
//   final Color dotColor;
//   final AnimationController animation;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = dotColor
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final rRect = RRect.fromRectAndRadius(
//       Rect.fromPoints(
//         Offset.zero,
//         Offset(size.width, size.height),
//       ),
//       Radius.circular(radius),
//     );
//     final path = Path()..addRRect(rRect);

//     canvas.drawRRect(
//       rRect,
//       Paint()
//         ..color = Colors.green
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 0.5,
//     );

    // var subPath = Path();
    // final metric = path.computeMetrics().first;
    // final perimeter = metric.length;

    // subPath = metric.extractPath(perimeter * animation.value, perimeter * animation.value + 50);

    // subPath.addPath(subPath, Offset.zero);

    // canvas.drawPath(subPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }


