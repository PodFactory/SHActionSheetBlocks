//
//  SHActionSheetBlocksCallbacksScenarion.m
//  Example
//
//  Created by Seivan Heidari on 7/31/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "KIF.h"
#import "SHActionSheetBlocksSuper.h"
#import "SHFastEnumerationProtocols.h"

@interface SHActionSheetBlocksCallbacksIntegration : KIFTestCase
@property(nonatomic,strong) UIViewController    * vc;
@property(nonatomic,strong) UIActionSheet       * sheet;


@end

@implementation SHActionSheetBlocksCallbacksIntegration
-(void)beforeEach; {
  [super beforeEach];
  
  
  self.sheet = [UIActionSheet SH_actionSheetWithTitle:@"Title"];
  self.vc    = UIViewController.new;

  
  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
  self.sheet = [UIActionSheet SH_actionSheetWithTitle:@"Title"];

  
}


-(void)testSingleButton; {
  NSString * buttonTitle   = @"Button1";
  __block BOOL didPassTest = NO;
  [self.sheet SH_addButtonWithTitle:buttonTitle withBlock:^(NSInteger theButtonIndex) {
    STAssertEquals(theButtonIndex, 0, nil);
    didPassTest = YES;
  }];
  [self.sheet showInView:self.vc.view];
  [tester tapViewWithAccessibilityLabel:buttonTitle];
  
  STAssertTrue(didPassTest, nil);
  
}

-(void)testDestructiveButton; {
  NSString * buttonTitle   = @"Delete";
  __block BOOL didPassTest = NO;
  [self.sheet SH_addButtonDestructiveWithTitle:buttonTitle withBlock:^(NSInteger theButtonIndex) {
    STAssertEquals(theButtonIndex, 0, nil);
    STAssertEquals(theButtonIndex, self.sheet.destructiveButtonIndex, nil);
    didPassTest = YES;
  }];
  [self.sheet showInView:self.vc.view];
  [tester tapViewWithAccessibilityLabel:buttonTitle];
  
  STAssertTrue(didPassTest, nil);
  
}

-(void)testCancelButton; {
  NSString * buttonTitle   = @"Cancel";
  __block BOOL didPassTest = NO;
  [self.sheet SH_addButtonCancelWithTitle:buttonTitle withBlock:^(NSInteger theButtonIndex) {
    STAssertEquals(theButtonIndex, 0, nil);
    STAssertEquals(theButtonIndex, self.sheet.cancelButtonIndex, nil);
    didPassTest = YES;
  }];
  [self.sheet showInView:self.vc.view];
  [tester tapViewWithAccessibilityLabel:buttonTitle];
  
  STAssertTrue(didPassTest, nil);
}

-(void)testSingleBlock; {
  
  NSArray * buttons = @[@"Button", @"Cancel", @"Delete"];
  
  [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self withButtonList:buttons.mutableCopy withButton:obj];
  }];
}

-(void)withButtonList:(NSMutableArray *)theButtonList withButton:(NSString *)theButtonTitle ; {
  __block BOOL didPassTest = NO;
  self.sheet = [UIActionSheet SH_actionSheetWithTitle:@"Title"
                                         buttonTitles:@[[theButtonList SH_popFirstObject]]
                                          cancelTitle:[theButtonList SH_popFirstObject]
                                     destructiveTitle:[theButtonList SH_popFirstObject]
                                            withBlock:^(NSInteger theButtonIndex) {
                                              didPassTest = YES;
                                              
                                              
                                            }];
  [self.sheet showInView:self.vc.view];
  [tester tapViewWithAccessibilityLabel:theButtonTitle];
  STAssertTrue(didPassTest, nil);

}



@end
