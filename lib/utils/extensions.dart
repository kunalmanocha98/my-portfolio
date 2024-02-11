extension ColorExtension on String {
  int get toColorInt{
    return int.parse(this,radix: 16);
  }
}