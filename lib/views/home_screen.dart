import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:weatherapp/core/widgets/glass_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(child: Column(children: [])),
          ),
        ),
      ),
    );
  }
}
