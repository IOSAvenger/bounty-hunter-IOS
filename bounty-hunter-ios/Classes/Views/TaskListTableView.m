//
//  TaskListTableView.m
//  bounty-hunter-ios
//
//  Created by xiaojia on 6/1/14.
//  Copyright (c) 2014 IOSAvenger. All rights reserved.
//

#import "TaskListTableView.h"
#import <QuartzCore/QuartzCore.h>

#define BACKVIEW_WIDTH 300

@interface TaskListTableView()<UITextViewDelegate>
@property (strong, nonatomic) NSArray *TitleList;
@property (strong, nonatomic) NSArray *DescpList;
@end

@implementation TaskListTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.bounces = NO;
        
        self.TitleList = @[@"习近平看望儿童",@"打通金融服务实体经济的“血脉”",@"解放军副总长脱稿批安倍",@"换班陪6岁儿子过六一",@"广州一楼盘突然大幅降价"];
        self.DescpList = @[@"据新华社电 在“六一”国际儿童节即将到来之际，中共中央总书记、国家主席、中央军委主席习近平5月30日上午来到北京市海淀区民族小学，参加学校少先队主题队日活动，了解学生们学习和课余活动、特别是学校开展多种活动积极引导学生培育和践行社会主义核心价值观方面的情况",@" 对此央行金融市场司司长纪志宏向新华社记者表示，根据国务院常务会议，“定向降准”的领域将主要指向对发放“三农”、小微企业等符合结构调整需要、能够满足市场需求的实体经济贷款达到一定比例的银行业金融机构。",@"昨天，第十三届香格里拉对话会继续进行，中国人民解放军副总参谋长王冠中发表了题为《树立亚洲安全观，共创亚太美好未来》的演讲。王冠中表示，中国从来没有以武力威胁过任何国家，从来没有主动挑起事端，当然，我们也绝不接受他国打着“积极和平主义”等旗号挑事闹事，为一己私利把地区搞乱。对于安倍演讲中旁敲侧击指责中国，王冠中脱稿予以批驳，并要安倍“你有话不如直接讲出来”。",@"　她喜欢玩微信，她长年累月帮犯病的婆婆擦洗身子，她对自己异常苛刻，却喜欢帮婆婆添置新衣服，她甚至还没来得及和家人去做一次长途旅行，就被他人夺去了生命。“××的遇到疯子。”5月28日21时18分，她在微信朋友圈里说。这也是这个喜欢玩微信的37岁的年轻母亲最后一次更新她的微信朋友圈。",@"楼市走势究竟如何，是近期人们关注的热点。日前，售价16000元至21000元的亚运城山海湾项目突然降价销售，只售9800元至12500元。导致老业主强烈反弹，封闭小区禁止销售员和看房客进入。但这些措施却难以阻挡看房者的热情，降价后房屋销售明显反弹，短短3天70多套房源就销售了四分之三。"];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: @"cell"];
        cell.backgroundColor = [UIColor colorWithRed:232.0f/255.0f green:232.0f/255.0f blue:232.0f/255.0f alpha:1.0f];
        
        UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(10, 10,BACKVIEW_WIDTH, 100)];
        [backview setBackgroundColor:[UIColor whiteColor]];
        backview.layer.cornerRadius = 4;
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(10, 80, BACKVIEW_WIDTH, 30)];
        [bottomview setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:241.0f/255.0f blue:244.0f/255.0f alpha:1.0f]];
        bottomview.layer.cornerRadius =3;
        
        //Title
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, BACKVIEW_WIDTH, 20)];
        title.font = [UIFont boldSystemFontOfSize:16.0f];
        
        //Description
        UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(6, 22, BACKVIEW_WIDTH-20, 60)];
        description.font = [UIFont fontWithName:@"Arial" size:15];
        description.scrollEnabled = NO;
        description.editable = NO;
        
        //userLabel
        UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 8, 70, 20)];
        userLabel.font = [UIFont fontWithName:@"Arial" size:10];
        //[userLabel setTextColor:[UIColor whiteColor]];
        
        //UIImageView *avatar = [UIImageView alloc] initWithFrame:
        [title setText:[self.TitleList objectAtIndex:indexPath.row]];
        [description setText:[self.DescpList objectAtIndex:indexPath.row]];
        [userLabel setText:@"发布者:xiaojian"];
       
        [cell.contentView addSubview:backview];
        [cell.contentView addSubview:bottomview];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [backview addSubview:description];
        [backview addSubview:title];
        [bottomview addSubview:userLabel];
    }
    
    return cell;
}




@end
