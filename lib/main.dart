import 'package:bogorTronik/cubit/cubit.dart';
import 'package:bogorTronik/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => BarangCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
      ],
          child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage()
        
        ),
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