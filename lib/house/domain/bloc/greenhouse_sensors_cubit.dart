// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fuzzy_greenhouse/app/async_data.dart';
//
// class GreenhouseSensorsCubit extends Cubit<AsyncData<String>> {
//   GreenhouseSensorsCubit() : super(const AsyncData<String>());
//
//   Future<void> getSensorsData({String path = ""}) async {
//     try {
//       emit(const AsyncData<String>.loading());
//       final database = FirebaseDatabase.instance.ref();
//       database.child('/test/$path').onValue.listen((event) {
//         final data = (event.snapshot.value ?? "").toString();
//         emit(AsyncData<String>.success(data));
//       });
//     } catch (e) {
//       emit(const AsyncData<String>.error('No data'));
//     }
//   }
// }
