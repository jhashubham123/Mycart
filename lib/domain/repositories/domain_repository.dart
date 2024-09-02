abstract class DomainRepository {
  /// Get local value
  void getLocalValue(String key);

  /// Save local value
  void saveLocalValue(dynamic key, dynamic value);

  /// Clear local box
  void clearBox();
}
