import 'package:flutter/material.dart';
import 'package:examen_2p/data/Equipment.dart';
import 'package:examen_2p/utilerias/global.dart';

class DetailEquipmentPage extends StatelessWidget {

  final DataEquipment? equipment;
  DetailEquipmentPage({this.equipment});
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipment!.name!.toUpperCase()),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [Column(children: [
          Center(
            child: Image(image: NetworkImage(equipment!.image!), height: 340,),),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 0, 65, 10),
            child: Row(children: [
            Text("Category:", style: Theme.of(context).textTheme.headline2),
            Spacer(),
            Text(equipment!.category!),
            Spacer(flex: 5,),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 10, 65, 10),
            child: Row(children: [
            Text("Attack:", style: Theme.of(context).textTheme.headline2),
            Spacer(),
            Text((equipment?.attack ?? 0).toString()),
            Spacer(flex: 2,),
            Text("Defense:", style: Theme.of(context).textTheme.headline2),
            Spacer(),
            Text((equipment?.defense ?? 0).toString()),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 10, 65, 2),
            child: Row(children: [
            Text("Common Locations:", style: Theme.of(context).textTheme.headline2),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(58, 0, 65, 0),
            child:  SizedBox(height: 70.0,
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: equipment?.commonLocations?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                return Text( equipment?.commonLocations?[index]);
              }
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 0, 65, 32),
            child: Text(equipment!.description!),
          )
        ],
        ),]
      )
    );
  }
}