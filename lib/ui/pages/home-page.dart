part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    double listItemWidth = 
      MediaQuery.of(context).size.width - 2 * defaultMargin;
    
    return ListView(
      children: [
        Column(
          children: [
            ///HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FATronik',
                        style: blackFontStyle1,
                      ),
                      Text(
                        'Lets buying another pcs',
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  //foto profil
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/dummy-image.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            ///CONTENT
            Container(
              height: 278,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockBarang
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  left: (e == mockBarang.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: ItemCard(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),

            ///Recomended
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['New Arrival', 'popular', 'recommended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Builder(
                    builder: (_) {
                      List<Barang> barangs = (selectedIndex == 0)
                          ? mockBarang
                          : (selectedIndex == 1)
                              ? []
                              : [];
                      return Column(
                        children: barangs
                            .map((e) =>
                                Padding(
                                  padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20),
                                  child: ListBarang(barang: e, itemWidth: listItemWidth),
                                ))
                            .toList(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
