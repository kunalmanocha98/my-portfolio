class PersonalDetailsResponse {
  String? name;
  String? icon;
  String? description;
  String? gender;
  String? dob;

  PersonalDetailsResponse(
      {this.name, this.icon, this.description, this.gender, this.dob});

  PersonalDetailsResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    gender = json['gender'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    data['gender'] = gender;
    data['dob'] = dob;
    return data;
  }
}