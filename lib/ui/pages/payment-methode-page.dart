part of 'pages.dart';

class PaymentMethodePage extends StatelessWidget {
  final String paymentURL;

  PaymentMethodePage(this.paymentURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NothingItemPage(
        title: 'Belanja Dong!',
        subtitle: 'pilih metode pembayaran',
        picturePath: 'assets/payment.png',
        buttonTap1: ()  {
        },
        buttonTitle1: 'Payment Methode',
        buttonTap2: () {
          Get.to(SuccessOrderPage());
        },
        buttonTitle2: 'Continue',
      ),
    );
  }
}
