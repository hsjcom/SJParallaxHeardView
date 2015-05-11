//
//  SJParalaxHeardView.m
//  SJParallaxHeardView
//
//  Created by Soldier on 15/5/8.
//  Copyright (c) 2015年 Soldier. All rights reserved.
//

#import "SJParalaxHeardView.h"

@interface SJParalaxHeardView ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, assign) CGPoint prePoint;

@end


@implementation SJParalaxHeardView

- (id)initWithFrame:(CGRect)frame
    backgroundImage:(NSString *)backgroundImage
        logoImage:(NSString *)logoImage
              title:(NSString *)title
           subTitle:(NSString *)subTitle {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, - 0.5 * frame.size.height, frame.size.width, frame.size.height * 1.5)];
        _bgImageView.image = [UIImage imageNamed:backgroundImage];
        [self addSubview:_bgImageView];

        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width * 0.5 - 0.125 * frame.size.height, 0.25 * frame.size.height, 0.25 * frame.size.height, 0.25 * frame.size.height)];
        _logoImageView.image = [UIImage imageNamed:logoImage];
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.layer.cornerRadius = _logoImageView.frame.size.width / 2.0;
        [self addSubview:_logoImageView];

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0.6 * frame.size.height, frame.size.width - 20, 25)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:25];
        _titleLabel.text = title;
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.85*frame.size.height, frame.size.width, frame.size.height * 0.1)];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.font = [UIFont systemFontOfSize:15];
        _subTitleLabel.text = subTitle;
        _subTitleLabel.textColor = [UIColor whiteColor];
         [self addSubview:_subTitleLabel];
        
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [[self.viewController navigationController] setNavigationBarHidden:YES];
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew) context:Nil];
    self.scrollView.contentInset = UIEdgeInsetsMake(self.frame.size.height, 0 ,0, 0);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGPoint newOffset = [change[@"new"] CGPointValue];
    [self updateSubViewsWithScrollOffset:newOffset];
}

- (void)updateSubViewsWithScrollOffset:(CGPoint)newOffset{
    float destinaOffset = - 60;
    float startChangeOffset = - self.scrollView.contentInset.top;
    
    newOffset = CGPointMake(newOffset.x, newOffset.y < startChangeOffset ? startChangeOffset:(newOffset.y > destinaOffset ? destinaOffset:newOffset.y));
    
    float titleDestinateOffset = self.frame.size.height - 40;
    float newY = - newOffset.y - self.scrollView.contentInset.top;
    float d = destinaOffset - startChangeOffset;
    float alpha = 1 - (newOffset.y - startChangeOffset) / d;
    self.subTitleLabel.alpha = alpha;
    self.frame = CGRectMake(0, newY, self.frame.size.width, self.frame.size.height);
    self.bgImageView.frame = CGRectMake(0, - 0.5 * self.frame.size.height + (1.5 * self.frame.size.height - 60) * (1 - alpha), self.bgImageView.frame.size.width, self.bgImageView.frame.size.height);
    
    self.titleLabel.frame = CGRectMake(0, 0.6 * self.frame.size.height + (titleDestinateOffset - 0.6 * self.frame.size.height) * (1 - alpha), self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16 + (alpha) * 4];
}


@end
