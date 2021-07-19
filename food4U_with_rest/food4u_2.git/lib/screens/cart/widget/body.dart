import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/loading.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({MainViewmodel mainViewmodel}) : _mainViewmodel = mainViewmodel;

  final MainViewmodel _mainViewmodel;

  @override
  Widget build(BuildContext context) {
    if (_mainViewmodel.user.cartList.length > 0) {
      return View(
        viewmodel: MainViewmodel(),
        builder: (_, _mainViewmodel, __) => _buildListView(),
      );
    } else {
      Container(width: 0.0, height: 0.0);
    }
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _mainViewmodel.user.cartList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 70,
                  minHeight: 60,
                  maxWidth: 70,
                  maxHeight: 60,
                ),
                child: Image.network(
                    '${_mainViewmodel.user.cartList[index].photoUrl}',
                    fit: BoxFit.cover),
              ),
              title: Text(
                '${_mainViewmodel.user.cartList[index].name}',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle:
                  Text('${_mainViewmodel.user.cartList[index].ownerName}'),
              trailing: Text('RM${_mainViewmodel.user.cartList[index].price}'),
            ),
          ),
        );
      },
    );
  }
}
