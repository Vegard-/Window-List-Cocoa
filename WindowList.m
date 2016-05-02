#include <Cocoa/Cocoa.h>

int main(int argc, char **argv) {
    printf("PID\tWindowID\tTitle\n");
    NSArray *windows = (NSArray *) CGWindowListCopyWindowInfo(kCGWindowListExcludeDesktopElements, kCGNullWindowID);
    for(NSDictionary *window in windows){
        int ownerPid = [[window objectForKey:(NSString *)kCGWindowOwnerPID] intValue];
        int windowId = [[window objectForKey:(NSString *)kCGWindowNumber] intValue];
        NSString *title = [window objectForKey:(NSString *)kCGWindowName];

        printf("%d\t%d\t%s\n", ownerPid, windowId, title.UTF8String);
    }
}
