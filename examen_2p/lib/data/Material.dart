class Material {
  List<DataMaterial>? dataList;

  Material({this.dataList});

  Material.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = <DataMaterial>[];
      json['data'].forEach((v) {
        dataList!.add(new DataMaterial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['data'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataMaterial {
  String? category;
  List<dynamic>? commonLocations;
  String? cookingEffect;
  String? description;
  num? heartsRecovered;
  int? id;
  String? image;
  String? name;

  DataMaterial(
    { 
      this.category,
      this.commonLocations,
      this.cookingEffect,
      this.description,
      this.heartsRecovered,
      this.id,
      this.image,
      this.name
    }
  );

  DataMaterial.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    commonLocations = json['common_locations'];
    cookingEffect = json['cooking_effect'];
    description = json['description'];
    heartsRecovered = json['hearts_recovered'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['common_locations'] = this.commonLocations;
    data['cooking_effect'] = this.cookingEffect;
    data['description'] = this.description;
    data['hearts_recovered'] = this.heartsRecovered;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}