# kib_debug_print

A Flutter package that provides enhanced debug printing capabilities with timestamps, counters, and categorized logging functionality. This package makes debugging more informative and organized by adding timestamps, message counters, and allowing categorization of debug messages using emojis.

## Features

- 🕒 **Timestamped Logging**: Each debug message includes elapsed milliseconds since initialization
- 🔢 **Message Counter**: Sequential numbering of debug messages for easier tracking
- 🎯 **Debug Mode Only**: Logging is automatically disabled in release mode
- 🏷️ **Categorized Logging**: Different log types (normal, warning, error) with distinctive emoji prefixes
- 🔄 **Restorable Configuration**: Ability to restore original debug print settings
- 💡 **Custom Symbols**: Support for custom emoji symbols to categorize different types of logs

## Getting Started

Add this package to your Flutter project by including it in your `pubspec.yaml`:

```yaml
dependencies:
  kib_debug_print: ^1.0.0
```

## Usage

### Basic Setup

Initialize the debug print service in your app's initialization code:

```dart
void main() {
  DebugPrintService.initialize();
  runApp(MyApp());
}
```

### Basic Logging

Use the `kprint` class for different types of logging:

```dart
// Regular log message
kprint.lg('User logged in successfully');  // Output: 📝 User logged in successfully

// Error message
kprint.err('Failed to connect to server');  // Output: ❌ Failed to connect to server

// Warning message
kprint.warn('Low memory warning');  // Output: ⚠️ Low memory warning
```

### Categorized Logging

Use custom symbols to categorize your logs:

```dart
// Network operations
kprint.lg('API request completed', symbol: '🌐');  // Output: 🌐 API request completed

// Database operations
kprint.lg('Data saved to cache', symbol: '💾');  // Output: 💾 Data saved to cache

// Timing information
kprint.lg('Operation completed in 200ms', symbol: '⏱️');  // Output: ⏱️ Operation completed in 200ms
```

### Available Symbols

The package includes several predefined symbols for common use cases:
- 🌐 - Network operations
- 🗑️ - Cache/cleanup operations
- ⏱️ - Timing information
- ✅ - Success messages
- 💾 - Database operations
- 🔔 - Notifications
- 📝 - General notes (default)

### Restoring Original Configuration

If needed, you can restore the original debug print configuration:

```dart
DebugPrintService.restore();
```

## Output Format

When using the enhanced debug print functionality, messages are formatted as follows:

```
#1 [123ms] Your message *
```

Where:
- `#1` is the sequential message counter
- `[123ms]` is the elapsed time since initialization
- `*` is an end marker for better message separation

## Additional Information

### Contributions

Contributions are welcome! If you'd like to contribute to this package:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

### Bug Reports and Feature Requests

If you find a bug or would like to request a new feature, please file an issue on the [GitHub repository](https://github.com/kibmuikia/kib_debug_print/issues).

### License

This project is licensed under the MIT License - see the LICENSE file for details.
