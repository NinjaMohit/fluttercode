import 'package:flutter/material.dart';
import 'dart:math';

class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  State<Assignment> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment> {
  int? countPalindrom = 0;
  int? countArmstrong = 0;
  int? countStrong = 0;

  List<int> nums = [121, 20, 222, 452, 212, 454, 587, 4, 12, 153, 145];

  void countPalindromArmstrong() {
    setState(() {
      countPalindrom = 0;
      countArmstrong = 0;
      countStrong = 0;

      for (int i = 0; i < nums.length; i++) {
        int original = nums[i];
        int reverse = 0;
        int number = nums[i];
        int digitCount = 0;
        int tempNumber = nums[i];

        // Count the number of digits in the current number
        while (tempNumber != 0) {
          tempNumber ~/= 10;
          digitCount++;
        }

        // Check for palindrome
        while (number != 0) {
          reverse = reverse * 10 + number % 10;
          number ~/= 10;
        }

        if (reverse == original) {
          countPalindrom = countPalindrom! + 1;
        }

        // Check for Strong number
        number = nums[i];
        int sumans = 0;
        int temp = number;
        while (temp != 0) {
          int rem = temp % 10;
          int fact = 1;
          for (int i = 1; i <= rem; i++) {
            fact *= i;
          }
          sumans += fact;
          temp ~/= 10;
        }
        if (sumans == nums[i]) {
          countStrong = countStrong! + 1;
        }

        // Check for Armstrong number
        number = nums[i];
        int sum = 0;
        while (number != 0) {
          int digit = number % 10;
          sum += pow(digit, digitCount).toInt();
          number ~/= 10;
        }

        if (sum == original) {
          countArmstrong = countArmstrong! + 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check app")),
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result"),
            const SizedBox(
              height: 20,
            ),
            Text("Palindrome Count: $countPalindrom"),
            const SizedBox(
              height: 20,
            ),
            Text("Armstrong Count: $countArmstrong"),
            const SizedBox(
              height: 20,
            ),
            Text("Strong Count: $countStrong"),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: countPalindromArmstrong,
              child: const Text("Check counts"),
            ),
          ],
        ),
      ),
    );
  }
}
