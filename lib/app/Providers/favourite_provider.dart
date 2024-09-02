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
  }

  /// get value from favourite box
  void getFavouriteItem({
    required int itemId,
  }) {
    favouriteBox.get(itemId);
  }
}
