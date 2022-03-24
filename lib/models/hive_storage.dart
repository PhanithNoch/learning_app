import 'package:hive/hive.dart';
import '../models/product_model.dart';

@override
const int typeId = 0;

class ProductHiveAdapter extends TypeAdapter<ProductModel> {
  @HiveField(1)
  String? name;

  @HiveField(2)
  String? desc;

  String? price;
  @HiveField(3)
  @HiveField(4)
  String? imgURL;

  @override
  read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      title: fields[0] as String,
      desc: fields[1] as String,
      imgURL: fields[2] as String,
      price: fields[3] as String,
    );
  }

  @override
  int get typeId => typeId.hashCode;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.desc);
    writer.writeString(obj.price);
    writer.writeString(obj.imgURL);
  }
}
