import 'package:flutter/material.dart';
import 'package:flutter_realm/realm_model.dart';
import 'package:realm/realm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Realm realm;

  _HomeScreenState() {
    final config = Configuration.local([
      Car.schema,
      Person.schema,
    ], shouldDeleteIfMigrationNeeded: true);
    realm = Realm(config);
  }

  int get carsCount => realm.all<Car>().length;

  @override
  void initState() {
    super.initState();
    var myCar = Car("Tesla", model: "Model Y", kilometer: 1);
    realm.write(() {
      var newCar = realm.add(Car('Dung', owner: Person('Dung')));

      newCar.model = 'Lq';
      newCar.kilometer = 10000;

      realm.add(myCar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Realm')),
      body: Center(
        child: Text('cars.owner: ${realm.all<Car>().first.owner?.name}'),
      ),
    );
  }
}
