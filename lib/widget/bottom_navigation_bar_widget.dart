import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigaton/navigation_bloc.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state is NavigationUpdated ? state.index : 0,
          onTap: (index) {
            context.read<NavigationBloc>().add(NavigationChanged(index));
          },
          items: const [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.home,),
                  SizedBox(height: 6,),
                  Text("Home",style: TextStyle(fontSize: 11),)
                ],
              ),

              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.list_alt_rounded,),
                  SizedBox(height: 6,),
                  Text("My Oder",style: TextStyle(fontSize: 11),)
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(

              icon: Column(
                children: [
                  CircleAvatar(

                       radius: 12,

                      child: Icon(Icons.add)),
                  SizedBox(height: 6,),
                  Text("Place An Add",style: TextStyle(fontSize: 11),)
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(height: 6,),
                  Text("Cart",style: TextStyle(fontSize: 11),)
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.person,),
                  SizedBox(height: 6,),
                  Text("My Account",style: TextStyle(fontSize: 11),)
                ],
              ),
              label: '',
            ),
          ],
          selectedItemColor: Colors.black, // Color for selected item
          unselectedItemColor: Colors.blue, // Color for unselected items
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Style for selected label
          unselectedLabelStyle: TextStyle(fontSize: 12), // Style for unselected label

        );
      },
    );
  }
}
