import 'dart:async';
import 'package:examen_2p/data/Creatures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatureServices{
  Future<List<CreatureList>> getCreatures() async{
    var url = Uri.parse('https://botw-compendium.herokuapp.com/api/v2/category/creatures');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    List<CreatureList> equipments = parsed['data'].map<CreatureList>((json) => CreatureList.fromJson(json)).toList();
    return equipments;
  }
}