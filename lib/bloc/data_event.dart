import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

sealed class DataEvent {}

final class LoadDataEvent extends DataEvent {}

final class LoadNewDataEvent extends DataEvent {
  final DataModel data;
  LoadNewDataEvent(this.data);
}
