import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});
  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  final List<Map<String, String>> _items = [
    {'title': 'dsfsdf fdgfdg fdsgdfg fdgefdgsdfg  ', 'image': 'assets/images/image1.png'},
    {'title': 'f gfdg fgdf fgdfg', 'image': 'assets/images/image2.png'},


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Other widgets in the Column

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40, // Set a fixed height or use any other constraint as needed
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8, // Number of items in your list
                  itemBuilder: (context, index) {
                    final items = [
                      'Latest ',
                      'Job',
                      'Properties ',
                      'Career ',
                      'Service ',
                      'Plan ',
                      'Contact Us ',
                      'Disclaimer '
                    ];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10), // Add padding between items
                      child: Text(
                        items[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (text) {
                  setState(() {
                    _searchText = text.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
            // Set a fixed height for the ListView
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _filteredItems().length,
                itemBuilder: (context, index) {
                  final item = _filteredItems()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item['title']!,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                item['image']!,
                                width: 100, // Set image width
                                height: 100, // Set image height
                                fit: BoxFit.fill, // Cover the image box
                              ),
                            ),
                          ),
                          // Text below the image

                        ],
                      ),
                    ),
                  );
                },
              ),
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
                child:  const Text("Book Services",style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),),
              ),
            ),
            SizedBox(
         width: MediaQuery.of(context).size.width,
             height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8, // Number of items in your list
                itemBuilder: (context, index) {
                  final items = [
                    'Latest ',
                    'Job',
                    'Properties ',
                    'Career ',
                    'Service ',
                    'Plan ',
                    'Contact Us ',
                    'Disclaimer '
                  ];

                  return Padding(
                    padding:  EdgeInsets.only(right: 10), // Add padding between items
                    child:Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        'https://via.placeholder.com/300?text=DITTO',
                       fit: BoxFit.fill,
                      ),
                    ),

                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
  // Filter items based on search text
  List<Map<String, String>> _filteredItems() {
    if (_searchText.isEmpty) {
      return _items;
    } else {
      return _items.where((item) => item['title']!.toLowerCase().contains(_searchText)).toList();
    }
  }
}

