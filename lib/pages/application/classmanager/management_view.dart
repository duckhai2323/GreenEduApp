import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/application/classmanager/management_controller.dart';
import 'package:greenedu/pages/application/classmanager/waitclass.dart';

import '../../../color/colorapp.dart';

class ManagementPage extends GetView<ManagementController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:AppColors.backgroundIntro,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          leading: InkWell(
            onTap: (){
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.backgroundColor,
            ),
          ),
          flexibleSpace: Center(
            child: Text(
              'Quản lý',
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: AppColors.backgroundIntro,
                indicatorWeight: 2,
                tabs: [
                  Tab(child: Text('Đang Hiển Thị'),),
                  Tab(child: Text('Lớp Của Bạn'),),
                  Tab(child: Text('Lớp Đã Hủy'),),
                  Tab(child: Text('Chờ Phê Duyệt'),),
                  Tab(child: Text('Được Nhận'),),
                  Tab(child: Text('Bị Từ Chối'),),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Home Tab')),
                    // Nội dung của tab Business
                    Center(child: Text('Business Tab')),
                    // Nội dung của tab School
                    Center(child: Text('School Tab')),
                    WaitClass(),
                    Center(child: Text('School Tab')),
                    Center(child: Text('School Tab')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}