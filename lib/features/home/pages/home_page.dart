import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 121),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();
                if (state is HomeRules) return const Text('Rules');
                if (state is HomePrivacy) return const Text('Privacy');
                if (state is HomeProfile) return const ProfilePage();
                return const _Home();
              },
            ),
          ),
          const CustomAppbar(),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Home'),
      ],
    );
  }
}
