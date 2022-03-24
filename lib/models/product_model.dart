import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String imgURL;

  ProductModel(
      {required this.title,
      required this.desc,
      required this.price,
      required this.imgURL});
}
