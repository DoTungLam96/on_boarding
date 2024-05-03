import 'package:flutter_on_boarding/gen/assets.gen.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavouriteHomeModel {
  final String? title;
  final String? imagePath;
  final int? count;

  FavouriteHomeModel({
    this.title,
    this.imagePath,
    this.count,
  });

  FavouriteHomeModel copyWith({
    String? title,
    String? imagePath,
    int? count,
  }) {
    return FavouriteHomeModel(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      count: count ?? this.count,
    );
  }
}

final ListFavouriteHome = [
  FavouriteHomeModel(
      title: "Văn bản chưa xử lý",
      imagePath: Assets.images.icVanbanchuaxuly,
      count: 19),
  FavouriteHomeModel(
      title: "Văn bản chờ ký duyệt",
      imagePath: Assets.images.icVanbanchuaden,
      count: 11),
  FavouriteHomeModel(
      title: "Văn bản chờ xét duyệt",
      imagePath: Assets.images.icVanbanchoxetduyet,
      count: 99),
  FavouriteHomeModel(
      title: "Văn bản ký chưa đến",
      imagePath: Assets.images.icVanbanyeucaudatlich,
      count: 1000023),
];
