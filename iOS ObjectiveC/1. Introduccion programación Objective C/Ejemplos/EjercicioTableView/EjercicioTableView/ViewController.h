//
//  ViewController.h
//  EjercicioTableView
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    NSArray *content;
}

@property (strong, nonatomic) IBOutlet UITableView *tablavista;

@end

