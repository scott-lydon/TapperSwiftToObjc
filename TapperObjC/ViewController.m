

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tapsL;
@property (weak, nonatomic) IBOutlet UIImageView *tapperImgView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOutlet;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *coinBtn;

@end

@implementation ViewController

- (void)updateTapsLbl {
    NSString *tapsStr = [NSString stringWithFormat:@"%ld", (long)currentTaps];
    NSString *tapStrCombined = [@"Taps: " stringByAppendingString:tapsStr];
    [_tapsL setText:tapStrCombined];
}

- (BOOL)isGameOver {
    return currentTaps >= maxTaps;
}

- (void)restartGame {
    maxTaps = 0;
    _tapsL.text = @"";
    
    [_tapperImgView setHidden:NO];
    [_playBtn setHidden:NO];
    [_textFieldOutlet setHidden:NO];
    
    [_coinBtn setHidden:YES];
    [_tapsL setHidden:YES];
}

- (IBAction)coinPress:(UIButton *)sender {
    [super viewDidLoad];
    currentTaps ++;
    [self updateTapsLbl];
    if ([self isGameOver]) {
        [self restartGame];
    }
}

- (IBAction)playPress:(UIButton *)sender {
    
    if ([_textFieldOutlet text] != NULL && ![_textFieldOutlet.text  isEqual: @""]) {
        [_tapperImgView setHidden:YES];
        [_playBtn setHidden:YES];
        [_textFieldOutlet setHidden:YES];
        
        [_coinBtn setHidden:NO];
        [_tapsL setHidden:NO];
        
        maxTaps =  [_textFieldOutlet.text intValue];
        currentTaps = 0;
        
        [self updateTapsLbl];
        
    }
}

- (IBAction)textField:(UITextField *)sender {
    
}

@end
