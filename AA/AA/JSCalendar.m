//
//  JSCalendar.m
//  AA
//
//  Created by YKJ3 on 16/8/10.
//  Copyright © 2016年 金松. All rights reserved.
//

#import "JSCalendar.h"
@interface JSCalendar()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation JSCalendar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.superview bringSubviewToFront:self];
        [self settingUpCollection];
    }
    return  self;
}
-(void)settingUpCollection{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing =CGFLOAT_MIN;
    layout.minimumInteritemSpacing =CGFLOAT_MIN;
    layout.itemSize =CGSizeMake(self.bounds.size.width/7, self.bounds.size.width/7);

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, self.bounds.size.width, self.bounds.size.width) collectionViewLayout:layout];
    _collectionView.delegate =self;
    _collectionView.dataSource =self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    return cell;
}

@end
