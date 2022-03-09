import 'package:flutter/material.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/blocs/store_bloc.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/models/pizza_item.dart';
import 'package:pizza_app_s/pages/ingredient_page.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';
import 'package:pizza_app_s/widgets/item_wrap.dart';

class MeatPage extends StatefulWidget {
  const MeatPage({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  State<MeatPage> createState() => _MeatPageState();
}

class _MeatPageState extends State<MeatPage> {
  final _selectedPizzaItems = ValueNotifier<List<PizzaItem>>([]);

  @override
  void dispose() {
    _selectedPizzaItems.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final number = MediaQuery.of(context).size.width ~/ Consts.px200;
    final size = ((MediaQuery.of(context).size.width - Consts.px8) / number) -
        Consts.px32;
    return CustomFutureBuilder<List<PizzaItem>>(
      future: BlocProvider.of<StoreBloc>(context).getPizzaViande(),
      dataBuilder: (context, data) => ValueListenableBuilder<List<PizzaItem>>(
        valueListenable: _selectedPizzaItems,
        builder: (context, selectedPizzaItems, _) => AppScaffold(
          onBack: () {
            Navigator.pop(context);
          },
          onForward: selectedPizzaItems.isEmpty
              ? null
              : () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => IngredientPage(
                        pizza: widget.pizza.copyWith(
                          pizzaViandes: selectedPizzaItems,
                        ),
                      ),
                      transitionsBuilder: (_, animation, __, child) {
                        const begin = Offset(1, 0);
                        const end = Offset.zero;
                        const curve = Curves.easeOut;

                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: Consts.edgeInsetsAll32,
                child: Column(
                  children: [
                    Text(
                      'La/les viande(s) dans votre pizza',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Consts.px16),
                    Text(
                      'Plusieurs choix possible(s)',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Consts.px16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: Consts.px8,
                        runSpacing: Consts.px8,
                        children: List.generate(
                          data.length,
                          (index) => ItemWrap(
                            size: size,
                            imageUrl: data[index].image,
                            labeel: data[index].label,
                            selected: selectedPizzaItems.contains(data[index]),
                            onTap: () {
                              final list = selectedPizzaItems;
                              if (list.contains(data[index])) {
                                list.remove(data[index]);
                              } else {
                                list.add(data[index]);
                              }
                              _selectedPizzaItems.value = [];
                              _selectedPizzaItems.value = list;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
