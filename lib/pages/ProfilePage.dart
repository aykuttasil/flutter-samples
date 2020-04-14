import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Samples",
              style: GoogleFonts.adaminaTextTheme().bodyText1,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/aykutasil.png"),
                radius: 50,
              ),
              Text(
                "Aykut Asil",
                style: GoogleFonts.adventPro().copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.accessibility_new),
                    title: Text("Software Developer"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+90 535 815 1244"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
