#import "RNSearchBarManager.h"

#import "RNSearchBar.h"

#import "RCTBridge.h"

#import "RCTUIManager.h"

@implementation RNSearchBarManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  RNSearchBar *searchBar = [[RNSearchBar alloc] initWithEventDispatcher:self.bridge.eventDispatcher];

  return searchBar;
}

RCT_EXPORT_METHOD(dismissKeyboard:(nonnull NSNumber*) reactTag)
{

    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary *viewRegistry) {
        RCTAssertMainThread();

        RNSearchBar *searchBar = (RNSearchBar *) [viewRegistry objectForKeyedSubscript:reactTag];
        [searchBar setShowsCancelButton:NO animated:YES];
        [searchBar resignFirstResponder];
    }];

}

RCT_EXPORT_VIEW_PROPERTY(placeholder, NSString)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(showsCancelButton, BOOL)
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor)
RCT_CUSTOM_VIEW_PROPERTY(hideBackground, BOOL, RNSearchBar)
{
    if ([RCTConvert BOOL:json]) {
        view.backgroundImage = [[UIImage alloc] init];
        view.backgroundColor = [UIColor clearColor];
    }
}

- (NSDictionary *)constantsToExport
{
  return @{
           @"ComponentHeight": @([self view].intrinsicContentSize.height),
           };
}

@end
