#import <UIKit/UIKit.h>

@interface UIAlertView (Additions)
- (void)showWithStyle:(UIAlertViewStyle)alertViewStyle completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;
@end
