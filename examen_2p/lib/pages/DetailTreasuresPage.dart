import 'package:flutter/material.dart';
import 'package:examen_2p/data/Treasure.dart';
import 'package:examen_2p/utilerias/global.dart';

class DetailTreasurePage extends StatelessWidget {
  final DataTreasure? treasure;
  DetailTreasurePage({this.treasure});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(treasure!.name!.toUpperCase()),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Column(
          children: [
            Center(child: ClipRRect(
             borderRadius: BorderRadius.circular(20), // Image border
             child: SizedBox.fromSize(
             size: Size.fromRadius(130), // Image radius
             child: Image.network(treasure!.image!, fit: BoxFit.cover),
              ),
            )
           ),
           Padding(
             padding: const EdgeInsets.only(top: 12, bottom: 12),
             child: Row(
               children: [
                 Text("Common Locations:", style: Theme.of(context).textTheme.headline2),
                 Spacer(),
                 Text("Drops:", style: Theme.of(context).textTheme.headline2),
                 Spacer(),
               ],
             ),
           ),
           Row(
             children: [
               Expanded(
                child: SizedBox(
                height: 80.0,
                child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: treasure?.commonLocations?.length ?? 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Text(treasure?.commonLocations?[index]);
                     },
                    ),
                  ),
                ),
               Spacer(),
               Expanded(
                child: SizedBox(
                height: 80.0,
                child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: treasure?.drops?.length ?? 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Text(treasure?.drops?[index]);
                     },
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text("Description", style: Theme.of(context).textTheme.headline2),
            Spacer(flex: 1,),
            Text(treasure!.description!),
            Spacer(flex: 2,),
          ]
        ),
      ),
    );
  }
}