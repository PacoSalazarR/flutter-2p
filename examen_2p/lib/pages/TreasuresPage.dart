import 'package:animate_do/animate_do.dart';
import 'package:examen_2p/pages/DetailTreasuresPage.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/TreasureServices.dart';
import 'package:examen_2p/utilerias/global.dart';

class TreasuresPage extends StatefulWidget{
   TreasuresPage({Key? key}): super(key: key);

   @override
  _TreasuresPageState createState() => _TreasuresPageState();

}

class _TreasuresPageState extends State<TreasuresPage> {

  TreasureServices treasureServices = new TreasureServices();
  bool cargando = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treasures'),
      ),
      body: Container(
        child: FutureBuilder(
          future: treasureServices.getTreasures(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return Center(
                child: Text("Loading..."),
              );
            }

            return ListView.builder(
              itemCount: snapshot.requireData.length,
              itemBuilder: (BuildContext context, int index){
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInRight(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.bacgroundColorCard,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image(image: NetworkImage(snapshot.requireData[index].image), height: 100,)),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.requireData[index].name.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Global.basicFont),
                                  ),
                                  Text(
                                    snapshot.requireData[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold, height: 2, color: Global.basicFont),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {      
                        Navigator.push(context,
                        MaterialPageRoute(builder: 
                        (context) => DetailTreasurePage(treasure: snapshot.data[index],),));                    
                       //print("tapped on container");
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}