import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:pizza_app_s/models/pizza_item.dart';

class Pizza extends Equatable {
  final String uuid;
  final String username;
  final PizzaItem? pizzaBase;
  final List<PizzaItem>? pizzaViandes;
  final List<PizzaItem>? pizzaIngredients;
  final List<PizzaItem>? pizzaFromages;
  final DateTime createdTo;

  const Pizza({
    required this.uuid,
    required this.username,
    this.pizzaBase,
    this.pizzaViandes,
    this.pizzaIngredients,
    this.pizzaFromages,
    required this.createdTo,
  });

  factory Pizza.fromFireStore(Map<String, dynamic> json) => Pizza(
        uuid: json['uuid'] as String,
        username: json['username'] as String,
        pizzaBase:
            PizzaItem.fromFireStore(json['pizzaBase'] as Map<String, dynamic>),
        pizzaViandes: (json['pizzaViandes'] as List<Map<String, dynamic>>)
            .map((e) => PizzaItem.fromFireStore(e))
            .toList(),
        pizzaIngredients:
            (json['pizzaIngredients'] as List<Map<String, dynamic>>)
                .map((e) => PizzaItem.fromFireStore(e))
                .toList(),
        pizzaFromages: (json['pizzaFromages'] as List<Map<String, dynamic>>)
            .map((e) => PizzaItem.fromFireStore(e))
            .toList(),
        createdTo: (json['createdTo'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toFirestore() => {
        'uuid': uuid,
        'username': username,
        'pizzaBase': pizzaBase?.toFirestore(),
        'pizzaViandes': pizzaViandes?.map((e) => e.toFirestore()).toList(),
        'pizzaIngredients':
            pizzaIngredients?.map((e) => e.toFirestore()).toList(),
        'pizzaFromages': pizzaFromages?.map((e) => e.toFirestore()).toList(),
        'createdTo': Timestamp.fromDate(createdTo),
      };

  Pizza copyWith({
    String? uuid,
    String? username,
    PizzaItem? pizzaBase,
    List<PizzaItem>? pizzaViandes,
    List<PizzaItem>? pizzaIngredients,
    List<PizzaItem>? pizzaFromages,
  }) {
    return Pizza(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      pizzaBase: pizzaBase ?? this.pizzaBase,
      pizzaViandes: pizzaViandes ?? this.pizzaViandes,
      pizzaIngredients: pizzaIngredients ?? this.pizzaIngredients,
      pizzaFromages: pizzaFromages ?? this.pizzaFromages,
      createdTo: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Pizza(uuid: $uuid, username: $username, pizzaBase: $pizzaBase, pizzaViandes: $pizzaViandes, pizzaIngredients: $pizzaIngredients, pizzaFromages: $pizzaFromages, createdTo: $createdTo)';
  }

  @override
  List<Object> get props => [uuid, username, createdTo];
}
