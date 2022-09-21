import 'package:flutter/material.dart';



import '../../../layout/layout_screen.dart';
import '../../../model/user_data_model/user_data_model.dart';
import '../../../network/local/shardpre.dart';
import '../../../responsive/respnsive.dart';
import '../../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../login/login_screen.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class SingUp extends StatelessWidget {
  SingUp({
    Key? key,
    required this.controllerfirstname,
    required this.controlleremail,
    required this.controllerpassword,
     required this.controllerlastName,

    required this.formkey,
  }) : super(key: key);

  final TextEditingController controllerfirstname;
  final TextEditingController controlleremail;
  final TextEditingController controllerlastName;

  final TextEditingController controllerpassword;
  final GlobalKey<FormState> formkey;
UserData? userData;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<SginUpCubit>(
       create: (BuildContext context) => SginUpCubit(),
      child: BlocConsumer<SginUpCubit, SginUpStatus>(
          listener: (context, state) {

              if (state is SginUpErrorState ) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }

          if (state is SginUpSuccessState) {
            CacheHelper.setData(key:SharedKeys.token , value: '${state.userData!.data!.accessToken}').then((value){
              navigateAndFinish(context, LayoutScreen());

              showToast(text: 'Login Success', state: ToastStates.SUCCESS);

            });
            // CacheHelper.saveData(key: 'uId', value: state.uId)
            //     .then((value) async {
            //   SocialCubit.get(context).getPosts();
            //   SocialCubit.get(context).getUserData();
            //   navigateAndFinish(context, SocialLayOut());
            //   showToast(text: 'Login Success', state: ToastStates.SUCCESS);
            // });
          }
          



          },
          builder: (context, state) {
            var cubit = SginUpCubit.get(context);
        return Scaffold(
          body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           FormName(name: 'First name'),
                   
                                defaultFormField(
                      
                      controller: controllerfirstname,
                    
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your First name';
                        }
                    
                        return null;
                      },
                    
                      type: TextInputType.emailAddress,
                                ),
                        ],
                      ),
                    ),
                    
                        Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           FormName(name:  'Last name'),
                          
                    
                                defaultFormField(
                      // label: 'E-mail',
                    
                      // prefix: IconBroken.Message,
                    
                      controller:controllerlastName,
                    
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Last name';
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
                    
                
                  ],
                ),
            
                  SizedBox(
                width: 20,
                            ),
                 FormName(name:  'Email'),
               
                
                defaultFormField(
                  // label: 'E-mail',
              
                  // prefix: IconBroken.Message,
              
                  controller: controlleremail,
              
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter  your Email';
                    }
              
                    return null;
                  },
              
                  type: TextInputType.emailAddress,
                ),
                 FormName(name:  'Password'),
                
               defaultFormField(
                                               
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(
                                cubit.suffix,
                              )),
                          isPassword: cubit.isPassword,
                          controller: controllerpassword,
                          validate: (value) {
                            if ( value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                                              ),
                
                SizedBox(
                  height: 20,
                ),
            state is SginUpLoadingState?
            CircularProgressIndicator(
              color: Colors.green,
            ):

           
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
                    'Rgister',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      
                      cubit.userSginUp(firstName: controllerfirstname.text, lastName:controllerlastName.text, email:controlleremail.text, password:controllerpassword.text);
                      
              
                    }
              
                    // Navigator.push(
              
                    //   context,
              
                    //   MaterialPageRoute(
              
                    //       builder: (context) => SocialLayout()),
              
              
                    // );
                  },
                ),
              ],
            ),
        );
          }
      ),
    );
 
  
  }
}
