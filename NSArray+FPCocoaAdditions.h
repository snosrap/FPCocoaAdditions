// http://www.metastatic.org/text/Concern/2010/12/20/map-reduce-and-filter-in-cocoa/

typedef id (^MapBlock)(id);
typedef id (^ReduceBlock)(id, id);
typedef BOOL (^FilterBlock)(id);

@interface NSArray (FPCocoaAdditions)

- (NSArray *)arrayByMappingWithBlock:(MapBlock)block;
- (id)valueByReducingWithBlock:(ReduceBlock)block;
- (NSArray *)arrayByFilteringWithBlock:(FilterBlock)block;

@end
