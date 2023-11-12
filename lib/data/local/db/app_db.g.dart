// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
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
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _themeIdMeta =
      const VerificationMeta('themeId');
  @override
  late final GeneratedColumn<int> themeId = GeneratedColumn<int>(
      'theme_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $QuestionTable question = $QuestionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [question];
}
