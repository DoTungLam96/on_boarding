// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'interesting_model.g.dart';

@JsonSerializable()
class InterestingModel extends Equatable {
  final int? id;
  final String? name;
  bool? isSelected;
  InterestingModel({this.id, this.name, this.isSelected});

  InterestingModel copyWith({int? id, String? name, bool? isSelected}) {
    return InterestingModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isSelected: isSelected ?? this.isSelected);
  }

  factory InterestingModel.fromJson(Map<String, dynamic> json) =>
      _$InterestingModelFromJson(json);

  Map<String, dynamic> toJson() => _$InterestingModelToJson(this);

  @override
  List<Object?> get props => [id, name, isSelected];
}
