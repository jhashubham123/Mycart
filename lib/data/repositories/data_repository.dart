import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycart/domain/repositories/domain_repository.dart';

class DataRepository extends DomainRepository {
  /// Returns the box in which data gets stored
  Box _getBox() => Hive.box<dynamic>('MyCart');

  /// Save value into the box
  @override
  void saveLocalValue(key, value) {
    _getBox().put(key, value);
  }

  /// Get value from the box
  @override
  void getLocalValue(String key) {
    _getBox().get(key);
  }

  /// Clear the open box
  @override
  void clearBox() async {
    await _getBox().clear();
  }
}
