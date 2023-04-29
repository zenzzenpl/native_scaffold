![flutter-native-scaffold-intro](https://user-images.githubusercontent.com/102783954/235310805-89819d0c-617f-41f8-8795-681cd98faa41.png)

## How to get started❓ 🤔

You can simply add the dependency from **cli** like:
`flutter pub add native_scaffold`

**Or** you can add it in your **pubspec.yaml** like:

```yaml
dependencies:
  native_scaffold:
```

### What is different?

| Title                                                        | Scaffold | CustomScaffold |
| ------------------------------------------------------------ | -------- | -------------- |
| Gives you basic AppBar and Scaffold functionalities          | ✅       | ✅             |
| Easy to use and setup                                        | 👎🏻       | ✅             |
| Works differently for a better experiance in Android and iOS | 👎🏻       | ✅             |
| Easy to add sliver scroll animation                          | 👎🏻       | ✅             |
| Allows you to add a bottom floating bar                      | 👎🏻       | ✅             |
| Can easily use `onRefresh` function                          | 👎🏻       | ✅             |

## How to use❓ 🤔

Using it is as **easy as** create a **Container**, Don't beleave? Let me show you:

```dart
NativeScaffold(
	title: "This is easy",
	child: ...,
);
```

## Additional Params (Optional)

- `title`: The title for the app bar or navigation bar.

- `action`: An action widget displayed at the end of the app bar or navigation bar.

- `leading`: A leading widget displayed at the start of the app bar or navigation bar.

- `child`: The main content of the scaffold.

- `showLoargeTitleInIOS`: Whether to show a large title on iOS. This shall only be used on iOS.

- `sliverAppBarPinned`: Whether to pin the SliverAppBar in place when scrolling. This shall only be used on Android.

- `onRefresh`: A function to be called when the refresh gesture is triggered.

- `sliverAppBarWidget`: A custom SliverAppBar widget. This shall only be used on Android.

- `appBarCenterWidget`: A widget to be displayed in the center of the app bar.

- `sliverAppBarWidgetHeight`: The height of the custom SliverAppBar widget.

- `bottomFloatingBar`: A widget to be used as the bottom navigation bar.

- `backgroundColor`: The background color of the scaffold.

- `appBarEnabled`: Whether the app bar should be enabled.

**This is what Zenzzen Team made for you specially 😊, Now it's your responsibility to make ground-breaking app that rocks 🤘🏻**

# Some Apps Made Using This 😎

![other-apps-using-custom-scaffold](https://user-images.githubusercontent.com/102783954/235311050-3ee430e3-88dd-4b0d-900a-cb97f37692f4.png)
