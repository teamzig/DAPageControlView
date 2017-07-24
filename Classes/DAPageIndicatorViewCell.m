//
//  FCPageIndicatorView.m
//  FCPageControl
//
//  Created by Daria Kopaliani on 5/27/14.
//  Copyright (c) 2014 FactorialComplexity. All rights reserved.
//

#import "DAPageIndicatorViewCell.h"

NSString *const DAPageIndicatorViewCellIdentifier = @"DAPageIndicatorViewCell";
CGFloat const DAPageIndicatorViewWidth = 7.;
CGFloat const DAPageIndicatorViewHeight = DAPageIndicatorViewWidth;


@interface DAPageIndicatorViewCell()

@property (strong, nonatomic) UIButton *pageIndicatorView;

@end


@implementation DAPageIndicatorViewCell

+ (instancetype)defaultCell
{
    return [[self alloc] initWithFrame:CGRectMake(0., 0., DAPageIndicatorViewWidth, DAPageIndicatorViewHeight)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        UIImage *indicatorImage = [UIImage imageNamed:@"PageIndicator" inBundle:bundle compatibleWithTraitCollection:nil];
        UIImage *currentImage = [UIImage imageNamed:@"ActivePageIndicator" inBundle:bundle compatibleWithTraitCollection:nil];
        
        self.pageIndicatorView = [[UIButton alloc] initWithFrame:CGRectMake(0., 0., DAPageIndicatorViewWidth, DAPageIndicatorViewHeight)];
        self.pageIndicatorView.layer.masksToBounds = YES;
        self.pageIndicatorView.layer.cornerRadius = self.pageIndicatorView.frame.size.width / 2;
        [self.pageIndicatorView setBackgroundImage:indicatorImage forState:UIControlStateNormal];
        [self.pageIndicatorView setBackgroundImage:currentImage forState:UIControlStateSelected];
     
        self.pageIndicatorView.center = CGPointMake(0.5 * CGRectGetWidth(frame), 0.5 * CGRectGetHeight(frame));
        self.pageIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.pageIndicatorView.userInteractionEnabled = NO;
        [self.contentView addSubview:self.pageIndicatorView];
    }
    
    return self;
}

- (void)setNormalColor:(UIColor *)normal andSelectedColor:(UIColor *)selected  {
    UIImage *normalImage = [self imageByDrawingCircleWithColor: normal withSize: self.frame.size];
    UIImage *selectedImage = [self imageByDrawingCircleWithColor: selected withSize: self.frame.size];
    [self.pageIndicatorView setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self.pageIndicatorView setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.pageIndicatorView.transform = CGAffineTransformIdentity;
    self.alpha = 1.;
    [self.layer removeAllAnimations];
}

-(UIImage *)imageByDrawingCircleWithColor:(UIColor *)color withSize:(CGSize)size {
    
    UIImage* img = nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillEllipseInRect(ctx, rect);
    
    CGContextRestoreGState(ctx);
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
