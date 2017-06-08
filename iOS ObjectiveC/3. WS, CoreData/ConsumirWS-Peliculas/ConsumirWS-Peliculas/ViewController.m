//
//  ViewController.m
//  ConsumirWS-Peliculas
//
//  Created by Julio Laptop on 6/7/17.
//  Copyright © 2017 Julio Galeano. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Celda.h"
#import "UIImageView+AFNetworking.h"

static NSString * const BaseURLString = @"https://api.themoviedb.org/3/search/movie?api_key=c039b854e11fae44ee49bde01bad3b74&language=es&page=1&include_adult=false&query=";


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

- (IBAction)llamarServicioClick:(id)sender {
    NSString *string = [NSString stringWithFormat:@"%@resi", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"%@", responseObject);
        // 3
        self.dataDic = (NSDictionary *)responseObject;
        self.title = @"Peliculas Retrieved";
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Error consultando servicio"
                                     message:[error localizedDescription]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        //Add Buttons
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                    }];
        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }];
        
        //Add your buttons to alert controller
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
    // 5
    [operation start];
}

//TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(!self.dataDic)
        return 0;
    
    NSArray *results = self.dataDic[@"results"];
    return [results count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identificador = @"MiCelda";
    
    Celda *cell = (Celda *) [tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Celda" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSArray *results =self.dataDic[@"results"];
    NSDictionary *item = results[indexPath.row];
    
    [cell.imagen setImageWithURL:[NSURL URLWithString:@"https://image.tmdb.org/t/p/w500/xBD4qtkzhRoYJp6YhwW3ciGzzws.jpg"] placeholderImage:nil];
    [cell.titulo setText:item[@"title"]];
    [cell.resumen setText:item[@"overview"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}





@end
