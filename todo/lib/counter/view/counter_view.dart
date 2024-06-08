import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counter/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(title: Text("Counter Demo")),
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) =>
                  Text('$state', style: textTheme.displayMedium)),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  print("incre");
                  context.read<CounterCubit>().increment();
                },
                child: Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  print('decre');
                  context.read<CounterCubit>().decrement();
                },
                child: Icon(Icons.remove))
          ],
        ));
  }
}
