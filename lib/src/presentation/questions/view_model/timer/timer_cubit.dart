import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/presentation/questions/view_model/timer/timer_state.dart';


@injectable
class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Timer? _timer;
  late int remainingTime;

  void startTime() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if(remainingTime==0){
          emit(FinishTimerState());
          _stopTimer();
          return;
        }
       else if (remainingTime > 0) {
          remainingTime--;
          emit(TimerUpdateState());
        } else {
          _stopTimer();
          emit(TimerUpdateState());
        }
      },
    );
  }

  void initRemainingTimer(int duration) {
    remainingTime = duration* 60;
  }

  String formattedTimer() {
    String minutes = _getRemainingMinutes().toString().padLeft(2, "0");
    String second = _getRemainingSeconds().toString().padLeft(2, "0");
    return "$second : $minutes";
  }

  bool isRemainingMoreThan15Minutes() {
    return _getRemainingSeconds() >= 14;
  }

  int _getRemainingMinutes() {
    return remainingTime % 60;
  }
  int _getRemainingSeconds() {
    return remainingTime ~/ 60;
  }


  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
  @override
  Future<void> close() async {
    super.close();
    _stopTimer();
    _timer = null;
  }
}
