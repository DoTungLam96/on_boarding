// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String? value;
  const SearchModel({
    this.value,
  });

  SearchModel copyWith({
    String? value,
  }) {
    return SearchModel(
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [value];
}
