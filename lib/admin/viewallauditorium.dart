import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/utilities/apptext.dart';


class ViewAllAuditorium extends StatefulWidget {
  const ViewAllAuditorium({Key? key}) : super(key: key);

  @override
  State<ViewAllAuditorium> createState() => _ViewAllAuditoriumState();
}

class _ViewAllAuditoriumState extends State<ViewAllAuditorium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AppText(text: "View All Auditoriums",size: 24,),
            SizedBox(height: 20,),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('user').where('usertype',isEqualTo: 'auditorium').snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return ListView.builder(

                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){


                          return  Card(
                            elevation: 5.0,
                            child: Container(
                              height: 100,
                              child: Center(
                                child: ListTile(

                                    leading:Container (
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              snapshot.data!.docs[index]['img']
                                          )
                                        ),
                                        shape: BoxShape.circle
                                      ),
                                    ),
                                  trailing: IconButton(

                                    onPressed: (){

                                      showDialog(context: context, builder: (context){


                                        return AlertDialog(
                                          content: Container(
                                            padding: EdgeInsets.all(15),
                                            height: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                AppText(text:"Details",size: 18,fw: FontWeight.bold,),
                                                SizedBox(height: 10,),
                                                AppText(text: snapshot.data!.docs[index]['audname'],size: 18,),
                                                AppText(text:snapshot.data!.docs[index]['place'],size: 16,),
                                                AppText(text:snapshot.data!.docs[index]['email'],size: 16,),
                                                AppText(text:snapshot.data!.docs[index]['phoneno'],size: 16,),

                                                SizedBox(height: 10,),
                                                snapshot.data!.docs[index]['status']==0?  InkWell(
                                                  onTap: (){


                                                    FirebaseFirestore.instance.collection('user').doc(snapshot.data!.docs[index]['id']).update({

                                                      'status':1
                                                    }).then((value) {

                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Approved")));
                                                      Navigator.pop(context);

                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 250,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: btnColor,

                                                    ),
                                                    child: Center(child: AppText(text: "Approve",color: Colors.white)),
                                                  ),
                                                ):


                                                InkWell(
                                                  onTap: (){


                                                    FirebaseFirestore.instance.collection('user').doc(snapshot.data!.docs[index]['id']).update({

                                                      'status':0
                                                    }).then((value) {

                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Removed")));
                                                      Navigator.pop(context);

                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 250,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: btnColor,

                                                    ),
                                                    child: Center(child: AppText(text: "Remove",color: Colors.white,)),
                                                  ),
                                                )


                                              ],
                                            ),
                                          ),
                                        );
                                      });


                                    },

                                    icon: Icon(Icons.arrow_forward_ios),
                                  ),
                                  title: AppText(text: snapshot.data!.docs[index]['audname'],size: 18,),
                                  subtitle: AppText(text:snapshot.data!.docs[index]['place'],size: 16,),
                                ),
                              ),
                            ),
                          );
                        });
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );

                },
              ),
            ),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
