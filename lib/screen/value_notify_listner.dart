// In this file i did Stateless Widget using like Stateful Widget

import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Notify Listner Screen', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                hintText: 'Password',
                suffix: InkWell(
                  onTap: () {
                    toggle.value = ! toggle.value;
                  },
                  // this is ternary operator
                  child: Icon(toggle.value? Icons.visibility_off_outlined : Icons.visibility))
              ),
            );
              },),
        
            
            Center(
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(_counter.value.toString(), style: TextStyle(fontSize: 50),);
              },)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
        _counter.value++;
        print(_counter.value.toString());
      },
      child: const Icon(Icons.add, color: Colors.white),),
    );
  }
}