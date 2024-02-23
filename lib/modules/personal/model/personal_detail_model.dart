class PersonalDetailsResponse {
  String? name;
  String? icon;
  String? description;
  String? gender;
  String? dob;
  Cv? cv;

  PersonalDetailsResponse(
      {this.name, this.icon, this.description, this.gender, this.dob, this.cv});

  PersonalDetailsResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    gender = json['gender'];
    dob = json['dob'];
    cv = json['cv'] != null ? Cv.fromJson(json['cv']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    data['gender'] = gender;
    data['dob'] = dob;
    if (cv != null) {
      data['cv'] = cv!.toJson();
    }
    return data;
  }
}

class Cv {
  String? cvPath;
  String? cvName;

  Cv({this.cvPath, this.cvName});

  Cv.fromJson(Map<String, dynamic> json) {
    cvPath = json['cvPath'];
    cvName = json['cvName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cvPath'] = cvPath;
    data['cvName'] = cvName;
    return data;
  }
}