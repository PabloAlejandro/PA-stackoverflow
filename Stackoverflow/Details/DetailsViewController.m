//
//  DetailsViewController.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerCountLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSAssert(self.params != nil, @"params can't be nil");
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)setup
{
    // This is just a quick demo of how to set some labels text
    self.titleLabel.text = self.params.title;
    self.userNameLabel.text = self.params.user_display_name;
    self.answerCountLabel.text = [self.params.answer_count stringValue];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
