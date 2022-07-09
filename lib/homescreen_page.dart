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
  "Rajesh",
  "Dilip",
  "Suresh",
  "Sam",
  "Vaibhav",
  "Sagar"
];
List<String> favoriteDataList=[];
List<bool> isSelected=List.generate(homeDataList.length, (index) => false);
List<bool>removeFavorite=List.generate(6, (index) => false);
List<String>tempList=List.from(homeDataList);


class _HomeScreenPageState extends State<HomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isDrawerOpen){
        if(isDrawerOpen){


        } else{

            setState((){
              print("sample 1");



                 bool isFav=false;
                for (int i = 0; i < homeDataList.length; i++) {
                  for(int j=0;j<favoriteDataList.length;j++){
                    if(homeDataList[i].contains(favoriteDataList[j])) {
                      if(homeDataList[i]==favoriteDataList[j])
                      isFav=true;
                      print("home if:"+homeDataList[i]);
                      isSelected[i]=true;
                      break;
                    }else{
                      isFav=false;
                      isSelected[i]=false;
                      print("home else:"+homeDataList[i]);

                    }
                  }
                  if(!isFav){
                    isSelected[i]=false;

                  }
                  // if(homeDataList[i].contains(favoriteDataList[i])) {
                  //   isSelected[i] = true;
                  //   print(i);
                  //   // print(isSelected[i]);
                  //
                  // } else{
                  //   isSelected[i]=false;
                  // }

              }
            });
        }
      },
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
                    removeFavorite[index]=  favoriteDataList.remove(homeDataList[index]);
                    isSelected[index]=false;

                  }else{
                    favoriteDataList.add(homeDataList[index]);
                    isSelected[index]=true;
                  }
                });
              },
                  icon:  Icon(isSelected[index]?Icons.favorite
                      :removeFavorite[index] ? Icons.favorite_border
                        :Icons.favorite_border),
                  color:isSelected[index] ?Colors.red:
                  removeFavorite[index] ? Colors.grey
                        :Colors.grey),
            ),
          );
        },

      ),
    );
  }
}

