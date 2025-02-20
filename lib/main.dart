import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tasks/screens/home_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

void _initCrashlitics() {
  FlutterError.onError = (details) => (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

  PlatformDispatcher.instance.onError =
      (Object exception, StackTrace stackTrace) {
    FirebaseCrashlytics.instance
        .recordError(exception, stackTrace, fatal: true);
    return true;
  };
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBfpm47flpKFs99algr9Z8B9H7ULM9jkIk',
    appId: '1:852697167768:android:654c253adab4c1b13f5ded',
    messagingSenderId: 'sended',
    projectId: 'my-tasks-d54f8',
    storageBucket: 'my-tasks-d54f8.appspot.com',
  ));
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  _initCrashlitics();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tasks',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
