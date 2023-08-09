import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/welcome/welcome_controller.dart';

import '../../color/colorapp.dart';

class WelcomePage extends GetView<WelcomeController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundIntro,
        body:Obx(()=> Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (index){
                controller.ChangedPage(index);
              },
              children: [
                page('Ocean Education','OceanEdu là một ững dụng giúp bạn có thể kết nối với'
                    ' đội ngũ gia sư nhiệt huyết của chúng tôi.','assets/images/logo_greenEdu.png'),
                page('Bạn là giáo viên, sinh viên?','Gia nhập vào đội ngũ gia sư của OceanEdu, nhận lớp và có thêm thu nhập từ những kiến thức, kỹ năng giảng dạy của bạn.','assets/images/intro1_1.png'),
                page('Bạn cần thuê gia sư?','GreenEdu  luôn làm việc chuyên nghiệp và trách nhiệm, bắt đầu từ việc tuyển chọn đến đào tạo gia sư. ','assets/images/intro2_1.png'),
                page('Ocean Education','Thủ tục nhanh chóng tiện lợi và hoàn toàn miễn phí','assets/images/intro3_1.png'),
              ],
            ),

            Positioned(
              bottom: 90,
              left: 30,
              right: 30,
              child: GestureDetector(
                onTap: (){
                  controller.OnClickNext();
                },
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
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
                      'Tiếp tục',
                      style: TextStyle(
                        color: AppColors.backgroundIntro,
                        fontWeight:FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 45,
              left: 40,
              right: 40,
              child: DotsIndicator(
                dotsCount: 4,
                position:controller.state.value,
                decorator: DotsDecorator(
                  activeColor: Colors.white,
                  size: const Size.square(8.0),
                  activeSize: const Size(12.0, 8.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }

  Widget page(String title, String subTitle, String imageStr){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: title=="Ocean Education"?230:260,
          height: title=="Ocean Education"?200:240,
          child: Image.asset(
            imageStr,
            fit: BoxFit.fitWidth,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textIntroColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        Padding(
          padding:const EdgeInsets.symmetric(
              horizontal: 20, vertical: 5),
          child: Text(
            subTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}