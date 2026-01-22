# Currency Converter

A powerful and easy-to-use Flutter plugin for live currency and cryptocurrency conversions.

[![pub package](https://img.shields.io/pub/v/currency_converter.svg)](https://pub.dev/packages/currency_converter)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

*   **Live Conversion:** Convert between fiat currencies using up-to-date exchange rates.
*   **Crypto Support:** Supports major cryptocurrencies.
*   **Local Currency Detection:** Automatically detect the user's local currency based on their device settings.
*   **No API Key Required:** Uses open-source APIs, so you don't need to sign up for any keys.
*   **Flexible Rounding:** Options to round results or keep raw precision.

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  currency_converter: ^3.0.0
```

Or run:

```bash
flutter pub add currency_converter
```

## Usage

### 1. Import the package

```dart
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
```

### 2. Convert Currency

Convert a specific amount from one currency to another:

```dart
// Convert 1 USD to INR
var inrAmount = await CurrencyConverter.convert(
  from: Currency.usd,
  to: Currency.inr,
  amount: 1,
);

print("1 USD = $inrAmount INR");
```

### 3. Get Local Currency

Retrieve the currency associated with the device's locale:

```dart
Currency myCurrency = await CurrencyConverter.getMyCurrency();
print("My local currency is: ${myCurrency.name}");
```

### 4. Advanced Usage

Combine methods to convert from a specific currency to the user's local currency:

```dart
// Get the user's local currency
Currency userCurrency = await CurrencyConverter.getMyCurrency();

// Convert 100 USD to the user's currency
var convertedAmount = await CurrencyConverter.convert(
  from: Currency.usd,
  to: userCurrency,
  amount: 100,
  withoutRounding: true, // Optional: Disable rounding
);

print("100 USD = $convertedAmount ${userCurrency.name}");
```

## Supported Currencies

The plugin supports a wide range of currencies including:
*   USD (United States Dollar)
*   EUR (Euro)
*   GBP (British Pound)
*   INR (Indian Rupee)
*   JPY (Japanese Yen)
*   ...and many cryptocurrencies like BTC, ETH, etc.

## Additional Information

This package uses the [currency-api](https://github.com/fawazahmed0/currency-api) for fetching exchange rates.

## Issues and Feedback

Please file issues, bugs, or feature requests in our [issue tracker](https://github.com/KishanBusa8/currency_converter/issues).

## Authors

*   [Kishan Busa](https://github.com/KishanBusa8)
