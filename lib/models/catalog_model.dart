import 'package:realm/realm.dart';

part 'catalog_model.realm.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late int id;
  late String name;
  late int color;
}

class CatalogModel {
  late Realm realm;

  CatalogModel() {
    var config = Configuration.local([
      Item.schema,
    ], shouldDeleteIfMigrationNeeded: true);
    realm = Realm(config);

    var allItems = realm.all<Item>();
    if (allItems.isEmpty) {
      realm.write(() {
        realm.add(Item(1, 'Code Smell', 0xFFF44336));
        realm.add(Item(2, 'Control Flow', 0xFF2196F3));
        realm.add(Item(3, 'Interpreter', 0xFF9C27B0));
        realm.add(Item(4, 'Recursion', 0xFF673AB7));
        realm.add(Item(5, 'Sprint', 0xFF4CAF50));
      });
    }
  }
}
