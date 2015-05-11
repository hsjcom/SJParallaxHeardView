//
//  SJParalaxHeardView.h
//  SJParallaxHeardView
//
//  Created by Soldier on 15/5/8.
//  Copyright (c) 2015年 Soldier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJParalaxHeardView : UIView

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) UIScrollView *scrollView;

- (id)initWithFrame:(CGRect)frame
    backgroundImage:(NSString *)backgroundImage
          logoImage:(NSString *)logoImage
              title:(NSString *)title
           subTitle:(NSString *)subTitle;

- (void)updateSubViewsWithScrollOffset:(CGPoint)newOffset;

@end
