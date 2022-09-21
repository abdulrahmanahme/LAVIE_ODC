import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie/screens_and_cubit/create_post/create_post.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/states.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/cubit.dart';
import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  bool isOpen = false;
// void initState() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//   ]);
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumCubit, ForumLavieStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ForumCubit.get(context);
          cubit.getForums();
          cubit.getMyForums();

          return SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(children: [
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
                        'Discussion Forums',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Search_Box_widget(
                    width: displayWidth(context) * .9,
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(
                        color: Colors.green,
                        width: 1,

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12) //
                          ),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    isScrollable: true,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.green,
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabs: [
                      Container(
                        height: displayHeight(context)*.05,
                        width: displayWidth(context)*.35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Tab(
                          child: Text('All Fourms'),
                        ),
                      ),
                      Container(
                      height: displayHeight(context)*.05,
                        width: displayWidth(context)*.35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 2,
                            ),
                          ],
                         
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Tab(
                          child: Text('My Fourms'),
                        ),
                      ),
                    ],
                  ),
                 
          
                  Expanded(
                      child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            cubit.fromDataList.length > 0
                                ? SizedBox(
                                    width: double.infinity,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => Post(
                                           forumData: cubit.fromDataList[index] ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 8.0,
                                      ),
                                      itemCount: cubit.formModel!.data!.length =20
                                      // itemCount: cubit.fromDataList.length>20?cubit.fromDataList.length=8:cubit.fromDataList.length,
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            cubit.myfromDataList.length > 0
                                ? SizedBox(
                                    width: double.infinity,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>Post(
                                         forumData: cubit.myfromDataList[index] ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 8.0,
                                      ),
                                      // itemCount: cubit.myformModel!.data!.length 
                                      itemCount: 1,
                                      // itemCount: cubit.fromDataList.length>20?cubit.fromDataList.length=8:cubit.fromDataList.length,
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                    ],
                  )),
                ]),
                floatingActionButton: FloatingActionButton(
                              heroTag: "f1",   
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    navigateTo(context, CreatePostScreen());
                  },
                ),
              ),
            ),
          );
        });
  }
}
