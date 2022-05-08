import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/screens/register_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context, String title, IconButton leading,
    Color? backgroundColor) {
  return AppBar(
    title: Text(title,
        style: GoogleFonts.poppins(fontSize: 20, color: Colors.black)),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: backgroundColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        child: leading,
        backgroundColor: ColorConstants.lightblue,
      ),
    ),
    actions: [
      TextButton.icon(
        onPressed: () async {
          await AuthService().signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegisterPage();
              },
            ),
          );
        },
        icon: const Icon(Icons.logout),
        label: const Text("Sign Out"),
        style: TextButton.styleFrom(primary: Colors.black),
      ),
    ],
  );
}