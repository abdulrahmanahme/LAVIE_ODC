
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/layout/cubit_layout/status.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/forurms_screen.dart';
import 'package:lavie/screens_and_cubit/google%20data/google_data.dart';
import 'package:lavie/screens_and_cubit/home/home.dart';
import 'package:lavie/screens_and_cubit/notifcation/noitfication.dart';
import 'package:lavie/screens_and_cubit/product_screen/product_screen.dart';
import 'package:lavie/screens_and_cubit/profile_screen/profile_screen.dart';
import 'package:lavie/screens_and_cubit/qr_screen/qr_screen.dart';


class LayoutCubit extends Cubit<LayoutLavieStatus>{

LayoutCubit():super(InitialLayout());
static LayoutCubit get(context) => BlocProvider.of(context);
  int currentPage = 0;
List<Widget> screen = [
  ForumScreen(),
  // QRScanner(),
  Qrcode(),
  NotifcationPage(),
  ProfileScreen(),
  ];
Future<void> flotingActionState(BuildContext context) {
    return Navigator.push(
      context,
      
      MaterialPageRoute(
        builder: (context) {
          return  ProductScreen();
        },
      ),
    );
  }
  Widget bottomBargetuser(
      {int? numberPage,
      Widget? currentscreen,
       ImageProvider<Object>? icon,
      String? iconName}) {
    return MaterialButton(
      minWidth: 20,
      onPressed: () {
      
        currentPage = numberPage!;
        currentscreen = currentscreen;
        emit(BottomState());
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(

              icon ,
  
     color: currentPage == numberPage ? Colors.green: Colors.black,
     size: 25,
),
          ),
         
        ],
      ),
    );
  }
  int currentIndex = 0;
Widget bottomBar(
      {int? numberPage,
      Widget? currentscreen,
      ImageProvider<Object>? icon,
      String? iconName}) {
    return MaterialButton(
      minWidth: 20,
      onPressed: () {
        currentPage = numberPage!;
        currentscreen = currentscreen;
        emit(BottomState());
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ImageIcon(

              icon ,
  
     color: currentPage == numberPage ? Colors.green: Colors.black,
     size: 25,
)  ,
          ),
        
        ],
      ),
    );
  }




 
}

