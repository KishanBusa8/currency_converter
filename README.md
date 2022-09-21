<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

DESCRIPTION: A Simple Flutter plugin for converting currencies and crypto currencies live!

## Features

1. Convert currencies from one to another by live rates.
2. Convert crypto currencies too.

## Getting started

*Install Package to your pubspec.yaml file*

```
currency_converter: ^0.0.1;
```

*Import library*

```dart
import 'package:currency_converter/Currency.dart';
import 'package:currency_converter/currency_converter.dart';
```


## Usage

Import package to your file where you want to use it.

```
    var usdConvert = await CurrencyConverter.convert(
    from: Currency.usd, to: Currency.inr, amount: 1);
```

- for more checkout the example file.

## Issues And feedback
- Please file specific issues, bugs, or feature requests in our [issue tracker](https://github.com/KishanBusa8/currency_converter/issues).

## Authors
- [Kishan Busa](https://github.com/KishanBusa8)

## Contributor
- [Kishan Busa](https://github.com/KishanBusa8)
- [Harsh patel](https://github.com/HarshuPatel007)
