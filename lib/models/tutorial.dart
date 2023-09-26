// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial.freezed.dart';
part 'tutorial.g.dart';

@freezed
class Tutorial with _$Tutorial {
  factory Tutorial({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'youtube_id') String? youtubeId,
  }) = _Tutorial;

  factory Tutorial.fromJson(Map<String, dynamic> json) =>
      _$TutorialFromJson(json);

  factory Tutorial.initial() => Tutorial(
        id: 0,
        title: '',
        youtubeId: '',
      );
}
