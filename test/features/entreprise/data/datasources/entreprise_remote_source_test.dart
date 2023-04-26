import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:square/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:square/features/entreprise/data/models/entreprise_model.dart';
import 'package:square/features/entreprise/domain/entities/entreprise.dart';

class MockHttpClient extends Mock implements http.BaseClient {}

void main() {
  MockHttpClient mockHttpClient;
  AuthenticationRemoteSourceImpl dataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = AuthenticationRemoteSourceImpl(client: mockHttpClient);
  });

  group('Entreprise', () {
    //instanse of  EntrepriseModel
    final tEntrepriseModel = EntrepriseModel(
      id: "1",
      name: "test name",
      email: "testemail",
      phone: "test phone",
      address: "test address",
      description: "test description",
    );
  });
}
