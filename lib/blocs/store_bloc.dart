import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/models/pizza_item.dart';

class StoreBloc extends BlocBase {
  final CollectionReference<PizzaItem> _pizzaBaseCollectionReference =
      FirebaseFirestore.instance
          .collection('pizzaBase')
          .withConverter<PizzaItem>(
            fromFirestore: (snapshot, _) =>
                PizzaItem.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  final CollectionReference<PizzaItem> _pizzaFromageCollectionReference =
      FirebaseFirestore.instance
          .collection('pizzaFromage')
          .withConverter<PizzaItem>(
            fromFirestore: (snapshot, _) =>
                PizzaItem.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  final CollectionReference<PizzaItem> _pizzaIngredientCollectionReference =
      FirebaseFirestore.instance
          .collection('pizzaIngredient')
          .withConverter<PizzaItem>(
            fromFirestore: (snapshot, _) =>
                PizzaItem.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  final CollectionReference<PizzaItem> _pizzaViandeCollectionReference =
      FirebaseFirestore.instance
          .collection('pizzaViande')
          .withConverter<PizzaItem>(
            fromFirestore: (snapshot, _) =>
                PizzaItem.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );
  final CollectionReference<Pizza> _pizzaCollectionReference =
      FirebaseFirestore.instance.collection('pizza').withConverter<Pizza>(
            fromFirestore: (snapshot, _) =>
                Pizza.fromFireStore(snapshot.data()!),
            toFirestore: (value, _) => value.toFirestore(),
          );

  Future<List<PizzaItem>> getPizzaBase() async {
    try {
      final querySnapshot =
          await _pizzaBaseCollectionReference.orderBy('label').get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print('Une erreur est survenue : ${e.message} - ${e.code}');
      return [];
    } catch (e) {
      print('Une erreur est survenue : $e');
      return [];
    }
  }

  Future<List<PizzaItem>> getPizzaFromage() async {
    try {
      final querySnapshot =
          await _pizzaFromageCollectionReference.orderBy('label').get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print('Une erreur est survenue : ${e.message} - ${e.code}');
      return [];
    } catch (e) {
      print('Une erreur est survenue : $e');
      return [];
    }
  }

  Future<List<PizzaItem>> getPizzaIngredient() async {
    try {
      final querySnapshot =
          await _pizzaIngredientCollectionReference.orderBy('label').get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print('Une erreur est survenue : ${e.message} - ${e.code}');
      return [];
    } catch (e) {
      print('Une erreur est survenue : $e');
      return [];
    }
  }

  Future<List<PizzaItem>> getPizzaViande() async {
    try {
      final querySnapshot =
          await _pizzaViandeCollectionReference.orderBy('label').get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print('Une erreur est survenue : ${e.message} - ${e.code}');
      return [];
    } catch (e) {
      print('Une erreur est survenue : $e');
      return [];
    }
  }

  Future<void> addPizza(Pizza pizza) async {
    try {
      final docRef = await _pizzaCollectionReference.add(pizza);
      await _pizzaCollectionReference
          .doc(docRef.id)
          .update({'uuid': docRef.id});
    } on FirebaseException catch (e) {
      print('Une erreur est survenue : ${e.message} - ${e.code}');
    } catch (e) {
      print('Une erreur est survenue : $e');
    }
  }

  @override
  void dispose() {}

  @override
  void initState() {}
}
