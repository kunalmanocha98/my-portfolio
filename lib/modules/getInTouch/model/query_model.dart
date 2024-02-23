class QueryModel {
  String? name;
  String? mobile;
  String? email;
  String? purpose;

  QueryModel({this.name, this.mobile, this.email, this.purpose});

  QueryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['purpose'] = purpose;
    return data;
  }
}