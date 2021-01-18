// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/string.dart';

class InvolvedModel {
  final String profilePath;
  final String name;
  final String knownForDepartment;
  final String birthday;
  final String placeOfBirth;
  final String biography;

  InvolvedModel({
    this.profilePath,
    this.name,
    this.knownForDepartment,
    this.biography,
    this.birthday,
    this.placeOfBirth,
  });

  factory InvolvedModel.fromJson({Map<String, dynamic> jsonMap}) {
    return InvolvedModel(
      profilePath: jsonMap['profile_path'],
      name: StringUtils.checkEmpty(
        value: jsonMap['name'],
        dontValue: CfStrings.UNIFORMED
      ),
      knownForDepartment: StringUtils.checkEmpty(
        value: jsonMap['known_for_department'],
        dontValue: '${CfStrings.UNIFORMED} department',
      ),
      biography: StringUtils.checkEmpty(
        value: jsonMap['biography'],
        dontValue: CfStrings.UNIFORMED,
      ),
      birthday: StringUtils.checkEmpty(
        value: jsonMap['birthday'],
        dontValue: CfStrings.UNIFORMED,
      ),
      placeOfBirth:
          jsonMap['place_of_birth'] ?? '${CfStrings.UNIFORMED} place of birth',
    );
  }
}
