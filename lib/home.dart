import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/bloc/navigaton/navigation_bloc.dart';
import 'package:push/presentation/dashboard.dart';
import 'package:push/presentation/my_profile.dart';
import 'package:push/widget/bottom_navigation_bar_widget.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: WillPopScope(
        onWillPop: () async {
          // your logic
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
             backgroundColor: Colors.white,
            title: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*.60,
                  height: 40,
                  child: Image.asset('assets/images/image1.png',)),
            ),
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              switch (state is NavigationUpdated ? state.index : 0) {
                case 0:
                  return MainDashboard();
                case 1:
                  return const Center(child: Text('My Oder'));
                case 2:
                  return const Center(child: Text('Place Add'));
                case 3:
                  return const Center(child: Text('Cart'));
                  case 4:
                  return MyProfile();
                default:
                  return const Center(child: Text('Home Screen'));
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBarWidget(),
        ),
      ),
    );
  }
}
