import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/sweet_appbar.dart';
import '../widgets/sweet_scaffold.dart';
import '../widgets/timer_card.dart';

class SweetPage extends StatefulWidget {
  const SweetPage({super.key});

  @override
  State<SweetPage> createState() => _SweetPageState();
}

class _SweetPageState extends State<SweetPage> {
  late Timer _timer;
  int _start = 180;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 180;
            startTimer();
          });
        } else {
          setState(() {
            _start--;
            log(_start.toString());
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SweetScaffold(
      body: Column(
        children: [
          const SizedBox(height: 18),
          const SweetAppbar(),
          const SizedBox(height: 40),
          TimerCard(sec: _start),
        ],
      ),
    );
  }
}
