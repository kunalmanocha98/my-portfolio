class TechStackResponse {
  String? color;
  List<TechStackItem>? list;

  TechStackResponse({this.color, this.list});

  TechStackResponse.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(TechStackItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TechStackItem {
  String? name;
  String? icon;

  TechStackItem({this.name, this.icon});

  TechStackItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}