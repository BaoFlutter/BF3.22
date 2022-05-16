
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/utils/ticker.dart';
import 'timer.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState>{
  static int _initDuration = 60;
  final Ticker _ticker;

  StreamSubscription<int>? _timerSubscription;


  TimerBloc({required Ticker ticker}) :
        _ticker = ticker,
        super(InitialState(_initDuration)){
          // StartEvent : RunningState
          on<StartEvent>(_onStarted);
         // RunEvent : RunningState
          on<RunEvent>(_onRun);
         // PauseEvent : PauseState
          on<PauseEvent>(_onPaused);
         // ResumeEvent : RunningState
          on<ResumeEvent>(_onResume);
          // ResetEvent : Initial State
          on<ResetEvent>(_onReset);


        }
       void _onStarted(StartEvent event, Emitter<TimerState> emit)
        {
          emit(RunningState(event.duration));
          _timerSubscription?.cancel();
          _timerSubscription = _ticker.tick(ticks: event.duration).
                                           listen((duration) => add(RunEvent(duration)));
        }

       void _onRun(RunEvent event, Emitter<TimerState> emit)
        {
          emit(
            event.duration > 0 ?
                RunningState(event.duration):
                CompletedState()
          );
        }

      void _onPaused( PauseEvent event, Emitter<TimerState> emit)
        {
          if(state is RunningState)
            {
              _timerSubscription?.pause();
              emit(PauseState(state.duration));
            }
        }

      void _onResume( ResumeEvent event, Emitter<TimerState> emit){
            if(state is PauseState)
              {
                _timerSubscription?.resume();
                emit(RunningState(state.duration));
              }

        }

      void  _onReset(ResetEvent event, Emitter<TimerState> emit)
        {
          _timerSubscription?.cancel();
          emit(InitialState(_initDuration));
        }

        @override
  Future<void> close() {
    // TODO: implement close
          _timerSubscription?.cancel();
    return super.close();
  }


}