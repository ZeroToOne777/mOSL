//
//  utilities.m
//  mOSLobjc
//
//  Created by Mikey on 08/08/2018.
//  Copyright © 2018 0xmachos. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString *FNgetInput() {
    @autoreleasepool {
        return [[[NSString alloc] initWithData:[[NSFileHandle fileHandleWithStandardInput] availableData] encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    }
}


int get_fix_mode_permission() {

    NSString *permission_warning = @"[⚠️ ] You are about to engage FIX mode which WILL make changes to your Mac 💻\n";
    NSString *permission_prompt = @"[⚠️ ] Do you want to continue? (y/N) ";
    
    printf("%s", [permission_warning UTF8String]);
    printf("%s", [permission_prompt UTF8String]);
    
    NSString *userInput = [[[NSString alloc] initWithData:[[NSFileHandle fileHandleWithStandardInput] availableData] encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    // Read from stdin, encode as UTF8 string and trim newline chars
    
    if ([userInput isEqualToString:@"y"] || [userInput isEqualToString:@"Y"]) {
        printf("yas");
        return 0;
    } else {
        NSString *userName = NSUserName();
        NSString *exit_message = [NSString stringWithFormat: @"[❌] %@ has chosen to quit\n", userName];
        printf("%s", [exit_message UTF8String]);
        exit(1);
    }
}


int check_os_compatability() {
    
    NSString *supported_macos_name= @"High Sierra";
    NSInteger supported_macos_minor_version = 13;
    
    NSOperatingSystemVersion current_macos_version = [[NSProcessInfo processInfo] operatingSystemVersion];
    
    if (current_macos_version.minorVersion != supported_macos_minor_version) {
        
        NSString *error_message = [NSString stringWithFormat:@"[❌] Lockdown was built for macOS %@ (10.%lu)\n[🍺] This is macOS 10.%ld\n", supported_macos_name, supported_macos_minor_version, current_macos_version.minorVersion];

        printf("%s", [error_message UTF8String]);
        exit(1);
    }
    
    return 0;
}
