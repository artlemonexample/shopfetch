//
//  ViewController.m
//  ShopFetch
//
//  Created by aleksandr on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>

#import "LSDataProvider.h"
#import "LSProductCell.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [LSDataProvider sharedInstance];
    if (![self.fetchedController performFetch:nil]){
        NSLog(@"error");
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedController.sections[section];
    return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"product_cell"];
    [cell updateModel:[LSProduct productFromEntity:[self.fetchedController objectAtIndexPath:indexPath]]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchedResultsController *)fetchedController {
    if (!_fetchedController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"LSProductEntity" inManagedObjectContext:[NSManagedObjectContext MR_rootSavingContext]];
        [fetchRequest setEntity:entity];
        
        NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                                  initWithKey:@"name" ascending:NO];
        [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
        
        [fetchRequest setFetchBatchSize:20];
        
        NSFetchedResultsController *theFetchedResultsController =
        [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                            managedObjectContext:[NSManagedObjectContext MR_rootSavingContext] sectionNameKeyPath:nil
                                                       cacheName:@"Root"];
        _fetchedController = theFetchedResultsController;
//        _fetchedController.delegate = self;
    }
    return _fetchedController;
}

@end
