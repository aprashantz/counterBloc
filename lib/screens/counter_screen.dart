import 'package:counterbloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Current Score",
            style: TextStyle(fontSize: 30),
          ),
          BlocBuilder<CounterBloc, int>(builder: (context, state) {
            return Text(
              "$state",
              style: TextStyle(fontSize: 30),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterEvent.increment);
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterEvent.decrement);
                  },
                  child: Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
