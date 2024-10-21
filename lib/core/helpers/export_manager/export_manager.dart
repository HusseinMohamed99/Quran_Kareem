import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/components/custom_outline.dart';
import 'package:moshaf_app/shared/components/responsive.space.dart';
import 'package:moshaf_app/shared/components/upgrade_wrapper.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/al_basmala_widget.dart';
import 'package:moshaf_app/shared/widget/grid_widget.dart';

import 'package:moshaf_app/shared/cubit/cubit/internet_bloc.dart';
import 'package:moshaf_app/shared/enum/enum.dart';

part './../../../screens/Home/home_page.dart';
part './../../../screens/HomeScreen/home_screen.dart';
part './../../../screens/OnboardingScreen/onboarding_screen.dart';
