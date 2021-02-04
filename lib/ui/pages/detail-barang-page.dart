part of 'pages.dart';

class DetailBarang extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  DetailBarang({this.onBackButtonPressed, this.transaction});

  @override
  _DetailBarangState createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: mainColor,
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.transaction.barang.picturePath),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    //back button
                    
                  ],
                )
              ],
          ))
        ],
      ),
    );
  }
}
