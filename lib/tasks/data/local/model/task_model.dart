class TaskModel {
  String id;
  String title;
  String description;
  DateTime? makeDateTime;
  // DateTime? startDateTime;
  // DateTime? stopDateTime;
  bool completed;
  // TODO (재현) : transcribedTexts nullable 해도 되는지?
  String transcribedTexts; // 변환된 텍스트 목록을 저장하는 리스트 추가
  List<String>? splitTranscribedTextsByContext;
  List<String>? summaryTexts; // 요약된 텍스트 리스트
  List<String>? quizTexts;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.makeDateTime,
    // required this.startDateTime,
    // required this.stopDateTime,
    this.completed = false,
    this.transcribedTexts = '', // 기본값으로 빈 값
    this.splitTranscribedTextsByContext,
    this.summaryTexts, // 기본값 null으로 설정
    this.quizTexts,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
      'makeDateTime': makeDateTime?.toIso8601String(),
      // 'startDateTime': startDateTime?.toIso8601String(),
      // 'stopDateTime': stopDateTime?.toIso8601String(),
      'transcribedTexts': transcribedTexts, // 리스트를 JSON 배열로 변환
      'splitTranscribedTextsByContext': splitTranscribedTextsByContext,
      'summaryTexts': summaryTexts,
      'quizTexts': quizTexts
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'],
      makeDateTime: DateTime.parse(json['makeDateTime']),
      // startDateTime: DateTime.parse(json['startDateTime']),
      // stopDateTime: DateTime.parse(json['stopDateTime']),
      transcribedTexts: json['transcribedTexts'] ?? '', // JSON에서 문자열로 변환
      summaryTexts: json['summaryTexts'] != null
          ? List<String>.from(json['summaryTexts'])
          : [],
      quizTexts: json['quizTexts'] != null
          ? List<String>.from(json['quizTexts'])
          : [],
      splitTranscribedTextsByContext: json['splitTranscribedTextsByContext'] != null
          ? List<String>.from(json['splitTranscribedTextsByContext'])
          : [],
    );

  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, description: $description, '
        'makeDateTime: $makeDateTime,'
    // 'startDateTime: $startDateTime, stopDateTime: $stopDateTime, '
        'completed: $completed,'
        'transcribedTexts: $transcribedTexts'
        'splitTranscribedTextsByContext: $splitTranscribedTextsByContext'
        'summaryTexts: $summaryTexts'
        'quizTexts: $quizTexts'
        '}';
  }
}