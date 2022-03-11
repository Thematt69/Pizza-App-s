import 'package:flutter/material.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/extensions/datetime_extension.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onBack: () => Navigator.pop(context),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: Consts.edgeInsetsAll32,
            child: Column(
              children: [
                Text(
                  'Pizza de ${pizza.username}',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Consts.px8),
                Text(
                  pizza.createdTo.dateTimeFormat,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Consts.px16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'La base',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: Consts.px8),
                if (pizza.pizzaBase == null)
                  const ListTile(
                    title: Text('Aucune base'),
                  )
                else
                  ListTile(
                    title: Text(
                      pizza.pizzaBase!.label,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                const SizedBox(height: Consts.px16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'La/les viande(s) (${pizza.pizzaViandes?.length ?? 0})',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: Consts.px8),
                if (pizza.pizzaViandes == null)
                  const ListTile(
                    title: Text('Aucune viande'),
                  )
                else
                  Column(
                    children: List.generate(
                      pizza.pizzaViandes!.length,
                      (index) => ListTile(
                        title: Text(
                          pizza.pizzaViandes![index].label,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: Consts.px16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'La/les ingrédients(s) (${pizza.pizzaIngredients?.length ?? 0})',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: Consts.px8),
                if (pizza.pizzaIngredients == null)
                  const ListTile(
                    title: Text('Aucune ingrédient'),
                  )
                else
                  Column(
                    children: List.generate(
                      pizza.pizzaIngredients!.length,
                      (index) => ListTile(
                        title: Text(
                          pizza.pizzaIngredients![index].label,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: Consts.px16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'La/les fromages(s) (${pizza.pizzaFromages?.length ?? 0})',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: Consts.px8),
                if (pizza.pizzaFromages == null)
                  const ListTile(
                    title: Text('Aucune fromage'),
                  )
                else
                  Column(
                    children: List.generate(
                      pizza.pizzaFromages!.length,
                      (index) => ListTile(
                        title: Text(
                          pizza.pizzaFromages![index].label,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
