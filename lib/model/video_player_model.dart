class VideoPlayerModel {
    VideoPlayerModel({
        required this.success,
        required this.video,
    });

    final bool? success;
    final Video? video;

    factory VideoPlayerModel.fromJson(Map<String, dynamic> json){ 
        return VideoPlayerModel(
            success: json["success"],
            video: json["video"] == null ? null : Video.fromJson(json["video"]),
        );
    }

}

class Video {
    Video({
        required this.id,
        required this.title,
        required this.videoId,
        required this.posted,
    });

    final int? id;
    final String? title;
    final String? videoId;
    final String? posted;

    factory Video.fromJson(Map<String, dynamic> json){ 
        return Video(
            id: json["id"],
            title: json["title"],
            videoId: json["videoId"],
            posted: json["posted"],
        );
    }

}
