import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_manage/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {

  // double value = 1.0;
  @override
  Widget build(BuildContext context) {

    // listen: false  :~ Provider Use Karke Usme Listen false Rakhne Se Pura Widget Rebuild Nahi Hota He.
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text('Example One Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

      // Consumer Widget Ka Use Provider Use Karke Single Widget ku Rebuild/Refresh Karne ke liye Use karte he, iske use karke Pura Widget Rebuild Hone Se Rok Sakte He. 
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
            min: 0,
            max: 1,
            value: value.value, onChanged: (val){
              // print(value);
              value.setValue(val);
              // value = val;
          });
          },),


          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text('Container 1'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text('Container 2'),
                  ),
                ),
              ),
            
            ],
          );
          },)
          

          
        ],
      ),
    );
  }
}