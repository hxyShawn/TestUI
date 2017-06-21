//
//  Case1ViewController.m
//  textAll
//
//  Created by 贺东方 on 17/6/21.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//


#import "Case1ViewController.h"

@interface Case1ViewController ()
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *contentView1;

@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initAllViews];
}

#pragma mark - Actions

- (IBAction)addLabelContent:(UIStepper *)sender {
    
    switch (sender.tag) {
        case 0:
            _label1.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;
            
        case 1:
            _label2.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;
            
        default:
            break;
    }
}

- (void)initAllViews
{
    _label1 = [UILabel new];
    _label1.backgroundColor = [UIColor yellowColor];
    _label1.text = @"label,";
    _label2 = [UILabel new];
    _label2.backgroundColor = [UIColor greenColor];
    _label2.text = @"label,";
    
    [_contentView1 addSubview:_label1];
    [_contentView1 addSubview:_label2];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView1).offset(5);
        make.left.equalTo(_contentView1).offset(2);
        make.height.mas_equalTo(40);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边贴着label1
        make.left.equalTo(_label1.mas_right).with.offset(2);
        
        //上边贴着父view
        make.top.equalTo(_contentView1.mas_top).with.offset(5);
        
        //右边的间隔保持大于等于2，注意是lessThanOrEqual
        //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
        //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
        make.right.lessThanOrEqualTo(_contentView1.mas_right).with.offset(-2);
        
        //只设置高度40
        make.height.equalTo(@40);
        
    }];
    /*Content Compression Resistance = 不许挤我！
     对，这个属性说白了就是“不许挤我”=。=
     这个属性的优先级（Priority）越高，越不“容易”被压缩。也就是说，当整体的空间装不下所有的View的时候，Content Compression Resistance优先级越高的，显示的内容越完整。
     
     Content Hugging = 抱紧！
     这个属性的优先级越高，整个View就要越“抱紧”View里面的内容。也就是View的大小不会随着父级View的扩大而扩大。*/
    /*
     在这里，2的compressionResistancePriority比1高，所以不论如何1如何增加1都会显示，如果交换两者的优先级，那么无论如何1都会显示
     */
    //设置label1的content hugging 为1000
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content hugging 为1000
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content compression 为250
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    NSMutableString *ret = [NSMutableString new];
    
    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }
    
    return ret.copy;
}

@end


