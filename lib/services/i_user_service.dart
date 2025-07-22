import '../models/user.dart';

abstract class IUserService {
  Future<List<User>> getUsers();
}