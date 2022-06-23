import 'dart:async';
import 'package:examen_2p/data/Monster.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MonsterServices{
  Future<List<DataMonster>> getMonsters() async{
    var url = Uri.parse('https://botw-compendium.herokuapp.com/api/v2/category/monsters');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    List<DataMonster> monsters = parsed['data'].map<DataMonster>((json) => DataMonster.fromJson(json)).toList();
    return monsters;
  }
}