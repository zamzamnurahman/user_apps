import 'package:user_apps/model/address.dart';

extension FormatToAdress on Address {
  formatedAdress() {
    Address address = this;
    return "${address.street} ${address.suite} ${address.city}, ${address.zipcode}";
  }
}
