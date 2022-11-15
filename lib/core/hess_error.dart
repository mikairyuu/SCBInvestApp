import 'package:json_annotation/json_annotation.dart';

enum HessError {
  @JsonValue(0)
  success,
  @JsonValue(1)
  failed,
  @JsonValue(2)
  userNotFound,
  @JsonValue(3)
  passwordIncorrect,
  @JsonValue(4)
  userAlreadyExists,
  @JsonValue(5)
  fileException,
  @JsonValue(6)
  taskNotFound,
  @JsonValue(7)
  imageNotFound,
  @JsonValue(8)
  emailInvalid,
  @JsonValue(9)
  phoneInvalid,
  @JsonValue(10)
  emailAlreadyExists,
  @JsonValue(11)
  phoneAlreadyExists,
  @JsonValue(12)
  scuNotFound,
  @JsonValue(13)
  courseNotFound
}
