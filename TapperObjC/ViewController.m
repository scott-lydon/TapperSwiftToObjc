

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tapsL;
@property (weak, nonatomic) IBOutlet UIImageView *tapperImgView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOutlet;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end

@implementation ViewController


- (void)updateTapsLbl {
    _tapsL.text = @"currentTaps Taps";
}

- (BOOL)isGameOver {
    return currentTaps >= maxTaps;
}

- (void)restartGame {
    maxTaps = 0;
    _tapsL.text = @"";
    
    
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
        
        [_tapperImgView setHidden:NO];
        [_tapsL setHidden:NO];
        
        maxTaps = [_textFieldOutlet.text  integerValue];
    }
}

- (IBAction)textField:(UITextField *)sender {
    
}

@end
