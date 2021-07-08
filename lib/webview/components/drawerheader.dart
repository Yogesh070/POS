import 'package:flutter/material.dart';

class NavDrawerHeaderText extends StatelessWidget {
  final String title, personName, userName;

  const NavDrawerHeaderText({
    Key? key,
    required this.title,
    required this.personName,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.9,
      child: DrawerHeader(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //direction: Axis.vertical,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                personName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(color: Colors.green),
      ),
    );
  }
}
