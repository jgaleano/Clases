//
//  ViewController.m
//  EjemploInterfaz
//
//  Created by Julio Laptop on 11/19/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickAction:(id)sender {
    NSString *a = [sender tag]==0?@"a":@"b";
    NSLog(@"%@",a);
}

@end
