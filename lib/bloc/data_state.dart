import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

class DataState {}

final class DataInitialState extends DataState {}

final class DataLoadingState extends DataState {}

final class DataSuccessState extends DataState {
  final DataModel dataModel;
  DataSuccessState(this.dataModel);
}

final class DataErrorState extends DataState {
  final String error;
  DataErrorState(this.error);
}
