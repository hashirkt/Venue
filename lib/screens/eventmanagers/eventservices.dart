import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/screens/eventmanagers/eventservicedetails.dart';
import 'package:venue/utilities/apptext.dart';

class EventServices extends StatefulWidget {
  var email;
  var eventname;
  var phoneno;
  var pin;
  var place;
  var id;

  EventServices({Key? key,this.email,this.eventname,this.phoneno,this.place,this.pin,this.id}) : super(key: key);
  @override
  State<EventServices> createState() => _EventServicesState();
}

class _EventServicesState extends State<EventServices> {
  String?_category;
  List<String> categories = ["Photography", "Catering Service", "Event Decoration"];
  TextEditingController eventserviceController=TextEditingController();
  TextEditingController eventservicedetailsController=TextEditingController();


  var uuid=Uuid();

var serviceid;
  initState(){
    serviceid=uuid.v1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Add Service'),
              content: Container(
                height: 130,
                child: Column(
                  children: [

                DropdownButtonFormField(
                items: categories.map((String category) {
              return new DropdownMenuItem<String>(
              value:category,
              child: Row(
              children: <Widget>[
              Text(category),
              ],
              ));
              }).toList(),
              onChanged: (String?value) {
                // do other stuff with _category
                setState(() => _category = value);
              },
              value: _category,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 3)),
                  hintText: 'Service ID'),
            ),

                    TextFormField(
                      controller: eventservicedetailsController,
                      decoration: InputDecoration(
                          hintText: "Service Details"
                      ),
                    )


                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {

                    Navigator.pop(context);

                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    print(_category);

                    FirebaseFirestore.instance.collection('eventservice').doc(serviceid).set({


                      'id':serviceid,
                      'title':_category,
                      'description':eventservicedetailsController.text,
                      'status':1,
                      'place':widget.place,
                      'phone':widget.phoneno,
                      'pin':widget.pin,
                      'eventmanagerid':widget.id
                    }).then((value) {

                      setState((){

                        serviceid=uuid.v1();
                      });
                    });


                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );



        },
        child: Icon(
            Icons.add
        ),
      ),
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

              AppText(text: "View All Services",size: 14,),
              SizedBox(height: 20,),

              Container(
                  height: MediaQuery.of(context).size.height*0.80,
                  width: MediaQuery.of(context).size.width,

                  child:StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('eventservice').where('eventmanagerid',isEqualTo:widget.id).snapshots(),
                    builder: (_,snapshot){
                      
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

                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventServiceDetails(

                                          id: snapshot.data!.docs[index]['id'],
                                          title: snapshot.data!.docs[index]['title'],
                                          description: snapshot.data!.docs[index]['description'],
                                          eventmanagerid: snapshot.data!.docs[index]['eventmanagerid'],




                                        )));

                                      },

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
                                      title: AppText(text: snapshot.data!.docs[index]['title'],size: 12,),
                                      subtitle: AppText(text:  snapshot.data!.docs[index]['description'],size: 10,),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }

                      if(snapshot.hasData && snapshot.data!.docs.length==0){

                        return Center(
                          child: Text("No Data"),
                        );
                      }

                      return Center(child: CircularProgressIndicator());
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
