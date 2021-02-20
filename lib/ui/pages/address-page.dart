part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController portalCodeController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Bandung', 'Bogor', 'Jakarta', 'Depok'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Complete your profile',
      subtitle: 'Fin your the best way',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 56, defaultMargin, 16),
            child: Text(
              'Phone Number',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type your full name',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 16),
            child: Text(
              'Address',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type your email address',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 16),
            child: Text(
              'Portal Code',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: portalCodeController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type your email address',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 16),
            child: Text(
              'City',
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: DropdownButton(
                value: selectedCity,
                isExpanded: true,
                underline: SizedBox(),
                items: cities
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e, style: blackFontStyle3)))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCity = item;
                  });
                },
              )),
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true) 
              ? Center(child: loadingIndicator) 
              : RaisedButton(
              onPressed: () async {
                User user = widget.user.copyWith(
                    phoneNumber: phoneNumberController.text,
                    address: addressController.text,
                    portalCode: portalCodeController.text,
                    city: selectedCity);
                setState(() {
                  isLoading = true;
                });
                // ignore: deprecated_member_use
                await context.bloc<UserCubit>().signUp(
                  user, widget.password,
                    pictureFile: widget.pictureFile);
                 //recognized backend and message sukses aatau tidak
                      // ignore: deprecated_member_use
                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        // ignore: deprecated_member_use
                        context.bloc<BarangCubit>().getBarang();
                        // ignore: deprecated_member_use
                        context.bloc<TransactionCubit>().getTransaction();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: 'D9435E'.toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Sign In Failed',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            messageText: Text(
                              (state as UserLoadingFailed).message,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          );
                      }
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Continue',
                style: blackFontStyle2.copyWith(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
