#import "UIAlertView+Additions.h"
#import <objc/runtime.h>

@implementation UIAlertView (Additions)

static char * keyUIAlertView;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^completion)(UIAlertView *alertView, NSInteger buttonIndex) = objc_getAssociatedObject(self, &keyUIAlertView);

    if (completion)
        completion(alertView, buttonIndex);
}

- (void)showWithStyle:(UIAlertViewStyle)alertViewStyle completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion
{
    self.delegate = self;
    self.alertViewStyle = alertViewStyle;
    objc_setAssociatedObject(self, &keyUIAlertView, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self show];
}

@end
