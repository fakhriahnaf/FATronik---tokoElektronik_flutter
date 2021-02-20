import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:bogorTronik/models/models.dart';

part 'user-service.dart';
part 'barang-service.dart';
part 'transaction-service.dart';

String  baseUrl = 'http://localhost:8000/api/';
