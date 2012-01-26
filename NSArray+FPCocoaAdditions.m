#import "NSArray+FPCocoaAdditions.h"

@implementation NSArray (FPCocoaAdditions)

- (NSArray *)arrayByMappingWithBlock:(MapBlock)block
{
    NSMutableArray *ret = [NSMutableArray array];
    for(id value in self)
        [ret addObject:block(value)];
    return [NSArray arrayWithArray:ret];
}

- (id)valueByReducingWithBlock:(ReduceBlock)block
{
    id ret = nil;
    for(id value in self)
        ret = block(ret, value);
    return ret;
}

- (NSArray *)arrayByFilteringWithBlock:(FilterBlock)block
{
    NSMutableArray *ret = [NSMutableArray array];
    for(id value in self)
        if(block(value))
            [ret addObject:value];
    return [NSArray arrayWithArray:ret];
}

@end
