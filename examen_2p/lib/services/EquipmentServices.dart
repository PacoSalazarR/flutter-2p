import 'dart:async';
import 'package:examen_2p/data/Equipment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EquipmentServices{
  Future<List<DataEquipment>> getEquipments() async{
    var url = Uri.parse('https://botw-compendium.herokuapp.com/api/v2/category/equipment');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    List<DataEquipment> equipments = parsed['data'].map<DataEquipment>((json) => DataEquipment.fromJson(json)).toList();
    return equipments;
  }
}
