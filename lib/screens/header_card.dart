import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final currentDate = Provider<DateTime>((ref) => DateTime.now());

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, _) {
              final date = ref.watch(currentDate);
              final format = DateFormat("EEEE, dd, MMMM").format(date);
              return Text(
                format,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
