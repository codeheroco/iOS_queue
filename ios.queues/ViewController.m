//
//  ViewController.m
//  ios.queues
//
//  Created by Ricardo Sampayo on 10/10/13.
//  Copyright (c) 2013 CodeHero. All rights reserved.
//

#import "ViewController.h"
#import "RSCell.h"
@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *datasource;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _datasource = @[@"http://www.gravatar.com/avatar/6352c71a03d5b247726deda291af1539?s=200",
                    @"http://www.gravatar.com/avatar/cfc00b30c3a938a407af6a90c88a31cf?s=200",
                    @"http://www.gravatar.com/avatar/006ef14fba8fadd40053ecda5039deb2?s=200",
                    @"http://www.gravatar.com/avatar/3a9a1ccdf73bd48a3f8c3cf618e73422?s=200",
                    @"http://www.gravatar.com/avatar/ce18739981f17f4e3fb91c7b52dff39e?s=200",
                    @"http://www.gravatar.com/avatar/6352c71a03d5b247726deda291af1539?s=200",
                    @"http://www.gravatar.com/avatar/cfc00b30c3a938a407af6a90c88a31cf?s=200",
                    @"http://www.gravatar.com/avatar/006ef14fba8fadd40053ecda5039deb2?s=200",
                    @"http://www.gravatar.com/avatar/3a9a1ccdf73bd48a3f8c3cf618e73422?s=200",
                    @"http://www.gravatar.com/avatar/ce18739981f17f4e3fb91c7b52dff39e?s=200"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datasource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identificador =@"myCell";
    RSCell *cell = [tableView dequeueReusableCellWithIdentifier:identificador];
    
    if (!cell)
    {
        cell = [[RSCell alloc] initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:identificador];
    }
    [cell.imageCell setImage:nil];
    cell.labelDescription.text = [NSString stringWithFormat:@"position %i",indexPath.row];
    
    // Creamos nuesta Queue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setName:@"Carga de imagenes"];
    
    // Agregamos bloques de operaciones a nuestro Queue
    [queue addOperationWithBlock:^{
        NSData * imageData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString: [_datasource objectAtIndex:indexPath.row]]];
        UIImage *image = [UIImage imageWithData:imageData];
        
        // Retornamos al mainQueue la imagen para ser agregada a la celda
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [cell.imageCell setImage:image];
            
        }];
        
    }];
    
    
    return cell;
}


@end
