import 'package:hive/hive.dart';
part 'favourite_model.g.dart';

@HiveType(typeId: 0)
class FavouriteModel {
  FavouriteModel({
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  @HiveField(0)
  final String itemImage;
  @HiveField(1)
  final String itemName;
  @HiveField(2)
  final String itemPrice;
}
