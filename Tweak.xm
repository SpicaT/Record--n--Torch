#import "../PS.h"
#import <Cephei/HBPreferences.h>

#define isBackCamera(device) (device != 1)
#define checkModeAndDevice(mode, device) (isBackCamera(device) && (mode == 1 || mode == 2 || mode == 6))

HBPreferences *preferences;
BOOL tweakEnabled;

BOOL override = NO;

%hook CUCaptureController

- (BOOL)isCapturingVideo {
    return override ? NO : %orig;
}

%end

%hook CAMViewfinderViewController

- (void)_startCapturingVideoWithRequest:(id)arg1 {
    %orig;
    if (checkModeAndDevice(self._currentMode, self._currentDevice))
        self._flashButton.allowsAutomaticFlash = NO;
}

- (BOOL)_shouldHideFlashButtonForGraphConfiguration:(CAMCaptureGraphConfiguration *)configuration {
    return checkModeAndDevice(configuration.mode, configuration.device) && [self._captureController isCapturingVideo] ? NO : %orig;
}

- (void)_updateTopBarStyleForGraphConfiguration:(CAMCaptureGraphConfiguration *)configuration capturing:(BOOL)capturing animated:(BOOL)animated {
    %orig(configuration, isBackCamera(configuration.device) ? NO : capturing, animated);
}

- (void)_updateTorchModeOnControllerForMode:(NSInteger)mode {
    override = YES;
    %orig;
    override = NO;
}

%end

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.PS.ToggleFlashVideo"];
    [preferences registerBool:&tweakEnabled default:YES forKey:@"TFVNative"];
    if (tweakEnabled) {
        openCamera10();
        %init;
    }
}
