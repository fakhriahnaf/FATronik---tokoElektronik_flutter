part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 1;
  // List<Transaction> inProgress = [];
  // List<Transaction> past = [];
  List<Transaction> inProgress = mockTransaction
      .where((element) =>
          element.status == TransactionStatus.on_delivered ||
          element.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransaction
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();
  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && past.length == 0) {
      return NothingItemPage(
        title: 'Thanks for ordering',
        subtitle: 'Just stay at home and wait \nwait until your item arrived',
        picturePath: 'assets/food_wishes.png',
        buttonTap1: () {},
        buttonTitle1: 'Order other item',
        buttonTap2: () {},
        buttonTitle2: 'View my order',
      );
    } else {
      return ListView(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                color: mainColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Orders',
                      style: blackFontStyle1,
                    ),
                    Text('Wait for the best things',
                        style: greyFontStyle.copyWith(
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
