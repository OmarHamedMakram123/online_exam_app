import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/src/presentation/base_screen/view_model/base_cubit.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var baseViewModel = context.read<BaseCubit>();
    return BlocBuilder<BaseCubit, BaseState>(
      builder: (context, state) {
        return NavigationBar(
          height: 50.h,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: baseViewModel.selectIndex,
          onDestinationSelected: (index) =>
              baseViewModel.changeBottomNavigationIndex(index),
          destinations: [
            NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AppImages.homeIcon,
                  color: AppColors.kBlue,
                ),
                icon: SvgPicture.asset(AppImages.homeIcon),
                label: ""),
            NavigationDestination(
                icon: SvgPicture.asset(AppImages.resultIcon),
                selectedIcon: SvgPicture.asset(
                  AppImages.resultIcon,
                  color: AppColors.kBlue,
                ),
                label: ""),
            NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AppImages.profileIcon,
                  color: AppColors.kBlue,
                ),
                icon: SvgPicture.asset(AppImages.profileIcon),
                label: "")
          ],
        );
      },
    );
  }
}
