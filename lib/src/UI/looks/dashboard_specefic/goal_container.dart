import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoalContainer extends ConsumerWidget {
  const GoalContainer(
      {super.key,
      required this.title,
      required this.quantity,
      required this.subTitle,
      required this.darkColor,
      required this.lightColor,
      this.progress = 0.4,
      this.isWater = false});
  final String title;
  final Color darkColor;
  final Color lightColor;
  final String quantity;
  final String subTitle;
  final double progress;
  final bool isWater;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    final width = MediaQuery.of(context).size.width * 0.4;
    return Stack(
      children: [
        // Adding the wave pattern with CustomPaint
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: isWater
                ? CustomPaint(
                    painter: WavePainter(progress: progress),
                  )
                : Container(
                    width: width,
                    height: width * 1.2,
                    color: dark ? darkColor : lightColor),
          ),
        ),
        // Foreground container with borderRadius
        Center(
          child: Container(
            width: width,
            height: width * 1.2,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quantity,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;

  WavePainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade600.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    double waveHeight = size.height * (1 - progress);

    paint.color = Colors.blue.shade800.withOpacity(0.3);
    final path3 = Path();
    path3.moveTo(0, waveHeight + 20);
    path3.quadraticBezierTo(
        size.width * 0.25, waveHeight - 10, size.width * 0.5, waveHeight + 20);
    path3.quadraticBezierTo(
        size.width * 0.75, waveHeight + 50, size.width, waveHeight + 20);
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.close();
    canvas.drawPath(path3, paint);
    // Path for the first wave
    final path1 = Path();
    path1.moveTo(0, waveHeight);
    path1.quadraticBezierTo(
        size.width * 0.25, waveHeight - 30, size.width * 0.5, waveHeight);
    path1.quadraticBezierTo(
        size.width * 0.75, waveHeight + 30, size.width, waveHeight);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint);

    // Path for the second wave, slightly higher and lighter
    paint.color = Colors.blue.shade400.withOpacity(0.3);
    final path2 = Path();
    path2.moveTo(0, waveHeight - 20);
    path2.quadraticBezierTo(
        size.width * 0.25, waveHeight - 50, size.width * 0.5, waveHeight - 20);
    path2.quadraticBezierTo(
        size.width * 0.75, waveHeight + 10, size.width, waveHeight - 20);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
