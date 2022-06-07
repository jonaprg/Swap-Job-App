import 'Offer.dart';
import 'User.dart';

class UserMatch {
  final int id;
  final bool isFinalized;
  final bool isContracted;
  final User user;
  final Offer offer;

  const UserMatch({
    required this.id,
    required this.isFinalized,
    required this.isContracted,
    required this.user,
    required this.offer
  });

  factory UserMatch.fromJson(Map<String, dynamic> json) {

    return UserMatch(
      id : json['id'] as int,
      isFinalized : json['finalized'] as bool,
      isContracted : json['contracted'] as bool,
      user : User.fromJson(json['user']),
      offer : Offer.fromJson(json['offer']),
    );
  }
}
