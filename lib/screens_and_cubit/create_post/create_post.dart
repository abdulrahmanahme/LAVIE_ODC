import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie/screens_and_cubit/create_post/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/create_post/cubit/states.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  // @override
  // void initState() {
  //    SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  // ]);
  //   super.initState();
  // }
  var controllerTittle = TextEditingController();
  var controllerDescraption = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CreatePostCubit.get(context);
        
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              iconSize: 25,
                              color: Colors.black,
                              icon: Icon(Icons.arrow_back_ios_new),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Create New post',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (cubit.postPhone != null)
                              Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 180,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(cubit.postPhone!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cubit.removePostImage();
                                    },
                                    icon: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (cubit.postPhone == null)
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cubit.getPostImage();
                                      },
                                      icon: Icon(Icons.add),
                                      color: Colors.green,
                                      iconSize: 30),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Add Photo',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18.0),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 1, left: 15, top: 10, bottom: 5),
                            child: Text(
                              'Title',
                              style: TextStyle(
                  
                                  // color: Color(0xff1A2552),
                  
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'jannah'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: defaultFormField(
                          // prefix: Icons.email,
                  
                          controller: controllerTittle,
                  
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your title';
                            }
                  
                            return null;
                          },
                  
                          type: TextInputType.emailAddress,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 1, left: 15, top: 10, bottom: 5),
                            child: Text(
                              'Description',
                              style: TextStyle(
                  
                                  // color: Color(0xff1A2552),
                  
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'jannah'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: defaultFormField(
                          // prefix: Icons.email,
                          // maxLines: 5,
                          maxLines: 3,
                          controller: controllerDescraption,
                  
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your  descraption ';
                            }
                  
                            return null;
                          },
                  
                          type: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.only(
                                top: 20, bottom: 20, left: 10, right: 10),
                            // shadowColor: Color(0xffFF4500),
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Post',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              cubit.createPost(
                                title: controllerTittle.text,
                                description: controllerDescraption.text,
                                imageBase64:
                                    "data:image/png;base64,${cubit.base64Image}",
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox(

                //   height: 8,

                // ),
              ),
            ),
          );
        });
  }
}
