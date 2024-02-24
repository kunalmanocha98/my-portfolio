class EducationalResponse {
  String? color;
  List<EducationalDetails>? educationalDetails;

  EducationalResponse({this.color, this.educationalDetails});

  EducationalResponse.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    if (json['educationDetails'] != null) {
      educationalDetails = [];
      json['educationDetails'].forEach((v) {
        educationalDetails!.add(EducationalDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    if (educationalDetails != null) {
      data['educationDetails'] =
          educationalDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationalDetails {
  String? name;
  String? summary;
  String? institution;
  String? location;
  String? fromDate;
  String? toDate;
  int? index;

  EducationalDetails(
      {this.name,
        this.summary,
        this.institution,
        this.location,
        this.fromDate,
        this.toDate,
        this.index});

  EducationalDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    summary = json['summary'];
    institution = json['institution'];
    location = json['location'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['summary'] = summary;
    data['institution'] = institution;
    data['location'] = location;
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['index'] = index;
    return data;
  }
}