// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class CategoriesModel {
  String? slug;
  String? name;
  String? url;
  CategoriesModel({this.slug, this.name, this.url});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
