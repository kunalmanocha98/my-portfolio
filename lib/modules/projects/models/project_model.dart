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
  int? index;
  List<Links>? links;

  ProjectItem({this.name, this.image, this.links,this.index});

  ProjectItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    index = json['index'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['index'] = index;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? type;
  String? link;

  Links({this.type, this.link});

  Links.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['link'] = link;
    return data;
  }
}