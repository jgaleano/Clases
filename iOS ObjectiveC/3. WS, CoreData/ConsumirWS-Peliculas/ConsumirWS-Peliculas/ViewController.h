//
//  ViewController.h
//  ConsumirWS-Peliculas
//
//  Created by Julio Laptop on 6/7/17.
//  Copyright © 2017 Julio Galeano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSDictionary *dataDic;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

