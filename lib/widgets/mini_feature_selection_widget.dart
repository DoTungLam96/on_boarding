// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:reorderable_grid_view/reorderable_grid_view.dart';

// import '../gen/assets.gen.dart';
// import '../model/mini_feature_model.dart';
// import '../model/mini_feature_type.dart';
// import 'dot_border/dot_border.dart';
// import 'icon_widget/icon_widget.dart';
// import 'mini_feature_subtitle.dart';

// const double HEIGHT_IMAGE_MINI_APP = 48;
// const double WIDTH_IMAGE_MINI_APP = 48;
// const int miniAppOnRow = 4;
// const int numberTabOfNews = 4;

// class MiniFeatureSelection extends StatefulWidget {
//   const MiniFeatureSelection({
//     Key? key,
//     this.isMainSection = false,
//     this.isEditMode = false,
//     this.onTap,
//     required this.listMiniApp,
//     required this.addOrRemoveMiniApp,
//   }) : super(key: key);

//   final Function(MiniFeatureModel)? onTap;
//   final bool isMainSection;
//   final bool isEditMode;
//   final List<MiniFeatureModel> listMiniApp;
//   final AddOrRemoveMiniApp addOrRemoveMiniApp;

//   @override
//   State<MiniFeatureSelection> createState() => _MiniFeatureSelectionState();
// }

// class _MiniFeatureSelectionState extends State<MiniFeatureSelection> {
//   @override
//   Widget build(BuildContext context) {
//     return ReorderableGridView.builder(
//       itemCount: widget.listMiniApp.length,
//       shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       physics: const NeverScrollableScrollPhysics(),
//       dragEnabled: widget.isEditMode && widget.isMainSection,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 0,
//         childAspectRatio: 0.84,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         final miniAppHome = widget.listMiniApp[index];
//         return GestureDetector(
//           key: ValueKey(miniAppHome.type.localKey),
//           onTap: () {
//             widget.onTap?.call(miniAppHome);
//           },
//           child: ColoredBox(
//             color: Colors.white,
//             child: MiniAppWidget(
//               isMainSection: widget.isMainSection,
//               isEditMode: widget.isEditMode,
//               isAdded: miniAppHome.isAdded,
//               miniAppHome: miniAppHome,
//               addOrRemoveMiniApp: (miniAppHome) {
//                 widget.addOrRemoveMiniApp(miniAppHome);
//               },
//             ),
//           ),
//         );
//       },
//       onReorder: (int oldIndex, int newIndex) {
//         print("re-order grid view");
//       },
//     );
//   }
// }

// class MiniAppWidget extends StatelessWidget {
//   final bool isMainSection;
//   final bool isAdded;
//   final bool isEditMode;
//   final MiniFeatureModel miniAppHome;
//   final AddOrRemoveMiniApp addOrRemoveMiniApp;

//   const MiniAppWidget({
//     Key? key,
//     this.isMainSection = false,
//     this.isAdded = false,
//     this.isEditMode = false,
//     required this.miniAppHome,
//     required this.addOrRemoveMiniApp,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.only(left: 8),
//       width: (MediaQuery.of(context).size.width - 16) / 4,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           _buildMainContent(context),
//           const SizedBox(height: 8),
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             alignment: Alignment.center,
//             child: MiniFeatureSubtitle(
//               title: miniAppHome.label,
//               style: Theme.of(context)
//                   .textTheme
//                   .labelSmall!
//                   .copyWith(color: Colors.black45),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainContent(BuildContext context) {
//     return isEditMode && isMainSection && miniAppHome.isPlaceholder
//         ? Container(
//             margin: const EdgeInsets.only(top: 8, right: 16),
//             child: const DotBorder(
//               color: Color.fromRGBO(150, 150, 157, 1),
//               radius: Radius.circular(4),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(4)),
//                 child: SizedBox(
//                   height: 64,
//                   width: 64,
//                 ),
//               ),
//             ),
//           )
//         : _buildIconInMainContent(context);
//   }

//   Widget _buildIconInMainContent(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: 64,
//           width: 64,
//           margin: const EdgeInsets.only(top: 8, right: 16),
//           decoration: BoxDecoration(
//             color: miniAppHome.isPlaceholder
//                 ? Colors.transparent
//                 : const Color.fromRGBO(240, 240, 242, 1),
//             borderRadius: const BorderRadius.all(Radius.circular(4)),
//           ),
//           child: miniAppHome.isPlaceholder
//               ? const SizedBox(
//                   width: WIDTH_IMAGE_MINI_APP, height: HEIGHT_IMAGE_MINI_APP)
//               : IconWidget(
//                   path: miniAppHome.icon,
//                   width: WIDTH_IMAGE_MINI_APP,
//                   height: HEIGHT_IMAGE_MINI_APP,
//                   noTintColor: true),
//         ),
//         _buildIconAddOrRemove(context)
//       ],
//     );
//   }

//   Widget _buildIconAddOrRemove(BuildContext context) {
//     return Positioned(
//       right: 0,
//       child: InkWell(
//         onTap: () {
//           if (isMainSection ||
//               (!isAdded && miniAppHome.type != MiniFeatureType.all)) {
//             addOrRemoveMiniApp(miniAppHome);
//           }
//         },
//         child: Container(
//           height: 16,
//           width: 16,
//           margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//           decoration: BoxDecoration(
//               color: isMainSection
//                   ? Colors.red
//                   : !isAdded
//                       ? Colors.green
//                       : Colors.green.withOpacity(0.3),
//               borderRadius: const BorderRadius.all(Radius.circular(8))),
//           child: isMainSection
//               ? IconWidget.ic24(
//                   path: Assets.images.icMinus.path,
//                   noTintColor: true,
//                 )
//               : IconWidget.ic24(path: Assets.images.icAdd.path),
//         ),
//       ),
//     );
//   }
// }

// typedef AddOrRemoveMiniApp = void Function(
//   MiniFeatureModel miniAppHome,
// );
