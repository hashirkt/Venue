import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venue/constants/colors.dart';
import 'package:venue/screens/user/paymentpage.dart';
import 'package:venue/utilities/apptext.dart';

class ViewAllOrdersUser extends StatefulWidget {
  var email;
  var fname;
  var lname;
  var pin;
  var place;
  var id;
  var phone;
  String? imgurl_pref;

  ViewAllOrdersUser(
      {Key? key,
      this.email,
      this.phone,
      this.fname,
      this.lname,
      this.pin,
      this.imgurl_pref,
      this.place,
      this.id})
      : super(key: key);
  @override
  State<ViewAllOrdersUser> createState() => _ViewAllOrdersUserState();
}

class _ViewAllOrdersUserState extends State<ViewAllOrdersUser>
    with SingleTickerProviderStateMixin {
  var email;
  var fname;
  var lname;
  var pin;
  var place;
  var id;
  var phone;
  var img;

  var imgurl;
  setData() {
    email = widget.email;
    fname = widget.fname;
    lname = widget.lname;
    pin = widget.pin;
    place = widget.place;
    id = widget.id;
    phone = widget.phone;
    img = widget.imgurl_pref;
  }

  TabController? _tabController;

  @override
  void initState() {
    setData();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Services',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Bookings',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "All Bookings",
                          color: Colors.black87,
                          size: 18,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('servicecallback')
                                  .where('customerid', isEqualTo: widget.id)
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  List<QueryDocumentSnapshot> feed =
                                      snapshot.data!.docs;

                                  return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (_, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            height: 200,
                                            //color: Colors.red,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                  child: Card(
                                                    elevation: 5.0,
                                                    child: Container(
                                                        //color: Colors.red,
                                                        height: 150,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      -0.9,
                                                                      0.0),
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  //color: Colors.grey,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      160,
                                                                  height: 180,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'session'],
                                                                        color: Colors
                                                                            .black87,
                                                                      ),
                                                                      // AppText(
                                                                      //  text: feed[index]
                                                                      //   ['storename'],
                                                                      //  color: Colors
                                                                      //       .black45,
                                                                      //   size: 12,
                                                                      // ),
                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'comment'],
                                                                        color: Colors
                                                                            .black45,
                                                                        size:
                                                                            12,
                                                                      ),

                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'date'],
                                                                        color: Colors
                                                                            .black45,
                                                                        size:
                                                                            12,
                                                                      ),
                                                                      Container(
                                                                          height:
                                                                              40,
                                                                          width: MediaQuery.of(context).size.width -
                                                                              160,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              feed[index]['callstatus'] == 1
                                                                                  ? AppText(
                                                                                      text: "Contacted",
                                                                                      size: 16,
                                                                                      fw: FontWeight.w700,
                                                                                      color: Colors.green,
                                                                                    )
                                                                                  : AppText(
                                                                                      text: "Pending",
                                                                                      size: 16,
                                                                                      fw: FontWeight.w700,
                                                                                      color: Colors.red,
                                                                                    ),
                                                                            ],
                                                                          )),
                                                                    ],
                                                                  )),
                                                            ),
                                                            // Positioned(
                                                            //   top: 50,
                                                            //   left: 0,
                                                            //   bottom: 50,
                                                            //   child: Container(
                                                            //     height: 20,
                                                            //     width: 30,
                                                            //     decoration: BoxDecoration(
                                                            //       color: primaryColor.withOpacity(0.5),
                                                            //       shape: BoxShape.rectangle
                                                            //     ),
                                                            //     child: Center(child: Text((index+1).toString())),
                                                            //   ),
                                                            // )
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "All Bookings",
                          color: btnColor,
                          size: 18,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('bookings')
                                  .where('customerid', isEqualTo: widget.id)
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  List<QueryDocumentSnapshot> feed =
                                      snapshot.data!.docs;

                                  return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (_, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            height: 200,
                                            //color: Colors.red,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                  child: Card(
                                                    elevation: 5.0,
                                                    child: Container(
                                                        //color: Colors.red,
                                                        height: 150,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      -0.9,
                                                                      0.0),
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  //color: Colors.grey,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      160,
                                                                  height: 180,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [

                                                                      AppText(
                                                                        text: feed[index]
                                                                        [
                                                                        'audname'],
                                                                        color: Colors
                                                                            .black87,
                                                                      ),
                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'bookingDate'],
                                                                        color: Colors
                                                                            .black87,
                                                                        size: 18,
                                                                      ),
                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'comments'],
                                                                        color: Colors
                                                                            .black45,
                                                                        size:
                                                                            12,
                                                                      ),
                                                                      AppText(
                                                                        text: feed[index]
                                                                            [
                                                                            'session'],
                                                                        color: Colors
                                                                            .black45,
                                                                        size:
                                                                            12,
                                                                      ),
                                                                      Container(
                                                                          height:
                                                                              40,
                                                                          width: MediaQuery.of(context).size.width -
                                                                              160,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              feed[index]['replystatus'] == 1
                                                                                  ? AppText(
                                                                                      text: "Replied",
                                                                                      size: 16,
                                                                                      fw: FontWeight.w700,
                                                                                      color: Colors.green,
                                                                                    )
                                                                                  : AppText(
                                                                                      text: "Not Replied",
                                                                                      size: 16,
                                                                                      fw: FontWeight.w700,
                                                                                      color: Colors.red,
                                                                                    ),
                                                                              feed[index]['replystatus'] == 1
                                                                                  ? InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.push(
                                                                                          context,
                                                                                          MaterialPageRoute(
                                                                                            builder: (context) => CrediCardClass(
                                                                                              email: email,
                                                                                              fname: fname,
                                                                                              lname: lname,
                                                                                              pin: pin,
                                                                                              place: place,
                                                                                              id: id,
                                                                                              phone: phone,
                                                                                              imgurl_pref: img,
                                                                                              item: snapshot.data!.docs[index],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: AppText(
                                                                                        text: "Pay Now",
                                                                                        size: 16,
                                                                                        fw: FontWeight.w700,
                                                                                        color: Colors.green,
                                                                                      ),
                                                                                    )
                                                                                  : SizedBox(),
                                                                            ],
                                                                          )),
                                                                    ],
                                                                  )),
                                                            ),
                                                            // Positioned(
                                                            //   top: 50,
                                                            //   left: 0,
                                                            //   bottom: 50,
                                                            //   child: Container(
                                                            //     height: 20,
                                                            //     width: 30,
                                                            //     decoration: BoxDecoration(
                                                            //       color: primaryColor.withOpacity(0.5),
                                                            //       shape: BoxShape.rectangle
                                                            //     ),
                                                            //     child: Center(child: Text((index+1).toString())),
                                                            //   ),
                                                            // )
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
