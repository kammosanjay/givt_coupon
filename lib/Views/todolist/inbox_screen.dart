import 'package:baanda_mobile_app/Views/todolist/inbox_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  TextEditingController textC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build called');
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Scaffold(
        floatingActionButton: Consumer<CounterProvider>(
          builder: (ctx, provider, child) {
            return Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: provider.incrementCounter,
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: provider.incrementCounter1,
                  child: Icon(Icons.remove),
                ),
              ],
            );
          },
        ),

        body: Column(
          children: [
            Center(
              child: Consumer<CounterProvider>(
                builder: (context, provider, child) {
                  return Text(
                    'Counter: ${provider.count}',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
