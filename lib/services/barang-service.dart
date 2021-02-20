part of 'services.dart';

class BarangService {
  static Future<ApiReturnValue<List<Barang>>> getBarang(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'barang';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: ' please try again');
    }
    var data = jsonDecode(response.body);
    List<Barang> barang = (data['data']['data'] as Iterable)
        .map((e) => Barang.fromJson(e))
        .toList();
    return ApiReturnValue(value: barang);
  }
}
