//
//  main.m
//  mOSLobjc
//
//  Created by Mikey on 08/08/2018.
//  Copyright © 2018 0xmachos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "utilities.h"
#import "settings.h"


int usgae() {
    
    NSString *str = @
    "Audit or Fix macOS security settings🔒🍎\n"
    "Usage:\n"
    "  list         - List all settings that can be audited/ fixed\n"
    "  audit        - Audit the status of all settings (Does NOT change settings)\n"
    "  fix  {force} - Attempt to fix all settings (Does change settings)\n";
    
    printf("%s", [str UTF8String]);
    
    exit(0);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        check_os_compatability();
        
        if (argc <= 1) {
            usgae();
        }
    
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        NSString *cmd = arguments[1];
        
        if ([cmd isEqualToString: @"audit"]){
            check_sip();
        }
        else if ([cmd isEqualToString: @"fix"]){
            get_fix_mode_permission();
        }
        else {
            usgae();
        }
    
        printf("\n");
        return 0;
        
    }
}
