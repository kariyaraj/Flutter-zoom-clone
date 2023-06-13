import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meetings_methods.dart';

import '../Widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
   MeetingScreen({Key? key}) : super(key: key);
   final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  createnewMeeting() async{
    var random=Random();
    String roomName=(random.nextInt(10000000)+10000000).toString();
    _jitsiMeetMethods.createNewMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, "/videoCall");
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createnewMeeting,
              text: "New Meeting",
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: ()=>joinMeeting(context),
              text: "Join Meeting",
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Schedule",
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Share Screen",
              icon: Icons.arrow_upward,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Create/Join Meetings with just a click!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
