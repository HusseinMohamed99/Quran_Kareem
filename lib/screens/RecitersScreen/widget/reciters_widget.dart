part of '../../../core/helpers/export_manager/export_manager.dart';

class RecitersWidget extends StatelessWidget {
  const RecitersWidget({
    super.key,
    required this.recitersModel,
    required this.index,
    required this.mainCubit,
  });
  final RecitersModel recitersModel;
  final int index;
  final MainCubit mainCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          RecitersDetailsScreen(
            number: index,
            recitersModel: recitersModel,
            mainCubit: mainCubit,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 32, 149, 100),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: ColorsManager.kBlueColor,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
                    recitersModel.reciters![index].letter ?? '',
                    textAlign: TextAlign.center,
                    style: buildTextStyle(context: context, fontSize: 12),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  recitersModel.reciters![index].name ?? '',
                  textAlign: TextAlign.center,
                  style: buildTextStyle(context: context, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
