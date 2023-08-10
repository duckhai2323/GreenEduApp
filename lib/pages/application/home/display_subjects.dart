import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/application/home/home_controller.dart';

import '../../../color/colorapp.dart';

class DisplaySubjects extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: [
          Subject("Toán","assets/images/icon_subject0.png"),
          Subject("Lý","assets/images/icon_subject1.png"),
          Subject("Hóa","assets/images/icon_subject2.png"),
          Subject("Sinh","assets/images/icon_subject3.png"),
          Subject("Tin","assets/images/icon_subject4.png"),
          Subject("Tiếng Anh","assets/images/icon_subject8.png"),
          Subject("Địa Lí","assets/images/icon_subject6.png"),
          Subject("Lịch Sử","assets/images/icon_subject7.png"),
          Subject("Ngữ Văn","assets/images/icon_subject5.png"),
          Subject("Khác","assets/images/icon_subject9.png"),
        ],
      ),
    );
  }

  Widget Subject(String subject, String imageSubject){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: AppColors.logoColor,
          child: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(imageSubject),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            subject,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}