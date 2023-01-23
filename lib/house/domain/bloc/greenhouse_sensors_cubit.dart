import 'package:firebase_database/firebase_database.dart';

class GreenhouseSensorsCubit {
  Future<void> getSensorsData({String path = ""}) async {
    try {
      final database = FirebaseDatabase.instance.ref();
      database.child('/test/$path').onValue.listen((event) {
        final data = (event.snapshot.value ?? "").toString();
      });
    } catch (e) {}
  }
}
