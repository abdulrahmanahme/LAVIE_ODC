import 'package:flutter/material.dart';


import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUp extends StatelessWidget {
  const SingUp({
    Key? key,
    required this.controllerfullname,
    required this.controlleremail,
    required this.controllerpassword,
    required this.controllerconfirmpassword,
    required this.formkey,
  }) : super(key: key);

  final TextEditingController controllerfullname;
  final TextEditingController controlleremail;
  final TextEditingController controllerpassword;
  final TextEditingController controllerconfirmpassword;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            // height:90 ,
            // width: 370,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                Expanded(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                               
                nametextForm(
                
                              name: 'Frist name',
                
                            ),
                            
                            defaultFormField(
                  // label: 'E-mail',
                
                  // prefix: IconBroken.Message,
                
                  controller: controlleremail,
                
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                
                    return null;
                  },
                
                  type: TextInputType.emailAddress,
                            ),
                    ],
                  ),
                ),
                
              SizedBox(
width: 10,
                      ),
                Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                nametextForm(
                
                              name: 'Last name',
                
                            ),
                            defaultFormField(
                  // label: 'E-mail',
                
                  // prefix: IconBroken.Message,
                
                  controller: controlleremail,
                
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                
                    return null;
                  },
                
                  type: TextInputType.emailAddress,
                            ),
                    ],
                  ),
                ),
                

              ],
            ),
          ),
          
         
          nametextForm(
            name: 'Email',
          ),
          defaultFormField(
            // label: 'E-mail',

            // prefix: IconBroken.Message,

            controller: controlleremail,

            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },

            type: TextInputType.emailAddress,
          ),
          nametextForm(
            name: 'Password',
          ),
          defaultFormField(
            // label: 'Password',

            // prefix: IconBroken.Lock,

            // suffixIcon: IconButton(

            //     onPressed: () {

            //       // cubit.changePasswordVisibility();

            //     },

            //     icon: Icon(

            //       cubit.suffix,

            //     )),

            // isPassword: cubit.isPassword,

            controller: controllerpassword,

            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },

            type: TextInputType.visiblePassword,
          ),
          nametextForm(
            name: 'Confirm Password',
          ),
          defaultFormField(
            // suffixIcon: IconButton(

            //     onPressed: () {

            //       // cubit.changePasswordVisibility();

            //     },

            //     icon: Icon(

            //       cubit.suffix,

            //     )),

            // isPassword: cubit.isPassword,

            controller: controllerconfirmpassword,

            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },

            type: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0XFF1ABC00),

              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 140, right: 140),

              // shadowColor: Color(0xffFF4500),

              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                // cubit.userLogin(

                //   email: controlleremail.text,

                //   password: controllerpassword.text,

                // );

              }

              // Navigator.push(

              //   context,

              //   MaterialPageRoute(

              //       builder: (context) => SocialLayout()),

              // );
            },
          ),
        ],
      );
 
  }
}
