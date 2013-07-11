//
//  UIControl+SHControlEventBlock.h
//  Example
//
//  Created by Seivan Heidari on 5/16/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#pragma mark -
#pragma mark Block Defs
typedef void (^SHActionSheetBlock)(NSUInteger theButtonIndex);
typedef void (^SHActionSheetShowBlock)(UIActionSheet * theActionSheet);
typedef void (^SHActionSheetDismissBlock)(UIActionSheet * theActionSheet, NSUInteger theButtonIndex);

@interface UIActionSheet (SHActionSheetBlocks)

#pragma mark -
#pragma mark Init
+(instancetype)SH_actionSheetWithTitle:(NSString *)theTitle;

+(instancetype)SH_actionSheetWithTitle:(NSString *)theTitle
                          buttonTitles:(id<NSFastEnumeration>)theButtonTitles
                           cancelTitle:(NSString *)theCancelTitle
                      destructiveTitle:(NSString *)theDestructiveTitle
                             withBlock:(SHActionSheetBlock)theBlock;
#pragma mark -
#pragma mark Adding
-(NSUInteger)SH_addButtonWithTitle:(NSString *)theTitle
                      withBlock:(SHActionSheetBlock)theBlock;

///Will add a new destructive button and make previous Destructive buttons to normal
-(NSUInteger)SH_addButtonDestructiveWithTitle:(NSString *)theTitle
                                    withBlock:(SHActionSheetBlock)theBlock;

///Will add a new destructive button and make previous Destructive buttons to normal
-(NSUInteger)SH_addButtonCancelWithTitle:(NSString *)theTitle
                               withBlock:(SHActionSheetBlock)theBlock;

#pragma mark -
#pragma mark Properties

#pragma mark -
#pragma mark Setters
-(void)SH_setButtonBlockForIndex:(NSUInteger)theButtonIndex
                       withBlock:(SHActionSheetBlock)theBlock;


-(void)SH_setButtonDestructiveBlock:(SHActionSheetBlock)theBlock;
-(void)SH_setButtonCancelBlock:(SHActionSheetBlock)theBlock;

-(void)SH_setWillShowBlock:(SHActionSheetShowBlock)theBlock;
-(void)SH_setDidShowBlock:(SHActionSheetShowBlock)theBlock;

-(void)SH_setWillDismissBlock:(SHActionSheetDismissBlock)theBlock;
-(void)SH_setDidDismissBlock:(SHActionSheetDismissBlock)theBlock;

#pragma mark -
#pragma mark Getters
-(SHActionSheetBlock)SH_blockForButtonIndex:(NSUInteger)theButtonIndex;

@property(nonatomic,readonly) SHActionSheetBlock SH_blockForDestructiveButton;
@property(nonatomic,readonly) SHActionSheetBlock SH_blockForCancelButton;


@property(nonatomic,readonly) SHActionSheetShowBlock    SH_blockWillShow;
@property(nonatomic,readonly) SHActionSheetShowBlock    SH_blockDidShow;

@property(nonatomic,readonly) SHActionSheetDismissBlock SH_blockWillDismiss;
@property(nonatomic,readonly) SHActionSheetDismissBlock SH_blockDidDismiss;

@end
