// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/dev.env
final class _Dev {
  static const String baseUrl = 'https://dev';

  static const List<int> _enviedkeysecretKey = <int>[
    3673190605,
    1774104257,
    3146689853,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    3673190569,
    1774104228,
    3146689867,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/prod.env
final class _Prod {
  static const List<int> _enviedkeybaseUrl = <int>[
    521416212,
    1531738619,
    1848980072,
    182008996,
    3709991239,
    1381698712,
    1302661735,
    3827932234,
    811723588,
    2219313679,
    1660651211,
    3873253673,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    521416316,
    1531738511,
    1848979996,
    182009044,
    3709991220,
    1381698722,
    1302661704,
    3827932261,
    811723572,
    2219313789,
    1660651172,
    3873253709,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    1955742606,
    4205835790,
    2163229621,
    2222483749,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1955742718,
    4205835900,
    2163229658,
    2222483777,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/stage.env
final class _Stage {
  static const List<int> _enviedkeybaseUrl = <int>[
    3625195177,
    1732144201,
    1758318810,
    4098368110,
    2750682543,
    3196255243,
    3957436137,
    2434567749,
    2161791522,
    58610594,
    1808524308,
    4198920846,
    3862453822,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3625195201,
    1732144189,
    1758318766,
    4098368030,
    2750682588,
    3196255281,
    3957436102,
    2434567786,
    2161791569,
    58610646,
    1808524405,
    4198920937,
    3862453851,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    4163542513,
    4146697992,
    4080338862,
    1801138465,
    1820747750,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    4163542402,
    4146698108,
    4080338895,
    1801138502,
    1820747651,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
