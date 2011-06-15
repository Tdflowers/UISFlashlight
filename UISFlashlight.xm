#import "fakesubstrate.h"
#import "UIToggle.h"
#import <AVFoundation/AVFoundation.h>


@interface flashtoggle : NSObject
{
    AVCaptureSession * torchSession;
    BOOL isOff;

}

@property (nonatomic, retain) AVCaptureSession * torchSession;


-(void) test;
@end
@implementation flashtoggle

@synthesize torchSession;


-(void) test
{
if (isOff){
AVCaptureSession * session = [[AVCaptureSession alloc] init];

[session beginConfiguration];

AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

if ([device hasTorch] && [device hasFlash]){
[device lockForConfiguration:nil];
[device setTorchMode:AVCaptureTorchModeOn];
[device setFlashMode:AVCaptureFlashModeOn];
[device unlockForConfiguration];

AVCaptureDeviceInput * flashInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
if (flashInput){
[session addInput:flashInput];
}

AVCaptureVideoDataOutput * output = [[AVCaptureVideoDataOutput alloc] init];
[session addOutput:output];
[output release];
[session commitConfiguration];

[session startRunning];
}

[self setTorchSession:session];
[session release];
isOff=NO;
}

else {
AVCaptureSession * session = [[AVCaptureSession alloc] init];

[session beginConfiguration];

AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

if ([device hasTorch] && [device hasFlash]){
[device lockForConfiguration:nil];
[device setTorchMode:AVCaptureTorchModeOff];
[device setFlashMode:AVCaptureFlashModeOff];
[device unlockForConfiguration];

AVCaptureDeviceInput * flashInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
if (flashInput){
[session addInput:flashInput];
}

AVCaptureVideoDataOutput * output = [[AVCaptureVideoDataOutput alloc] init];
[session addOutput:output];
[output release];
[session commitConfiguration];

[torchSession stopRunning];
}

[self setTorchSession:session];
[session release];
isOff=YES;
}

}
@end


%ctor
{
// runtime	

UISettingsToggleController* handler=[objc_getClass("UISettingsToggleController") sharedController];
id toggleController=[flashtoggle new];


// basic settings

[handler createToggleWithTitle:@"Flashlight" andImage:@"Flashlight.png" andSelector:@selector(test) toTarget:toggleController];
}
