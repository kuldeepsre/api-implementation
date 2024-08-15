import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/utils/LoadingIndicator.dart';
import 'package:push/utils/custom_dialog.dart';

import 'bloc/login/login_bloc.dart';
import 'color_utils.dart';
import 'custom_button/custom_button.dart';
import 'login_form.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late bool _validate;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    _validate = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  LoginForm()),
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
            color: Colors.deepPurple,

            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 12),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          /* CircleAvatar(
                            child: image.,
                          )*/
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
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  LoginForm()),
                              );
                            }
                            ,
                            child:  const Text("Loigin Here"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
