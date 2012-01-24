@interface UIDocument (FPCocoaAdditions)

- (void)deleteFromURL:(NSURL *)url completionHandler:(void (^)(BOOL success))completionHandler;

@end
