import 'dart:async';
import 'package:examen_2p/data/Treasure.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TreasureServices{
  Future<List<DataTreasure>> getTreasures() async{
    var url = Uri.parse('https://botw-compendium.herokuapp.com/api/v2/category/treasure');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    List<DataTreasure> treasures = parsed['data'].map<DataTreasure>((json) => DataTreasure.fromJson(json)).toList();
    return treasures;
  }
}