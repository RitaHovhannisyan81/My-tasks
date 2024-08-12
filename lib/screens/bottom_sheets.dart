import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            width: double.maxFinite,
            height: 200,
            color: Colors.white,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ElevatedButton(
                child: Text('Close Bottom Sheet'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Container(
                              width: 30,
                              height: 40,
                              child: Image(
                                image: AssetImage(
                                  'assets/del_u.png',
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            child: Text('Delete user'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 15),
                              child: Container(
                                width: 30,
                                height: 40,
                                child: Image(
                                  image: AssetImage(
                                    'assets/user-logout.webp',
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              child: Text('Log out user'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showModalBottomSheet(context),
          child: Text('Show Modal Bottom Sheet'),
        ),
      ),
    );
  }
}
