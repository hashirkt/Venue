import 'package:flutter/material.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/screens/user/homepage.dart';

class BottomNavigationPage extends StatefulWidget {
  var email;
  var fname;
  var lname;
  var pin;
  var place;
  var id;
  BottomNavigationPage({Key? key,this.email,this.fname,this.lname,this.pin,this.place,this.id}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedindex = 0;
  var email;
  var fname;
  var lname;
  var pin;
  var place;
  var id;
  SetData(){

    email=widget.email;
    fname=widget.fname;
    lname=widget.lname;
    pin=widget.pin;
    place=widget.place;
    id=widget.id;
  }

  List<Widget> _widgetOptions = [

  ];
  @override
  initState(){
   SetData();
   _widgetOptions=[HomePage(email: email,fname: fname,lname: lname,pin: pin,place: place,id: id,),
     Text("Orders"),
     Text("Profile"),
     Text("Favourites")];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: btnColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: btnColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: backColor,
        currentIndex: _selectedindex,
        onTap: (int index) {
          setState(() {
            _selectedindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: btnColor,
              label: "Home",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              backgroundColor: btnColor,
              label: "Orders",
              icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              backgroundColor: btnColor,
              label: "Profile",
              icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              backgroundColor: btnColor,
              label: "Favourites",
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: _widgetOptions.elementAt(_selectedindex)),
    );
  }
}
