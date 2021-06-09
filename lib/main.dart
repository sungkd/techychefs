import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:techychefs/BottomNavBarWidget.dart';
// ignore: unused_import
import 'package:techychefs/circleavatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildTopScreen(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              color: Colors.blueGrey,
              height: MediaQuery.of(context).size.height * 0.70,
              width: 400,
              child: buildCenterScreen(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.yellow,
              ),
              // ignore: deprecated_member_use
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.post_add,
                size: 30.0,
                color: Colors.yellow,
              ),
              // ignore: deprecated_member_use
              title: Text('Post'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.yellow,
              ),
              // ignore: deprecated_member_use
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notification_add,
                size: 30.0,
                color: Colors.yellow,
              ),
              // ignore: deprecated_member_use
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                color: Colors.yellow,
              ),
              // ignore: deprecated_member_use
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildTopScreen() {
    return SafeArea(
      child: Container(
        color: Colors.red,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Circle avatar images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...stories.map(
                    (item) => Container(
                      margin: EdgeInsets.all(10.0),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 60.0,
                            width: 60.0,
                            image: AssetImage(stories[stories.indexOf(item)]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardImages(int index) => Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/male.png',
                fit: BoxFit.cover,
              ),
            )),
      );

  Widget buildCenterScreen() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxiscount -> how many images will be displayed in single row
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => buildCardImages(index),
        itemCount: 10,
      );
}
