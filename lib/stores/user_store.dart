import 'package:mobx/mobx.dart';
import '../models/user.dart';
import '../services/i_user_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IUserService userService;

  _UserStoreBase(this.userService);

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchUsers() async {
    isLoading = true;
    try {
      final data = await userService.getUsers();
      users = ObservableList.of(data);
    } catch (e) {
      print("Erro ao buscar usuários: $e");
    } finally {
      isLoading = false;
    }
  }
}
