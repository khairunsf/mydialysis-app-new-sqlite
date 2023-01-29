// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/dialysis%20staff/widget%20ds/bottomBarDS.dart';

class SecondPartDSTreatmentRecord extends StatelessWidget {
  const SecondPartDSTreatmentRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Patient Treatment Record',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSSlotTime extends StatelessWidget {
  const SecondPartDSSlotTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Slot Time',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSST extends StatelessWidget {
  const SecondPartDSST({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Slot Time',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSDirectory extends StatelessWidget {
  const SecondPartDSDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Dialysis Center Directory',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSPayment extends StatelessWidget {
  const SecondPartDSPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Patient Payment',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSProfile extends StatelessWidget {
  const SecondPartDSProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Profile',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDSEditProfile extends StatelessWidget {
  const SecondPartDSEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 12,
                padding: EdgeInsets.symmetric(horizontal: 0.3),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Profile',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
