//
//  CHViewController.m
//  TextViewInScrollView
//
//  Created by Chenhao on 14-2-10.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import "CHViewController.h"

@interface CHViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) NSTextStorage *textStorage;
@property (strong, nonatomic) NSLayoutManager *layoutManager;

@end

@implementation CHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.bounds) * 2, CGRectGetHeight(self.scrollView.bounds));
    [self.view addSubview:self.scrollView];
    
    self.textStorage = [[NSTextStorage alloc] initWithString:@"Hello world.\n\n\n\n\nA\n\n\n\n\nB\n\n\n\n\nC\n\n\n\nD\n\n\n\n\nE\n\n\n\nF"
                                                  attributes:@{
                                                               NSFontAttributeName: [UIFont systemFontOfSize:17.0]
                                                               }];
    self.layoutManager = [[NSLayoutManager alloc] init];
    [self.textStorage addLayoutManager:self.layoutManager];
    
    CGRect rect = CGRectInset(self.scrollView.bounds, 10, 20);
    
    for (int i = 0; i < 2; i++) {
        rect.origin.x += CGRectGetWidth(self.scrollView.bounds) * i;

        NSTextContainer *textContainter = [[NSTextContainer alloc] initWithSize:rect.size];
        [self.layoutManager addTextContainer:textContainter];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:rect textContainer:textContainter];
        textView.editable = NO;
        textView.scrollEnabled = NO;
        [self.scrollView addSubview:textView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
