//
//  settings.m
//  mOSLobjc
//
//  Created by Mikey on 08/08/2018.
//  Copyright © 2018 0xmachos. All rights reserved.
//

#import <Foundation/Foundation.h>

int check_sip(){
    
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/csrutil"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"status", nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *result;
    result = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    
    if ([result containsString:@"enabled"]) {
        NSString *str = @"[✅] SIP Enabled";
        printf("%s", [str UTF8String]);
        return 0;
    } else {
        NSString *str = @"[❌] SIP Disabled";
        printf("%s", [str UTF8String]);
        return 1;
    }
}
