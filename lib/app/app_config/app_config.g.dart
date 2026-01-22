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
    1761373286,
    2673511910,
    587601593,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1761373186,
    2673511811,
    587601615,
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
    4203131027,
    2013162503,
    3279394812,
    2240807618,
    2822448762,
    325830148,
    2216997857,
    2090346573,
    608817686,
    1868967938,
    3781273002,
    1555140065,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    4203131131,
    2013162611,
    3279394696,
    2240807602,
    2822448649,
    325830206,
    2216997838,
    2090346594,
    608817766,
    1868968048,
    3781273029,
    1555139973,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    2080929649,
    965719428,
    1382974164,
    3256741046,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2080929537,
    965719542,
    1382974139,
    3256741074,
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
    4158075309,
    1454963489,
    3702971759,
    1624532547,
    870980599,
    3366106656,
    2749210318,
    4419004,
    2258678315,
    3420197582,
    3696255242,
    335900327,
    2255756564,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    4158075333,
    1454963541,
    3702971675,
    1624532531,
    870980484,
    3366106650,
    2749210337,
    4418963,
    2258678360,
    3420197562,
    3696255339,
    335900352,
    2255756657,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    116374537,
    736028975,
    516472871,
    2411946710,
    2912811503,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    116374650,
    736029019,
    516472902,
    2411946673,
    2912811402,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );
}
