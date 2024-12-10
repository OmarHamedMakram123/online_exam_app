part of 'base_cubit.dart';

@immutable
sealed class BaseState {}

final class BaseInitial extends BaseState {}
class ChangeBottomNavigationIndexState extends BaseState{}
