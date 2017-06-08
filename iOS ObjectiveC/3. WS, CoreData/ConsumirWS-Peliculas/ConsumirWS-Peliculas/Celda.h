//
//  Celda.h
//  PrimeraTabla
//
//  Created by Julio Laptop on 6/2/17.
//  Copyright © 2017 Julio Galeano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Celda : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imagen;
@property (strong, nonatomic) IBOutlet UILabel *titulo;
@property (strong, nonatomic) IBOutlet UILabel *resumen;

@end
