# Changelog

All notable changes to the `kib_debug_print` package will be documented in this file.

## 1.0.0

Initial release of kib_debug_print with the following features:

* Added `DebugPrintService` class for managing debug print functionality
    * `initialize()` method to set up enhanced debug printing
    * `restore()` method to revert to original debug print behavior

* Added `kprint` utility class with specialized logging methods:
    * `lg()` - General logging with customizable emoji symbols
    * `err()` - Error logging with ❌ prefix
    * `warn()` - Warning logging with ⚠️ prefix

* Enhanced debug print features:
    * Message counter (#1, #2, etc.)
    * Timestamp tracking in milliseconds
    * Debug mode awareness (only prints in debug mode)
    * Original debug print function preservation