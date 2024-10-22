part of './../../core/helpers/export_manager/export_manager.dart';

class RecitersDetailsScreen extends StatelessWidget {
  const RecitersDetailsScreen(
      {super.key, required this.number, required this.recitersModel});
  final int number;
  final RecitersModel recitersModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getReciters(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit mainCubit = MainCubit.get(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        Assets.imagesGroup,
                      ),
                    ),
                    Text(
                      'القارئ:  ${recitersModel.reciters?[number].name ?? ''}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ColorsManager.kWhiteColor,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return RecitersDetailsWidget(
                            recitersModel:
                                mainCubit.recitersModel ?? RecitersModel(),
                            index: index,
                            number: number,
                          );
                        },
                        itemCount: mainCubit.recitersModel?.reciters?[number]
                                .moshaf?.length ??
                            0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 60,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
