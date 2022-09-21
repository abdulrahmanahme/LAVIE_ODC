import 'package:flutter/material.dart';
import 'package:lavie/screens_and_cubit/cart_screen/cart_notfound.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import '../auth/login/cubit/cubit.dart';
import '../cart_screen/cart_screen.dart';
import '../product_screen/product_screen.dart';
import '../search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../layout/layout_screen.dart';
import '../../../network/local/shardpre.dart';
import '../../../responsive/respnsive.dart';
import '../../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart/cubit.dart';
import 'cubit.dart/status.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          cubit.getProducts();
          cubit.getSeeds();
          cubit.getTools();
          cubit.getPlants();

          return SafeArea(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 130,
                          // color:Colors.amber,
                          child: Image.asset('assets/image/Group1.png'),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(),
                              ),
                            );
                          },
                          child: Search_Box_widget(
                            width: displayWidth(context) * .76,
                          ),
                        ),
                        InkWell(
                          child: CartIcon(),
                          onTap: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>CartScreen()
                                  )
                                  );
                          },
                        ),
                      ],
                    ),
                    // construct the profile details widget here

                    TabBar(
                      indicator: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: Colors.green,
                          width: 3,
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
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 2,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.shade100,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Tab(
                            child: Text('All'),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 2,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.shade100,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Tab(
                            child: Text('Seeds'),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 2,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.shade100,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Tab(
                            child: Text('Plants'),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 2,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.shade100,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Tab(
                            child: Text('Tools'),
                          ),
                        ),
                        
                      ],
                    ),
                    cubit.proudcts.length > 0
                        ? Expanded(
                            child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              // first tab bar view widget
                              ///////////////////////////0
                              ///
                              ////////////////////4
                              GridView.count(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                                children: 
                                List.generate(
                                 4,
                                  // cubit.proudcts.length
                                  (index) =>
                                      cardProduct(model: cubit.proudcts[index]),
                                ),
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                                children: List.generate(
                                  // cubit.seed.length,
                                  4,
                                  (index) =>
                                      ProductWidget(model: cubit.seed[index]),
                                ),
                              ),
                             
                             
/////////////////////
                              GridView.count(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                                children: List.generate(
                                  // cubit.proudcts.length,
                                  5,
                                  (index) =>
                                      cardPlant(model: cubit.plant[index]),
                                ),
                              ),
                               GridView.count(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.3,
                                children: List.generate(
                                  // cubit.tool.length.bitLength,
                                  3,
                                  (index) =>
                                      cardTools(model:cubit.tool[index] ),
                                ),
                              ),

                            
                            ],
                          ))
                        : Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
