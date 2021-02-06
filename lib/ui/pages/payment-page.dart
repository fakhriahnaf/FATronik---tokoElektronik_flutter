part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final Transaction transaction;
  PaymentPage({this.transaction});
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment Section',
      subtitle: 'ayo dibayar',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          ///BAGIAN ATAS
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item ordered',
                    style: blackFontStyle3.copyWith(fontSize: 18)),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      transaction.barang.picturePath),
                                  fit: BoxFit.cover,
                                ))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width -189, 
                              //2(jarakbodrd)+60(lebargambar)+12(jarakpictureke title)+78(lebarjmlahitems)
                              child: Text(
                                transaction.barang.name,
                                style: blackFontStyle2,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR',
                                        decimalDigits: 0)
                                    .format(transaction.barang.price),
                                style: greyFontStyle.copyWith(fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '${transaction.quantity} items',
                      style: greyFontStyle.copyWith(fontSize: 13)
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 26, bottom: 8),
                  child: Text(
                    'Detail Transaction',
                    style: blackFontStyle3.copyWith(fontSize: 18)
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                      child: Text(
                        transaction.barang.name,
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                       width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                       child: Text(
                         NumberFormat.currency(
                           locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(
                             transaction.quantity * transaction.barang.price
                           ), 
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                       ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                      child: Text(
                        'Ongkir',
                        style: greyFontStyle
                      ),
                    ),
                    SizedBox(
                       width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                       child: Text(
                         NumberFormat.currency(
                           locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(
                             10000
                           ), 
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                       ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                      child: Text(
                        'Tax 10%',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                       width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                       child: Text(
                         NumberFormat.currency(
                           locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(
                             transaction.quantity * transaction.barang.price * 0.1
                           ), 
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                       ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                      child: Text(
                        'Total',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                       width: MediaQuery.of(context).size.width / 2 - defaultMargin-5,
                       child: Text(
                         NumberFormat.currency(
                           locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(
                             transaction.barang.price * transaction.quantity * 1.1 + 10000
                           ), 
                          style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500,
                            color: '1Abc9c'.toColor()
                          ),
                          textAlign: TextAlign.right,
                       ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                
              ],
            ),
          )

          ///
        ],
      ),
    );
  }
}
