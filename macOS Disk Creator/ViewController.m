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

- (IBAction)openSierra:(id)sender{
    
    NSAppleScript *sierraScript = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:
                                   @"\
                                   do shell script \"sudo /Applications/Install\\\\ macOS\\\\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/%@ --applicationpath /Applications/Install\\\\ macOS\\\\ Sierra.app --nointeraction\" with administrator privileges",[self.diskChoose.selectedItem.title stringByReplacingOccurrencesOfString:@" " withString:@"\\\\ "] ]];
    NSDictionary *dict = [NSDictionary dictionary];
    [sierraScript executeAndReturnError:&dict];
    NSLog(@"%@", dict);
    
}


@end
