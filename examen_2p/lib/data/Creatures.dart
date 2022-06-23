class Creatures{
  List<CreatureList>? dataList;

  Creatures({this.dataList});
  Creatures.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = <CreatureList>[];
      json['data'].forEach((v) {
        dataList!.add(new CreatureList.fromJson(v));
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

class CreatureList {
  List<Food>? food;
  List<NonFood>? nonFood;

  CreatureList({
    this.food,
    this.nonFood
  });

  CreatureList.fromJson(Map<String, dynamic> json){
    food = json['food'];
    nonFood = json['non_food'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food'] = this.food;
    data['non_food'] = this.nonFood;
    return data;
  }
}


class Food {
  String? category;
  String? cookingEffect;
  String? description;
  int? id;
  String? image;
  String? name;

  Food({
    this.category,
    this.cookingEffect,
    this.description,
    this.id,
    this.image,
    this.name
  });

  Food.fromJson(Map<String, dynamic> json){
    category = json['category'];
    cookingEffect = json['cooking_effect'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['cooking_effect'] = this.cookingEffect;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class NonFood {
  String? category;
  String? description;
  int? id;
  String? image;
  String? name;

  NonFood({
    this.category,
    this.description,
    this.id,
    this.image,
    this.name
  });

  NonFood.fromJson(Map<String, dynamic> json){
    category = json['category'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}