class Monster {
  List<DataMonster>? dataList;

  Monster({this.dataList});

  Monster.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = <DataMonster>[];
      json['data'].forEach((v) {
        dataList!.add(new DataMonster.fromJson(v));
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

class DataMonster {
  String? category;
  List<dynamic>? commonLocations;
  String? description;
  List<dynamic>? drops;
  int? id;
  String? image;
  String? name;

  DataMonster(
    {
      this.category,
      this.commonLocations,
      this.description,
      this.drops,
      this.id,
      this.image,
      this.name
    }
  );

  DataMonster.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    commonLocations = json['common_locations'];
    description = json['description'];
    drops = json['drops'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['common_locations'] = this.commonLocations;
    data['description'] = this.description;
    data['drops'] = this.drops;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}