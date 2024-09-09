import 'package:hive/hive.dart';
part 'favourite_model.g.dart';

@HiveType(typeId: 0)
class FavouriteModel {
  FavouriteModel({
    required this.itemId,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  @HiveField(0)
  final int itemId;
  @HiveField(1)
  final String itemImage;
  @HiveField(2)
  final String itemName;
  @HiveField(3)
  final String itemPrice;
}
