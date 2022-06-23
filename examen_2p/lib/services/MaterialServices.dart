import 'dart:async';
import 'package:examen_2p/data/Material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MaterialServices{
  Future<List<DataMaterial>> getMaterials() async{
    var url = Uri.parse('https://botw-compendium.herokuapp.com/api/v2/category/materials');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    List<DataMaterial> materials = parsed['data'].map<DataMaterial>((json) => DataMaterial.fromJson(json)).toList();
    return materials;
  }
}