//
//  SegundoViewController.m
//  PrimerEjercicio
//
//  Created by Julio Laptop on 6/2/17.
//  Copyright © 2017 Julio Galeano. All rights reserved.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)clickVolver:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
