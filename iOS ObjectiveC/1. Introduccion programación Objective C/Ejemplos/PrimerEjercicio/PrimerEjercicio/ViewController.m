//
//  ViewController.m
//  PrimerEjercicio
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger conteo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.conteo = 0;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBoton:(UIButton *)sender {
    self.conteo++;
    NSString *mensaje =  @"Click en el boton: ";
    self.texto.text = [mensaje stringByAppendingString:[NSString stringWithFormat:@"%d", (int)self.conteo]];
}

@end
