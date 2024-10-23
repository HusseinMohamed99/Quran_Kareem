part of './../../../core/helpers/export_manager/export_manager.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    super.key,
    required this.mainCubit,
    required this.index,
  });

  final MainCubit mainCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          VideoDetailsScreen(
            number: index,
            mainCubit: mainCubit,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 32, 149, 100),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: ColorsManager.kBlueColor,
          ),
        ),
        child: Text(
          mainCubit.videosModel?.videos?[index].reciterName ?? '',
          textAlign: TextAlign.center,
          style: buildTextStyle(context: context, fontSize: 16),
        ),
      ),
    );
  }
}
