part of 'pages.dart';

class DetailBarang extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  DetailBarang({this.onBackButtonPressed, this.transaction});

  @override
  _DetailBarangState createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.transaction.barang.picturePath),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  //back button
                  Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                if (widget.onBackButtonPressed != null) {
                                  widget.onBackButtonPressed();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black12,
                                ),
                                child:
                                    Image.asset('assets/back_arrow_white.png'),
                              )))),

                  ///BODY AREA
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    //content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //judul barang+ rating
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      134, //32 - 102,
                                  child: Text(
                                    widget.transaction.barang.name,
                                    style: blackFontStyle2,
                                  ),
                                ),
                                SizedBox(height: 10),
                                RatingStar(widget.transaction.barang.rate),
                              ],
                            ),

                            //tombol quantitiy part
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = max(1, quantity - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_min.png'))),
                                  ),
                                ),
                                SizedBox(
                                    width: 50,
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = min(999, quantity + 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/btn_min.png'))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.transaction.barang.description,
                              style: greyFontStyle,
                            )),
                        Text(
                          'Spesification',
                          style: blackFontStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                          child: Text(widget.transaction.barang.spesification,
                              style: greyFontStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR',
                                          decimalDigits: 0)
                                      .format(quantity *
                                          widget.transaction.barang.price),
                                  style: blackFontStyle2.copyWith(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                                width: 163,
                                height: 45,
                                child: RaisedButton(
                                  onPressed: () {
                                    Get.to(PaymentPage(
                                        transaction: widget.transaction
                                            .copyWith(quantity: quantity, total: quantity* widget.transaction.barang.price)
                                    ));
                                  },
                                  color: mainColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Order Now',
                                    style: blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
