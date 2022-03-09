import 'package:flutter/material.dart';
import 'package:pizza_app_s/consts.dart';
import 'package:pizza_app_s/models/pizza.dart';
import 'package:pizza_app_s/pages/base_page.dart';
import 'package:pizza_app_s/widgets/app_scaffold.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _username = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _username,
      builder: (context, username, _) => AppScaffold(
        onForward: username == null || username.isEmpty
            ? null
            : () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => BasePage(
                      pizza: Pizza(
                        uuid: 'temp',
                        username: username,
                        createdTo: DateTime.now(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/pizza.png',
                    height: Consts.px200,
                  ),
                  const SizedBox(height: Consts.px32),
                  Text(
                    "Bienvenue sur Pizza App's !",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Consts.px16),
                  Text(
                    'Vous allez pouvoir choisir votre pizza personnalisée en fonction de vos goûts et de vos envies.',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Consts.px16),
                  Text(
                    'Votre choix sera constitué de 4 parties : base, viande, fromage et les autres ingrédients.',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Consts.px32),
                  Container(
                    constraints: const BoxConstraints(maxWidth: Consts.px400),
                    child: TextFormField(
                      initialValue: username,
                      onChanged: (value) => _username.value = value,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        label: Text('Votre prénom *'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
