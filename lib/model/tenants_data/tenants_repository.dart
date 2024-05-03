import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/string_constants.dart';
import '../tenants_model.dart';

class TenantsRepository {

  Future fetchTenantsItems(String tenantId) async {
    String baseUrl = "${ConstantStrings.baseURL}$tenantId/widgets";
    var response = await http.get(Uri.parse(baseUrl),);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint("LOG:: fetchTenantsItems Result:: $result");
      Iterable list = result;
      return list.map((tenantsData) => TenantsData.fromJson(tenantsData)).toList();

    } else {
      throw Exception("Failed to load data");
    }
  }
}