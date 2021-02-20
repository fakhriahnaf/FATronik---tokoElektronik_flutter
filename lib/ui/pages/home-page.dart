part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                            // ignore: deprecated_member_use
                            image: NetworkImage(
                                // ignore: deprecated_member_use
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
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
              child: BlocBuilder<BarangCubit, BarangState>(
                  builder: (_, state) => (state is BarangLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.barang
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.barang.first)
                                                ? defaultMargin
                                                : 0,
                                            right: defaultMargin),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(DetailBarang(
                                                transaction: Transaction(
                                                    barang: e,
                                                    // ignore: deprecated_member_use
                                                    user: (context.bloc<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user),
                                                onBackButtonPressed: () {
                                                  Get.back();
                                                },
                                              ));
                                            },
                                            child: ItemCard(e)),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(child: loadingIndicator)),
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
                  BlocBuilder<BarangCubit, BarangState>(builder: (_, state) {
                    if (state is BarangLoaded) {
                      List<Barang> barang = state.barang
                          .where((element) =>
                              element.types.contains((selectedIndex == 0)
                                  ? TipeBarang.new_arrival
                                  : (selectedIndex == 1)
                                      ? TipeBarang.popular
                                      : TipeBarang.recommended))
                          .toList();
                      return Column(
                        children: barang
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 20),
                                  child: ListBarang(
                                      barang: e, itemWidth: listItemWidth),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  }),
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
