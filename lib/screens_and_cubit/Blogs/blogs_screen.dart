
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie/screens_and_cubit/Blogs/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/Blogs/cubit/states.dart';
import 'package:lavie/screens_and_cubit/Blogs/single_blogs.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/cubit.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/status.dart';
import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlogsScreen extends StatefulWidget {
  // static const String cartpage = 'cartpage';

  int numofItem = 1;
  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}


  
class _BlogsScreenState extends State<BlogsScreen> {
  // @override
  // void initState() {
  //    SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  // ]);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
            cubit.getPlants();
    return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      iconSize: 25,
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Blogs',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    cubit.plant.length > 0
                        ? SizedBox(
                            width: double.infinity,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => BlogsCard(model: cubit.plant[index]),
                              separatorBuilder: (context, index) =>
                                  SizedBox(
                                height: 8.0,
                              ),
                              itemCount:  10,
                              // itemCount: cubit.fromDataList.length>20?cubit.fromDataList.length=8:cubit.fromDataList.length,
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ],
                ),

              
            ]),
          ),
        );
        }
      ),
  
    );
  }
}