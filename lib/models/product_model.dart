import 'package:aldo_shop/models/category_model.dart';
import 'package:aldo_shop/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  // Karna Data harga kita itu Float ,00
  double? price;
  String? description;
  String? tags;
  // Data Kategori yang dipisah
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updateAt;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.galleries,
    this.createdAt,
    this.updateAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.formJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJSon(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updateAt.toString()
    };
  }
}
