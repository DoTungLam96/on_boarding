import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/model/category_model.dart';
import 'package:flutter_on_boarding/model/interesting_model.dart';
import 'package:collection/collection.dart';

import '../constant/constant.dart';

class CategoryCubit extends Cubit<CategoryModel?> {
  CategoryCubit({CategoryModel? categoryModel}) : super(categoryModel);

  List<CategoryModel> _listSelected = [];

  List<CategoryModel> get getListSelected => _listSelected;

  List<CategoryModel> _listUnSelected = [];

  List<CategoryModel> get getListUnSelected => _listUnSelected;

  final List<CategoryModel> _listTotal = LIST_FAVOURITE;

  void init() {
    _listSelected =
        _listTotal.where((element) => element.isSelected == true).toList();
    _listUnSelected =
        _listTotal.where((element) => element.isSelected != true).toList();
  }

  void addOrRemoveFavourite(
      {required CategoryModel item, required bool isRemove}) {
    final index = _listTotal.indexOf(
      _listTotal.firstWhere((element) => element.id == item.id),
    );
    if (isRemove) {
      _listTotal[index].isSelected = false;
    } else {
      _listTotal[index].isSelected = true;
    }
    _update();
    emit(item.copyWith());
  }

  void _update() {
    _listSelected.clear();
    _listUnSelected.clear();
    init();
  }
}
