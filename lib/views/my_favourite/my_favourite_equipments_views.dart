import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

import '../../cubits/cubits.dart';
import '../../widgets/widgets.dart';

class MyFavouriteEquipments extends StatelessWidget {
  const MyFavouriteEquipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHaveFavouriteEquipments = context.watch<FavouriteBookingsCubit>().state.favouriteEquipments.isEmpty;

    return isHaveFavouriteEquipments ? const EquipmentsInitial() : const FavouriteEquipments();
  }
}

class EquipmentsInitial extends StatelessWidget {
  const EquipmentsInitial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have no favourite Equipment', style: kTitlePrimary),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click the', style: kTextPrimary.copyWith(fontSize: 15)),
              const SizedBox(width: 12),
              SvgPicture.asset('assets/images/coolicon-heart.svg'),
              const SizedBox(width: 12),
              Text('to save to My Favourites', style: kTextPrimary.copyWith(fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }
}

class FavouriteEquipments extends StatelessWidget {
  const FavouriteEquipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteEquipments = context.watch<FavouriteBookingsCubit>().state.favouriteEquipments;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: favouriteEquipments.length,
                  itemBuilder: (context, index) {
                    return EquipmentsCard(
                      equipments: favouriteEquipments[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
