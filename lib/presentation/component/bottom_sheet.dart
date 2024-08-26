import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push/endpoint/constants.dart';

import '../../utils/Spacing.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.info, color: Colors.deepPurple),
                  SizedBox(width: 8.0),
                  Text(
                    'Entry Screen',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*.08,
                height: MediaQuery.of(context).size.height*.08,
                decoration: BoxDecoration(color: Colors.deepPurple,shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(Icons.close,color: EndPoint.kPrimaryLightColor,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of entries in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.list),
                  title: Text('Entry ${index + 1}'),
                  onTap: () {
                    // Handle the tap event if needed
                    print('Tapped on Entry ${index + 1}');
                  },
                );
              },
            ),
          ),
          // Add more content here if needed
        ],
      ),
    );
  }
}