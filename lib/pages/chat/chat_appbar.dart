import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../color/colorapp.dart';
import 'chat_controller.dart';

class ChatAppBar extends GetView<ChatController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: CachedNetworkImageProvider("${controller.to_avatar}"),
              ),

              const SizedBox(width: 15,),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.to_name??"",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const Text(
                      'Đang hoạt động',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Row(
              children: [
                Icon(Icons.phone,color: AppColors.backgroundIntro,size: 30,),
                SizedBox(width: 20,),
                Icon(Icons.video_camera_front,color: AppColors.backgroundIntro,size: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}