import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/CreateAccount.dart';
import 'package:push/painter/ArcPainter.dart';
import 'package:push/painter/CircleClipper.dart';
import 'package:push/painter/DiagonalClipper.dart';
import 'package:push/painter/RailLineClipper.dart';
import 'package:push/painter/RoundedRectangleClipper.dart';
import 'package:push/painter/TicketClipper.dart';
import 'package:push/presentation/Signup.dart';
import 'package:push/presentation/component/Background.dart';
import 'package:push/presentation/component/already_have_an_account_acheck.dart';
import 'package:push/presentation/component/login_screen_top_image.dart';
import 'package:push/presentation/component/or_divider.dart';
import 'package:push/presentation/component/welcome_image.dart';
import 'package:push/utils/LoadingIndicator.dart';
import 'package:push/utils/Spacing.dart';
import 'package:push/utils/custom_dialog.dart';
import '../../bloc/login/login_bloc.dart';
import 'color_utils.dart';

import 'custom_button/CheckboxPopupDialog.dart';
import 'custom_button/TopShapeClipper.dart';
import 'custom_button/custom_button.dart';
import 'custom_button/evaluation_button.dart';
import 'custom_button/filter_dialog.dart';
import 'custom_button/neumorphic_container.dart';
import 'custom_button/neumorphic_popup.dart';
import 'custom_button/nuroprism_card.dart';
import 'custom_button/nuroprism_card_view.dart';
import 'custom_button/nuroprism_circle_button.dart';
import 'custom_button/nuroprism_login_button.dart';
import 'custom_button/nuroprism_text_form_field.dart';
import 'custom_button/outline_button.dart';
import 'home.dart';
import 'model/Option.dart';
import 'package:http/http.dart' as http;
import 'package:push/painter/RectanglePainter.dart';
import 'package:push/painter/CirclePainter.dart';

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
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (state is LoginFailure) {
              ErrorDialog.show(context, message: '${state.error}');
            } else if (state is NoInternetConnection) {
              //  showCustomSnackbar(context,state.error);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: LoadingIndicator());
              }
              return Background(
                child: Padding(
                  padding: Spacing.margin4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const LoginScreenTopImage(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorUtils.app_primary_color,
                                              width: 2),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorUtils.app_primary_color,
                                              width: 4.0),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorUtils.app_primary_color),
                                        ),
                                        hintText:
                                            "codingskills-demo101@mejidigital.in",
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                          color: ColorUtils.app_primary_color,
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400),
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
                                              color:
                                                  ColorUtils.app_primary_color,
                                              width: 2),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorUtils.app_primary_color,
                                              width: 4.0),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorUtils.app_primary_color),
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
                                  CustomOutlineButton(
                                    width: MediaQuery.of(context).size.width,
                                    text: 'Login',
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final username =
                                            _usernameController.text;
                                        final password =
                                            _passwordController.text;
                                        context
                                            .read<LoginBloc>()
                                            .add(LoginButtonPressed(
                                              username: username,
                                              password: password,
                                            ));
                                      }
                                    },
                                    textColor: Colors.blue,
                                    borderColor: Colors.blue,
                                    borderWidth: 2.0,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 24.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    borderRadius: 12.0,
                                  ),
                                  /*   OrDivider(),*/
                                  /*     const SizedBox(height: Spacing.defaultPadding),*/
                                  AlreadyHaveAnAccountCheck(
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const SignUpScreen();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  /*               Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          */ /*    Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const CreateAccount()),
                                          );*/ /*
                                        },
                                        child: const Text(
                                          "Create Account",
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ),*/
                                  NuroprismCircleButton(
                                    icon: Icons.home,
                                    onPressed: () {
                                      _showFilterDialog(context);
                                    },
                                    iconColor: Colors.white,
                                    gradientColors: const [
                                      Colors.purple,
                                      Colors.blue
                                    ],
                                    size: 80.0,
                                    iconSize: 36.0,
                                    borderWidth: 4.0,
                                    borderColor: Colors.white,
                                    elevation: 10.0,
                                  ),
                                  CustomOutlineButton(
                                    width: MediaQuery.of(context).size.width,
                                    text: 'Primary Button',
                                    onPressed: () {
                                      // Action for primary button
                                      print('Primary button pressed');
                                    },
                                    textColor: Colors.blue,
                                    borderColor: Colors.blue,
                                    borderWidth: 2.0,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 24.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    borderRadius: 12.0,
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomOutlineButton(
                                    width: MediaQuery.of(context).size.width,
                                    text: 'Secondary Button',
                                    onPressed: () {
                                      print('Secondary button pressed');
                                    },
                                    textColor: Colors.red,
                                    borderColor: Colors.red,
                                    borderWidth: 1.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    borderRadius: 8.0,
                                  ),
                                  NuroprismLoginButton(
                                    text: 'Login',
                                    onPressed: () {
                                      // Action for login button
                                      print('Login button pressed');
                                    },
                                    textColor: Colors.white,
                                    gradientColors: const [
                                      Colors.purple,
                                      Colors.blue
                                    ],
                                    borderRadius: 16.0,
                                    elevation: 12.0,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  EvaluationButton(
                                    text: 'Submit',
                                    onPressed: () {
                                      _showNeumorphicDialog(context);
                                      print('Submit button pressed');
                                    },
                                    textColor: Colors.white,
                                    buttonColor: Colors.green,
                                    elevation: 8.0,
                                    borderRadius: 16.0,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 16.0),
                                  EvaluationButton(
                                    text: 'Cancel',
                                    onPressed: () {
                                      // Action for cancel button
                                      print('Cancel button pressed');
                                    },
                                    textColor: Colors.black,
                                    buttonColor: Colors.grey,
                                    elevation: 4.0,
                                    borderRadius: 8.0,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  NuroprismCard(
                                    title: 'Nuroprism Card',
                                    subtitle:
                                        'A futuristic card with gradient background.',
                                    icon: Icons.star,
                                    gradientColors: const [
                                      Colors.purple,
                                      Colors.blue
                                    ],
                                    borderRadius: 16.0,
                                    elevation: 12.0,
                                    padding: const EdgeInsets.all(24.0),
                                  ),
                                  const SizedBox(height: 16.0),
                                  NuroprismCard(
                                    title: 'Another Card',
                                    subtitle: 'Different gradient and styling.',
                                    icon: Icons.favorite,
                                    gradientColors: const [
                                      Colors.red,
                                      Colors.orange
                                    ],
                                    borderRadius: 12.0,
                                    elevation: 8.0,
                                    padding: const EdgeInsets.all(16.0),
                                  ),
                                  NuroprismCardView(
                                    title: 'Nuroprism Card',
                                    subtitle:
                                        'A futuristic card with gradient background.',
                                    icon: Icons.star,
                                    gradientColors: const [
                                      Colors.purple,
                                      Colors.blue
                                    ],
                                    borderRadius: 16.0,
                                    elevation: 12.0,
                                    padding: const EdgeInsets.all(24.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                  const SizedBox(height: 16.0),
                                  NuroprismCardView(
                                    title: 'Another Card',
                                    subtitle: 'Different gradient and styling.',
                                    icon: Icons.favorite,
                                    gradientColors: const [
                                      Colors.red,
                                      Colors.orange
                                    ],
                                    borderRadius: 12.0,
                                    elevation: 8.0,
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                  NuroprismTextFormField(
                                    hintText: 'Email',
                                    controller: _usernameController,
                                    keyboardType: TextInputType.emailAddress,
                                    borderColor: Colors.purple,
                                    borderRadius: 16.0,
                                    elevation: 8.0,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                  const SizedBox(height: 16.0),
                                  NuroprismTextFormField(
                                    hintText: 'Password',
                                    controller: _passwordController,
                                    obscureText: true,
                                    borderColor: Colors.blue,
                                    borderRadius: 16.0,
                                    elevation: 8.0,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                  const SizedBox(height: 20.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        //List<Option> options = await fetchOptions();
                                        const jsonString =
                                            '''[{"id": 1, "name": "Option 1"},
                                                                 {"id": 2, "name": "Option 2"},
                                                                 {"id": 3, "name": "Option 3"},
                                                                 {"id": 4, "name": "Option 4"} ]
                                                                   ''';

                                        List<dynamic> jsonList =
                                            json.decode(jsonString);
                                        List<Option> options = jsonList
                                            .map(
                                                (json) => Option.fromJson(json))
                                            .toList();

                                        print(options
                                            .map((option) =>
                                                '${option.id}: ${option.name}')
                                            .toList());
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CheckboxPopupDialog(
                                                options: options);
                                          },
                                        );
                                      } catch (e) {
                                        print('Error fetching options: $e');
                                      }
                                    },
                                    child: const Text(
                                        'Show Multiple Selection Popup'),
                                  ),
                                  Center(
                                    child: CustomPaint(
                                      size: const Size(300, 200),
                                      // Size of the CustomPaint widget
                                      painter: RectanglePainter(),
                                    ),
                                  ),
                                  Center(
                                    child: CustomPaint(
                                      size: const Size(300, 200),
                                      // Size of the CustomPaint widget
                                      painter: CirclePainter(),
                                    ),
                                  ),
                                  Center(
                                    child: CustomPaint(
                                      size: const Size(300, 200),
                                      // Size of the CustomPaint widget
                                      painter: ArcPainter(),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: Container(
                                      width: 100, // Width of the container
                                      height: 100, // Height of the container
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        // Background color of the container
                                        borderRadius: BorderRadius.circular(
                                            10), // Rounded corners
                                      ),
                                      child: CustomPaint(
                                        painter: CirclePainter(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: ClipPath(
                                      clipper: DiagonalClipper(),
                                      child: Container(
                                        width: 300,
                                        height: 200,
                                        color: Colors.blue,
                                        // Background color of the container
                                        child: const Center(
                                          child: Text(
                                            'Hello, Flutter!',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: ClipPath(
                                      clipper: CircleClipper(),
                                      child: Container(
                                        width: 200,
                                        // Width of the container
                                        height: 200,
                                        // Height of the container
                                        color: Colors.blue,
                                        // Background color of the container
                                        alignment: Alignment.center,
                                        // Center the text inside the container
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Hello, Flutter! ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipPath(
                                        clipper: RoundedRectangleClipper(
                                            borderRadius: 12),
                                        child: Container(
                                          width: 200,
                                          // Width of the container
                                          height: 200,
                                          // Height of the container
                                          color: Colors.blue,
                                          // Background color of the container
                                          alignment: Alignment.center,
                                          // Center the text inside the container
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Hello, Flutter! ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ClipPath(
                                        clipper: RoundedRectangleClipper(
                                            borderRadius: 12),
                                        child: Container(
                                          width: 200,
                                          // Width of the container
                                          height: 200,
                                          // Height of the container
                                          color: Colors.blue,
                                          // Background color of the container
                                          alignment: Alignment.center,
                                          // Center the text inside the container
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Hello, Flutter! ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Center(
                                    child: ClipPath(
                                      clipper: TicketClipper(),
                                      child: Container(
                                        width: 300,
                                        height: 150,
                                        color: Colors.blue,
                                        // Background color of the ticket
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'VIP Ticket',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Admit One',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              const SizedBox(height: 20.0),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: ClipPath(
                                        clipper: RailLineClipper(),
                                        child: Container(
                                          width: 200, // Width of the rail line container
                                          height: 400, // Height of the rail line container
                                          color: Colors.brown, // Background color for the rail line
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: ClipPath(
                                        clipper: RailLineClipper(),
                                        child: Container(
                                          width: 200, // Width of the rail line container
                                          height: 400, // Height of the rail line container
                                          color: Colors.brown, // Background color for the rail line
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                                ],
                              ),
                            ),
                          ),
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

void _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FilterDialog();
    },
  );
}

void _showNeumorphicDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return NeumorphicDialog(
        title: 'Neumorphic Dialog',
        content: 'This is a neumorphic style popup.',
        onConfirm: () {
          Navigator.of(context).pop();
          // Handle confirm action
        },
        onCancel: () {
          Navigator.of(context).pop();
          // Handle cancel action
        },
      );
    },
  );
}
