//
//  ViewController.m
//  Disk Creator
//
//  Created by Sam DeLong on 12/28/16.
//  Copyright © 2016 Sam  DeLong. All rights reserved.
//

#import "ViewController.h"
#include <sys/mount.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *diskManager = [[NSFileManager defaultManager] mountedVolumeURLsIncludingResourceValuesForKeys:@[NSURLVolumeNameKey] options:0];
    for (NSURL *url in diskManager) {
    NSLog(@"Volume mounted at: %@", [url path]);
      if ([[url path] rangeOfString:@"/Volumes"].location != NSNotFound){

            [self.diskChoose addItemWithTitle:[[url path] substringFromIndex:9]];
            
        }
        

    }
    
    
}
- (IBAction)findDisks:(id)sender{
    NSError *error = nil;
    NSDictionary *attr = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[NSString stringWithFormat:@"/Volumes/%@",[self.diskChoose.selectedItem.title stringByReplacingOccurrencesOfString:@" " withString:@"\ "]] error:&error];
    
    double diskSize = [[attr valueForKey:@"NSFileSystemSize"] doubleValue];
    double diskFreeSpace = [[attr valueForKey:@"NSFileSystemFreeSize"] doubleValue];
    double usedSpace = diskSize - diskFreeSpace;
    NSLog(@"%f",usedSpace);

    
    
        [self.diskChoose removeAllItems];
    NSArray *diskManager = [[NSFileManager defaultManager] mountedVolumeURLsIncludingResourceValuesForKeys:@[NSURLVolumeNameKey] options:0];
    for (NSURL *url in diskManager) {
        NSLog(@"Volume mounted at: %@", [url path]);
        if ([[url path] rangeOfString:@"/Volumes"].location != NSNotFound){
            
            [self.diskChoose addItemWithTitle:[[url path] substringFromIndex:9]];
            
        }
        
    }
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
/*
- (void)startProgressBar:(id)sender{
    
    [self.progress setMinValue:0.0];
    [self.progress setMaxValue:5017358336.000000];
    
    
        NSError *error = nil;
        NSDictionary *attr = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[NSString stringWithFormat:@"//volumes/Install\ macOS\ Sierra"] error:&error];
        
        double diskSize = [[attr valueForKey:@"NSFileSystemSize"] doubleValue];
        double diskFreeSpace = [[attr valueForKey:@"NSFileSystemFreeSize"] doubleValue];
        double usedSpace = diskSize - diskFreeSpace;
        [self.progress setDoubleValue:usedSpace];
    if (usedSpace < 4993851392.000000){
        [NSTimer scheduledTimerWithTimeInterval:0.05
                                         target:self
                                       selector:@selector(startProgressBar:)
                                       userInfo:nil
                                        repeats:NO];
//        x++;
    }
    
        else {
            NSAlert *finishedAlert = [[NSAlert alloc] init];
            [finishedAlert setInformativeText:@"DONE!"];
            [finishedAlert setMessageText:@"Done copying!"];
            [finishedAlert runModal];
 
 }
}
 */



- (IBAction)openSierra:(id)sender{
                NSAppleScript *sierraScript = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:
                                                                             @"\
                                                                             do shell script \"sudo /Applications/Install\\\\ macOS\\\\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/%@ --applicationpath /Applications/Install\\\\ macOS\\\\ Sierra.app --nointeraction\" with administrator privileges",[self.diskChoose.selectedItem.title stringByReplacingOccurrencesOfString:@" " withString:@"\\\\ "] ]];
    [sierraScript executeAndReturnError:nil];
        NSAlert *finishedAlert = [[NSAlert alloc] init];
        [finishedAlert setInformativeText:@"DONE!"];
        [finishedAlert setMessageText:@"Done copying!"];
        [finishedAlert runModal];
    
    
}
- (IBAction)gay:(id)sender{
    NSError *error = nil;
    NSDictionary *attr = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[NSString stringWithFormat:@"//volumes/Install\ macOS\ Sierra"] error:&error];
    
    double diskSize = [[attr valueForKey:@"NSFileSystemSize"] doubleValue];
    double diskFreeSpace = [[attr valueForKey:@"NSFileSystemFreeSize"] doubleValue];
    double usedSpace = diskSize - diskFreeSpace;
    NSLog(@"%f",usedSpace);
    
}







@end
