import 'package:flutter/material.dart';
import 'package:examen_2p/services/CreaturesServices.dart';

class CreaturesPage extends StatefulWidget{
   CreaturesPage({Key? key}): super(key: key);

  @override
  _CreaturesPageState createState() => _CreaturesPageState();

}

class _CreaturesPageState extends State<CreaturesPage> {

  CreatureServices creatureServices = new CreatureServices();
  bool cargando = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creatures'),
      ),
      body: Container(
        child: FutureBuilder(
          future: creatureServices.getCreatures(),
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
                  child: InkWell(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Image(image: NetworkImage(snapshot.requireData[index].image), height: 100,)),
                        Expanded(
                          child: Text(
                            snapshot.requireData[index].name.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {      
                      //Navigator.push(context,
                       //MaterialPageRoute(builder: 
                       //(context) => DetailEquipmentPage(equipment: snapshot.data[index],),));                    
                     //print("tapped on container");
                    },
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