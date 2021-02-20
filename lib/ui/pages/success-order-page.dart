part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NothingItemPage(
        title: 'Thanks for ordering',
        subtitle: 'Just stay at home and wait \nwait until your item arrived',
        picturePath: 'assets/food_whises.png',
        buttonTap1: () {
          Get.offAll(MainPage());
        },
        buttonTitle1: 'Order other item',
        buttonTap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
          ));
        },
        buttonTitle2: 'View my order',
      ),
    );
  }
}
