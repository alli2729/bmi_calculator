import 'package:flutter/material.dart';

class AnimatedSlider extends StatefulWidget {
  const AnimatedSlider({super.key, required this.value});
  final double value; // This should be between 0 and 50

  @override
  AnimatedSliderState createState() => AnimatedSliderState();
}

class AnimatedSliderState extends State<AnimatedSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animationController.value = widget.value / 50;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.1),
              gradient: const LinearGradient(colors: [
                Colors.green,
                Colors.lightGreenAccent,
                Colors.orange,
                Colors.redAccent,
                Color.fromARGB(255, 102, 19, 13),
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white,
                trackHeight: 0.1,
                thumbColor: Colors.white,
                overlayColor: Colors.white.withAlpha(1),
              ),
              child: Slider(
                min: 18.5,
                max: 35,
                value: _animationController.value * 50,
                onChanged: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
