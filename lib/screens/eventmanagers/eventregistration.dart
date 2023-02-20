import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue/common/loginpage.dart';
import 'package:venue/constants/colors.dart';

import 'package:venue/utilities/apptext.dart';
import 'package:venue/utilities/header.dart';

class EventRegistration extends StatefulWidget {
  const EventRegistration({Key? key}) : super(key: key);

  @override
  State<EventRegistration> createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  bool showPass=true;
  bool showPass1=true;


  TextEditingController eventnameController=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  TextEditingController placeController=TextEditingController();
  TextEditingController pinController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(

      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(left: 25,right: 25,bottom: 30,top: 30),


      child: Form(

        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              HeaderWidget(),
              AppText(text: "Create your Account",size: 24,fw: FontWeight.w500,
                color: Colors.white,),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){

                  if(value!.isEmpty
                      || value.length<=2){
                    return "Enter a valid  name";
                  }

                },
                controller: eventnameController,

                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:btnColor, width: 2)),
                    hintText: "Event Name",
                    hintStyle: TextStyle(color: Colors.black54)
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value){

                  if(

                  value!.isEmpty || value.length<=9
                  ){
                    return "Enter a valid phone number";
                  }

                },
                controller: phonecontroller,
                keyboardType: TextInputType.phone,


                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:btnColor, width: 2)),
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.black54)
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value){

                  if(

                  value!.isEmpty || value.length<=2
                  ){
                    return "Enter a valid place";
                  }


                },
                controller:placeController,

                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:btnColor, width: 2)),
                    hintText: "Place",
                    hintStyle: TextStyle(color: Colors.black54)
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value){

                  if (value!.isEmpty || !value.contains('@')) {
                    return "Enter a valid email";
                  }

                },
                controller: emailController,

                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:btnColor, width: 2)),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black54)
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(

                validator: (value){
                  if(value!.length<=5){
                    return "Invalid Password";
                  }
                },
                controller: passwordController,

                obscureText: showPass,
                obscuringCharacter: "*",

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(
                          color: btnColor,
                          width: 2

                      )
                  ),

                  hintText:"Password",
                  hintStyle: TextStyle(color: Colors.black54),

                  suffixIcon: IconButton(onPressed: (){
                    if(showPass==true){
                      setState((){
                        showPass=false;
                      });
                    }else{
                      setState((){
                        showPass=true;
                      });
                    }

                  }, icon:showPass==true? Icon(Icons.visibility_off):Icon(Icons.visibility),

                  ),

                ),

              ),
              SizedBox(height: 10,),
              TextFormField(

                validator: (value){
                  if(value!=passwordController.text){
                    return "Password does not match";
                  }
                },
                controller: confirmController,

                obscureText: showPass1,
                obscuringCharacter: "*",

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(
                          color: btnColor,
                          width: 2

                      )
                  ),

                  hintText:" Confirm Password",
                  hintStyle: TextStyle(color: Colors.black54),

                  suffixIcon: IconButton(onPressed: (){
                    if(showPass1==true){
                      setState((){
                        showPass1=false;
                      });
                    }else{
                      setState((){
                        showPass1=true;
                      });
                    }

                  }, icon:showPass1==true? Icon(Icons.visibility_off):Icon(Icons.visibility),

                  ),

                ),

              ),

              SizedBox(height: 10,),
              TextFormField(
                validator: (value){

                  if(

                  value!.isEmpty || value.length<=5
                  ){
                    return "Enter a valid pin";
                  }

                },
                controller: pinController,
                keyboardType: TextInputType.number,

                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:btnColor, width: 2)),
                    hintText: "PIN",
                    hintStyle: TextStyle(color: Colors.black54)
                ),

              ),
              SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim())
                          .then((value) {
                        FirebaseFirestore.instance
                            .collection('user')
                            .doc(value.user!.uid)
                            .set({
                          'id': value.user!.uid,
                          'email': value.user!.email,
                          'eventname': eventnameController.text,
                          'phoneno': phonecontroller.text,
                          'password': passwordController.text,
                          'place': placeController.text,
                          'pin': pinController.text,
                          'create_at': DateTime.now(),
                          'status': 1,
                          'usertype': "event"
                        }).then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Account Created"),
                            ),
                          );
                        });
                      });
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(
                      color: btnColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: AppText(
                        text: "Register",
                        size: 24,
                        color: Colors.black,
                        fw: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

            ],

          ),
        ),
      ),

    );
  }
}
