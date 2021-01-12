class ArrayUtils {
  static List<dynamic> sliceArrayLength({List<dynamic> array, int num}) {
    return array.length > num ? array.sublist(0, num) : array;
  }
}
