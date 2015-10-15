//
//  ViewController.m
//  Sample
//
//  Created by TEJA on 03/06/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

#import "ViewController.h"
#import "FilterTableViewCell.h"
#import "Months.h"
#import "Days.h"
#import "Events.h"

@interface ViewController ()
{
    NSMutableArray *monthsArray;
    NSMutableArray *datesArray;
    NSMutableArray *eventsArray;


}
@property (weak, nonatomic) IBOutlet UITableView *sampleTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//   NSMutableArray *tempmonthsArray=[[NSMutableArray alloc]initWithObjects:@"October",@"November",@"December", nil];
//    
//    
//    
//   
//    NSMutableArray *tempdatesArray1=[[NSMutableArray alloc]initWithObjects:@"12",@"16",@"18", nil];
//    NSMutableArray *tempdatesArray2=[[NSMutableArray alloc]initWithObjects:@"01",@"07",@"15",@"20",@"23", nil];
//    NSMutableArray *tempdatesArray3=[[NSMutableArray alloc]initWithObjects:@"06",@"11",@"13",@"16",@"20",@"23",@"27", nil];
//
//  
//    NSMutableArray *tempeventsArray1=[[NSMutableArray alloc]initWithObjects:@"Alternative Healthcare",@"Business Management",@"Cardiology",@"Chemical Engineering",@"Dentistry",@"Diabetes & Endocrinology",@"EEE & Engineering", nil];
//    NSMutableArray *tempeventsArray2=[[NSMutableArray alloc]initWithObjects:@"Business Management",@"Chemical Engineering",@"Dentistry",@"Diabetes & Endocrinology",@"EEE & Engineering", nil];
//    NSMutableArray *tempeventsArray3=[[NSMutableArray alloc]initWithObjects:@"Alternative Healthcare",@"Business Management",@"Cardiology",@"Chemical Engineering",@"Dentistry", nil];
    NSMutableArray *tempeventsArray4=[[NSMutableArray alloc]initWithObjects:@"Alternative Healthcare ",@"Business Management Healthcare Engineering",@"Cardiology Healthcare Healthcare Engineering",@"Chemical Engineering Engineering Engineering Engineering Chemical Engineering Engineering Engineering Engineering",@"Dentistry ",@"Alternative Healthcare", nil];
//    NSMutableArray *tempeventsArray5=[[NSMutableArray alloc]initWithObjects:@"Chemical Engineering",@"Dentistry",@"Diabetes & Endocrinology", nil];
  // NSMutableArray *tempeventsArray6=[[NSMutableArray alloc]initWithObjects:@"Diabetes & Endocrinology", nil];
    


    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320)];
    backView.backgroundColor=[UIColor lightGrayColor];

    UILabel *monthLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 30, 50)];
    monthLabel.backgroundColor=[UIColor blueColor];
    [monthLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];

    double xvalue=50;
    double yvalue=5;
    
    for (int i=0; i<tempeventsArray4.count; i++)
    {
    
        UIView *eventBackView=[[UIView alloc]initWithFrame:CGRectMake(xvalue, yvalue, 240, 35)];
       // eventBackView.backgroundColor=[UIColor greenColor];

        UILabel *dateLabel=[[UILabel alloc]initWithFrame:CGRectMake(1, 0, 30, 30)];
        dateLabel.backgroundColor=[UIColor blueColor];
        dateLabel.text=@"02";
        dateLabel.textColor=[UIColor whiteColor];
       
        dateLabel.textAlignment = NSTextAlignmentCenter;
        if (i!=0)
        {
            dateLabel.hidden=YES;
        }
    
        
        double eventLblSize;
        CGSize labelSize=[self getLabelHeight:[tempeventsArray4 objectAtIndex:i] :240 :[UIFont systemFontOfSize:15]];
        
        
        if (labelSize.height>35)
        {
            CGRect eventbackViewRect;
            eventbackViewRect=eventBackView.frame;
            eventbackViewRect.size.height=labelSize.height+5;
            eventBackView.frame=eventbackViewRect;
            eventLblSize=eventbackViewRect.size.height;
        }
        else
        {
             eventLblSize=32;
        }
      

        
        UILabel *eventsLabel=[[UILabel alloc]initWithFrame:CGRectMake(31, 0, 240, eventLblSize)];
       // eventsLabel.backgroundColor=[UIColor greenColor];
        eventsLabel.font=[UIFont systemFontOfSize:15];
        eventsLabel.numberOfLines=0;
        eventsLabel.text=[tempeventsArray4 objectAtIndex:i];
      
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(31, eventLblSize+2, 240, 2)];
        lineView.backgroundColor=[UIColor brownColor];
        
        [eventBackView addSubview:lineView];
        [eventBackView addSubview:dateLabel];
        [eventBackView addSubview:eventsLabel];
        [backView addSubview:eventBackView];
        if (labelSize.height>32)
        {
            yvalue=yvalue+eventBackView.frame.size.height+5;

        }
        else
        {
            yvalue=yvalue+40;

        }
        
    }
    
    CGRect backViewRect;
  
    if (yvalue>100)
    {
        backViewRect=backView.frame;
        backViewRect.size.height=yvalue;
        backView.frame=backViewRect;
    }
    
    
    CGRect monthLabelRect=monthLabel.frame;
    monthLabelRect.origin.y=backViewRect.origin.y;
    monthLabelRect.size.height=backViewRect.size.height;
    monthLabel.frame=monthLabelRect;
    monthLabel.text=@"January";
    monthLabel.textAlignment = NSTextAlignmentCenter;

    [backView addSubview:monthLabel];
    [self.view addSubview:backView];

   }




-(CGSize)getLabelHeight:(NSString*)text :(CGFloat)width :(UIFont*)font
{
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:text
     attributes:@
     {
     NSFontAttributeName: font
     }];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    return size;
}






/*

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilterTableViewCell *filterCell;
    filterCell=[tableView dequeueReusableCellWithIdentifier:@"flterCell"];
    
    return filterCell;
}

*/






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
