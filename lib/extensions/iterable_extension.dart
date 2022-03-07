extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull {
    if (isNotEmpty) return first;
    return null;
  }
}
