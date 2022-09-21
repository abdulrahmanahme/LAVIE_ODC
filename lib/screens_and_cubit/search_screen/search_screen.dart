import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Search_Box_widget(
                width: displayWidth(context) * .9,
                suffixIcon: Image.asset('assets/Union.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Results for ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "\"Cactus plants\" ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green)),
                      ],
                    ),
                  ),
                  Text(
                    "0 found",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight(context) * .18,
              ),
              Container(
                  child: Image.asset('assets/search_screen_icon/Frame.png')),
              SizedBox(
                height: displayHeight(context) * .060,
              ),
              Text(
                "Not found",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(
                    child: Text(
                      "Sorry,the keyword you entered cannot be found, please check again or search with anthor keyword.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        //  fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
