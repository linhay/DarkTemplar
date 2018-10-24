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

@implementation Invocation

+ (NSInvocation *)invocationWithMethodSignature:(NSMethodSignature *)sig {
  return [super invocationWithMethodSignature:sig];
}

// https://github.com/JaviSoto/iOS10-Runtime-Headers/tree/master/lib/libswiftCore.dylib
/**
 设置函数参数

 @param argument 参数
 @param typeEncoding 预期参数类型
 @param idx 偏移量
 */
- (void)setArgument:(id)argument expectedTypeEncoding: (NSString *)typeEncoding atIndex:(NSInteger)idx {
  NSString * className = [[NSString alloc] initWithCString:object_getClassName(argument) encoding: NSUTF8StringEncoding];
  id inoutArg;
  if (@encode(double) && [className isEqualToString:@"Swift._SwiftDeferredNSArray"]) {
    CFNumberGetValue((__bridge CFNumberRef)argument[0], kCFNumberDoubleType, &inoutArg);
  }
  [self setArgument:&inoutArg atIndex:idx];
}

@end
