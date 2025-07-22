import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'services/user_service_http.dart';
import 'stores/user_store.dart';

void main() {
  final userService = UserServiceHttp();
  runApp(MyApp(userStore: UserStore(userService)));
}

class MyApp extends StatelessWidget {
  final UserStore userStore;

  const MyApp({super.key, required this.userStore});

  @override
  Widget build(BuildContext context) {
    return Provider<UserStore>(
      create: (_) => userStore,
      child: MaterialApp(
        title: 'User List',
        home: UserListPage(),
      ),
    );
  }
}
class UserListPage extends StatefulWidget {
  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    final store = Provider.of<UserStore>(context, listen: false);
    store.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Observer(
        builder: (_) {
          if (userStore.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: userStore.users.length,
            itemBuilder: (_, index) {
              final user = userStore.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}
