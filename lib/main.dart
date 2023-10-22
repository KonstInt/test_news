import 'package:flutter/material.dart';
import 'package:test_news/app/di/locator.dart';
import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
