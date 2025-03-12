import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/home.dart';
import 'package:tp2/mytheme.dart';
import 'package:tp2/viewmodels/settingsviewmodels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) {
          SettingViewModel settingViewModel = SettingViewModel();
          return settingViewModel;
        },
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
            title: "TD2",
            home: Home(),
            theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
          );
        },
      ),
    );
  }
}