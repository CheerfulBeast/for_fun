import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';
import 'package:ricky_and_morty_simple_project/data/provider/data_provider.dart';

abstract class IDataRepository {
  Future<DataModel> getCharacters();

  Future<DataModel> getNewCharacters(DataModel data);
}

class DataRepository implements IDataRepository {
  final DataProvider dataProvider;
  DataRepository(this.dataProvider);
  @override
  Future<DataModel> getCharacters() {
    return DataProvider().getCharacters();
  }

  @override
  Future<DataModel> getNewCharacters(DataModel data) {
    return DataProvider().getNewCharacters(data);
  }
}
