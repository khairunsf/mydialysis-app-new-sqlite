// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/hospital%20staff/widgets%20hs/bottomBarHS.dart';

class SecondPartHSdirectory extends StatelessWidget {
  const SecondPartHSdirectory({super.key});

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
                    MaterialPageRoute(builder: (context) => HSBottomBarPage()),
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

class SecondPartHSprofile extends StatelessWidget {
  const SecondPartHSprofile({super.key});

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
                    MaterialPageRoute(builder: (context) => HSBottomBarPage()),
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

class SecondPartHSeditprofile extends StatelessWidget {
  const SecondPartHSeditprofile({super.key});

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
              'Edit Profile',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartHSpatientprofile extends StatelessWidget {
  const SecondPartHSpatientprofile({super.key});

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
                    MaterialPageRoute(builder: (context) => HSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Patient Profile',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartHSViewPatientProfile extends StatelessWidget {
  const SecondPartHSViewPatientProfile({super.key});

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
              'Patient Profile',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartHSappointment extends StatelessWidget {
  const SecondPartHSappointment({super.key});

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
                    MaterialPageRoute(builder: (context) => HSBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Patient Appointment',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
class SecondPartHSappointmentDetails extends StatelessWidget {
  const SecondPartHSappointmentDetails({super.key});

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
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Patient Appointment Details',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartHSeditAppointment extends StatelessWidget {
  const SecondPartHSeditAppointment({super.key});

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
              'Patient Appointment',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartHSViewDirectory extends StatelessWidget {
  const SecondPartHSViewDirectory({super.key});

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
              'Directory',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
