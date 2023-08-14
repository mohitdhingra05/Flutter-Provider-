import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_tutorial/list_provider.dart';
import 'package:provider_tutorial/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, numbersProviderModel, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  numbersProviderModel.add();
                },
                child: Icon(Icons.add),
              ),
              appBar: AppBar(),
              body: SizedBox(
                child: Column(
                  children: [
                    Text(
                      numbersProviderModel.numbers.last.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: numbersProviderModel.numbers.length,
                          itemBuilder: (context, index) {
                            return Text(
                              numbersProviderModel.numbers[index].toString(),
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            );
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Second()));
                      },
                      child: const Text('Second'),
                    )
                  ],
                ),
              ),
            ));
  }
}
