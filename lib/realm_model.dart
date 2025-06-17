
import 'package:realm/realm.dart';
part 'realm_model.realm.dart';   // declare a part file.

@RealmModel()
class _Car {
  late String make;
  String? model;
  int? kilometer = 500;
  _Person? owner;
}


@RealmModel()
class _Person {
  late String name;
  int age = 1;
}