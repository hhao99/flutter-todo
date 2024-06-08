import 'package:bloc/bloc.dart';

//{BlocObserver} for the counter application to monitor all state changes.

class CounterObserver extends BlocObserver {
  const CounterObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("${bloc.runtimeType} $change");
  }
}
