import 'package:flutter/cupertino.dart';
import 'package:flutter_on_boarding/gen/assets.gen.dart';
import 'package:flutter_on_boarding/model/interesting_model.dart';

import '../model/category_model.dart';

final LIST_INTERESTING_SIGN = <InterestingModel>[
  InterestingModel(
    id: 1,
    name: "Văn bản chờ ký duyệt",
  ),
  InterestingModel(
    id: 2,
    name: "Văn bản chờ ký nháy",
  ),
  InterestingModel(
    id: 3,
    name: "Văn bản chờ ký duyệt",
  ),
  InterestingModel(
    id: 4,
    name: "Văn bản quá thời gian ký",
  ),
  InterestingModel(
    id: 5,
    name: "Văn bản lãnh đạo chưa ký",
  ),
];

final LIST_INTERESTING_FORM = <InterestingModel>[
  InterestingModel(
    id: 9,
    name: "Văn bản chưa đọc",
  ),
  InterestingModel(
    id: 10,
    name: "Văn bản chờ ký nháy",
  ),
  InterestingModel(
    id: 11,
    name: "Tỷ lệ đọc văn bản",
  ),
  InterestingModel(
    id: 12,
    name: "Văn bản quá thời gian ký",
  ),
  InterestingModel(
    id: 13,
    name: "Văn bản chờ ký duyệt",
  ),
  InterestingModel(
    id: 14,
    name: "Văn bản lãnh đạo chưa ký",
  ),
  InterestingModel(
    id: 15,
    name: "Văn bản yêu cầu trả lời",
  ),
];

final LIST_INTERESTING_MEETING = <InterestingModel>[
  InterestingModel(
    id: 20,
    name: "Lịch cá nhân",
  ),
  InterestingModel(
    id: 21,
    name: "Lịch lãnh đạo",
  ),
  InterestingModel(
    id: 22,
    name: "Duyệt lịch",
  ),
];

final LIST_INTERESTING_MISSION = <InterestingModel>[
  InterestingModel(
    id: 30,
    name: "Nhiệm vụ giao đi",
  ),
  InterestingModel(
    id: 31,
    name: "Chờ phê duyệt",
  ),
  InterestingModel(
    id: 32,
    name: "Cảnh báo nhiệm vụ sắp đến hạn",
  ),
];

final LIST_FAVOURITE = <CategoryModel>[
  CategoryModel(id: 1, name: "Trang chủ", isSelected: true),
  CategoryModel(
    id: 2,
    name: "Ký điện tử",
    isSelected: true,
  ),
  CategoryModel(
    id: 3,
    name: "Văn bản",
    isSelected: true,
  ),
  CategoryModel(id: 4, name: "Lịch họp", isSelected: true),
  CategoryModel(id: 5, name: "Nhiệm vụ", isSelected: true),
  CategoryModel(
    id: 6,
    name: "Danh bạ",
  ),
  CategoryModel(
    id: 7,
    name: "Thư viện",
  ),
  CategoryModel(
    id: 8,
    name: "Truyền thông",
  ),
  CategoryModel(
    id: 9,
    name: "Thỏa thuận hợp tác",
  ),
  CategoryModel(
    id: 10,
    name: "Signing Hub",
  ),
  CategoryModel(
    id: 11,
    name: "Kho lưu trữ",
  ),
];

extension CategoryModelEX on CategoryModel {
  Widget get getImage {
    switch (id) {
      case 1:
        {
          return Assets.images.icHome.image(width: 34, height: 36);
        }
      case 2:
        {
          return Assets.images.icSign.image(width: 34, height: 36);
        }
      case 3:
        {
          return Assets.images.icText.image(width: 34, height: 36);
        }
      case 4:
        {
          return Assets.images.icMeeting.image(width: 34, height: 36);
        }
      case 5:
        {
          return Assets.images.icMission.image(width: 34, height: 36);
        }
      case 6:
        {
          return Assets.images.icContact.image(width: 34, height: 36);
        }
      case 7:
        {
          return Assets.images.icLibrary.image(width: 34, height: 36);
        }
      case 8:
        {
          return Assets.images.icCommunicate.image(width: 34, height: 36);
        }
      case 9:
        {
          return Assets.images.icCollab.image(width: 34, height: 36);
        }
      case 10:
        {
          return Assets.images.icSignHub.image(width: 34, height: 36);
        }
      case 11:
        {
          return Assets.images.icStorage.image(width: 34, height: 36);
        }
      default:
        return Assets.images.icHome.image(width: 34, height: 36);
    }
  }
}
