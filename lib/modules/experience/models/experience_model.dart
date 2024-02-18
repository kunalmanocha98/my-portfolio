class ExperienceResponse {
  List<ExperienceItem>? experiences;

  ExperienceResponse({this.experiences});

  ExperienceResponse.fromJson(Map<String, dynamic> json) {
    if (json['experiences'] != null) {
      experiences = [];
      json['experiences'].forEach((v) {
        experiences!.add(ExperienceItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (experiences != null) {
      data['experiences'] = experiences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExperienceItem {
  String? name;
  String? designation;
  String? summary;
  String? location;
  String? fromDate;
  String? toDate;

  ExperienceItem(
      {this.name,
        this.designation,
        this.summary,
        this.location,
        this.fromDate,
        this.toDate});

  ExperienceItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    summary = json['summary'];
    location = json['location'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['summary'] = summary;
    data['location'] = location;
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    return data;
  }
}