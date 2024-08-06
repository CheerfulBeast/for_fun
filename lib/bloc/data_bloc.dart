import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty_simple_project/bloc/data_event.dart';
import 'package:ricky_and_morty_simple_project/bloc/data_state.dart';
import 'package:ricky_and_morty_simple_project/data/repository/data_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository _dataRepository;
  DataBloc(this._dataRepository) : super(DataInitialState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        final data = await _dataRepository.getCharacters();
        emit(DataSuccessState(data));
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });
    on<LoadNewDataEvent>((event, emit) async {
      emit(DataLoadingState());
      try {
        final data = await _dataRepository.getNewCharacters(event.data);
        emit(DataSuccessState(data));
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });
  }
}
