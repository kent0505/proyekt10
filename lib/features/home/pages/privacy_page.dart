import 'package:flutter/material.dart';

import '../widgets/tile_button.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          TileButton(
            title: 'Rate Us',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Contact Us',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Privacy Policy',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Terms of Use',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
