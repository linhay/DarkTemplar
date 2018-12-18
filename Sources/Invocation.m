// Copyright (c) 2018 linhay <is.linhay@outlook.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "Invocation.h"
#import <objc/runtime.h>

@interface Invocation ()


@end


@implementation Invocation

- (void)getReturnValue:(void *)retLoc {
  [self.instance getReturnValue:retLoc];
}


- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx{
  [self.instance getArgument:argumentLocation atIndex:idx];
}

- (void)invoke{
  [self.instance invoke];
}

- (void)invokeWithTarget:(id)target {
  [self.instance invokeWithTarget:target];
}

- (void)retainArguments{
  [self.instance retainArguments];
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx{
  [self.instance setArgument:argumentLocation atIndex:idx];
}

- (void)setReturnValue:(void *)retLoc{
  [self.instance setReturnValue:retLoc];
}

- (void)setTarget:(id)target {
  self.instance.target = target;
}

- (id)target {
  return self.instance.target;
}

- (void)setSelector:(SEL)selector{
  self.instance.selector = selector;
}

- (SEL)selector{
  return self.instance.selector;
}

+ (Invocation *)invocationWithMethodSignature:(MethodSignature *)sig {
  Invocation * obj = [[Invocation alloc] init];
  obj.instance = [NSInvocation invocationWithMethodSignature:sig.instance];
  return obj;
}

// https://github.com/JaviSoto/iOS10-Runtime-Headers/tree/master/lib/libswiftCore.dylib
- (void)setArgument:(id)argument expectedTypeEncoding: (NSString *)typeEncoding atIndex:(NSInteger)idx {
  id inoutArg = argument;
  if ([@"c" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberCharType, &inoutArg);
  }else if ([@"s" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberShortType, &inoutArg);
  }else if ([@"i" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberIntType, &inoutArg);
  }else if ([@"q" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberLongLongType, &inoutArg);
  }else if ([@"f" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberFloatType, &inoutArg);
  }else if ([@"d" isEqualToString:typeEncoding]) {
    CFNumberGetValue((__bridge CFNumberRef)argument, kCFNumberDoubleType, &inoutArg);
  }
  [self.instance setArgument:&inoutArg atIndex:idx];
}

- (id)getReturnValue {
  NSLog(@"test");
  @autoreleasepool {
    id __autoreleasing obj  = nil;
    [self.instance getReturnValue:&obj];
    return obj;
  }
}

@end
