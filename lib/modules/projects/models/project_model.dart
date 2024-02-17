class ProjectsResponse {
  String? color;
  List<ProjectItem>? projects;

  ProjectsResponse({this.color, this.projects});

  ProjectsResponse.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    if (json['projects'] != null) {
      projects = [];
      json['projects'].forEach((v) {
        projects!.add(ProjectItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectItem {
  String? name;
  String? image;
  Links? links;

  ProjectItem({this.name, this.image, this.links});

  ProjectItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Links {
  String? android;
  String? ios;
  String? web;

  Links({this.android, this.ios, this.web});

  Links.fromJson(Map<String, dynamic> json) {
    android = json['android'];
    ios = json['ios'];
    web = json['web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['android'] = android;
    data['ios'] = ios;
    data['web'] = web;
    return data;
  }
}