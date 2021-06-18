import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jizt/l10n/l10n.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt/summary/summary.dart';
import 'package:jizt/theme.dart';
import 'package:jizt/widgets/date_label.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HomeHeader(),
        _InputTypeSelector(),
        _NewTextSummaryCard(),
        BlocProvider(
          create: (context) => SummariesCubit(
            context.read<JiztRepository>(),
          )..loadSummaries(),
          child: _SummariesList(),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homePageTitle,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Color(0xFF050081)),
          ),
          Text(
            l10n.homePageSubtitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class _InputTypeSelector extends StatelessWidget {
  const _InputTypeSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _InputTypeSelectorChip(
            label: Text(
              l10n.homePageInputTypeText,
              style: TextStyle(color: Colors.white),
            ),
            avatar: Icon(
              Icons.edit,
              size: 18,
              color: Colors.white,
            ),
            selected: true,
            onSelected: (bool selected) {},
          ),
          SizedBox(width: 8),
          _InputTypeSelectorChip(
            label: Text(l10n.homePageInputTypeDocument),
            avatar: Icon(
              Icons.text_snippet_outlined,
              size: 18,
              color: appPalette['secondaryIconColor'],
            ),
            onSelected: (bool selected) {
              Fluttertoast.showToast(msg: l10n.homePageInputTypeComingSoon);
            },
          ),
          SizedBox(width: 8),
          _InputTypeSelectorChip(
            label: Text(l10n.homePageInputTypeCamera),
            avatar: Icon(
              Icons.camera_alt_outlined,
              size: 18,
              color: appPalette['secondaryIconColor'],
            ),
            onSelected: (bool selected) {
              Fluttertoast.showToast(msg: l10n.homePageInputTypeComingSoon);
            },
          ),
        ],
      ),
    );
  }
}

class _InputTypeSelectorChip extends StatelessWidget {
  const _InputTypeSelectorChip(
      {Key? key,
      required this.label,
      required this.avatar,
      this.selected = false,
      required this.onSelected})
      : super(key: key);

  final Text label;
  final Widget avatar;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: label,
        padding: EdgeInsets.only(left: 4, right: 12),
        labelPadding: EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        avatar: avatar,
        selected: selected,
        backgroundColor: Colors.transparent,
        selectedColor: appPalette['primaryColor'],
        onSelected: (bool selected) {
          onSelected(selected);
        },
      ),
    );
  }
}

class _NewTextSummaryCard extends StatelessWidget {
  const _NewTextSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Hero(
          tag: 'card',
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push<void>(
                NewTextSummaryPage.route(),
              );
            },
            child: Card(
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    l10n.homePageNewTextSummaryCardHint,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SummariesList extends StatelessWidget {
  const _SummariesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        _SummariesListHeader(),
        SizedBox(
          height: 146,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.only(bottom: 16),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.7, 1.0],
                  colors: <Color>[
                    Colors.transparent,
                    Colors.transparent,
                    appPalette['primaryColor']!
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: BlocBuilder<SummariesCubit, SummariesState>(
                builder: (context, state) {
                  if (state is SummariesLoadInProgressState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SummariesLoadSuccessState &&
                      state.summaries.isNotEmpty) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16),
                      itemCount: state.summaries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final summary = state.summaries[index];
                        return _SummariesListItem(summary: summary);
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        l10n.homePageSummariesListEmpty,
                        style: TextStyle(
                          color: appPalette['secondaryTextColor'],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummariesListHeader extends StatelessWidget {
  const _SummariesListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            l10n.homePageSummariesListTitle,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          TextButton(
              child: Text(l10n.homePageSummariesListBtnSeeAll,
                  style: TextStyle(
                    fontSize: 12,
                    color: appPalette['secondaryTextColor'],
                  )),
              onPressed: () {
                Navigator.of(context).push<void>(
                  SummariesPage.route(),
                );
              })
        ],
      ),
    );
  }
}

class _SummariesListItem extends StatelessWidget {
  const _SummariesListItem({
    Key? key,
    required this.summary,
  }) : super(key: key);

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push<void>(
          SummaryPage.route(summary.id),
        ),
        child: Card(
          color: appPalette['primaryColor'],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 130,
              width: 100,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: DateLabel(date: summary.startedAt),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${summary.output}',
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
