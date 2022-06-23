import 'package:examen_2p/utilerias/global.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/pages/EquipmentPage.dart';
import 'package:examen_2p/pages/MaterialsPage.dart';
import 'package:examen_2p/pages/MonstersPage.dart';
import 'package:examen_2p/pages/TreasuresPage.dart';
import 'package:examen_2p/pages/CreaturesPage.dart';


class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Global.basicBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           UserAccountsDrawerHeader(
            accountName: Text('Paco Salazar'),
            accountEmail: Text('franciscosr1803@gmail.com'),
            currentAccountPicture: CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage('https://i1.sndcdn.com/avatars-000332978364-33krex-t500x500.jpg'),
               )
             ),
          Ink(
            color: Global.alertColor,
            child: ListTile(
              leading: const Icon(Icons.add_moderator, color: Colors.white,),
              title: const Text('Equipment', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EquipmentPage()));
              },
            ),
          ),
          const Divider(
            thickness: 0,
          ),
          Ink(
            color: Global.alertColor,
            child: ListTile(
              leading: const Icon(Icons.yard, color: Colors.white,),
              title: const Text('Materials', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MaterialsPage()));
              },
            ),
          ),
          const Divider(
            thickness: 0,
          ),
          Ink(
            color: Global.alertColor,
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.white,),
              title: const Text('Monsters', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MonstersPage()));
              },
            ),
          ),
          const Divider(
            thickness: 0,
          ),
          Ink(
            color: Global.alertColor,
            child: ListTile(
              leading: const Icon(Icons.wallet_giftcard_rounded, color: Colors.white,),
              title: const Text('Treasures', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TreasuresPage()));
              },
            ),
          ),
          const Divider(
            thickness: 0,
          ),
          /*Ink(
            color: Colors.pink,
            child: ListTile(
              leading: const Icon(Icons.food_bank, color: Colors.white,),
              title: const Text('Creatures', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CreaturesPage()));
              },
            ),
          ),
          const Divider(
            thickness: 0,
          ),*/
        ],
      ),
    );
  }
}
