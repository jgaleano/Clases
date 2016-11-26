//
//  ViewController.m
//  Calculadora
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *operacion;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    operacion = @"0";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)operacionClick:(id)sender {
    if([self validarOperacion:self.valo1Txt.text yElValor2:self.valor2Txt.text]) {
        return;
    }
    
    switch ([sender tag]) {
        case 0:
            [self sumar:self.valo1Txt.text.intValue yElValor2:self.valor2Txt.text.intValue];
            break;
        case 1:
            [self restar:self.valo1Txt.text.intValue yElValor2:self.valor2Txt.text.intValue];
            break;
        case 2:
            [self multiplicar:self.valo1Txt.text.intValue yElValor2:self.valor2Txt.text.intValue];
            break;
        case 3:
            [self dividir:self.valo1Txt.text.intValue yElValor2:self.valor2Txt.text.intValue];
            break;
        default:
            break;
    }
}

-(bool) validarOperacion:(NSString *) valor1 yElValor2:(NSString *) valor2 {
    if([[valor1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] ||
       [[valor2 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        self.resultadoTxt.text = @"valores vacios";
        return true;
    }
    return false;
}

-(void) sumar:(int)valor1 yElValor2:(int)valor2 {
    int resultado = valor1 + valor2;
    self.operationTxt.text = @"+";
    [self.resultadoTxt setText:[NSString stringWithFormat:@"%d", resultado]];
}

-(void) restar:(int)valor1 yElValor2:(int)valor2 {
    int resultado = valor1 - valor2;
    self.operationTxt.text = @"-";
    [self.resultadoTxt setText:[NSString stringWithFormat:@"%d", resultado]];
}

-(void) multiplicar:(int)valor1 yElValor2:(int)valor2 {
    int resultado = valor1 * valor2;
    self.operationTxt.text = @"*";
    [self.resultadoTxt setText:[NSString stringWithFormat:@"%d", resultado]];
}

-(void) dividir:(int)valor1 yElValor2:(int)valor2 {
    if(valor2==0) {
        self.resultadoTxt.text = @"Invalido dividir por cero";
        return;
    }
    int resultado = valor1 / valor2;
    self.operationTxt.text = @"/";
    [self.resultadoTxt setText:[NSString stringWithFormat:@"%d", resultado]];
}

@end
