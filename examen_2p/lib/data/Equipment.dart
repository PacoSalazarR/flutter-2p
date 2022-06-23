class Equipment {
  List<DataEquipment>? dataList;

  Equipment({this.dataList});

  Equipment.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = <DataEquipment>[];
      json['data'].forEach((v) {
        dataList!.add(new DataEquipment.fromJson(v));
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

class DataEquipment {
  int? attack;
  String? category;
  List<dynamic>? commonLocations;
  int? defense;
  String? description;
  int? id;
  String? image;
  String? name;

  DataEquipment(
    { this.attack,
      this.category,
      this.commonLocations,
      this.defense,
      this.description,
      this.id,
      this.image,
      this.name
    }
  );

  DataEquipment.fromJson(Map<String, dynamic> json) {
    attack = json['attack'];
    category = json['category'];
    commonLocations = json['common_locations'];
    defense = json['defense'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attack'] = this.attack;
    data['category'] = this.category;
    data['common_locations'] = this.commonLocations;
    data['defense'] = this.defense;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}