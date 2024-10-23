part of './../../../core/helpers/export_manager/export_manager.dart';

class RecitersDetailsWidget extends StatelessWidget {
  const RecitersDetailsWidget({
    super.key,
    required this.recitersModel,
    required this.index,
    required this.number,
  });
  final RecitersModel recitersModel;
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Assets.imagesIconMuslim,
                width: 24.w,
                height: 24.h,
              ),
              Text(
                recitersModel.reciters![number].moshaf![index].id.toString(),
                style: buildTextStyle(context: context, fontSize: 12),
              ),
            ],
          ),
          Expanded(
            child: Text(
              recitersModel.reciters![number].moshaf![index].name!,
              textAlign: TextAlign.center,
              style: buildTextStyle(context: context, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
