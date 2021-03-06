part of 'services.dart';

class UserService {
  //untuk signIn
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'login';
    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  // //with dummy data
  // String email, String password) async {
  // await Future.delayed(Duration(milliseconds: 500));

  // return ApiReturnValue(value: mockUser);
  // //return ApiReturnValue(message: 'wrong email or password');}

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'register';

    var response = await client.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'portalCode': user.portalCode,
          'phoneNumber': user.phoneNumber
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath: 'http://localhost:8000/storage/' + result.value);
      }
    }

    //todo : upload PhotoProfile
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'uploading profile failed');
    }
  }
}
