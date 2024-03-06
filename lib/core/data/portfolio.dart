import 'package:realm/realm.dart';
part 'portfolio.g.dart';

@RealmModel()
class _Portfolio {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int no;
  late String userId;
}
