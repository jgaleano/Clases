//
//  ViewController.m
//  PrimerEjercicio
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"
#import "SegundoViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger conteo;
@property (nonatomic, strong) SegundoViewController *segundoControlador;

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
    /*self.conteo++;
    NSString *mensaje =  @"Click en el boton: ";
    self.texto.text = [mensaje stringByAppendingString:[NSString stringWithFormat:@"%d", (int)self.conteo]];*/
    
    self.segundoControlador = [[SegundoViewController alloc] init];
    
    [self presentViewController:self.segundoControlador animated:YES completion:nil];
    
    
    
}

@end
