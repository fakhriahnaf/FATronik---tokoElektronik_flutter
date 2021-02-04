part of 'widget.dart';

class ListBarang extends StatelessWidget {
  final Barang barang;
  final double itemWidth;

  ListBarang({@required this.barang, @required this.itemWidth });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(barang.picturePath), 
              fit:BoxFit.cover)
          ),
        ),
        SizedBox(
          width: itemWidth - 182, //60+12+110
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                barang.name,
                style: blackFontStyle2,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID'
                ).format(barang.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ]
          ),
        ),
        RatingStar(barang.rate),
      ],
    );
  }
}