//
//  DetalleViewController.h
//  EjercicioTableView
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleViewController : UIViewController

@property (nonatomic, strong) NSString *valor;
@property (strong, nonatomic) IBOutlet UILabel *valorLbl;

@end
