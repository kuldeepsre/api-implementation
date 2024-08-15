import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push/endpoint/globleconstant.dart';
import 'package:push/login_form.dart';
import '../custom_button/custom_button.dart';
import '../utils/custom_dialog.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  @override
  State<MyProfile> createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool _validate;
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
    _validate = false;
    _usernameController.text=GlobleConstant.firstname;
    _lastNameController.text=GlobleConstant.lastName;
    _EmailController.text=GlobleConstant.email;
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("My Profile",style: TextStyle(color: Colors.black,fontSize: 32),),
          ),
          const SizedBox(height: 15,),
          Card(
            color: Colors.white54,
            elevation: 5,
            shape: const Border(left: BorderSide(color: Colors.blueAccent, width: 5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("First Name",style: TextStyle(color: Colors.black,fontSize: 18),),
                  TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: "dev",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                    controller: _usernameController,

                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Card(
            color: Colors.white54,
            elevation: 5,
            shape: const Border(left: BorderSide(color: Colors.blueAccent, width: 5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Last Name",style: TextStyle(color: Colors.black,fontSize: 18),),
                  TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: "dev",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                    controller: _lastNameController,

                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Card(
            color: Colors.white54,
            elevation: 5,
            shape: const Border(left: BorderSide(color: Colors.blueAccent, width: 5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email",style: TextStyle(color: Colors.black,fontSize: 18),),
                  TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: "dev@qwe",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                    controller: _EmailController,

                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),

          CustomButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final username = _usernameController.text.toString();
                final lastNAmne = _lastNameController.text.toString();
                final email = _lastNameController.text.toString();
              /*  context.read<LoginBloc>().add(LoginButtonPressed(
                  username: username,
                  password: password,
                ));*/
              }
            },
            title: 'Update My Account'.toUpperCase(),
          ),
          const SizedBox(height: 20,),
          CustomButton(
            onPressed: () {
              LogoutDialog.show(context, () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LoginForm(),
                    )
                );
              });
            },
            title: 'logout'.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
