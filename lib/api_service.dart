class ApiService {
  Future<List<UserModel>> getUser() async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () => [UserModel(name: "FARHAN ASLAM")],
    );
  }
}

class UserModel {
  String name;
  UserModel({required this.name});
}
