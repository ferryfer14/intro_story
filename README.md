# intro_story

This widget allows you to create a textfield that takes in Textfield values and display the values as tags. The tags can also be customized to your own preference. The widget also takes in a controller that can also be customized by extending it into your own custom controller and inheriting its functionalities.  

## Environment

`sdk: ">=2.12.0 <3.0.0"`

`flutter: ">=1.17.0"`

## Installation

```yaml 
  dependencies:
    intro_story:
        git:
            url: https://github.com/ferryfer14/intro_story.git
            ref: master # branch name
```

`$ flutter pub get`

## Getting Started

``` dart
    List<Widget> imagesWidget = [
        SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.asset('${vAssetJpg}artwork_walkthrough1.jpg'),
        ),
        SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.asset('${vAssetJpg}artwork_walkthrough2.jpg'),
        ),
        SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.asset('${vAssetJpg}artwork_walkthrough3.jpg'),
        ),
        SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.asset('${vAssetJpg}artwork_walkthrough4.jpg'),
        )
    ];
    List<String> titleWidget = [
        AppLocalizations.of(context)!.title1,
        AppLocalizations.of(context)!.title2,
        AppLocalizations.of(context)!.title3,
        AppLocalizations.of(context)!.title4
    ];
    List<String> subtitleWidget = [
        AppLocalizations.of(context)!.subtitle1,
        AppLocalizations.of(context)!.subtitle2,
        AppLocalizations.of(context)!.subtitle3,
        AppLocalizations.of(context)!.subtitle4
    ];
    IntroPage(
        imagesWidget: imagesWidget,
        labelButton: AppLocalizations.of(context)!.username,labelButton,
        listSubtitle: subtitleWidget,
        listTitle: titleWidget,
        totalStory: 4,
        duration: 7,
        barColor: primaryColor,
        borderBarColor: Colors.white,
        backgroundColor: Colors.white,
        buttonColor: primaryColor,
        titleStyle : ts14blackBold,
        subtitleStyle : ts12black,
        labelButtonStyle : ts12white
    ),
```
### Visual Samples For Above Examples

Result<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/intro_story/master/assets/record.gif" width=250><br/>

<img src="https://raw.githubusercontent.com/ferryfer14/intro_story/master/assets/result.png" width=250><br/>