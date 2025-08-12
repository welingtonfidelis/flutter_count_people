import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int total = 0;

  void increment() {
    if (total < 20) {
      setState(() {
        total++;
      });
    }
  }

  void decrement() {
    if (total > 0) {
      setState(() {
        total--;
      });
    }
  }

  bool get isEmpty => total == 0;
  bool get isFull => total == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ice_cream.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                total.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.white,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    'Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(width: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isFull
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.white,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: increment,
                  child: Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
