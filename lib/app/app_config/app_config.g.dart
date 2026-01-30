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

  static const bool isAuthRequired = true;

  static const List<int> _enviedkeysecretKey = <int>[
    524547297,
    2980713988,
    3295342575,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    524547205,
    2980714081,
    3295342489,
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
    3699528321,
    2731184397,
    2857062812,
    3414667694,
    4288611049,
    437416200,
    1216597589,
    4024283733,
    2731219953,
    4243175540,
    2501786896,
    3224968741,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    3699528425,
    2731184505,
    2857062888,
    3414667742,
    4288610970,
    437416242,
    1216597626,
    4024283770,
    2731219841,
    4243175430,
    2501787007,
    3224968769,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    1528165307,
    894408051,
    4184165999,
    3418290831,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1528165323,
    894407937,
    4184165888,
    3418290923,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );

  static const bool isAuthRequired = true;
}

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: env/stage.env
final class _Stage {
  static const List<int> _enviedkeybaseUrl = <int>[
    1696745855,
    4222428480,
    2872993844,
    1519047070,
    134342190,
    1119469856,
    3812131658,
    228787543,
    1496099302,
    2407972713,
    3232639429,
    3112910608,
    1126757554,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1696745751,
    4222428468,
    2872993856,
    1519047150,
    134342237,
    1119469850,
    3812131685,
    228787576,
    1496099221,
    2407972637,
    3232639396,
    3112910711,
    1126757591,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    77427731,
    1508975458,
    696222104,
    1395783878,
    3727916802,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    77427808,
    1508975382,
    696222201,
    1395783841,
    3727916903,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );

  static const bool isAuthRequired = true;
}
