import 'dart:io';

import 'package:givt_mobile_app/Views/todolist/inbox_provider.dart';
import 'package:flutter/material.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  TextEditingController textC = TextEditingController();

  pattern() {
    int i = 0, j, a = 10;

    for (i = 0; i <= a; i++) {
      for (j = 0; j <= i; j++) {
        print('*');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    print('build called');
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Scaffold(
        // floatingActionButton: Consumer<CounterProvider>(
        //   builder: (ctx, provider, child) {
        //     return Row(
        //       spacing: 20,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         FloatingActionButton(
        //           onPressed: provider.incrementCounter,
        //           child: Icon(Icons.add),
        //         ),
        //         FloatingActionButton(
        //           onPressed: provider.incrementCounter1,
        //           child: Icon(Icons.remove),
        //         ),
        //       ],
        //     );
        //   },
        // ),
        body: Center(child: Text(appLoc.survey),)
      ),
    );
  }
}
