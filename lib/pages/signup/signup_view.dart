import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenedu/pages/signup/signup_controller.dart';

import '../../color/colorapp.dart';

class SignupPage extends GetView<SignupController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                color: AppColors.backgroundIntro,
                onPressed: (){
                  Get.back();
                },
              ),
              const Text(
                'Đăng ký',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto-Medium",
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 53,
                    backgroundColor: AppColors.logoColor,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avatar0.jpg'),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '* Thông tin cơ bản:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Họ và Tên',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.person_outlined,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ngày sinh',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.calendar_month,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Số điện thoại',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.numbers,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.mail_outline,size: 23,color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:TextField(
                  /*obscureText: controller.obscureText_.value,*/
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.lock_outline,size: 23,color: Colors.grey),
                    suffixIcon: InkWell(
                      onTap: (){
                        //controller.ClickVisible();
                      },
                      child: Icon(/*controller.obscureText_.value?*/Icons.visibility_off/*:Icons.visibility*/,color: Colors.grey,size: 23,),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:TextField(
                  /*obscureText: controller.obscureText_.value,*/
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "Roboto-Medium"),
                    prefixIcon: Icon(Icons.lock_outline,size: 23,color: Colors.grey),
                    suffixIcon: InkWell(
                      onTap: (){
                        //controller.ClickVisible();
                      },
                      child: Icon(/*controller.obscureText_.value?*/Icons.visibility_off/*:Icons.visibility*/,color: Colors.grey,size: 23,),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: 0,
                          onChanged: (value){

                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            'Giáo viên, Gia sư',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: 0,
                          onChanged: (value){

                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            'Phụ huynh',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    height: 43,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundIntro,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: const Center(
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: AppColors.textIntroColor,
                          fontWeight:FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}