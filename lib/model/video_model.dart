class VideosModel {
  VideosModel({
    required this.videos,
  });

  final List<VideosModelVideo>? videos;

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return VideosModel(
      videos: json["videos"] == null
          ? []
          : List<VideosModelVideo>.from(
              json["videos"]!.map((x) => VideosModelVideo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "videos": videos!.map((x) => x.toJson()).toList(),
      };
}

class VideosModelVideo {
  VideosModelVideo({
    required this.id,
    required this.reciterName,
    required this.videos,
  });

  final int? id;
  final String? reciterName;
  final List<VideoVideo> videos;

  factory VideosModelVideo.fromJson(Map<String, dynamic> json) {
    return VideosModelVideo(
      id: json["id"],
      reciterName: json["reciter_name"],
      videos: json["videos"] == null
          ? []
          : List<VideoVideo>.from(
              json["videos"]!.map((x) => VideoVideo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "reciter_name": reciterName,
        "videos": videos.map((x) => x.toJson()).toList(),
      };
}

class VideoVideo {
  VideoVideo({
    required this.id,
    required this.videoType,
    required this.videoUrl,
    required this.videoThumbUrl,
  });

  final int? id;
  final int? videoType;
  final String? videoUrl;
  final String? videoThumbUrl;

  factory VideoVideo.fromJson(Map<String, dynamic> json) {
    return VideoVideo(
      id: json["id"],
      videoType: json["video_type"],
      videoUrl: json["video_url"],
      videoThumbUrl: json["video_thumb_url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_type": videoType,
        "video_url": videoUrl,
        "video_thumb_url": videoThumbUrl,
      };
}
