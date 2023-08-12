import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenedu/pages/application/messenger/messenger_controller.dart';

class DisplayUsers extends GetView<MessController>{

  Widget ItemUser1 (){
   /* String token = UserStore.to.token;
    String? url;
    String? name;
    if(item.from_uid == token){
      url = item.to_avatar;
      name = item.to_name;
    } else {
      url = item.from_avatar;
      name = item.from_name;
    }*/
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 39,
                backgroundColor: Colors.lightBlueAccent,
                child:Padding(
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 37,
                    backgroundImage: /*CachedNetworkImageProvider(url??"")*/ AssetImage('assets/images/avatar0.png'),
                  ),
                ) ,
              ),
              Positioned(
                right: 3,
                bottom: 3,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          ),

          title: Text(
            "Tran Thanh Nhan",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),

          subtitle: Text(
            /*controller.MessAndTime(item),*/
            'i love you',
            style: TextStyle(
              color: Colors.grey,
              fontWeight:  FontWeight.bold,
            ),
          ),

          trailing: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.blue,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,top: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
              onTap:(){

              } ,
              child: ItemUser1(),
          );
        },
      ),
    );
  }
}