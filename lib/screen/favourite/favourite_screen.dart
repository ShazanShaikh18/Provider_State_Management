import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_manage/provider/favourite_provider.dart';
import 'package:provider_state_manage/screen/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {

    // final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteItemScreen(),));
            },
            child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Consumer<FavouriteItemProvider>(builder: (context, value, child) {
                return ListTile(
                 onTap: () {
                   
                   if (value.selectedItem.contains(index)) {
                     value.removeItem(index);
                   }
                   else{
                      value.addItem(index);
                   }
                   
                 },
                title: Text('Item$index'),
                trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
              );
              },);
            },),
          )
        ],
      ),
    );
  }
}