part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Fin your the best way',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 56, defaultMargin, 16),
            child: Text(
              'Email Addres',
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
              controller: emailController,
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
              'Password',
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
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type your email address',
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
            "Silahkan login dengan username dan password \n atau dengan sosial media",
            style: blackFontStyle2.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: 'assets/icons/google.svg',
                press: () {},
              ),
              SocialCard(
                icon: 'assets/icons/facebook-2.svg',
                press: () {},
              ),
              SocialCard(
                icon: 'assets/icons/twitter.svg',
                press: () {},
              ),
            ],
          ),

          ///BUTTON SIGN IN
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      // ignore: deprecated_member_use
                      await context.bloc<UserCubit>().signIn(
                          emailController.text, passwordController.text);

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
                      'Sign In',
                      style: blackFontStyle2.copyWith(fontSize: 18),
                    ),
                  ),
          ),

          ///button create account
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.grey,
                    child: Text(
                      'Create a new account',
                      style: whiteFontStyle2.copyWith(fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
