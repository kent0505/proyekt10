import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils.dart';

class MyCoins extends StatelessWidget {
  const MyCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 90,
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          SvgPicture.asset('assets/coin.svg'),
          const SizedBox(width: 5),
          Text(
            getCoins(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(width: 10),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            minSize: 16,
            child: SvgPicture.asset('assets/add.svg'),
          ),
        ],
      ),
    );
  }
}