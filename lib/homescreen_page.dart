import 'package:favourites_project/favscreen_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  final Widget? ListTiles;
  const HomeScreenPage({Key? key,this.ListTiles}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}
List<String> homeDataList=[
  "Data 1",
  "Data 2",
  "Data 3",
  "Data 4",
  "Data 5"
];
List<String> favoriteDataList=[];
List<bool> isSelected=List.generate(5, (index) => false);
bool removeFavorite=false;


class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: FavScreenPage(),
      ),
      body: ListView.builder(
        itemCount: homeDataList.length,
        itemBuilder: (context,index){
         return  Card(
           margin: EdgeInsets.all(7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.black)
            ),
            child: ListTile(
              title: Text(homeDataList[index]),
              trailing: IconButton(onPressed:(){
                setState((){
                  if(favoriteDataList.contains(homeDataList[index])){
                    removeFavorite=  favoriteDataList.remove(homeDataList[index]);
                    isSelected[index]=false;


                  }else{
                    favoriteDataList.add(homeDataList[index]);
                    isSelected[index]=true;
                  }

                });
              },
                  icon:  Icon(isSelected[index]?Icons.favorite
                      :removeFavorite? Icons.favorite_border
                      :Icons.favorite_border),
                  color:isSelected[index] ?Colors.red:
                  removeFavorite? Colors.grey
                      :Colors.grey),
            ),
          );
        },

      ),
    );
  }
}
