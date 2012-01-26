@interface UIDocument (FPCocoaAdditions)

- (id)initWithExtension:(NSString *)extension;
- (void)deleteFromURL:(NSURL *)url completionHandler:(void (^)(BOOL success))completionHandler;
- (NSComparisonResult)compare:(UIDocument *)document;

@end
