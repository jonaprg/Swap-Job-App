import 'Offer.dart';
import 'User.dart';

class MatchUser {
  final int id;
  final bool isFinalized;
  final bool isContracted;
  final User user;
  final Offer offer;

  const MatchUser({
    required this.id,
    required this.isFinalized,
    required this.isContracted,
    required this.user,
    required this.offer
  });

  factory MatchUser.fromJson(Map<String, dynamic> json) {

    return MatchUser(
      id : json['id'] as int,
      isFinalized : json['isFinalized'] as bool,
      isContracted : json['isContracted'] as bool,
      user : User.fromJson(json['user']),
      offer : Offer.fromJson(json['offer']),
    );
  }

  @override
  String toString() {
    return 'MatchUser{id: $id, isFinalized: $isFinalized, isContracted: $isContracted, user: $user, offer: $offer}';
  }
}