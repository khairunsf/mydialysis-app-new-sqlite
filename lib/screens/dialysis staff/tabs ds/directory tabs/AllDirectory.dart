import 'package:flutter/material.dart';

class AllDirectoryTabBar extends StatefulWidget {
  const AllDirectoryTabBar({super.key});

  @override
  State<AllDirectoryTabBar> createState() => _AllDirectoryTabBarState();
}

class _AllDirectoryTabBarState extends State<AllDirectoryTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //3rd part
          Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              color: Color.fromRGBO(193, 214, 255, 1.000),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('"Image"'),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text('Center name'),
                            Text('Address'),
                            Text('Phone'),
                            Text('Rating'),
                            Text('Place'),
                          ],
                        )
                      ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
