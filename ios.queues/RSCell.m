//
//  RSCell.m
//  ios.queues
//
//  Created by Ricardo Sampayo on 10/10/13.
//  Copyright (c) 2013 CodeHero. All rights reserved.
//

#import "RSCell.h"

@implementation RSCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
