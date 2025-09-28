# Deep-Learning-Health-App

## Description

A Deep Learning-Driven Fitness and Nutrition Assessment Application developed in MATLAB. It estimates BMI and BMR from basic demographic data, classifies users into weight categories, and provides daily energy-balance insights by combining food intake and exercise expenditure. This app includes a computer vision module powered by GoogLeNet Convolutional Neural Network (CNN) to streamline meal logging and reduce manual input. Target users include anyone interested in weight and fitness management, from underweight to obese, who are seeking clear, accessible, and actionable daily feedback.

## Features

- **Profile & Metrics:** Compute BMI and BMR from gender, height, weight, and age.
- **User Classification:** Categorize users into five groups (underweight, normal, overweight, obesity, extreme obesity).
- **Energy Balance Insights:** Provide tailored suggestions.
- **Food Recognition (GoogLeNet):** Image-based logging for supported items.
- **Exercise Calculator:** Pick an activity and duration to auto-estimate calories burned.
- **Summaries:** End-of-day caloric balance to indicate weight-loss/weight-gain trend.

### Current model scope

The included GoogLeNet model is trained on a limited set of classes and can only accurately recognize the following items: toast, pizza, ham, steak, egg, milk, juice, and diet coke.

## Requirements

Install MATLAB and the following toolboxes/support packages before running the app:
1. MATLAB Support Package for USB Webcams
2. Deep Learning Toolbox
3. Deep Learning Toolbox Model for GoogLeNet Network
4. Image Acquisition Toolbox
5. Image Acquisition Toolbox Support Package for OS Generic Video Interface
6. Curve Fitting Toolbox

## Quick Start

1. Download the **“AI Health App” folder**. For the app to function normally, **DO NOT** remove or rename any files in the folder, and ensure that all images are in **.jpg format**.
2. In MATLAB, open the **.mlapp file** in the “AI Health App” folder.
3. Ensure your webcam (or supported video device) is connected if you plan to use food recognition.
4. Run the app:
- Enter name, gender, height, weight, age to view BMI/BMR, category, and suggestions.
- Log food: Use the image-based recognizer for supported classes.
- Log exercise: Select an exercise and input time to auto-calculate calories burned.
- Review end-of-day net calories and insights.

## How It Works

- BMI/BMR calculated from demographic inputs (Fig. 1). The BMI category drives the suggestion shown in the UI (Fig. 2a-2e).
- Energy intake from the CNN recognizer (Fig. 4).
- Energy expenditure from selected exercises and durations (Fig. 5).
- Net calories displayed in the daily summary (Fig. 6). Negative values imply a weight-loss trend, and positive values imply a weight-gain trend.






## Limitations

The GoogLeNet model in this repo is a lightweight prototype trained on only eight classes. Accuracy is high within these classes but does not generalize beyond them. Consider expanding the training dataset and adding more supported food classes.

Actual nutritional values can vary by brand and portion size. Treat estimates as guidance.

## GoogLeNet Retrain

The **trainNet.mlx file** retrains GoogLeNet for image classification using transfer learning. It loads images from folders where each folder name is treated as a class label and applies data augmentation, including random rotation, reflection, and scaling, to prepare the dataset for training. The final layers of GoogLeNet are replaced to match the number of classes, and the network is trained using stochastic gradient descent with momentum (SGDM). 

During training, MATLAB’s training-progress window displays accuracy and loss curves for both the training and validation sets in real time. Once training is finished, the network is saved as **trainedGoogLeNet1.mat**, which can later be loaded for classification. 

To use the script, simply update the dataset path in the code and run **trainNet.mlx** in MATLAB. The script will automatically manage data preparation, training, and saving of the trained model.

**Note:** If you expand the training dataset with new classes, you must also update the calorie database in the main **.mlapp file** to keep it consistent with the retrained network.

## Disclaimer

This application is for information and educational purposes only and is not medical advice. Consult a healthcare professional for personalized guidance.

## Acknowledgements

GoogLeNet architecture for image classification (via Deep Learning Toolbox model).


