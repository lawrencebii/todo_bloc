import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlockConsumer takes both listener and builder
            Container(
              child: Center(
                  child: BlocListener<CounterBloc,
                      CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is IncrementState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content:
                            Text('Successfully increase'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else if (state is DecrementState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content:
                            Text('Successfully decreased'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child:
                    BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      'Counter value: ${state.counterValue}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterDecrementEvent()),
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrease'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterIncrementEvent()),
                      icon: const Icon(Icons.add),
                      label: const Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
