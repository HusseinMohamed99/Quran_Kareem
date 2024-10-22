part of './../../../core/helpers/export_manager/export_manager.dart';

class GridItemList extends StatelessWidget {
  const GridItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          _buildGridRow(
            context,
            items: [
              _GridItemData(
                  titleAR: 'القرآن',
                  titleEN: 'Quran',
                  onTap: () {
                    _navigateWithCubit(
                      context,
                      MainCubit()
                        ..getSurahEN()
                        ..getQuran(),
                      const MoshafScreen(),
                    );
                  }),
              _GridItemData(
                titleAR: 'راديو',
                titleEN: 'Radio',
                onTap: () {
                  _navigateWithCubit(
                    context,
                    MainCubit()..getRadio(),
                    const RadioScreen(),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _buildGridRow(
            context,
            items: [
              _GridItemData(
                  titleAR: 'روايات',
                  titleEN: 'Rewayat',
                  onTap: () {
                    _navigateWithCubit(
                      context,
                      MainCubit()..getRiwayat(),
                      const RiwayatScreen(),
                    );
                  }),
              _GridItemData(
                  titleAR: 'تفسير',
                  titleEN: 'Tafasir',
                  onTap: () {
                    _navigateWithCubit(
                      context,
                      MainCubit()..getTafasir(),
                      const TafasirScreen(),
                    );
                  }),
            ],
          ),
          SizedBox(height: 10.h),
          _buildGridRow(
            context,
            items: [
              _GridItemData(
                  titleAR: 'القراء',
                  titleEN: 'Reciters',
                  onTap: () {
                    _navigateWithCubit(
                      context,
                      MainCubit()..getReciters(),
                      const RecitersScreen(),
                    );
                  }),
              _GridItemData(
                  titleAR: 'فيديوهات',
                  titleEN: 'Videos',
                  onTap: () {
                    _navigateWithCubit(
                      context,
                      MainCubit()..getVideo(),
                      const VideoScreen(),
                    );
                  }),
            ],
          ),
          // SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildGridRow(BuildContext context,
      {required List<_GridItemData> items}) {
    return Row(
      children: items
          .map((item) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 6.w,
                    left: 6.w,
                  ),
                  child: BuildGridItem(
                    titleAR: item.titleAR,
                    titleEN: item.titleEN,
                    function: item.onTap,
                  ),
                ),
              ))
          .toList(),
    );
  }

  void _navigateWithCubit(
      BuildContext context, MainCubit cubit, Widget screen) {
    navigateTo(
      context,
      BlocProvider(create: (context) => cubit, child: screen),
    );
  }
}

class _GridItemData {
  final String titleAR;
  final String titleEN;
  final VoidCallback onTap;

  _GridItemData(
      {required this.titleAR, required this.titleEN, required this.onTap});
}
