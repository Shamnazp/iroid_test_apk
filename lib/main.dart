import 'package:flutter/material.dart';
import 'package:iroid_apk/view/home/homescreen.dart';
import 'package:iroid_apk/viewmodel/home_vm.dart';
import 'package:provider/provider.dart';
import 'data/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(ApiService())..fetchHomeData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const HomeScreen(),
      ),
    );
  }
}
