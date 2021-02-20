part of 'shared.dart';

Color mainColor = "C8F902".toColor();
Color greyColor = '8D92A3'.toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);
TextStyle whiteFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

const double defaultMargin = 24;
