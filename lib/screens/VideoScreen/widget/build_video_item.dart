part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildVideoItem extends StatelessWidget {
  const BuildVideoItem({
    super.key,
    required this.controller,
    required this.voidCallback,
  });
  final VideoPlayerController controller;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isPlaying) {
      return GestureDetector(
        onTap: voidCallback,
        child: Center(
          child: controller.value.isInitialized
              ? Container(
                  width: 250.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsManager.kGreenColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: VideoPlayer(controller),
                  ),
                )
              : Container(
                  width: 250.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsManager.kGreenColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: voidCallback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsManager.kGreenColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio * 2 / 1.4,
              child: VideoPlayer(controller),
            ),
          ),
        ),
      );
    }
  }
}
