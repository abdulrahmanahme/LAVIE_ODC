import 'package:flutter/material.dart';
import 'package:lavie/layout/cubit_layout/cubit.dart';
import 'package:lavie/screens_and_cubit/Blogs/blogs_screen.dart';
import 'package:lavie/screens_and_cubit/Blogs/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/auth/login/login_screen.dart';
import 'package:lavie/screens_and_cubit/cart_screen/cart_notfound.dart';
import 'package:lavie/screens_and_cubit/cart_screen/cart_screen.dart';
import 'package:lavie/screens_and_cubit/create_post/create_post.dart';
import 'package:lavie/screens_and_cubit/create_post/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/forurms_screen.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/cubit.dart';
import 'package:lavie/screens_and_cubit/home/home.dart';
import 'package:lavie/screens_and_cubit/profile_screen/profile_screen.dart';
import 'package:lavie/screens_and_cubit/qr_screen/after_can.dart/after_can.dart';
import 'package:lavie/screens_and_cubit/qr_screen/qr_screen.dart';
import 'package:lavie/screens_and_cubit/reset_password/change_password.dart';
import 'package:lavie/screens_and_cubit/reset_password/create_password.dart';
import 'package:lavie/style/bloc_obsrver.dart';


import 'layout/layout_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/local/shardpre.dart';
import 'network/remote/Dio_helper.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/cubit.dart';

import 'package:lavie/screens_and_cubit/profile_screen/cubit/cubit.dart';

import 'screens_and_cubit/reset_password/reset_password.dart';
import 'package:lavie/screens_and_cubit/qr_screen/cubit/cubit.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

   DioHelper.init();
  await CacheHelper.init();
  Widget ?startScreen;
 
  runApp( MyApp(widget: startScreen!));
    Bloc.observer = MyBlocObserver();
  var token= CacheHelper.getData(key: SharedKeys.token);
  if (token != null) {
    startScreen = LayoutScreen();
  } else {
    startScreen = LoginScreen();
  }
   print("ttttttttttttttttttttttttttttttttttttttttttt${token}");
}
class MyApp extends StatelessWidget {
   MyApp({this.widget});
  Widget?widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [

            BlocProvider<HomeCubit >(
          create: (BuildContext context) => HomeCubit ()..getProducts()..getSeeds()..getTools()..getPlants(),
        ),
        /////////////////////////////////
          BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
     
           BlocProvider<LayoutCubit>(
          create: (context) =>LayoutCubit(),
        ),
         BlocProvider<CreatePostCubit>(
          create: (context) =>CreatePostCubit(),
        ),
         BlocProvider<ForumCubit>(
          create: (context) =>ForumCubit()..getForums()..getMyForums(),
        ),
           BlocProvider<ProfileCubit>(
          create: (context) =>ProfileCubit()..getchangedDataa(),
        ),

          BlocProvider<RQCodeCubit>(
          create: (context) => RQCodeCubit()
        ),
         BlocProvider<BlogsCubit>(
          create: (context) =>BlogsCubit()
        ),
          ],
      child: MaterialApp(
        title: 'LaVie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(       
          primarySwatch: Colors.blue,
        ),
        home:widget,
      ),
    );
  }
}

