import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CrazyCard extends StatelessWidget {
  const CrazyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/home/crazy');
      },
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        // height: 96,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              const Color(0xff088A2D).withOpacity(0.6),
              const Color(0xff088A2D).withOpacity(0.8),
              const Color(0xffB500D2).withOpacity(0.8),
              const Color(0xffB500D2).withOpacity(0.4),
              const Color(0xff8D002A).withOpacity(0),
              const Color(0xff8D002A).withOpacity(0),
            ],
          ),
        ),
        child: SvgPicture.asset('assets/crazy_card.svg'),
      ),
    );
  }
}
