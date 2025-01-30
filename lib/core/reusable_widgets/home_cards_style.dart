
// 🎨 CustomPainter for Curved Slope with Rounded Bottom Corners
import 'package:flutter/material.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';


// 🎨 **Reusable Memorize Card Widget**
class MemorizeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color slopeColor;
  final Color containerColor;

  const MemorizeCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.slopeColor,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color:containerColor, // Light background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Stack(
        children: [
          // 🎨 Slope with Clipped Bottom Corners
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 120, // Adjust slope height
                child: CustomPaint(
                  painter: CurvySlopePainter(color: slopeColor),
                ),
              ),
            ),
          ),
          // 📌 Content (Dynamic Text + Image)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title, // Dynamic Title
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                imagePath, // Dynamic Image
                width: 80,
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class CurvySlopePainter extends CustomPainter {
  final Color color;

  CurvySlopePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, size.height * 0.3);
    path.cubicTo(
      size.width * 0.5, size.height * 0.5,
      size.width * 0.8, size.height * 1.2,
      size.width * 0.0, size.height * 0.8,
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}