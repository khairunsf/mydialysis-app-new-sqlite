// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mydialysis_app/screens/patient/widgets%20patient/bottombar.dart';

class SecondPartProfile extends StatelessWidget {
  const SecondPartProfile({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
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

class SecondPartProfileEdit extends StatelessWidget {
  const SecondPartProfileEdit({super.key});

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

class SecondPartTimeSlot extends StatelessWidget {
  const SecondPartTimeSlot({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
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

class SecondPartSlotTimeRequest extends StatelessWidget {
  const SecondPartSlotTimeRequest({super.key});

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
              'Request Slot Time',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartAppointment extends StatelessWidget {
  const SecondPartAppointment({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Appointment',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartAppointmentReschedule extends StatelessWidget {
  const SecondPartAppointmentReschedule({super.key});

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
              'Reschedule',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartAppointmentDetails extends StatelessWidget {
  const SecondPartAppointmentDetails({super.key});

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
              'Appointment Details',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartPayment extends StatelessWidget {
  const SecondPartPayment({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Payment',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPartDirectory extends StatelessWidget {
  const SecondPartDirectory({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
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

class SecondPartTreatment extends StatelessWidget {
  const SecondPartTreatment({super.key});

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
                    MaterialPageRoute(builder: (context) => PBottomBarPage()),
                  );
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Treatment Record',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
