import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/rocket_controller.dart';
import 'screens/home_screen..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RocketController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rocket App Assignment',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        //home screen
        home: const HomeScreen(),
      ),
    );
  }
}
