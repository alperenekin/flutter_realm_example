import 'package:realm/realm.dart';
part 'local_user.g.dart';

@RealmModel()
class _LocalUser {
  @PrimaryKey()
  late ObjectId id;
  late String firstName;
  late String lastName;
  late String gender;
  late String? email;
}
