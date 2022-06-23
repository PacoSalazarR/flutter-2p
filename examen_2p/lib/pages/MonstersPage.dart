import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/MonsterServices.dart';
import 'package:examen_2p/pages/DetailMonstersPage.dart';
import 'package:examen_2p/utilerias/global.dart';


class MonstersPage extends StatefulWidget{
   MonstersPage({Key? key}): super(key: key);

  @override
  _MonstersPageState createState() => _MonstersPageState();

}

class _MonstersPageState extends State<MonstersPage> {

  MonsterServices monsterServices = new MonsterServices();
  bool cargando = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monsters'),
      ),
      body: Container(
        child: FutureBuilder(
          future: monsterServices.getMonsters(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return Center(
                child: Text("Loading..."),
              );
            }

            return GridView.builder(
              itemCount: snapshot.requireData.length,
              itemBuilder: (BuildContext context, int index){
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInUp(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.bacgroundColorCard,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Image(image: NetworkImage(snapshot.requireData[index].image), height: 100,)),
                            Expanded(
                              child: Text(
                                snapshot.requireData[index].name.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold, height: 2, color: Global.basicFont),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {      
                        Navigator.push(context,
                        MaterialPageRoute(builder: 
                        (context) => DetailMonsterPage(monster: snapshot.data[index],),));                    
                       //print("tapped on container");
                      },
                    ),
                  ),
                );
              }, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}