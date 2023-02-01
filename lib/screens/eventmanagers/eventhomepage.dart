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
import 'package:venue/screens/eventmanagers/eventbookings.dart';
import 'package:venue/screens/eventmanagers/eventfeedbacks.dart';
import 'package:venue/screens/eventmanagers/eventpayments.dart';
import 'package:venue/screens/eventmanagers/eventservices.dart';
import 'package:venue/utilities/apptext.dart';

class EventHomePage extends StatefulWidget {

  var email;
  var eventname;
  var phoneno;
  var pin;
  var place;
  var id;

   EventHomePage({Key? key,this.email,this.eventname,this.phoneno,this.place,this.pin,this.id}) : super(key: key);

  @override
  State<EventHomePage> createState() => _EventHomePageState();
}

class _EventHomePageState extends State<EventHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            AppText(
              text: "Event Managers Dashboard",
              size: 12,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventBookings()));
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: AppText(
                          text: "View All\n Bookings",
                          color: Colors.white,
                          size: 10,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventServices(
                                  id: widget.id,
                                  email: widget.email,
                                  place: widget.place,
                                  phoneno: widget.phoneno,
                                  pin: widget.pin,

                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: AppText(
                          text: "Manage Services",
                          color: Colors.white,
                          size: 10,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventFeedbacks()));
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: AppText(
                          text: "View All\n Feedbacks",
                          color: Colors.white,
                          size: 10,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventPayments()));
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: backColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: AppText(
                          text: "View All\n Payments",
                          color: Colors.white,
                          size: 10,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
