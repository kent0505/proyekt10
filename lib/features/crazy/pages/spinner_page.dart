import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/crazy_appbar.dart';
import '../widgets/crazy_scaffold.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  double turns = 0.0;
  double angle = 0;
  bool active = true;

  List<double> angles = [
    2, // 15
    4, // 5
    14, // 10
    16, // 20
    20, // 1
  ];

  int getCoins() {
    if (angle == 2) {
      return 15;
    } else if (angle == 4) {
      return 5;
    } else if (angle == 14) {
      return 10;
    } else if (angle == 16) {
      return 20;
    } else {
      return 1;
    }
  }

  void onSpin() {
    setState(() {
      active = false;
      turns += 5 / 1;
    });
    getRandom();
    Future.delayed(const Duration(seconds: 7), () {
      // show dialog
    });
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        print(angle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CrazyScaffold(
      body: Column(
        children: [
          const SizedBox(height: 18),
          const CrazyAppbar(),
          const SizedBox(height: 40),
          const Text(
            'Get the opportunity to earn extra\npoints by spinning the wheel.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Positioned(
                bottom: 14,
                right: -10,
                left: -10,
                child: Container(
                  height: 422,
                  width: 422,
                  decoration: BoxDecoration(
                    color: const Color(0xff2A0071),
                    borderRadius: BorderRadius.circular(220),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
                child: Transform.rotate(
                  angle: angle,
                  child: AnimatedRotation(
                    duration: const Duration(seconds: 6),
                    curve: Curves.easeInOutCirc,
                    turns: turns,
                    child: SizedBox(
                      // width: 400,
                      height: 400,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset('assets/spinner0.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner1.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner2.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner3.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/spinner4.svg'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _SpinButton(onSpin),
        ],
      ),
    );
  }
}

class _SpinButton extends StatelessWidget {
  const _SpinButton(this.onPressed);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 172,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff1F7600)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff5FBD00),
            Color(0xff6AD300),
            Color(0xff0E8104),
          ],
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: const Center(
          child: Text(
            'Spin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
