# BasicUI
一些自己未来也许会用到的常用 UI

## HXYCustomButton

### 简单说明
可以横向或者竖向排列的button,通过 **HXYCustomButtonDirectionType** 来确定方向,` - (instancetype)initWithType:(HXYCustomButtonDirectionType )directionType imageSize:(CGSize)imageSize space:(NSNumber *)space;` 初始化,需要指定方向,图片大小,图片与lable的间距

使用以下三个方法设置样式

	- (void)setText:(nullable NSString *)text forState:(UIControlState)state;
	- (void)setTextColor:(nullable UIColor *)color forState:(UIControlState)state;
	- (void)setImageStr:(nullable NSString *)imageStr forState:(UIControlState)state;

### 使用案例
	HXYCustomButton *button = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeVertical imageSize:CGSizeMake(40, 40) space:@4];
    button.frame = CGRectMake(10, 10, 100, 100);
    [button setImageStr:@"estimateSelected" forState:UIControlStateNormal];
    [button setImageStr:@"estimateUnSelected" forState:UIControlStateSelected];
    [button setText:@"全部人" forState:UIControlStateNormal];
    [button setText:@"么了" forState:UIControlStateSelected];
    [button setTextColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTextColor:[UIColor redColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(btnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    HXYCustomButton *horizontalBtn = [[HXYCustomButton alloc]initWithType:HXYCustomButtonDirectionTypeHorizontal imageSize:CGSizeMake(20, 20) space:nil];
    horizontalBtn.frame = CGRectMake(100, 100, 100, 22);
    [horizontalBtn setImageStr:@"estimateSelected" forState:UIControlStateNormal];
    [horizontalBtn setImageStr:@"estimateUnSelected" forState:UIControlStateSelected];
    [horizontalBtn setText:@"全部" forState:UIControlStateNormal];
    [horizontalBtn setText:@"么了" forState:UIControlStateSelected];
    [horizontalBtn setTextColor:[UIColor greenColor] forState:UIControlStateNormal];
    [horizontalBtn setTextColor:[UIColor redColor] forState:UIControlStateSelected];
    [horizontalBtn addTarget:self action:@selector(btnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:horizontalBtn];
    
效果图: 在另外一个文件夹里
