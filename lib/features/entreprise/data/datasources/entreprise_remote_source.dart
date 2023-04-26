import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:square/core/error/exceptions.dart';
import 'package:square/core/utils/constants.dart';
import 'package:square/features/entreprise/data/models/entreprise_model.dart';
import 'dart:convert';

import 'package:square/features/entreprise/domain/entities/entreprise.dart';

abstract class EntrepriseRemoteDataSource {
  Future<List<Entreprise>> getAllEntreprises();
  Future<Unit> addEntreprise(EntrepriseModel entrepriseModel);
}

class EntrepriseRemoteSourceImpl extends EntrepriseRemoteDataSource {
  final http.Client client;

  EntrepriseRemoteSourceImpl({required this.client});

  @override
  Future<List<EntrepriseModel>> getAllEntreprises() async {
    final response = await client.get(
        Uri.parse("$API_BASE_URL/get-entreprises"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List data = json.decode(response.body) as List;

      final List<EntrepriseModel> postInfo = data
          .map<EntrepriseModel>((data) => EntrepriseModel.fromJson(data))
          .toList();

      return postInfo;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addEntreprise(EntrepriseModel entrepriseModel) async {
    final body = json.encode(entrepriseModel.toJson());

    final response = await client.post(
        Uri.parse("$API_BASE_URL/add-entreprise"),
        body: body,
        headers: {"Content-Type": "application/json"});

    debugPrint(response.body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
