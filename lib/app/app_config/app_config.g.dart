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
    2340132473,
    993053095,
    1878678333,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2340132381,
    993053122,
    1878678347,
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
    455093772,
    1064806230,
    3568732047,
    1498504347,
    625146642,
    1337523805,
    1992138136,
    2354690195,
    4140381664,
    1868924555,
    3241124905,
    3651747722,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    455093860,
    1064806178,
    3568732155,
    1498504427,
    625146721,
    1337523815,
    1992138167,
    2354690236,
    4140381584,
    1868924665,
    3241124934,
    3651747822,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    451155142,
    310028541,
    2397697652,
    46370741,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    451155126,
    310028431,
    2397697563,
    46370769,
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
    3703643072,
    1021794397,
    2224427362,
    2184597742,
    1661511136,
    2071546588,
    1891327421,
    1719015665,
    3466911561,
    2244702433,
    3639766857,
    3495546855,
    1694345819,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3703643048,
    1021794345,
    2224427286,
    2184597662,
    1661511059,
    2071546598,
    1891327378,
    1719015646,
    3466911546,
    2244702357,
    3639766824,
    3495546752,
    1694345790,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    4140950242,
    1053700729,
    1883758367,
    1818452115,
    599494995,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    4140950161,
    1053700621,
    1883758462,
    1818452212,
    599494966,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
