import 'package:favourites_project/homescreen_page.dart';
import 'package:flutter/material.dart';
class FavScreenPage extends StatefulWidget {
  const FavScreenPage({Key? key}) : super(key: key);

  @override
  State<FavScreenPage> createState() => FavScreenPageState();
}


class FavScreenPageState extends State<FavScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: favoriteDataList.length,
          itemBuilder: (context,index){
         return favoriteDataList.isEmpty? const
          Center(
            child: Text("There are no favorites yet!",
              style: TextStyle(color: Colors.black,fontSize: 22),),
          ):
             ListTile(
              title: Text(favoriteDataList[index]),
               trailing: IconButton(onPressed: (){
                 setState((){
                   favoriteDataList.remove(favoriteDataList[index]);



                 });
                 }
               , icon: Icon(Icons.remove),),
            );
          }),

    );
  }
}
