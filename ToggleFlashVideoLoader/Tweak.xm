#import "../../PS.h"
#import <Cephei/HBPreferences.h>
#import <dlfcn.h>

HBPreferences *preferences;
BOOL tweakEnabled;

%ctor {
    if (IN_SPRINGBOARD && isiOS7Up)
        return;
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.PS.ToggleFlashVideo"];
    [preferences registerBool:&tweakEnabled default:YES forKey:@"TFVNative"];
    if (tweakEnabled) {
        if (isiOS9Up)
            dlopen("/Library/MobileSubstrate/DynamicLibraries/RecordNTorch/ToggleFlashVideoiOS9AB.dylib", RTLD_LAZY);
#if !__arm64e__
        else if (isiOS8Up)
            dlopen("/Library/MobileSubstrate/DynamicLibraries/RecordNTorch/ToggleFlashVideoiOS8.dylib", RTLD_LAZY);
        else if (isiOS7Up)
            dlopen("/Library/MobileSubstrate/DynamicLibraries/RecordNTorch/ToggleFlashVideoiOS7.dylib", RTLD_LAZY);
#if !__LP64__
        else
            dlopen("/Library/MobileSubstrate/DynamicLibraries/RecordNTorch/ToggleFlashVideoiOS56.dylib", RTLD_LAZY);
#endif
#endif
    }
}
