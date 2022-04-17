extension CollectionExtensions<T> on List<T> {
  Iterable<List<T>> chunk(int size) {
    List<List<T>> chunks = [];
    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }

  /// 在原始列表的相邻元素之间插入指定的元素。
  ///
  /// Examples:
  /// ```dart
  /// var list = ['A', 'A', 'A'];
  /// list.insertBetween('b');
  /// print(list) // Output: ['A', 'b', 'A', 'b', 'A']
  /// ```
  ///
  /// ### NOTE:
  /// 该方法仅对至少 2 个元素的 [List] 才产生作用，否则不会产生任何影响。
  ///
  void insertBetween(T element) {
    int len = length;
    for (var i = 1; i <= len - 1; i++) {
      insert(2 * i - 1, element);
    }
  }
}
