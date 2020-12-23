import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:cinephile_flutter/screens/movies/movies.dart';
import 'package:cinephile_flutter/resources/type-request.dart';

class InputSearchWidget extends StatefulWidget {
  @override
  _InputSearchWidgetState createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  final _controller = TextEditingController();

  // state
  String value = '';

  @override
  void initState() {
    super.initState();

    _controller.addListener(_handleChangeSearch);
  }

  void _handleChangeSearch() {
    setState(() {
      value = _controller.text;
    });
  }

  void _handleClearSearch() {
    _controller.clear();

    setState(() {
      value = '';
    });
  }

  void _handleSubmit() {
    if (value.length > 0) {
      NavigationService().navigateTo(MoviesScreen.route, arguments: {
        'typeRequest': CfTypeRequest.SEARCH,
        'name': value,
      });
    }
  }

  Widget _renderIconClear() {
    if (value.length == 0) {
      return Container();
    }

    return IconButton(
      splashColor: CfColors.TRANSPARENT,
      highlightColor: CfColors.TRANSPARENT,
      icon: Icon(
        Icons.clear,
        color: CfColors.DARK_GRAY,
      ),
      onPressed: () {
        _handleClearSearch();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            controller: _controller,
            style: TextStyle(color: CfColors.DARK_BLUE, fontSize: 18),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CfColors.TRANSPARENT),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CfColors.TRANSPARENT),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: CfColors.DARK_GRAY,
              ),
              contentPadding: EdgeInsets.all(5),
              hintText: CfStrings.SEARCH,
              hintStyle: TextStyle(
                fontSize: 18,
                color: CfColors.DARK_GRAY,
              ),
              filled: true,
              fillColor: CfColors.FREEZE,
            ),
            onSubmitted: (String text) {
              _handleSubmit();
            },
          ),
          _renderIconClear(),
        ],
      ),
    );
  }
}
