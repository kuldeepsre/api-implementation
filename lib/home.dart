import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/bloc/home_product/product_dashboard_bloc.dart';
import 'package:push/bloc/navigaton/navigation_bloc.dart';
import 'package:push/presentation/CartScreen.dart';
import 'package:push/presentation/HomePage.dart';
import 'package:push/presentation/component/bottom_sheet.dart';
import 'package:push/presentation/dashboard.dart';
import 'package:push/presentation/my_profile.dart';
import 'package:push/presentation/notification.dart';
import 'package:push/widget/bottom_navigation_bar_widget.dart';

import 'bloc/notification/notification_bloc.dart';
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
            actions: [
        /*      BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationCountUpdated) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationBadge(totalNotifications: state.count),
                    );
                  }
                  return Container();
                },
              ),*/
              BlocBuilder<ProductDashboardBloc, ProductDashboardState>(
                builder: (context, state) {
                  int cartCount = 0;
                  if (state is ProductLoaded) {
                    cartCount = state.cartCount;
                  }
                  return Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ));
                        },
                      ),
                      if (cartCount > 0)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text(
                              '$cartCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),

          body: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              switch (state is NavigationUpdated ? state.index : 0) {
                case 0:
                  return const MainDashboard();
                case 1:
                  return const Center(child: Text('My Oder'));
                case 2:
                  return const Center(child: Text('Place Add'));
                case 3:
                  return Notifications();
                  case 4:
                  return const MyProfile();
                default:
                  return const Center(child: Text('Home Screen'));
              }
            },
          ),
            floatingActionButton: FloatingActionButton(
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple])
                ),
                child: const Icon(
                  Icons.add,color: Colors.white54,
                  size: 40,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(

                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetContent();
                  },
                );
              },
            ),
          bottomNavigationBar: BottomNavigationBarWidget(),
        ),
      ),
    );
  }
}
