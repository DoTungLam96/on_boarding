// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  final int? id;
  final String? name;
  bool? isSelected;
  final dynamic image;
  CategoryModel({
    this.id,
    this.name,
    this.isSelected,
    this.image,
  });

  CategoryModel copyWith(
      {int? id, String? name, bool? isSelected, dynamic image}) {
    return CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        isSelected: isSelected ?? this.isSelected);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [id, name, isSelected, image];
}
