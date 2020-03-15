import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app_mobile/components/home.dart';
import 'package:society_app_mobile/data_model/CounterModel.dart';
import 'package:society_app_mobile/test_ui.dart';

void main() => runApp(DevicePreview(
      builder: (context) => MyApp(),
      enabled: !kReleaseMode,
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CounterNotifierModel>(
        create: (_) => CounterNotifierModel(21),
        child: HomeView(),
      ),
    );
  }
}
