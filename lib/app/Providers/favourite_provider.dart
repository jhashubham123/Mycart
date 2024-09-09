import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycart/domain/entities/model/hive/favourites/favourite_model.dart';

class FavouriteProvider extends ChangeNotifier {
  /// Get box of favourite to store data in it
  Box<FavouriteModel> favouriteBox = Hive.box<FavouriteModel>('favourite');

  /// Saving value in favourite box
  void saveFavouriteItem({
    required int itemId,
    required FavouriteModel favouriteModel,
  }) {
    favouriteBox.put(itemId, favouriteModel);
    notifyListeners();
  }

  /// get value from favourite box
  void getFavouriteItem({
    int? itemId,
  }) {
    if (itemId != null) {
      favouriteBox.get(itemId);
    }
    print('product Keys -- ${favouriteBox.length}');
  }

  /// delete value from favourite box
  void deleteFavouriteItem({
    int? itemId,
  }) {
    print('itemid--------- $itemId');
    if (itemId == null) {
      favouriteBox.clear();
    }
    favouriteBox.delete(itemId);

    notifyListeners();
  }
}
