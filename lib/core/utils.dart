import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int mycoins = 1000;
String myname = 'Player';

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  mycoins = prefs.getInt('mycoins') ?? 1000;
  myname = prefs.getString('myname') ?? 'Player';
}

Future<void> changeCoins(bool correct) async {
  final prefs = await SharedPreferences.getInstance();
  if (correct) {
    mycoins = mycoins + 10;
  } else {
    mycoins = mycoins - 10;
  }
  log(mycoins.toString());
  await prefs.setInt('mycoins', mycoins);
}

Future<void> saveCoins(int coin) async {
  final prefs = await SharedPreferences.getInstance();
  mycoins = mycoins + coin;
  await prefs.setInt('mycoins', mycoins);
}

String formatCoins() {
  return NumberFormat('#,##0').format(mycoins);
}

String formatTimer(int totalSeconds) {
  int minutes = totalSeconds ~/ 60;
  int seconds = totalSeconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}



// // HIVE
// List<MyModel> mymodels = [];

// Future<List<MyModel>> getModels() async {
//   final box = await Hive.openBox('mymodelbox');
//   List data = box.get('mymodels') ?? [];
//   mymodels = data.cast<MyModel>();
//   log(mymodels.length.toString());
//   return mymodels;
// }

// Future<List<MyModel>> updateModels() async {
//   final box = await Hive.openBox('mymodelbox');
//   box.put('mymodels', mymodels);
//   mymodels = await box.get('mymodels');
//   return mymodels;
// }

// int getCurrentTimestamp() {
//   return DateTime.now().millisecondsSinceEpoch ~/ 1000;
// }