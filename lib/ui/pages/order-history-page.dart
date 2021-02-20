part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  // List<Transaction> inProgress = [];
  // List<Transaction> past = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return NothingItemPage(
            title: 'Thanks for ordering',
            subtitle:
                'Just stay at home and wait \nwait until your item arrived',
            picturePath: 'assets/food_wishes.png',
            buttonTap1: () {},
            buttonTitle1: 'Order other item',
            buttonTap2: () {},
            buttonTitle2: 'View my order',
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28))),
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
                  Container(
                    height: 24,
                    color: Colors.white,
                  ),
                  ///BODY
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTabBar(
                          titles: ['InProgress', 'Past Order'],
                          selectedIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0)
                              ? state.transaction
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.on_delivered ||
                                      element.status ==
                                          TransactionStatus.pending)
                                  .toList()
                              : state.transaction
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.delivered ||
                                      element.status ==
                                          TransactionStatus.cancelled)
                                  .toList();
                          return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: OrderListItem(
                                            transaction: e,
                                            itemWidth: listItemWidth),
                                      ))
                                  .toList());
                        })
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
