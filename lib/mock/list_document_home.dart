import 'package:flutter_on_boarding/gen/assets.gen.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DocumentHomeModel {
  final String? title;
  final int? timeStamp;
  final String? imagePath;

  DocumentHomeModel({
    this.title,
    this.timeStamp,
    this.imagePath,
  });

  DocumentHomeModel copyWith({
    String? title,
    int? timeStamp,
    String? imagePath,
  }) {
    return DocumentHomeModel(
      title: title ?? this.title,
      timeStamp: timeStamp ?? this.timeStamp,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

final ListDocumentHome = [
  DocumentHomeModel(
      title: "Quy trình đánh giá hiệu quả tài chính tại nhà",
      imagePath: Assets.images.icDoc1,
      timeStamp: 1714606439),
  DocumentHomeModel(
      title: "Quy trình quản lý văn bản đi, đến Tập đoàn Viettel",
      imagePath: Assets.images.icDoc2,
      timeStamp: 1706744039),
  DocumentHomeModel(
      title: "Quy trình quản lý văn bản đi, đến Tập đoàn Viettel",
      imagePath: Assets.images.icDoc2,
      timeStamp: 1706744039),
  DocumentHomeModel(
      title: "Guideline định cỡ, cấp phát hạ tầng công cộng tại Viettel",
      imagePath: Assets.images.icDoc3,
      timeStamp: 1714710810),
];

final ListDocumentInprocessHome = [
  DocumentHomeModel(
      title: "Quy trình đánh giá hiệu quả tài chính.pdf",
      imagePath: Assets.images.icPdf,
      timeStamp: 1714606439),
  DocumentHomeModel(
      title: "Dự thảo Tờ trình đầu tư mua sắm.docx",
      imagePath: Assets.images.icDoc,
      timeStamp: 1706744039),
  DocumentHomeModel(
      title: "Thống kê danh sách cán bộ VPTĐ.xlsx",
      imagePath: Assets.images.icExcel,
      timeStamp: 1706744039),
  DocumentHomeModel(
      title: "Guideline định cỡ, cấp phát hạ tầng công cộng tại Viettel",
      imagePath: Assets.images.icDoc3,
      timeStamp: 1714710810),
];
