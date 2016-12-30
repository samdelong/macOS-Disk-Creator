//
//  ViewController.h
//  Disk Creator
//
//  Created by Sam DeLong on 12/28/16.
//  Copyright © 2016 Sam  DeLong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

static NSArray *_diskVar = nil;

@interface ViewController : NSViewController

@property (strong, nonatomic) IBOutlet NSButton *sierraButton;

@property (strong, nonatomic) IBOutlet NSPopUpButton *diskChoose;

@property (strong, nonatomic) IBOutlet NSButton *detectDrives;

@end

