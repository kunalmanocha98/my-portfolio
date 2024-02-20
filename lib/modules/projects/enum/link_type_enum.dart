enum LinkType{
  android,ios,web,none
}

extension LinkTypeExt on LinkType {
  String get type {
    switch(this){
      case LinkType.android:
        return 'android';
      case LinkType.ios:
        return 'ios';
      case LinkType.web:
        return 'web';
      case LinkType.none:
        return 'none';
    }
  }
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