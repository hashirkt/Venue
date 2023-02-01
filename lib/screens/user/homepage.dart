import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/common/loginpage.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/screens/user/detailscreen.dart';
import 'package:venue/utilities/apptext.dart';
import 'package:venue/utilities/header.dart';


class HomePage extends StatefulWidget {
  var email;
  var fname;
  var lname;
  var pin;
  var place;
  var id;

   HomePage({Key? key,this.email,this.fname,this.lname,this.pin,this.place,this.id}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Scaffold(


     backgroundColor: backColor,


      body: SafeArea(
        child: Container(

            padding: EdgeInsets.all(20),
            height: size.height,
            width: size.width,


            child: SingleChildScrollView(
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text:"Welcome ${widget.lname}",size: 28,color: Colors.white,),
                        CircleAvatar(
                          radius:30 ,
                          backgroundColor: Colors.white,

                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(

                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(

                                  image: DecorationImage(
                                      fit: BoxFit.cover,

                                      image: AssetImage('assets/images/img2.jpg')
                                  ),
                                  color: Colors.red,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 15,),
                    Container(
                      height: 45,
                      width: size.width,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:2,
                              child: AppText(text: "  Search Spaces, Event Planners, Photographers",size: 12,)),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(Icons.search),
                          )
                        ],
                      ),


                    ),

                    SizedBox(height: 30,),
                    AppText(text: "Trending Spaces Near You",size: 24,color: Colors.white,),
                    SizedBox(height: 15,),

                    Container(
                        height: 280
                        ,
                        child:StreamBuilder<QuerySnapshot>(

                          stream: FirebaseFirestore.instance.collection('user').where('usertype',isEqualTo: 'auditorium').snapshots(),
                          builder: (context,snapshot){



                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context,index){

                                  return   Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: InkWell(

                                      onTap: (){


                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                                      },
                                      child: Card(
                                        elevation: 5.0,
                                        child: Stack(
                                          children: [


                                            Container(

                                              height: 270,
                                              width: 250,

                                              color: Colors.white,

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Container(
                                                    height: 200,

                                                    // color: Colors.green,
                                                    child: Image.asset('assets/images/img2.jpg',fit: BoxFit.cover,),
                                                  ),

                                                  Container(
                                                    height: 70,
                                                    width: size.width,

                                                    //color: Colors.green,

                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [

                                                        Container(
                                                          padding: EdgeInsets.only(left: 10),
                                                          //color:Colors.blueGrey,
                                                          width: 150,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,

                                                            children: [
                                                              AppText(text: snapshot.data!.docs[index]['audname'],size: 20, ),
                                                              AppText(text: snapshot.data!.docs[index]['place'],size: 16,)
                                                            ],
                                                          ),
                                                        ),



                                                      ],
                                                    ),
                                                  ),


                                                ],
                                              ),

                                            ),
                                            Positioned(

                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                height: 40,
                                                width: 100,

                                                decoration: BoxDecoration(

                                                    color: Colors.yellow,
                                                    borderRadius: BorderRadius.circular(12)),
                                                child: Center(child: AppText(text: "Book Now",size: 16,color: Colors.black,)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        )

                    ),
//Photographers
                    SizedBox(height: 30,),
                    Text("Never Miss \nBeautiful Moments",style: TextStyle(color: Colors.white,fontSize: 24),),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Best Photographers",style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text("View all",style: TextStyle(color: Colors.white,fontSize:18),),


                      ],
                    ),
                    SizedBox(height: 15,),

                   Container(
                        height: 280
                        ,
                        child:StreamBuilder<QuerySnapshot>(

                          stream: FirebaseFirestore.instance.collection('eventservice').where('title',isEqualTo: 'Photography').snapshots(),
    builder: (context,snapshot){


                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context,index){

                                  return   Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: InkWell(
                                      onTap: (){


                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                                      },


                                      child: Card(
                                        elevation: 5.0,
                                        child: Stack(
                                          children: [


                                            Container(

                                              height: 270,
                                              width: 250,

                                              color: Colors.white,

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Container(
                                                    height: 200,

                                                    // color: Colors.green,
                                                    child: Image.asset('assets/images/images.jpg',fit: BoxFit.cover,),
                                                  ),

                                                  Container(
                                                    height: 70,
                                                    width: size.width,

                                                    //color: Colors.green,

                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [

                                                        Container(
                                                          padding: EdgeInsets.only(left: 10),
                                                          //color:Colors.blueGrey,
                                                          width: 150,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,

                                                            children: [
                                                              AppText(text: snapshot.data!.docs[index]['title'],size: 20, ),
                                                              AppText(text:snapshot.data!.docs[index]['place'],size: 16,)
                                                            ],
                                                          ),
                                                        ),



                                                      ],
                                                    ),
                                                  ),


                                                ],
                                              ),

                                            ),
                                            Positioned(

                                              top: 10,
                                              right: 10,
                                              child: Container(
                                                height: 40,
                                                width: 100,

                                                decoration: BoxDecoration(

                                                    color: Colors.yellow,
                                                    borderRadius: BorderRadius.circular(12)),
                                                child: Center(child: AppText(text: "Book Now",size: 16,color: Colors.black,)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
    }

                    ),
                   ),
//Event Managers
                    SizedBox(height: 30,),
                    Text("Service at its Best",style: TextStyle(color: Colors.white,fontSize: 24),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Best Catering Managers",style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text("View all",style: TextStyle(color: Colors.white,fontSize:18),),
                      ],
                    ),
                    SizedBox(height: 15,),

                    Container(
                        height: 280
                        ,
                        child:StreamBuilder<QuerySnapshot>(

    stream: FirebaseFirestore.instance.collection('eventservice').where('title',isEqualTo: 'Catering Service').snapshots(),
    builder: (context,snapshot) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage(



                      )));
                },


                child: Card(
                  elevation: 5.0,
                  child: Stack(
                    children: [


                      Container(

                        height: 270,
                        width: 250,

                        color: Colors.white,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: 200,

                              // color: Colors.green,
                              child: Image.asset(
                                'assets/images/images.jpg', fit: BoxFit.cover,),
                            ),

                            Container(
                              height: 70,
                              width: size.width,

                              //color: Colors.green,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    //color:Colors.blueGrey,
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,

                                      children: [
                                        AppText(text: snapshot.data!.docs[index]['title'], size: 20,),
                                        AppText(text: snapshot.data!.docs[index]['place'], size: 16,)
                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            ),


                          ],
                        ),

                      ),
                      Positioned(

                        top: 10,
                        right: 10,
                        child: Container(
                          height: 40,
                          width: 100,

                          decoration: BoxDecoration(

                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(child: AppText(
                            text: "Book Now", size: 16, color: Colors.black,)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    } ),
    ),

                    SizedBox(height: 30,),
                    Text("Well Planned is half Done",style: TextStyle(color: Colors.white,fontSize: 24),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Best Event Managers",style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text("View all",style: TextStyle(color: Colors.white,fontSize:18),),
                      ],
                    ),

                    SizedBox(height: 15,),

                    Container(
                        height: 280
                        ,
                        child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context,index){

                              return   Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
        onTap: (){


        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
        },

                                  child: Card(
                                    elevation: 5.0,
                                    child: Stack(
                                      children: [


                                        Container(

                                          height: 270,
                                          width: 250,

                                          color: Colors.white,

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                height: 200,

                                                // color: Colors.green,
                                                child: Image.asset('assets/images/img2.jpg',fit: BoxFit.cover,),
                                              ),

                                              Container(
                                                height: 70,
                                                width: size.width,

                                                //color: Colors.green,

                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [

                                                    Container(
                                                      padding: EdgeInsets.only(left: 10),
                                                      //color:Colors.blueGrey,
                                                      width: 150,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,

                                                        children: [
                                                          AppText(text: "Building1",size: 20, ),
                                                          AppText(text: "Building Address",size: 16,)
                                                        ],
                                                      ),
                                                    ),



                                                  ],
                                                ),
                                              ),


                                            ],
                                          ),

                                        ),
                                        Positioned(

                                          top: 10,
                                          right: 10,
                                          child: Container(
                                            height: 40,
                                            width: 100,

                                            decoration: BoxDecoration(

                                                color: Colors.yellow,
                                                borderRadius: BorderRadius.circular(12)),
                                            child: Center(child: AppText(text: "Book Now",size: 16,color: Colors.black,)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })

                    ),


                  ]),
            )
        ),
      ),
    );

  }
}
