import 'package:flutter/material.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/blocs/store_bloc.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/models/pizza_item.dart';
import 'package:pizza_app_s/pages/meat_page.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';
import 'package:pizza_app_s/widgets/item_wrap.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _selectedPizzaItem = ValueNotifier<PizzaItem?>(null);

  @override
  void dispose() {
    _selectedPizzaItem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final number = MediaQuery.of(context).size.width ~/ Consts.px200;
    final size = ((MediaQuery.of(context).size.width - Consts.px8) / number) -
        Consts.px32;
    return CustomFutureBuilder<List<PizzaItem>>(
      future: BlocProvider.of<StoreBloc>(context).getPizzaBase(),
      dataBuilder: (context, data) => ValueListenableBuilder<PizzaItem?>(
        valueListenable: _selectedPizzaItem,
        builder: (context, selectedPizzaItem, _) => AppScaffold(
          onBack: () {
            Navigator.pop(context);
          },
          onForward: selectedPizzaItem == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => MeatPage(
                        pizza: widget.pizza.copyWith(
                          pizzaBase: selectedPizzaItem,
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
                      'La base de votre pizza',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Consts.px16),
                    Text(
                      'Un seul choix possible',
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
                            selected: data[index] == selectedPizzaItem,
                            onTap: () {
                              _selectedPizzaItem.value = data[index];
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
