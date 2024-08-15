import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/CreateAccount.dart';
import 'package:push/utils/LoadingIndicator.dart';
import 'package:push/utils/custom_dialog.dart';
import '../../bloc/login/login_bloc.dart';
import 'color_utils.dart';
import 'custom_button/custom_button.dart';
import 'home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool _validate;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    _validate = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
            } else if (state is LoginFailure) {
              ErrorDialog.show(context, message: '${state.error}');
            }
            else if (state is NoInternetConnection) {
            //  showCustomSnackbar(context,state.error);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: LoadingIndicator());
              }
              return Container(
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 12),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: const Text("Welcome To",style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 22),)),
                            SizedBox(height: 20,),
                            Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: Image.asset('assets/images/image1.png',)),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color,
                                        width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color,
                                        width: 4.0),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color),
                                  ),
                                  hintText: "codingskills-demo101@mejidigital.in",
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color,
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey.shade400),
                                ),
                                autocorrect: _validate,
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Email Id!";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: TextFormField(
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color,
                                        width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color,
                                        width: 4.0),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.app_primary_color),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    color: ColorUtils.app_primary_color
                                        .withOpacity(0.4),
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                autocorrect: _validate,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Password!";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  final username = _usernameController.text;
                                  final password = _passwordController.text;
                                  context.read<LoginBloc>().add(LoginButtonPressed(
                                    username: username,
                                    password: password,
                                  ));
                                }
                              },
                              title: 'Login',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: GestureDetector(
                                onTap: (){
                                  /*    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CreateAccount()),
                                  );*/
                                }
                                ,
                                child:  const Text("Create Account",style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

