import 'dart:html';

import 'package:flutter/foundation.dart';

class Sample {
  String nama;
  int umur;
  Sample({required this.nama, required this.umur});
  @override
  String toString() {
    return 'Sample{nama: $nama, umur: $umur}';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(nama: json["nama"], umur: json["umur"]);
  }
}
