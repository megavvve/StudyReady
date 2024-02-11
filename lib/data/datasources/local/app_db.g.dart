// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $SubjectTableTable extends SubjectTable
    with TableInfo<$SubjectTableTable, SubjectTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectTableTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'subject_table';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectTableData> instance,
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
  SubjectTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_name'])!,
    );
  }

  @override
  $SubjectTableTable createAlias(String alias) {
    return $SubjectTableTable(attachedDatabase, alias);
  }
}

class SubjectTableData extends DataClass
    implements Insertable<SubjectTableData> {
  final int id;
  final String name;
  const SubjectTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_name'] = Variable<String>(name);
    return map;
  }

  SubjectTableCompanion toCompanion(bool nullToAbsent) {
    return SubjectTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory SubjectTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectTableData(
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

  SubjectTableData copyWith({int? id, String? name}) => SubjectTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectTableData(')
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
      (other is SubjectTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class SubjectTableCompanion extends UpdateCompanion<SubjectTableData> {
  final Value<int> id;
  final Value<String> name;
  const SubjectTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SubjectTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SubjectTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'subject_name': name,
    });
  }

  SubjectTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SubjectTableCompanion(
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
    return (StringBuffer('SubjectTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ChapterTableTable extends ChapterTable
    with TableInfo<$ChapterTableTable, ChapterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterTableTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.constraintIsAlways('REFERENCES subject_table (id)'));
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
  static const String $name = 'chapter_table';
  @override
  VerificationContext validateIntegrity(Insertable<ChapterTableData> instance,
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
  ChapterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChapterTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjectId'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chapter_name'])!,
    );
  }

  @override
  $ChapterTableTable createAlias(String alias) {
    return $ChapterTableTable(attachedDatabase, alias);
  }
}

class ChapterTableData extends DataClass
    implements Insertable<ChapterTableData> {
  final int id;
  final int subjectId;
  final String name;
  const ChapterTableData(
      {required this.id, required this.subjectId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subjectId'] = Variable<int>(subjectId);
    map['chapter_name'] = Variable<String>(name);
    return map;
  }

  ChapterTableCompanion toCompanion(bool nullToAbsent) {
    return ChapterTableCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      name: Value(name),
    );
  }

  factory ChapterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChapterTableData(
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

  ChapterTableData copyWith({int? id, int? subjectId, String? name}) =>
      ChapterTableData(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ChapterTableData(')
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
      (other is ChapterTableData &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.name == this.name);
}

class ChapterTableCompanion extends UpdateCompanion<ChapterTableData> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<String> name;
  const ChapterTableCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ChapterTableCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required String name,
  })  : subjectId = Value(subjectId),
        name = Value(name);
  static Insertable<ChapterTableData> custom({
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

  ChapterTableCompanion copyWith(
      {Value<int>? id, Value<int>? subjectId, Value<String>? name}) {
    return ChapterTableCompanion(
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
    return (StringBuffer('ChapterTableCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ThemeTableTable extends ThemeTable
    with TableInfo<$ThemeTableTable, ThemeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemeTableTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.constraintIsAlways('REFERENCES subject_table (id)'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapterId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chapter_table (id)'));
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
  static const String $name = 'theme_table';
  @override
  VerificationContext validateIntegrity(Insertable<ThemeTableData> instance,
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
  ThemeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThemeTableData(
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
  $ThemeTableTable createAlias(String alias) {
    return $ThemeTableTable(attachedDatabase, alias);
  }
}

class ThemeTableData extends DataClass implements Insertable<ThemeTableData> {
  final int id;
  final int subjectId;
  final int chapterId;
  final String name;
  const ThemeTableData(
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

  ThemeTableCompanion toCompanion(bool nullToAbsent) {
    return ThemeTableCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      chapterId: Value(chapterId),
      name: Value(name),
    );
  }

  factory ThemeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThemeTableData(
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

  ThemeTableData copyWith(
          {int? id, int? subjectId, int? chapterId, String? name}) =>
      ThemeTableData(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        chapterId: chapterId ?? this.chapterId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ThemeTableData(')
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
      (other is ThemeTableData &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.chapterId == this.chapterId &&
          other.name == this.name);
}

class ThemeTableCompanion extends UpdateCompanion<ThemeTableData> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<int> chapterId;
  final Value<String> name;
  const ThemeTableCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ThemeTableCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required int chapterId,
    required String name,
  })  : subjectId = Value(subjectId),
        chapterId = Value(chapterId),
        name = Value(name);
  static Insertable<ThemeTableData> custom({
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

  ThemeTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? subjectId,
      Value<int>? chapterId,
      Value<String>? name}) {
    return ThemeTableCompanion(
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
    return (StringBuffer('ThemeTableCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $QuestionTableTable extends QuestionTable
    with TableInfo<$QuestionTableTable, QuestionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionTableTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.constraintIsAlways('REFERENCES subject_table (id)'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chapter_table (id)'));
  static const VerificationMeta _themeIdMeta =
      const VerificationMeta('themeId');
  @override
  late final GeneratedColumn<int> themeId = GeneratedColumn<int>(
      'theme_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES theme_table (id)'));
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
              $QuestionTableTable.$converterincorrectAnswers);
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
  static const String $name = 'question_table';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionTableData> instance,
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
  QuestionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionTableData(
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
      incorrectAnswers: $QuestionTableTable.$converterincorrectAnswers.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}incorrect_answers'])!),
    );
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterincorrectAnswers =
      StringListTypeConverter();
}

class QuestionTableData extends DataClass
    implements Insertable<QuestionTableData> {
  final int id;
  final int courseNumber;
  final int subjectId;
  final int chapterId;
  final int themeId;
  final String difficultly;
  final String questionContext;
  final String rightAnswer;
  final List<String> incorrectAnswers;
  const QuestionTableData(
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
      map['incorrect_answers'] = Variable<String>($QuestionTableTable
          .$converterincorrectAnswers
          .toSql(incorrectAnswers));
    }
    return map;
  }

  QuestionTableCompanion toCompanion(bool nullToAbsent) {
    return QuestionTableCompanion(
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

  factory QuestionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionTableData(
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

  QuestionTableData copyWith(
          {int? id,
          int? courseNumber,
          int? subjectId,
          int? chapterId,
          int? themeId,
          String? difficultly,
          String? questionContext,
          String? rightAnswer,
          List<String>? incorrectAnswers}) =>
      QuestionTableData(
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
    return (StringBuffer('QuestionTableData(')
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
      (other is QuestionTableData &&
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

class QuestionTableCompanion extends UpdateCompanion<QuestionTableData> {
  final Value<int> id;
  final Value<int> courseNumber;
  final Value<int> subjectId;
  final Value<int> chapterId;
  final Value<int> themeId;
  final Value<String> difficultly;
  final Value<String> questionContext;
  final Value<String> rightAnswer;
  final Value<List<String>> incorrectAnswers;
  const QuestionTableCompanion({
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
  QuestionTableCompanion.insert({
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
  static Insertable<QuestionTableData> custom({
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

  QuestionTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? courseNumber,
      Value<int>? subjectId,
      Value<int>? chapterId,
      Value<int>? themeId,
      Value<String>? difficultly,
      Value<String>? questionContext,
      Value<String>? rightAnswer,
      Value<List<String>>? incorrectAnswers}) {
    return QuestionTableCompanion(
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
      map['incorrect_answers'] = Variable<String>($QuestionTableTable
          .$converterincorrectAnswers
          .toSql(incorrectAnswers.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableCompanion(')
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

class $TrainerTableTable extends TrainerTable
    with TableInfo<$TrainerTableTable, TrainerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainerNameMeta =
      const VerificationMeta('trainerName');
  @override
  late final GeneratedColumn<String> trainerName = GeneratedColumn<String>(
      'trainer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectNameMeta =
      const VerificationMeta('subjectName');
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
      'subject_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image_link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _questionsMeta =
      const VerificationMeta('questions');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> questions =
      GeneratedColumn<String>('questions_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TrainerTableTable.$converterquestions);
  @override
  List<GeneratedColumn> get $columns =>
      [id, trainerName, subjectName, description, color, image, questions];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainer_table';
  @override
  VerificationContext validateIntegrity(Insertable<TrainerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trainer_name')) {
      context.handle(
          _trainerNameMeta,
          trainerName.isAcceptableOrUnknown(
              data['trainer_name']!, _trainerNameMeta));
    } else if (isInserting) {
      context.missing(_trainerNameMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
          _subjectNameMeta,
          subjectName.isAcceptableOrUnknown(
              data['subject_name']!, _subjectNameMeta));
    } else if (isInserting) {
      context.missing(_subjectNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('image_link')) {
      context.handle(_imageMeta,
          image.isAcceptableOrUnknown(data['image_link']!, _imageMeta));
    }
    context.handle(_questionsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trainerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trainer_name'])!,
      subjectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_link']),
      questions: $TrainerTableTable.$converterquestions.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}questions_ids'])!),
    );
  }

  @override
  $TrainerTableTable createAlias(String alias) {
    return $TrainerTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterquestions =
      StringListTypeConverter();
}

class TrainerTableData extends DataClass
    implements Insertable<TrainerTableData> {
  final int id;
  final String trainerName;
  final String subjectName;
  final String description;
  final String? color;
  final String? image;
  final List<String> questions;
  const TrainerTableData(
      {required this.id,
      required this.trainerName,
      required this.subjectName,
      required this.description,
      this.color,
      this.image,
      required this.questions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trainer_name'] = Variable<String>(trainerName);
    map['subject_name'] = Variable<String>(subjectName);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || image != null) {
      map['image_link'] = Variable<String>(image);
    }
    {
      map['questions_ids'] = Variable<String>(
          $TrainerTableTable.$converterquestions.toSql(questions));
    }
    return map;
  }

  TrainerTableCompanion toCompanion(bool nullToAbsent) {
    return TrainerTableCompanion(
      id: Value(id),
      trainerName: Value(trainerName),
      subjectName: Value(subjectName),
      description: Value(description),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      questions: Value(questions),
    );
  }

  factory TrainerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainerTableData(
      id: serializer.fromJson<int>(json['id']),
      trainerName: serializer.fromJson<String>(json['trainerName']),
      subjectName: serializer.fromJson<String>(json['subjectName']),
      description: serializer.fromJson<String>(json['description']),
      color: serializer.fromJson<String?>(json['color']),
      image: serializer.fromJson<String?>(json['image']),
      questions: serializer.fromJson<List<String>>(json['questions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainerName': serializer.toJson<String>(trainerName),
      'subjectName': serializer.toJson<String>(subjectName),
      'description': serializer.toJson<String>(description),
      'color': serializer.toJson<String?>(color),
      'image': serializer.toJson<String?>(image),
      'questions': serializer.toJson<List<String>>(questions),
    };
  }

  TrainerTableData copyWith(
          {int? id,
          String? trainerName,
          String? subjectName,
          String? description,
          Value<String?> color = const Value.absent(),
          Value<String?> image = const Value.absent(),
          List<String>? questions}) =>
      TrainerTableData(
        id: id ?? this.id,
        trainerName: trainerName ?? this.trainerName,
        subjectName: subjectName ?? this.subjectName,
        description: description ?? this.description,
        color: color.present ? color.value : this.color,
        image: image.present ? image.value : this.image,
        questions: questions ?? this.questions,
      );
  @override
  String toString() {
    return (StringBuffer('TrainerTableData(')
          ..write('id: $id, ')
          ..write('trainerName: $trainerName, ')
          ..write('subjectName: $subjectName, ')
          ..write('description: $description, ')
          ..write('color: $color, ')
          ..write('image: $image, ')
          ..write('questions: $questions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, trainerName, subjectName, description, color, image, questions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainerTableData &&
          other.id == this.id &&
          other.trainerName == this.trainerName &&
          other.subjectName == this.subjectName &&
          other.description == this.description &&
          other.color == this.color &&
          other.image == this.image &&
          other.questions == this.questions);
}

class TrainerTableCompanion extends UpdateCompanion<TrainerTableData> {
  final Value<int> id;
  final Value<String> trainerName;
  final Value<String> subjectName;
  final Value<String> description;
  final Value<String?> color;
  final Value<String?> image;
  final Value<List<String>> questions;
  const TrainerTableCompanion({
    this.id = const Value.absent(),
    this.trainerName = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.description = const Value.absent(),
    this.color = const Value.absent(),
    this.image = const Value.absent(),
    this.questions = const Value.absent(),
  });
  TrainerTableCompanion.insert({
    this.id = const Value.absent(),
    required String trainerName,
    required String subjectName,
    required String description,
    this.color = const Value.absent(),
    this.image = const Value.absent(),
    required List<String> questions,
  })  : trainerName = Value(trainerName),
        subjectName = Value(subjectName),
        description = Value(description),
        questions = Value(questions);
  static Insertable<TrainerTableData> custom({
    Expression<int>? id,
    Expression<String>? trainerName,
    Expression<String>? subjectName,
    Expression<String>? description,
    Expression<String>? color,
    Expression<String>? image,
    Expression<String>? questions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainerName != null) 'trainer_name': trainerName,
      if (subjectName != null) 'subject_name': subjectName,
      if (description != null) 'description': description,
      if (color != null) 'color': color,
      if (image != null) 'image_link': image,
      if (questions != null) 'questions_ids': questions,
    });
  }

  TrainerTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? trainerName,
      Value<String>? subjectName,
      Value<String>? description,
      Value<String?>? color,
      Value<String?>? image,
      Value<List<String>>? questions}) {
    return TrainerTableCompanion(
      id: id ?? this.id,
      trainerName: trainerName ?? this.trainerName,
      subjectName: subjectName ?? this.subjectName,
      description: description ?? this.description,
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
    if (trainerName.present) {
      map['trainer_name'] = Variable<String>(trainerName.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (image.present) {
      map['image_link'] = Variable<String>(image.value);
    }
    if (questions.present) {
      map['questions_ids'] = Variable<String>(
          $TrainerTableTable.$converterquestions.toSql(questions.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainerTableCompanion(')
          ..write('id: $id, ')
          ..write('trainerName: $trainerName, ')
          ..write('subjectName: $subjectName, ')
          ..write('description: $description, ')
          ..write('color: $color, ')
          ..write('image: $image, ')
          ..write('questions: $questions')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $SubjectTableTable subjectTable = $SubjectTableTable(this);
  late final $ChapterTableTable chapterTable = $ChapterTableTable(this);
  late final $ThemeTableTable themeTable = $ThemeTableTable(this);
  late final $QuestionTableTable questionTable = $QuestionTableTable(this);
  late final $TrainerTableTable trainerTable = $TrainerTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [subjectTable, chapterTable, themeTable, questionTable, trainerTable];
}
