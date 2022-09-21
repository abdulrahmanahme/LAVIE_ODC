import 'package:flutter/material.dart';
import 'package:lavie/layout/cubit_layout/cubit.dart';
import 'package:lavie/layout/cubit_layout/status.dart';

import '../screens_and_cubit/home/home.dart';
import '../screens_and_cubit/product_screen/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
        return  
          BlocConsumer<LayoutCubit, LayoutLavieStatus>(
            listener: (context, state) {
            },
            builder: (context, state) {
              var cubit = LayoutCubit.get(context);
          return SafeArea(
              child: Scaffold(
                extendBody: true,
                body: cubit.screen[cubit.currentPage],
                bottomNavigationBar: BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  notchMargin: 12,
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cubit.bottomBar(
                          numberPage: 0,
                          currentscreen:HomeScreen (),
                          icon: AssetImage("assets/image/navbar_icons/leave.png"),
                        ),
                        cubit.bottomBargetuser(
                          numberPage: 1,
                          currentscreen: ProductScreen(),
                          icon: AssetImage(
                              "assets/image/navbar_icons/qr-code-scan.png"),
                        ),
                        SizedBox(width: 15),
                        cubit.bottomBar(
                          numberPage: 2,
                          currentscreen: ProductScreen(),
                          // icon: Icons.mail,
                          icon: AssetImage("assets/image/navbar_icons/Bell.png"),
                        ),
                        cubit.bottomBar(
                          numberPage: 3,
                          currentscreen: ProductScreen(),
                          // icon: Icons.settings_cell,
                          // iconName: 'Setting',
                          icon: AssetImage("assets/image/navbar_icons/person.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                              
                  child: ImageIcon(
                    AssetImage('assets/image/navbar_icons/home.png'),
                    size: 25,
                  ),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    
                    // cubit.flotingActionState(context);
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return  HomeScreen();
        },
      ),
    );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
            );
            }
          
        )
        ;
  
  }
}
