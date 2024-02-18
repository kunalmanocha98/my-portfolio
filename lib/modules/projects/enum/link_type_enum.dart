enum LinkType{
  android,ios,web,none
}

extension LinkTypeExtension on String {
  LinkType get getLinkType {
    switch (this) {
      case "android":{
        return LinkType.android;
      }
      case "ios":{
        return LinkType.ios;
      }
      case "web":{
        return LinkType.web;
      }
      default :{
        return LinkType.none;
      }
    }
  }
}