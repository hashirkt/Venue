import 'package:flutter/material.dart';
import 'package:venue/utilities/apptext.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        height: double.infinity,
           width: double.infinity,
           // color: Colors.red,
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [


                 Container(
                   color: Colors.green,
                   height: MediaQuery.of(context).size.height/2,
                   child:Stack(
                     children: [
                       Container(
                           height: MediaQuery.of(context).size.height/2,

                           child: Image.asset('assets/images/img2.jpg',fit: BoxFit.cover,)),



                       Positioned(

                         bottom: 30,
                         left: 20,
                         child: Container(
                           child: AppText(text: 'Hotel Name',color: Colors.white, size: 16,fw: FontWeight.bold,),
                         ),
                       )
                     ],
                   ),
                 ),

                 Container(
                   padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                   child: SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [

                         AppText(text: "Description",size:12 ,fw: FontWeight.bold,),
                         SizedBox(height: 10),

                         Container(
                           padding: EdgeInsets.only(top: 10,bottom: 10),
                             height: 200,
                             child:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                         ),

                         AppText(text: "Facilities",size:12 ,fw: FontWeight.bold,),

                         Container(
                           height: 50,

                           child: ListView.builder(
                               scrollDirection: Axis.horizontal,
                               itemCount: 5,
                               itemBuilder: (context,index){

                             return Padding(
                               padding: const EdgeInsets.only(right: 8.0),
                               child: Chip(label: Text("Parking")),
                             );
                           })
                         ),
                         SizedBox(height: 10),

                         AppText(text: "Available Packages",size:12 ,fw: FontWeight.bold,),

                         SizedBox(height: 10),

                         Container(
                           height: 150,

                           child: ListView.builder(
                               scrollDirection: Axis.horizontal,
                               itemCount: 5,
                               itemBuilder: (context,index){

                                 return Padding(
                                   padding: const EdgeInsets.only(right: 8.0),
                                   child:  Container(

                                     height: 150,
                                     width: 150,
                                     color: Colors.red,
                                     child: Center(
                                       child: Text("Packages"),
                                     ),
                                   ),
                                 );
                               }),
                         ),





                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 10),
                 Center(
                   child: Container(
                     height: 40,
                     width: 100,

                     decoration: BoxDecoration(

                         color: Colors.yellow,
                         borderRadius: BorderRadius.circular(12)),
                     child: Center(child: AppText(text: "Book Now",size: 8,color: Colors.black,)),
                   ),
                 ),
                 SizedBox(height: 30),
               ],
             ),
           ),
      ),

    );
  }
}
