// ignore_for_file: constant_identifier_names

import 'package:cv/config/flavor/flavors.dart';

final class FlavorModel {
  final Flavors flavor;
  final String name;

  const FlavorModel({
    required this.flavor,
    required this.name,
  });
}
