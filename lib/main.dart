import 'package:flutter/material.dart';

import 'pages/note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.grey.shade700,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white))),
      home: NotePage(),
    );
  }
}
