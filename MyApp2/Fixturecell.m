//
//  Fixturecell.m
//  MyApp2
//
//  Created by qbadmin on 16/06/14.
//  Copyright (c) 2014 qbadmin. All rights reserved.
//

#import "Fixturecell.h"

@implementation Fixturecell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
