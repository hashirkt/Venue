import 'package:flutter/material.dart';
import 'package:venue/admin/AllEventManagers.dart';
import 'package:venue/admin/manageauditoriums.dart';
import 'package:venue/admin/managenotifications.dart';
import 'package:venue/admin/manageservices.dart';
import 'package:venue/admin/viewallauditorium.dart';
import 'package:venue/admin/viewallfeedbacks.dart';
import 'package:venue/admin/viewallpayments.dart';
import 'package:venue/admin/viewallusers.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/utilities/apptext.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: btnColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AppText(text: "Admin Dashboard",size: 12,),
             SizedBox(height: 10,),
             Container(


               height: 100,
               child:
               Row(
                 children: [

  
                   Expanded(
                     child: InkWell(
                       onTap: (){


                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllEventManagers()));
                       },
                       child: Container(
                         height: 100,
                         width: 150,
                         decoration: BoxDecoration(
                         color: backColor,
                           borderRadius: BorderRadius.circular(12),

                         ),

                         child: Center(child: AppText(text: "View All Event\n Managers",color: Colors.white,size: 10,)),
                       ),
                     ),
                   ),

                   SizedBox(width: 20,),

                   Expanded(
                     child: InkWell(


                       onTap: (){


                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllAuditorium()));
                       },

                       child: Container(
                         height: 100,
                         width: 150,
                         decoration: BoxDecoration(
                           color: backColor,
                           borderRadius: BorderRadius.circular(12),

                         ),
                         child: Center(child: AppText(text: "View All\n Auditoriums",color: Colors.white,size: 10,)),

                       ),
                     ),
                   ),

                 ],
               ),
             ),
            SizedBox(height: 10,),
             Container(


               height: 100,
               child:
               Row(
                 children: [


                   Expanded(
                     child: InkWell(

                       onTap: (){


                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllUsers()));
                       },

                       child: Container(
                         height: 100,
                         width: 150,
                         decoration: BoxDecoration(
                           color: backColor,
                           borderRadius: BorderRadius.circular(12),

                         ),
                         child: Center(child: AppText(text: "View All Users",color: Colors.white,size: 10,)),
                       ),
                     ),
                   ),

                   SizedBox(width: 20,),

                   Expanded(
                     child: InkWell(

                       onTap: (){


                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllPayments()));
                       },

                       child: Container(
                         height: 100,
                         width: 150,
                         decoration: BoxDecoration(
                           color: backColor,
                           borderRadius: BorderRadius.circular(12),

                         ),
                         child: Center(child: AppText(text: "View All\n Payments",color: Colors.white,size: 10,)),

                       ),
                     ),
                   ),

                 ],
               ),
             ),

            SizedBox(height: 10,),
            Container(


              height: 100,
              child:
              Row(
                children: [


                  Expanded(
                    child: InkWell(

                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllFeedbacks()));
                      },

                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(child: AppText(text: "View All\n Feedbacks",color: Colors.white,size: 10,)),
                      ),
                    ),
                  ),

                  SizedBox(width: 20,),

                  Expanded(
                    child: InkWell(

                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageNotifications()));
                      },

                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(child: AppText(text: "Manage\n Notifications",color: Colors.white,size: 10,)),

                      ),
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 10,),
            Container(


              height: 100,
              child:
              Row(
                children: [


                  Expanded(
                    child: InkWell(

                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageServices()));
                      },

                      child: Container(

                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(child: AppText(text: "Manage Services",color: Colors.white,size: 10,)),
                      ),
                    ),
                  ),

                  SizedBox(width: 20,),

                  Expanded(
                    child: InkWell(

                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageAuditoriums()));
                      },

                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Center(child: AppText(text: "Manage\n Auditoriums",color: Colors.white,size: 10,)),

                      ),
                    ),
                  ),

                ],
              ),
            )




          ],
        ),
      ),
    );
  }
}
