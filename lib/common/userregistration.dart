import 'package:flutter/material.dart';
import 'package:venue/utilities/header.dart';

class UserRegisrration extends StatefulWidget {
  const UserRegisrration({Key? key}) : super(key: key);

  @override
  State<UserRegisrration> createState() => _UserRegisrrationState();
}

class _UserRegisrrationState extends State<UserRegisrration> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: double.infinity,

      child: SingleChildScrollView(
        child: Column(


          children: [

            HeaderWidget()


          ],
        ),
      ),
    );
  }
}
