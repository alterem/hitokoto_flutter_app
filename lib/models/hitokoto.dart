class Hitokoto {
  final int id;
  final String uuid;
  final String hitokoto;
  final String type;
  final String from;
  final String fromWho;
  final String creator;
  final int creatorUid;
  final int reviewer;
  final String commitFrom;
  final String createdAt;
  final int length;

  Hitokoto({
    required this.id,
    required this.uuid,
    required this.hitokoto,
    required this.type,
    required this.from,
    required this.fromWho,
    required this.creator,
    required this.creatorUid,
    required this.reviewer,
    required this.commitFrom,
    required this.createdAt,
    required this.length,
  });

  factory Hitokoto.fromJson(Map<String, dynamic> json) {
    return Hitokoto(
      id: json['id'],
      uuid: json['uuid'],
      hitokoto: json['hitokoto'],
      type: json['type'],
      from: json['from'],
      fromWho: json['from_who'] ?? '',
      creator: json['creator'],
      creatorUid: json['creator_uid'],
      reviewer: json['reviewer'],
      commitFrom: json['commit_from'],
      createdAt: json['created_at'],
      length: json['length'],
    );
  }
}