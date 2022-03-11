import 'package:flutter/material.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/blocs/store_bloc.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/extensions/datetime_extension.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/pages/pizza_page.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';

class CheatCodePage extends StatelessWidget {
  const CheatCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: Consts.edgeInsetsAll32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Les pizzas',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Consts.px16),
                CustomStreamBuilder<List<Pizza>>(
                  stream: BlocProvider.of<StoreBloc>(context).onPizzaChange,
                  dataBuilder: (context, pizzas) => Column(
                    children: List.generate(
                      pizzas.length,
                      (index) => ListTile(
                        title: Text(pizzas[index].username),
                        subtitle: Text(pizzas[index].createdTo.dateTimeFormat),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  PizzaPage(pizza: pizzas[index]),
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
