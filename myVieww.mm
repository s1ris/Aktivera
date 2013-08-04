#include <UIKit/UIKit.h>
#include <CoreGraphics/CoreGraphics.h>
#import "myVieww.h"

@implementation myVieww 
-(id)initWithFrame:(CGRect)frame {
        self = [super initWithFrame:frame];
        return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if ([touch view] == self) {
    CGPoint location = [touch locationInView:self];
    CGRect tempFrame=self.frame;
    tempFrame.size.width = 420;
    tempFrame.size.height = 240;
    tempFrame.origin.x = 20;
    tempFrame.origin.y = 15;
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    self.frame=tempFrame;
    [UIView commitAnimations];
    return;
    }
}
-(void)dealloc {
        [super dealloc];
        [self release];
}
@end
