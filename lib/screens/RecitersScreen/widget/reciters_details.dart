part of '../../../core/helpers/export_manager/export_manager.dart';

class RecitersDetailsScreen extends StatelessWidget {
  const RecitersDetailsScreen(
      {super.key,
      required this.number,
      required this.recitersModel,
      required this.mainCubit});
  final int number;
  final RecitersModel recitersModel;
  final MainCubit mainCubit;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: backgroundImage(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  Assets.imagesGroup,
                ),
              ),
              Text(
                'القارئ :  ${recitersModel.reciters?[number].name ?? ''}',
                textAlign: TextAlign.center,
                style: buildTextStyle(context: context, fontSize: 18),
              ),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return RecitersDetailsWidget(
                      recitersModel: mainCubit.recitersModel ?? RecitersModel(),
                      index: index,
                      number: number,
                    );
                  },
                  itemCount: mainCubit
                          .recitersModel?.reciters?[number].moshaf?.length ??
                      0,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
