#import "UIDocument+FPCocoaAdditions.h"

@implementation UIDocument (FPCocoaAdditions)

- (id)initWithExtension:(NSString *)extension {
    return [self initWithFileURL:[[[[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil] URLByAppendingPathComponent:@"Documents"] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", [[NSProcessInfo processInfo] globallyUniqueString], extension]]];
}

- (void)deleteFromURL:(NSURL *)url completionHandler:(void (^)(BOOL success))completionHandler {
    NSURL *destinationURL = [[NSURL fileURLWithPath:NSTemporaryDirectory()] URLByAppendingPathComponent:[[NSProcessInfo processInfo] globallyUniqueString]];
    dispatch_queue_t q_default;
    q_default = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_default, ^(void) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL success = [fileManager setUbiquitous:NO itemAtURL:url destinationURL:destinationURL error:nil];
        [fileManager removeItemAtURL:destinationURL error:nil];
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^(void) {
            completionHandler(success);
        });
    });
}

- (NSComparisonResult)compare:(UIDocument *)document {
    return [self.localizedName compare:document.localizedName];
}

@end
