//
//  ViewController.m
//  EjercicioTableView
//
//  Created by Julio Laptop on 11/18/16.
//  Copyright © 2016 Julio Galeano. All rights reserved.
//

#import "ViewController.h"
#import "CeldaPersonalizada.h"
#import "DetalleViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     content = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [content count];
}

/*-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [content objectAtIndex:indexPath.row];
    return cell;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CeldaPersonalizada";
    
    CeldaPersonalizada *cell = (CeldaPersonalizada *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.texto1.text = [content objectAtIndex:indexPath.row];
    cell.texto2.text = [content objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Item seleccionado: %@", [content objectAtIndex:indexPath.row]);
    [self performSegueWithIdentifier:@"ShowDetail" sender:tableView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDetailt"]) {
        NSIndexPath *indexPath = [self.tablavista indexPathForSelectedRow];
        DetalleViewController *destViewController = segue.destinationViewController;
        destViewController.valor = [content objectAtIndex:indexPath.row];
    }
}


@end
