import 'package:flutter/material.dart';
import 'package:examen_2p/widgets/navigation_drawer_widget.dart';
import 'package:examen_2p/utilerias/global.dart';

class MainPage extends StatelessWidget{
  const MainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage("https://www.notebookcheck.org/fileadmin/Notebooks/News/_nc3/maxresdefault47.jpg"),
          fit: BoxFit.cover,
         ),
       ),
    ),
  backgroundColor: Colors.transparent,
        title: const Text('Main'),
        actions: [
          IconButton(
            tooltip: "Log out",
            onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("Welcome back! On the drawer you'll find the categories of each entry available right now.", 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Global.basicFont),),
              ),
              Image(image: NetworkImage("https://static.wikia.nocookie.net/zelda_gamepedia_en/images/0/02/BotW_Link_Shooting_Artwork.png/revision/latest?cb=20180429122910"), height: 400,)
            ],
          )
        ),
      ),
      drawer: const NavigationDrawerWidget(),
    );
  }

}