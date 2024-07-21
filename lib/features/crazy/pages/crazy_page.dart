import 'package:flutter/material.dart';

import '../widgets/crazy_appbar.dart';
import '../widgets/crazy_scaffold.dart';

class CrazyPage extends StatelessWidget {
  const CrazyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CrazyScaffold(
      body: Column(
        children: [
          SizedBox(height: 18),
          CrazyAppbar(),
        ],
      ),
    );
  }
}
