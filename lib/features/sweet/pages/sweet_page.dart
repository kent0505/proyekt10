import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sweet_bloc.dart';
import '../widgets/pairs_count_card.dart';
import '../widgets/remember_text.dart';
import '../widgets/sweet_appbar.dart';
import '../widgets/sweet_scaffold.dart';
import '../widgets/sweets_list.dart';
import '../widgets/timer_card.dart';

class SweetPage extends StatefulWidget {
  const SweetPage({super.key});

  @override
  State<SweetPage> createState() => _SweetPageState();
}

class _SweetPageState extends State<SweetPage> {
  late Timer _timer;
  int _remember = 5;
  int _start = 180;

  void startRemember() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_remember == 1) {
          setState(() {
            timer.cancel();
            context.read<SweetBloc>().add(StartSweetEvent());
            startTimer();
          });
        } else {
          setState(() {
            _remember--;
            log('REMEMBER = $_remember');
          });
        }
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          context.read<SweetBloc>().add(LooseSweetEvent());
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
    context.read<SweetBloc>().add(RememberSweetEvent());
    startRemember();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SweetScaffold(
      body: BlocListener<SweetBloc, SweetState>(
        listener: (context, state) {
          if (state is FinishedSweetState) {
            // dialog
          }

          if (state is LooseSweetState) {
            // dialog
          }
        },
        child: BlocBuilder<SweetBloc, SweetState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 18),
                const SweetAppbar(),
                const SizedBox(height: 40),
                if (state is RememberSweetState) ...[
                  TimerCard(sec: _remember),
                  const SizedBox(height: 20),
                  const RememberText(),
                  const SizedBox(height: 20),
                  SweetsList(sweets: state.sweets),
                  const SizedBox(height: 58),
                  const PairsCountCard(index: 0),
                ],
                if (state is StartedSweetState) ...[
                  TimerCard(sec: _start),
                  const SizedBox(height: 20),
                  const Opacity(opacity: 0, child: RememberText()),
                  const SizedBox(height: 20),
                  SweetsList(sweets: state.sweets),
                  const SizedBox(height: 58),
                  PairsCountCard(index: state.left),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
