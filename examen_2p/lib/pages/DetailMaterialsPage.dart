import 'package:flutter/material.dart';
import 'package:examen_2p/data/Material.dart';
import 'package:examen_2p/utilerias/global.dart';

class DetailMaterialPage extends StatelessWidget {

  final DataMaterial? material;
  DetailMaterialPage({this.material});
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(material!.name!.toUpperCase()),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: Image(image: NetworkImage(material!.image!))),
                Expanded(flex: 2, child: Container(
                  margin: const EdgeInsets.only(left: 13),
                  child: Column(children: [
                    Text("Common Locations:", style: Theme.of(context).textTheme.headline2),
                    SizedBox(height: 70.0,
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(top: 12),
                    itemCount: material?.commonLocations?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                    return Text( material?.commonLocations?[index]);
                  }
                ),
              ),
                    Text("Hearts Recovered:", style: Theme.of(context).textTheme.headline2),
                    Text(material!.heartsRecovered!.toString(),),
                    ],),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Row(children: [
              Text("Category:", style: Theme.of(context).textTheme.headline2),
              Spacer(),
              Text(material!.category!),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Row(children: [
              Text("Cooking Effect:", style: Theme.of(context).textTheme.headline2),
              Spacer(),
              Text(material!.cookingEffect!),
              ],),
            ),
            Spacer(),
            Text("Description", style: Theme.of(context).textTheme.headline2),
            Spacer(flex: 1,),
            Text(material!.description!),
            Spacer(flex: 4,),
          ]
        ),
      ),
    );
  }
}