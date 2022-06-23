import 'package:examen_2p/pages/DetailMaterialsPage.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/MaterialServices.dart';
import 'package:examen_2p/utilerias/global.dart';
import 'package:animate_do/animate_do.dart';

class MaterialsPage extends StatefulWidget{
   MaterialsPage({Key? key}): super(key: key);

  @override 
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialsPage>{

  MaterialServices materialServices = new MaterialServices();
  bool cargando = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
      ),
      body: Container(
        child: FutureBuilder(
          future: materialServices.getMaterials(),
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
                  child: FadeInDown(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.bacgroundColorCard,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: CircleAvatar(radius: 48, // Image radius
                                  backgroundImage: NetworkImage(snapshot.requireData[index].image),)),
                            Expanded(
                              child: Text(
                                snapshot.requireData[index].name.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12, height: 2, color: Global.basicFont),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {      
                        Navigator.push(context,
                        MaterialPageRoute(builder: 
                        (context) => DetailMaterialPage(material: snapshot.data[index],),));                    
                       //print("tapped on container");
                      },
                    ),
                  ),
                );
              }, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            );
          },
        ),
      ),
    );
  }
}