import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_debug_print/kib_debug_print.dart';

void main() {
  group('DebugPrintService Tests', () {
    late DebugPrintCallback originalDebugPrint;

    setUp(() {
      // Store the original debugPrint function
      originalDebugPrint = debugPrint;
    });

    tearDown(() {
      // Restore the original debugPrint function after each test
      debugPrint = originalDebugPrint;
      DebugPrintService.restore();
    });

    test('initialize() modifies debugPrint function', () {
      DebugPrintService.initialize();
      expect(debugPrint, isNot(equals(originalDebugPrint)));
    });

    test('restore() reverts to original debugPrint function', () {
      DebugPrintService.initialize();
      DebugPrintService.restore();
      expect(debugPrint, equals(originalDebugPrint));
    });
  });

  group('kprint Tests', () {
    late List<String> printedMessages;
    late DebugPrintCallback originalDebugPrint;

    setUp(() {
      printedMessages = [];
      originalDebugPrint = debugPrint;
      debugPrint = (String? message, {int? wrapWidth}) {
        if (message != null) {
          printedMessages.add(message);
        }
      };
    });

    tearDown(() {
      debugPrint = originalDebugPrint;
    });

    test('lg() prints message with correct symbol', () {
      kprint.lg('Test message');
      expect(printedMessages.length, equals(1));
      expect(printedMessages.first, equals('📝 Test message'));
    });

    test('lg() with custom symbol prints correctly', () {
      kprint.lg('Network request completed', symbol: '🌐');
      expect(printedMessages.length, equals(1));
      expect(printedMessages.first, equals('🌐 Network request completed'));
    });

    test('err() prints message with error symbol', () {
      kprint.err('Error message');
      expect(printedMessages.length, equals(1));
      expect(printedMessages.first, equals('❌ Error message'));
    });

    test('warn() prints message with warning symbol', () {
      kprint.warn('Warning message');
      expect(printedMessages.length, equals(1));
      expect(printedMessages.first, equals('⚠️ Warning message'));
    });

    test('empty messages are handled correctly', () {
      kprint.lg('');
      kprint.err('');
      kprint.warn('');
      expect(printedMessages.length, equals(3));
    });

    test('multiple messages print in order', () {
      kprint.lg('First');
      kprint.err('Second');
      kprint.warn('Third');

      expect(printedMessages.length, equals(3));
      expect(printedMessages[0], equals('📝 First'));
      expect(printedMessages[1], equals('❌ Second'));
      expect(printedMessages[2], equals('⚠️ Third'));
    });
  });

  group('setupDebugPrint Tests', () {
    late DebugPrintCallback originalDebugPrint;
    late List<String> printedMessages;

    setUp(() {
      printedMessages = [];
      originalDebugPrint = debugPrint;
      debugPrint = (String? message, {int? wrapWidth}) {
        if (message != null) {
          printedMessages.add(message);
        }
      };
    });

    tearDown(() {
      debugPrint = originalDebugPrint;
    });

    test('modified debugPrint adds counter and timestamp', () {
      setupDebugPrint();
      debugPrint('Test message');

      expect(printedMessages.length, equals(1));
      expect(printedMessages.first, matches(r'#1 \[\d+ms\] Test message \*'));
    });

    test('counter increments correctly', () {
      setupDebugPrint();
      debugPrint('First');
      debugPrint('Second');
      debugPrint('Third');

      expect(printedMessages.length, equals(3));
      expect(printedMessages[0], matches(r'#1 \[\d+ms\] First \*'));
      expect(printedMessages[1], matches(r'#2 \[\d+ms\] Second \*'));
      expect(printedMessages[2], matches(r'#3 \[\d+ms\] Third \*'));
    });

    test('empty or null messages are handled correctly', () {
      setupDebugPrint();
      debugPrint('');
      debugPrint(null);
      expect(printedMessages.isEmpty, isTrue);
    });
  });
}
