# Integrating a Core ML Model into Your App

Add a simple model to an app, 
pass input data to the model, and process the model's predictions. 

## Overview

This sample app uses a trained model, `MarsHabitatPricer.mlmodel`, 
to predict habitat prices on Mars.

## Add a Model to Your Xcode Project

Add the model to your Xcode project by dragging the model into the project 
navigator. 

You can see information about the model—including 
the model type and its expected inputs and outputs—by 
opening the model in Xcode. 
In this sample, the inputs are the number of solar panels and greenhouses, as well 
as the lot size of the habitat (in acres). 
The output is the predicted price of the habitat.

## Create the Model in Code

Xcode also uses information about the model’s inputs and outputs to 
automatically generate a custom programmatic interface to the model, 
which you use to interact with the model in your code.
For `MarsHabitatPricer.mlmodel`, Xcode generates interfaces to 
represent the model (`MarsHabitatPricer`), the model’s inputs (`MarsHabitatPricerInput`), 
and the model’s output (`MarsHabitatPricerOutput`).

Use the generated `MarsHabitatPricer` class’s initializer to create the model:

``` 
MarsHabitatPricer *model = [[MarsHabitatPricer alloc]init];
```

## Get Input Values to Pass to the Model

This sample app uses a `UIPickerView` to get the model’s input values from the user:

```
-(NSInteger)selectedRowForFeature:(Feature)feature
{
    return [self.pickerView selectedRowInComponent:feature];
}

 double solarPanels = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureSolarPanels] feature:FeatureSolarPanels];
    
double greenhouses = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureGreenhouses] feature:FeatureGreenhouses];
    
double size = [self.pickerDataSource valueForRow:[self selectedRowForFeature:FeatureSize] feature:FeatureSize];
```

## Use the Model to Make Predictions

The `MarsHabitatPricer` class has a generated 
`-predictionFromSolarPanels:greenhouses:size:error: method that’s used to predict a
price from the model’s input values—in this case, the number of solar panels,
the number of greenhouses, and the size of the habitat (in acres). The result of
this method is a `MarsHabitatPricerOutput` instance.

```
 NSError *error;
 MarsHabitatPricerOutput *output = [self.model predictionFromSolarPanels:solarPanels
                                                             greenhouses:greenhouses
                                                                    size:size
                                                                   error:&error];
}
```

Access the `price` property of `marsHabitatPricerOutput` to get a predicted price 
and display the result in the app’s UI.

```
double price = output.price;
self.priceLabel.text = [self.priceFormatter stringFromNumber:@(price)];
```

- Note: The generated `-predictionFromSolarPanels:greenhouses:size:error:)` method can fail with an error. The most common type of error you’ll encounter when working with Core ML occurs when the details of the input data don't match the details the model is expecting—for example, an image in the wrong format. 

## Build and Run a Core ML App 

Xcode compiles the Core ML model 
into a resource that’s been optimized to run on a device. 
This optimized representation of the model is included in your app bundle
and is what’s used to make predictions while the app is running on a device. 

