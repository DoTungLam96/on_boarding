import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/model/interesting_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter_on_boarding/model/search_model.dart';

class SearchCubit extends Cubit<SearchModel?> {
  SearchCubit({SearchModel? searchModel}) : super(searchModel);

  List<InterestingModel> _listAdded = [];

  List<InterestingModel> get getListAdded => _listAdded;

  void searchModel({required SearchModel value}) {
    emit(value);
  }
}
