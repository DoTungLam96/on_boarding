import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/model/interesting_model.dart';
import 'package:collection/collection.dart';

class SelectedItemCubit extends Cubit<InterestingModel?> {
  SelectedItemCubit({InterestingModel? interestingModel})
      : super(interestingModel);

  List<InterestingModel> _listAdded = [];

  List<InterestingModel> get getListAdded => _listAdded;

  void selectedItem({required InterestingModel item}) {
    if (item.isSelected == true) {
      _listAdded.add(item);
    } else {
      _listAdded.removeWhere((element) => element.id == item.id);
    }
    emit(item);
  }
}
