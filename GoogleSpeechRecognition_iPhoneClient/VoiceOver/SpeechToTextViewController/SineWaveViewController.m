//
//  SineWaveViewController.m
//  SpeechToText
//
//  Created by Sam Bosley on 10/11/11.
//  Copyright (c) 2011 Astrid. All rights reserved.
//

#import "SineWaveViewController.h"
#import "SpeechToTextModule.h"

@interface SineWaveViewController ()
{
//    SpeechToTextModule* speechToTextModule;
}

@property (retain) NSString *originalDoneText;

@end

@implementation SineWaveViewController

@synthesize delegate;
@synthesize dataPoints;
@synthesize backgroundView;
@synthesize waveDisplay;
@synthesize doneButton;
@synthesize processingView;
@synthesize header;
@synthesize footer;
@synthesize originalDoneText;
@synthesize cancelButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    waveDisplay = [[WaveDisplay alloc] initWithFrame:CGRectMake(10, 10, 300, 100)];
    [self.view addSubview:waveDisplay];
    
    waveDisplay.dataPoints = self.dataPoints;
    [self resetViewState];
    
//    speechToTextModule = [[SpeechToTextModule alloc] initWithCustomDisplay:@"SineWaveViewController"];
//    speechToTextModule.delegate = self;
//    [speechToTextModule beginRecording];
    
}

- (void)setDataPoints:(NSArray *)_dataPoints {
    // Have to hold on to them here in case the wave display hasn't loaded when they're first set
    [dataPoints release];
    dataPoints = [_dataPoints retain];
    waveDisplay.dataPoints = dataPoints;
}

- (void)dealloc {
    delegate = nil;
    [dataPoints release];
    [header release];
    [footer release];
    [backgroundImage release];
    [waveDisplay release];
    [doneButton release];
    [cancelButton release];
    [processingView release];
    self.originalDoneText = nil;
    
//    [speechToTextModule release];
//    speechToTextModule = nil;
    
    [super dealloc];
}

- (void)resetViewState {
    self.header.hidden = NO;
    self.header.text = @"Speak now";
    self.header.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    self.processingView.hidden = YES;
    self.waveDisplay.hidden = NO;
    self.doneButton.hidden = NO;
    self.doneButton.enabled = YES;
    self.cancelButton.hidden = NO;
    self.footer.hidden = YES;
}

- (IBAction)done {
    [delegate sineWaveDoneAction];
//    [speechToTextModule stopRecording:YES];
    [delegate stopRecording];
}

-(IBAction)cancel {
    [delegate sineWaveCancelAction];
}

- (void)updateWaveDisplay {
    [waveDisplay setNeedsDisplay];
}

@end
