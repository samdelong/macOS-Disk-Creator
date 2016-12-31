//
//  ViewController.h
//  Disk Creator
//
//  Created by Sam DeLong on 12/28/16.
//  Copyright © 2016 Sam  DeLong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

static NSString *_diskpath = nil;

@interface ViewController : NSViewController

@property (strong, nonatomic) IBOutlet NSButton *sierraButton;

@property (strong, nonatomic) IBOutlet NSPopUpButton *diskChoose;

@property (strong, nonatomic) IBOutlet NSButton *detectDrives;

@property (strong, nonatomic) IBOutlet NSProgressIndicator *progress;

@property (strong, nonatomic) IBOutlet NSButton *test;



@end

