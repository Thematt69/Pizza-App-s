import 'package:flutter/material.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/blocs/store_bloc.dart';
import 'package:pizza_app_s/colors.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';

class EndPage extends StatefulWidget {
  const EndPage({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  final Pizza pizza;

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  final _snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: const [
        Icon(
          Icons.task_alt_outlined,
          color: CustomColors.primary,
        ),
        SizedBox(width: Consts.px8),
        Expanded(
          child: Text('Votre pizza a bien été enregistrée !'),
        ),
      ],
    ),
  );

  @override
  void initState() {
    BlocProvider.of<StoreBloc>(context)
        .addPizza(widget.pizza)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(_snackBar));
    super.initState();
  }

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
                Image.asset(
                  'assets/images/pizza.png',
                  height: Consts.px200,
                ),
                const SizedBox(height: Consts.px32),
                Text(
                  "Et voilà ! C'est fini pour vous",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Consts.px16),
                Text(
                  "Maintenant, il ne vous reste plus qu'à attendre le jour J.",
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
