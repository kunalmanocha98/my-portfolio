class ContactResponse {
  String? email;
  String? mobile;
  String? summary;
  List<SocialLinks>? socialLinks;

  ContactResponse({this.email, this.mobile, this.socialLinks,this.summary});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    mobile = json['mobile'];
    summary = json['summary'];
    if (json['socialLinks'] != null) {
      socialLinks = <SocialLinks>[];
      json['socialLinks'].forEach((v) {
        socialLinks!.add(SocialLinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['mobile'] = mobile;
    data['summary'] = summary;
    if (socialLinks != null) {
      data['socialLinks'] = socialLinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialLinks {
  String? icon;
  String? name;
  String? socialLinkUrl;

  SocialLinks({this.icon, this.name, this.socialLinkUrl});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    socialLinkUrl = json['socialLinkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['socialLinkUrl'] = socialLinkUrl;
    return data;
  }
}