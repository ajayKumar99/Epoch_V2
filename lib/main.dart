import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Routes/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(
    App(
      pref: pref,
    ),
  );
}