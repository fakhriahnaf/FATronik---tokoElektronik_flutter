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
      home: MainPage()
      
      );

      // PaymentPage(
      //   transaction: Transaction(
      //     barang: mockBarang[0], 
      //     user: mockUser, 
      //     quantity: 3,
      //     total: (mockBarang[0].price *2 * 1.1).toInt()+ 50000)));
       //DetailBarang(transaction: Transaction(barang: mockBarang[0])));
  }
}