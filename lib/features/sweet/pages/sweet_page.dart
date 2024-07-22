import 'package:flutter/material.dart';

import '../widgets/sweet_appbar.dart';
import '../widgets/sweet_scaffold.dart';

class SweetPage extends StatelessWidget {
  const SweetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SweetScaffold(
      body: Column(
        children: [
          SizedBox(height: 18),
          SweetAppbar(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
