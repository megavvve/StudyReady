// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'subject_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<Subject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['subject_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_name'])!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String name;
  const Subject({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_name'] = Variable<String>(name);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Subject copyWith({int? id, String? name}) => Subject(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject && other.id == this.id && other.name == this.name);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> name;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'subject_name': name,
    });
  }

  SubjectsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['subject_name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subjectId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES subjects (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'chapter_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, subjectId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subjectId')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subjectId']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('chapter_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['chapter_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjectId'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chapter_name'])!,
    );
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int subjectId;
  final String name;
  const Chapter(
      {required this.id, required this.subjectId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subjectId'] = Variable<int>(subjectId);
    map['chapter_name'] = Variable<String>(name);
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      name: Value(name),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'name': serializer.toJson<String>(name),
    };
  }

  Chapter copyWith({int? id, int? subjectId, String? name}) => Chapter(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subjectId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.name == this.name);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<String> name;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required String name,
  })  : subjectId = Value(subjectId),
        name = Value(name);
  static Insertable<Chapter> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subjectId': subjectId,
      if (name != null) 'chapter_name': name,
    });
  }

  ChaptersCompanion copyWith(
      {Value<int>? id, Value<int>? subjectId, Value<String>? name}) {
    return ChaptersCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subjectId'] = Variable<int>(subjectId.value);
    }
    if (name.present) {
      map['chapter_name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ThemesTable extends Themes with TableInfo<$ThemesTable, Theme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subjectId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES subjects (id)'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapterId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chapters (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'theme_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, subjectId, chapterId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'themes';
  @override
  VerificationContext validateIntegrity(Insertable<Theme> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subjectId')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subjectId']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('chapterId')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapterId']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('theme_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['theme_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Theme map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Theme(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjectId'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapterId'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_name'])!,
    );
  }

  @override
  $ThemesTable createAlias(String alias) {
    return $ThemesTable(attachedDatabase, alias);
  }
}

class Theme extends DataClass implements Insertable<Theme> {
  final int id;
  final int subjectId;
  final int chapterId;
  final String name;
  const Theme(
      {required this.id,
      required this.subjectId,
      required this.chapterId,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subjectId'] = Variable<int>(subjectId);
    map['chapterId'] = Variable<int>(chapterId);
    map['theme_name'] = Variable<String>(name);
    return map;
  }

  ThemesCompanion toCompanion(bool nullToAbsent) {
    return ThemesCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      chapterId: Value(chapterId),
      name: Value(name),
    );
  }

  factory Theme.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Theme(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'chapterId': serializer.toJson<int>(chapterId),
      'name': serializer.toJson<String>(name),
    };
  }

  Theme copyWith({int? id, int? subjectId, int? chapterId, String? name}) =>
      Theme(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        chapterId: chapterId ?? this.chapterId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Theme(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subjectId, chapterId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Theme &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.chapterId == this.chapterId &&
          other.name == this.name);
}

class ThemesCompanion extends UpdateCompanion<Theme> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<int> chapterId;
  final Value<String> name;
  const ThemesCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ThemesCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required int chapterId,
    required String name,
  })  : subjectId = Value(subjectId),
        chapterId = Value(chapterId),
        name = Value(name);
  static Insertable<Theme> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<int>? chapterId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subjectId': subjectId,
      if (chapterId != null) 'chapterId': chapterId,
      if (name != null) 'theme_name': name,
    });
  }

  ThemesCompanion copyWith(
      {Value<int>? id,
      Value<int>? subjectId,
      Value<int>? chapterId,
      Value<String>? name}) {
    return ThemesCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      chapterId: chapterId ?? this.chapterId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subjectId'] = Variable<int>(subjectId.value);
    }
    if (chapterId.present) {
      map['chapterId'] = Variable<int>(chapterId.value);
    }
    if (name.present) {
      map['theme_name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemesCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $QuestionTable extends Question
    with TableInfo<$QuestionTable, QuestionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courseNumberMeta =
      const VerificationMeta('courseNumber');
  @override
  late final GeneratedColumn<int> courseNumber = GeneratedColumn<int>(
      'course_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'course_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES subjects (id)'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chapters (id)'));
  static const VerificationMeta _themeIdMeta =
      const VerificationMeta('themeId');
  @override
  late final GeneratedColumn<int> themeId = GeneratedColumn<int>(
      'theme_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES themes (id)'));
  static const VerificationMeta _difficultlyMeta =
      const VerificationMeta('difficultly');
  @override
  late final GeneratedColumn<String> difficultly = GeneratedColumn<String>(
      'difficultly', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionContextMeta =
      const VerificationMeta('questionContext');
  @override
  late final GeneratedColumn<String> questionContext = GeneratedColumn<String>(
      'question_context', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rightAnswerMeta =
      const VerificationMeta('rightAnswer');
  @override
  late final GeneratedColumn<String> rightAnswer = GeneratedColumn<String>(
      'right_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _incorrectAnswersMeta =
      const VerificationMeta('incorrectAnswers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      incorrectAnswers = GeneratedColumn<String>(
              'incorrect_answers', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $QuestionTable.$converterincorrectAnswers);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseNumber,
        subjectId,
        chapterId,
        themeId,
        difficultly,
        questionContext,
        rightAnswer,
        incorrectAnswers
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_number')) {
      context.handle(
          _courseNumberMeta,
          courseNumber.isAcceptableOrUnknown(
              data['course_number']!, _courseNumberMeta));
    } else if (isInserting) {
      context.missing(_courseNumberMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['course_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('theme_id')) {
      context.handle(_themeIdMeta,
          themeId.isAcceptableOrUnknown(data['theme_id']!, _themeIdMeta));
    } else if (isInserting) {
      context.missing(_themeIdMeta);
    }
    if (data.containsKey('difficultly')) {
      context.handle(
          _difficultlyMeta,
          difficultly.isAcceptableOrUnknown(
              data['difficultly']!, _difficultlyMeta));
    } else if (isInserting) {
      context.missing(_difficultlyMeta);
    }
    if (data.containsKey('question_context')) {
      context.handle(
          _questionContextMeta,
          questionContext.isAcceptableOrUnknown(
              data['question_context']!, _questionContextMeta));
    } else if (isInserting) {
      context.missing(_questionContextMeta);
    }
    if (data.containsKey('right_answer')) {
      context.handle(
          _rightAnswerMeta,
          rightAnswer.isAcceptableOrUnknown(
              data['right_answer']!, _rightAnswerMeta));
    } else if (isInserting) {
      context.missing(_rightAnswerMeta);
    }
    context.handle(_incorrectAnswersMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      courseNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_number'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      themeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_id'])!,
      difficultly: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficultly'])!,
      questionContext: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}question_context'])!,
      rightAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}right_answer'])!,
      incorrectAnswers: $QuestionTable.$converterincorrectAnswers.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}incorrect_answers'])!),
    );
  }

  @override
  $QuestionTable createAlias(String alias) {
    return $QuestionTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterincorrectAnswers =
      StringListTypeConverter();
}

class QuestionData extends DataClass implements Insertable<QuestionData> {
  final int id;
  final int courseNumber;
  final int subjectId;
  final int chapterId;
  final int themeId;
  final String difficultly;
  final String questionContext;
  final String rightAnswer;
  final List<String> incorrectAnswers;
  const QuestionData(
      {required this.id,
      required this.courseNumber,
      required this.subjectId,
      required this.chapterId,
      required this.themeId,
      required this.difficultly,
      required this.questionContext,
      required this.rightAnswer,
      required this.incorrectAnswers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_number'] = Variable<int>(courseNumber);
    map['course_id'] = Variable<int>(subjectId);
    map['chapter_id'] = Variable<int>(chapterId);
    map['theme_id'] = Variable<int>(themeId);
    map['difficultly'] = Variable<String>(difficultly);
    map['question_context'] = Variable<String>(questionContext);
    map['right_answer'] = Variable<String>(rightAnswer);
    {
      final converter = $QuestionTable.$converterincorrectAnswers;
      map['incorrect_answers'] =
          Variable<String>(converter.toSql(incorrectAnswers));
    }
    return map;
  }

  QuestionCompanion toCompanion(bool nullToAbsent) {
    return QuestionCompanion(
      id: Value(id),
      courseNumber: Value(courseNumber),
      subjectId: Value(subjectId),
      chapterId: Value(chapterId),
      themeId: Value(themeId),
      difficultly: Value(difficultly),
      questionContext: Value(questionContext),
      rightAnswer: Value(rightAnswer),
      incorrectAnswers: Value(incorrectAnswers),
    );
  }

  factory QuestionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionData(
      id: serializer.fromJson<int>(json['id']),
      courseNumber: serializer.fromJson<int>(json['courseNumber']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      themeId: serializer.fromJson<int>(json['themeId']),
      difficultly: serializer.fromJson<String>(json['difficultly']),
      questionContext: serializer.fromJson<String>(json['questionContext']),
      rightAnswer: serializer.fromJson<String>(json['rightAnswer']),
      incorrectAnswers:
          serializer.fromJson<List<String>>(json['incorrectAnswers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseNumber': serializer.toJson<int>(courseNumber),
      'subjectId': serializer.toJson<int>(subjectId),
      'chapterId': serializer.toJson<int>(chapterId),
      'themeId': serializer.toJson<int>(themeId),
      'difficultly': serializer.toJson<String>(difficultly),
      'questionContext': serializer.toJson<String>(questionContext),
      'rightAnswer': serializer.toJson<String>(rightAnswer),
      'incorrectAnswers': serializer.toJson<List<String>>(incorrectAnswers),
    };
  }

  QuestionData copyWith(
          {int? id,
          int? courseNumber,
          int? subjectId,
          int? chapterId,
          int? themeId,
          String? difficultly,
          String? questionContext,
          String? rightAnswer,
          List<String>? incorrectAnswers}) =>
      QuestionData(
        id: id ?? this.id,
        courseNumber: courseNumber ?? this.courseNumber,
        subjectId: subjectId ?? this.subjectId,
        chapterId: chapterId ?? this.chapterId,
        themeId: themeId ?? this.themeId,
        difficultly: difficultly ?? this.difficultly,
        questionContext: questionContext ?? this.questionContext,
        rightAnswer: rightAnswer ?? this.rightAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionData(')
          ..write('id: $id, ')
          ..write('courseNumber: $courseNumber, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('themeId: $themeId, ')
          ..write('difficultly: $difficultly, ')
          ..write('questionContext: $questionContext, ')
          ..write('rightAnswer: $rightAnswer, ')
          ..write('incorrectAnswers: $incorrectAnswers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, courseNumber, subjectId, chapterId,
      themeId, difficultly, questionContext, rightAnswer, incorrectAnswers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionData &&
          other.id == this.id &&
          other.courseNumber == this.courseNumber &&
          other.subjectId == this.subjectId &&
          other.chapterId == this.chapterId &&
          other.themeId == this.themeId &&
          other.difficultly == this.difficultly &&
          other.questionContext == this.questionContext &&
          other.rightAnswer == this.rightAnswer &&
          other.incorrectAnswers == this.incorrectAnswers);
}

class QuestionCompanion extends UpdateCompanion<QuestionData> {
  final Value<int> id;
  final Value<int> courseNumber;
  final Value<int> subjectId;
  final Value<int> chapterId;
  final Value<int> themeId;
  final Value<String> difficultly;
  final Value<String> questionContext;
  final Value<String> rightAnswer;
  final Value<List<String>> incorrectAnswers;
  const QuestionCompanion({
    this.id = const Value.absent(),
    this.courseNumber = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.themeId = const Value.absent(),
    this.difficultly = const Value.absent(),
    this.questionContext = const Value.absent(),
    this.rightAnswer = const Value.absent(),
    this.incorrectAnswers = const Value.absent(),
  });
  QuestionCompanion.insert({
    this.id = const Value.absent(),
    required int courseNumber,
    required int subjectId,
    required int chapterId,
    required int themeId,
    required String difficultly,
    required String questionContext,
    required String rightAnswer,
    required List<String> incorrectAnswers,
  })  : courseNumber = Value(courseNumber),
        subjectId = Value(subjectId),
        chapterId = Value(chapterId),
        themeId = Value(themeId),
        difficultly = Value(difficultly),
        questionContext = Value(questionContext),
        rightAnswer = Value(rightAnswer),
        incorrectAnswers = Value(incorrectAnswers);
  static Insertable<QuestionData> custom({
    Expression<int>? id,
    Expression<int>? courseNumber,
    Expression<int>? subjectId,
    Expression<int>? chapterId,
    Expression<int>? themeId,
    Expression<String>? difficultly,
    Expression<String>? questionContext,
    Expression<String>? rightAnswer,
    Expression<String>? incorrectAnswers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseNumber != null) 'course_number': courseNumber,
      if (subjectId != null) 'course_id': subjectId,
      if (chapterId != null) 'chapter_id': chapterId,
      if (themeId != null) 'theme_id': themeId,
      if (difficultly != null) 'difficultly': difficultly,
      if (questionContext != null) 'question_context': questionContext,
      if (rightAnswer != null) 'right_answer': rightAnswer,
      if (incorrectAnswers != null) 'incorrect_answers': incorrectAnswers,
    });
  }

  QuestionCompanion copyWith(
      {Value<int>? id,
      Value<int>? courseNumber,
      Value<int>? subjectId,
      Value<int>? chapterId,
      Value<int>? themeId,
      Value<String>? difficultly,
      Value<String>? questionContext,
      Value<String>? rightAnswer,
      Value<List<String>>? incorrectAnswers}) {
    return QuestionCompanion(
      id: id ?? this.id,
      courseNumber: courseNumber ?? this.courseNumber,
      subjectId: subjectId ?? this.subjectId,
      chapterId: chapterId ?? this.chapterId,
      themeId: themeId ?? this.themeId,
      difficultly: difficultly ?? this.difficultly,
      questionContext: questionContext ?? this.questionContext,
      rightAnswer: rightAnswer ?? this.rightAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseNumber.present) {
      map['course_number'] = Variable<int>(courseNumber.value);
    }
    if (subjectId.present) {
      map['course_id'] = Variable<int>(subjectId.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (themeId.present) {
      map['theme_id'] = Variable<int>(themeId.value);
    }
    if (difficultly.present) {
      map['difficultly'] = Variable<String>(difficultly.value);
    }
    if (questionContext.present) {
      map['question_context'] = Variable<String>(questionContext.value);
    }
    if (rightAnswer.present) {
      map['right_answer'] = Variable<String>(rightAnswer.value);
    }
    if (incorrectAnswers.present) {
      final converter = $QuestionTable.$converterincorrectAnswers;

      map['incorrect_answers'] =
          Variable<String>(converter.toSql(incorrectAnswers.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionCompanion(')
          ..write('id: $id, ')
          ..write('courseNumber: $courseNumber, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('themeId: $themeId, ')
          ..write('difficultly: $difficultly, ')
          ..write('questionContext: $questionContext, ')
          ..write('rightAnswer: $rightAnswer, ')
          ..write('incorrectAnswers: $incorrectAnswers')
          ..write(')'))
        .toString();
  }
}

class $TrainersTable extends Trainers with TableInfo<$TrainersTable, Trainer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionsMeta =
      const VerificationMeta('questions');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> questions =
      GeneratedColumn<String>('questions_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TrainersTable.$converterquestions);
  @override
  List<GeneratedColumn> get $columns => [id, name, color, image, questions];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainers';
  @override
  VerificationContext validateIntegrity(Insertable<Trainer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('image_link')) {
      context.handle(_imageMeta,
          image.isAcceptableOrUnknown(data['image_link']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    context.handle(_questionsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trainer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trainer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_link'])!,
      questions: $TrainersTable.$converterquestions.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}questions_ids'])!),
    );
  }

  @override
  $TrainersTable createAlias(String alias) {
    return $TrainersTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterquestions =
      StringListTypeConverter();
}

class Trainer extends DataClass implements Insertable<Trainer> {
  final int id;
  final String name;
  final String color;
  final String image;
  final List<String> questions;
  const Trainer(
      {required this.id,
      required this.name,
      required this.color,
      required this.image,
      required this.questions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['image_link'] = Variable<String>(image);
    {
      final converter = $TrainersTable.$converterquestions;
      map['questions_ids'] = Variable<String>(converter.toSql(questions));
    }
    return map;
  }

  TrainersCompanion toCompanion(bool nullToAbsent) {
    return TrainersCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      image: Value(image),
      questions: Value(questions),
    );
  }

  factory Trainer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trainer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      image: serializer.fromJson<String>(json['image']),
      questions: serializer.fromJson<List<String>>(json['questions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'image': serializer.toJson<String>(image),
      'questions': serializer.toJson<List<String>>(questions),
    };
  }

  Trainer copyWith(
          {int? id,
          String? name,
          String? color,
          String? image,
          List<String>? questions}) =>
      Trainer(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        image: image ?? this.image,
        questions: questions ?? this.questions,
      );
  @override
  String toString() {
    return (StringBuffer('Trainer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('image: $image, ')
          ..write('questions: $questions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, image, questions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trainer &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.image == this.image &&
          other.questions == this.questions);
}

class TrainersCompanion extends UpdateCompanion<Trainer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String> image;
  final Value<List<String>> questions;
  const TrainersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.image = const Value.absent(),
    this.questions = const Value.absent(),
  });
  TrainersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    required String image,
    required List<String> questions,
  })  : name = Value(name),
        color = Value(color),
        image = Value(image),
        questions = Value(questions);
  static Insertable<Trainer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? image,
    Expression<String>? questions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (image != null) 'image_link': image,
      if (questions != null) 'questions_ids': questions,
    });
  }

  TrainersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String>? image,
      Value<List<String>>? questions}) {
    return TrainersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      image: image ?? this.image,
      questions: questions ?? this.questions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (image.present) {
      map['image_link'] = Variable<String>(image.value);
    }
    if (questions.present) {
      final converter = $TrainersTable.$converterquestions;

      map['questions_ids'] = Variable<String>(converter.toSql(questions.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('image: $image, ')
          ..write('questions: $questions')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $ChaptersTable chapters = $ChaptersTable(this);
  late final $ThemesTable themes = $ThemesTable(this);
  late final $QuestionTable question = $QuestionTable(this);
  late final $TrainersTable trainers = $TrainersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [subjects, chapters, themes, question, trainers];
}
