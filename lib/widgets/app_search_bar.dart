import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_travel/constants/app_colors.dart';

class AppSearchBar extends StatefulWidget {
  const new({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.blackColor),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      backgroundColor: WidgetStateProperty.all(AppColors.whiteColor),
      leading: SvgPicture.asset('assets/svg/search.svg'),
      hintText: 'Search for a coin',
      hintStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.blackColor),
      ),
      controller: _controller,
      onChanged: (value) {
        // context.read<CryptoBloc>().add(
        //       CryptoEvent.cryptoSearchStringChanged(value),
        //     );
        setState(() {});
      },
      trailing: [
        if (_controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              // context.read<CryptoBloc>().add(
              //       const CryptoEvent.cryptoSearchStringChanged(''),
              //     );
              setState(() {});
            },
          ),
      ],
    );
  }
}
