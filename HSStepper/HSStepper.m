#import "HSStepper.h"

@implementation HSStepper

#pragma mark - obj life cycle
- (id)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    
    return self;
}

#pragma mark - load
- (void)setup
{
    // subtracticBtn
    _subtracticBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_subtracticBtn addTarget:self action:@selector(subtracticBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_subtracticBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_minus.png"] forState:UIControlStateNormal];
    [_subtracticBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_minus_hlt.png"] forState:UIControlStateHighlighted];
    [_subtracticBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_minus_disable.png"] forState:UIControlStateDisabled];
    [self addSubview:_subtracticBtn];
    [_subtracticBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo(48);
    }];

    // addBtn
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addBtn addTarget:self action:@selector(addBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_add.png"] forState:UIControlStateNormal];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_add_hlt.png"] forState:UIControlStateHighlighted];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"cell_ic_add_disable.png"] forState:UIControlStateDisabled];
    [self addSubview:_addBtn];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.mas_equalTo(48);
    }];
    
    /*
    // verline0
    UIImageView *verline0 = [[UIImageView alloc] init];
    verline0.backgroundColor = [UIColor clearColor];
    [self addSubview:verline0];
    [verline0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_subtracticBtn.mas_right);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
    }];
    
    // verline1
    UIImageView *verline1 = [[UIImageView alloc] init];
    verline1.backgroundColor = [UIColor clearColor];
    [self addSubview:verline1];
    [verline1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_addBtn.mas_left);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
    }];
    
    // valueLabel
    _valueLabel = [[UILabel alloc] init];
    _valueLabel.textColor = [AppConfig shareConfig].mainColor;
    _valueLabel.font = [UIFont systemFontOfSize:16];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_valueLabel];
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(verline0.mas_right);
        make.right.equalTo(verline1.mas_left);
    }];
     */
    
}

- (void)refresh {
    if (_value <= _minimumValue) {
        _subtracticBtn.enabled = NO;
    }
    else {
        _subtracticBtn.enabled = YES;
    }
    
    if (_value >= _maximumValue) {
        _addBtn.enabled = NO;
    }
    else {
        _addBtn.enabled = YES;
    }
}


#pragma mark - actions
- (void)subtracticBtnClicked:(id)sender {
    _value -= _stepValue;
    [self refresh];
    if ([self.delegate respondsToSelector:@selector(stepper:textOfValue:)]) {
        _valueLabel.text = [self.delegate stepper:self textOfValue:_value];
    }
}

- (void)addBtnClicked:(id)sender {
    _value += _stepValue;
    [self refresh];
    if ([self.delegate respondsToSelector:@selector(stepper:textOfValue:)]) {
        _valueLabel.text = [self.delegate stepper:self textOfValue:_value];
    }
}

#pragma mark - custom setter
- (void)setValue:(double)value {
    _value = value;
    [self refresh];
    if ([self.delegate respondsToSelector:@selector(stepper:textOfValue:)]) {
        _valueLabel.text = [self.delegate stepper:self textOfValue:_value];
    }
}

- (void)setMaximumValue:(double)maximumValue {
    _maximumValue = maximumValue;
    [self refresh];
}

- (void)setMinimumValue:(double)minimumValue {
    _minimumValue = minimumValue;
    [self refresh];
}




@end
