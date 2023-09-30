//
//  ViewController.m
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/29/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.

#import "ViewController.h"
#import "MarsHabitatPricer.h"
#import "PickerViewDataSource.h"

@interface ViewController () <UIPickerViewDelegate>

@property (nonatomic,weak) IBOutlet UILabel *priceLabel;
@property (nonatomic,weak) IBOutlet UIPickerView *pickerView;

@property (nonatomic,strong) MarsHabitatPricer *model;
@property (nonatomic,strong) PickerViewDataSource *pickerDataSource;
@property (nonatomic,strong) NSNumberFormatter *priceFormatter;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self.pickerDataSource;

    [self.pickerView selectRow:2 
                   inComponent:FeatureGreenhouses
                      animated:NO];
    
    [self updatePredictedPrice];
}

-(NSInteger)selectedRowForFeature:(Feature)feature
{
    return [self.pickerView selectedRowInComponent:feature];
}

-(void)updatePredictedPrice
{
    double solarPanels = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureSolarPanels]
                                                    feature:FeatureSolarPanels];
    
    double greenhouses = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureGreenhouses]
                                                    feature:FeatureGreenhouses];
    
    double size = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureSize]
                                                    feature:FeatureSize];
    
    NSError *error;
    MarsHabitatPricerOutput *output = [self.model predictionFromSolarPanels:solarPanels
                                                                greenhouses:greenhouses
                                                                       size:size
                                                                      error:&error];
    
    if (error != nil)
    {
        os_log_error(OS_LOG_DEFAULT, "Error: %@",error);
    }
    else
    {
        double price = output.price;
        self.priceLabel.text = [self.priceFormatter stringFromNumber:@(price)];
    }
}


#pragma mark - UIPickerViewDelegate
/// When values are changed, update the predicted price.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updatePredictedPrice];
}

-(nullable NSString *)pickerView:(UIPickerView*)pickerView
                     titleForRow:(NSInteger)row
                    forComponent:(NSInteger)component
{
    NSString *title = [self.pickerDataSource titleForRow:row feature:component];
    return title;
}

#pragma mark - Getters
-(MarsHabitatPricer*)model
{
    if (_model == nil)
    {
        _model = [[MarsHabitatPricer alloc]init];
    }
    return _model;
}

-(NSNumberFormatter*)priceFormatter
{
    if (_priceFormatter == nil)
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
        formatter.numberStyle = NSNumberFormatterCurrencyStyle;
        formatter.maximumFractionDigits = 0;
        formatter.usesGroupingSeparator = YES;
        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
        _priceFormatter = formatter;
    }
    return _priceFormatter;
}

-(PickerViewDataSource*)pickerDataSource
{
    if (_pickerDataSource == nil)
    {
        _pickerDataSource = [[PickerViewDataSource alloc]init];
    }
    return _pickerDataSource;
}

@end
