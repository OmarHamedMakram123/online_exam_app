sealed class TimerState {}

final class TimerInitial extends TimerState {}

class TimerUpdateState extends TimerState{}

class FinishTimerState extends TimerState{}