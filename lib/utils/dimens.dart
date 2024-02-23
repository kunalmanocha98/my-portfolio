
class Dimensions{
  final bool isMobile;
  Dimensions(this.isMobile);

  double get gapSmall => isMobile?18:24;
  double get gapNormal => isMobile?24:36;
  double get gapMedium => isMobile?36:50;
  double get gapBig => isMobile?50:72;
  double get gapLarge => isMobile?72:100;

}