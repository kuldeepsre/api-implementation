import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notification/notification_bloc.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return  Text("");
/*
      BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationsLoaded) {
          return ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.notifications[index]),
              );
            },
          );
        }
        return Center(child: Text('No Notifications'));
      },
    );*/
  }
}
