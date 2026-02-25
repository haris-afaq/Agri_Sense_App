import 'dart:io';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ScanningOverlay extends StatefulWidget {
  final File image;
  const ScanningOverlay({super.key, required this.image});

  @override
  State<ScanningOverlay> createState() => _ScanningOverlayState();
}

class _ScanningOverlayState extends State<ScanningOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCorner(double top, double left, double width, double height) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border(
            top: BorderSide(color: AppColors.lightGreenColor, width: 10),
            left: BorderSide(color:AppColors.lightGreenColor, width: 10),
          ),
        ),
      ),
    );
  }

  Widget _buildCornerBottomRight(double bottom, double right, double width, double height) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border(
            bottom: BorderSide(color: AppColors.lightGreenColor, width: 10),
            right: BorderSide(color: AppColors.lightGreenColor, width: 10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  widget.image,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              // Top-left corner
              _buildCorner(0, 0, 40, 40),
              // Top-right corner
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border(
                        top: BorderSide(color: AppColors.lightGreenColor, width: 10),
                        right: BorderSide(color: AppColors.lightGreenColor, width: 10),
                      ),
                    ),
                  )),

              // Bottom-left corner
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border(
                        bottom: BorderSide(color: AppColors.lightGreenColor, width: 10),
                        left: BorderSide(color: AppColors.lightGreenColor, width: 10),
                      ),
                    ),
                  )),

              // Bottom-right corner
              _buildCornerBottomRight(0, 0, 40, 40),

              // Scanning line animation
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Positioned(
                    top: 300 * _animation.value,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 3,
                      color: Colors.lightGreenAccent.withOpacity(0.8),
                    ),
                  );
                },
              ),

              // Analyzing text
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Analyzing Image...",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}