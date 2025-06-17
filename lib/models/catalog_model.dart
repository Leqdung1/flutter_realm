import 'package:realm/realm.dart';

part 'catalog_model.realm.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late int id;

  late String name;
}

@RealmModel()
class _CatalogModel {
  late Realm realm;

  _CatalogModel() {
    var config = Configuration.local([Item.schema]);
    realm = Realm(config);

    var allItems = realm.all<Item>();

    if (allItems.isEmpty) {}
  }
}
