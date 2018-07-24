#import <UIKit/UIKit.h>

@protocol HSStepperDelegate;

@interface HSStepper : UIView

@property (nonatomic,weak) id <HSStepperDelegate>delegate;
@property (nonatomic,assign) double value; // 当前值(必须设置)
@property (nonatomic,assign) double maximumValue; // 最大值(必须设置)
@property (nonatomic,assign) double minimumValue; // 最小值(必须设置)
@property (nonatomic,assign) double stepValue; // 增减值(必须设置)
@property (nonatomic,strong) UIButton *subtracticBtn;
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UILabel *valueLabel;

@end

@protocol HSStepperDelegate <NSObject>
@optional
- (NSString *)stepper:(HSStepper *)stepper textOfValue:(float)value;

@end
