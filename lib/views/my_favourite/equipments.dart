import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

class Equipments extends StatelessWidget {
  const Equipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have no favourite Equipment',
            style: kTitlePrimary,
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click the',
                style: kTextPrimary.copyWith(fontSize: 15),
              ),
              const SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                'assets/images/coolicon-heart.svg',
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'to save to My Favourites',
                style: kTextPrimary.copyWith(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
