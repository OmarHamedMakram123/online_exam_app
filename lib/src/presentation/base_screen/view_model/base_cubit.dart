import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../profile/view/profile_view.dart';
import '../../result/view/result_view.dart';
import '../../subject/view/subject_view.dart';

part 'base_state.dart';

@injectable
class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitial());

  int selectIndex = 0;
  List<Widget> screen = const [
    SubjectView(),
    ResultView(),
    ProfileView(),
  ];
  void changeBottomNavigationIndex(int newIndex) {
    selectIndex = newIndex;
    emit(ChangeBottomNavigationIndexState());
  }
}
