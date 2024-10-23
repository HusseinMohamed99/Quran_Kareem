part of './../../../core/helpers/export_manager/export_manager.dart';

class RiwayatWidget extends StatelessWidget {
  const RiwayatWidget(
      {super.key, required this.riwayatModel, required this.index});
  final RiwayatModel riwayatModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIconMuslim),
              Text(
                riwayatModel.riwayat![index].id.toString(),
                style: buildTextStyle(context: context, fontSize: 12),
              ),
            ],
          ),
          Expanded(
            child: Text(
              riwayatModel.riwayat![index].name!,
              textAlign: TextAlign.center,
              style: buildTextStyle(context: context, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
