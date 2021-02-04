part of 'widget.dart';

class ItemCard extends StatelessWidget {
  final Barang barang;
  ItemCard(this.barang);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 244,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black26),
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(barang.picturePath),
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Text(
              barang.name,
              style: blackFontStyle2,
              maxLines: 3,
              overflow: TextOverflow.clip
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:12),
            child: RatingStar(barang.rate),
          ),
        ],
      ),
    );
  }
}
