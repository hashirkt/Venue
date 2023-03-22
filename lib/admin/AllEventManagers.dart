import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/utilities/apptext.dart';


class ViewAllEventManagers extends StatefulWidget {
  const ViewAllEventManagers({Key? key}) : super(key: key);

  @override
  State<ViewAllEventManagers> createState() => _ViewAllEventManagersState();
}

class _ViewAllEventManagersState extends State<ViewAllEventManagers> {




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


        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppText(text: "View All Event Managers",size: 24,),
              SizedBox(height: 20,),

              Container(
                height: MediaQuery.of(context).size.height*0.80,
                width: MediaQuery.of(context).size.width,

                child:StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('user').where('usertype',isEqualTo: 'event').snapshots(),
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

                                    leading: CircleAvatar(
                                      child: Center(
                                        child: Text(
                                            (index+1).toString()
                                        ),
                                      ),
                                    ),
                                    trailing: IconButton(

                                      onPressed: (){},

                                      icon: Icon(Icons.arrow_forward_ios),
                                    ),
                                    title: AppText(text: snapshot.data!.docs[index]['eventname'],size: 18,),
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
                )
              ),

              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
