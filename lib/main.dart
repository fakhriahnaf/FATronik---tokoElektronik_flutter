import 'package:bogorTronik/models/models.dart';
import 'package:bogorTronik/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailBarang(transaction: Transaction(barang: mockBarang[0]))
    );
  }
}