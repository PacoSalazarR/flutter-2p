import 'package:flutter/material.dart';
import 'package:examen_2p/services/EquipmentServices.dart';
import 'DetailEquipmentPage.dart';
import 'package:examen_2p/utilerias/global.dart';
import 'package:animate_do/animate_do.dart';

class EquipmentPage extends StatefulWidget{
  EquipmentPage({Key? key}): super(key: key);

  @override
  _EquipmentPageState createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {

  EquipmentServices equipmentServices = new EquipmentServices();
  bool cargando = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
      ),
      body: Container(
        child: FutureBuilder(
          future: equipmentServices.getEquipments(),
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
                              child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image(image: NetworkImage(snapshot.requireData[index].image), height: 100,))),
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
                         (context) => DetailEquipmentPage(equipment: snapshot.data[index],),));                    
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
/*class EquipmentPage extends StatelessWidget{
  const EquipmentPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
      ),
      body: const Center(
        child: Text('This is the equipment page'),
      ),
    );
  }

}*/