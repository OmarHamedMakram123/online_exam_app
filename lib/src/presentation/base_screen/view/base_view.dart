import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/dependency_injection/di.dart';

import '../view_model/base_cubit.dart';
import '../widget/bottom_navigation_bar_widget.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var baseViewModel = getIt.get<BaseCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => baseViewModel,
      child: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) {
          return Scaffold(
            body: baseViewModel.screen[baseViewModel.selectIndex],
            bottomNavigationBar: const BottomNavigationBarWidget(),
          );
        },
      ),
    );
  }
}
