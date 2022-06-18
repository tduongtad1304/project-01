import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import '../../widgets/widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: kTitlePrimary.copyWith(letterSpacing: 0.32),
        ),
      ),
      body: Stack(
        children: [
          CustomTriangle(
            rotate: 180,
            offset: const Offset(1, -1),
            angle: 90,
            a: 277,
            b: 120,
            color: const Color.fromARGB(220, 251, 235, 240),
          ),
          CustomTriangle(
            rotate: 90,
            offset: const Offset(-1, -1),
            angle: 90,
            a: 173,
            b: 277,
            color: const Color.fromARGB(210, 229, 248, 242),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 19.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 62.5,
                    backgroundImage: NetworkImage(netWorkImageUrl, scale: 0.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Center(
                child: Text(
                  'Edit Photo',
                  style: kTextPrimary.copyWith(
                    fontSize: 14,
                    color: kPrimaryButtons,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
