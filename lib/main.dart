import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter/bloc/counter_bloc.dart';

void main() {
  runApp(BlocProvider(create:(_)=>CounterBloc() ,child: const MaterialApp(home: Home(),),));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Bloc",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Counter",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<CounterBloc,CounterState>(builder: (_,state)=>  Text('${state.counter}',
              textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
            ]),
      ),
      floatingActionButton: Column(children: [
        FloatingActionButton(child:const  Icon(Icons.add),onPressed:()=> BlocProvider.of<CounterBloc>(context).add(IncreaseCounter())),
        FloatingActionButton(child:const  Icon(Icons.home),onPressed:()=> BlocProvider.of<CounterBloc>(context).add(ResetCounter())),
        FloatingActionButton(child:const  Icon(Icons.delete),onPressed:()=> BlocProvider.of<CounterBloc>(context).add(DecreaseCounter()))
      ]),
    );
  }
}
