class ArrayUtils {
  static List<dynamic> sliceArrayLength({List<dynamic> array, int num}) {
    return array.length > num ? array.sublist(0, num) : array;
  }

  static dynamic checkValueExistInArray({dynamic array, dynamic dontValue}) {
    return array.asMap().containsKey(0) ? array[0] : dontValue;
  }
}
