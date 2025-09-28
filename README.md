# Deep-Learning-Health-App


## Description

A Deep Learning-Driven Fitness and Nutrition Assessment Application developed in MATLAB. It estimates BMI and BMR from basic demographic data, classifies users into weight categories, and provides daily energy-balance insights by combining food intake and exercise expenditure. This app includes a computer vision module powered by GoogLeNet Convolutional Neural Network (CNN) to streamline meal logging and reduce manual input. Target users include anyone interested in weight and fitness management, from underweight to obese, who are seeking clear, accessible, and actionable daily feedback.

## Features

- **Profile & Metrics:** Compute BMI and BMR from gender, height, weight, and age.
- **User Classification:** Categorize users into five groups (underweight, normal, overweight, obesity, extreme obesity).
- **Energy Balance Insights:** Provide tailored suggestions.
- **Food Recognition (GoogLeNet):** Vision-based logging for supported items.
- **Exercise Calculator:** Pick an activity and duration to auto-estimate calories burned.
- **Summaries:** End-of-day caloric balance to indicate weight-loss/weight-gain trend.

### Current model scope

The included GoogLeNet model (**trainedGoogLeNet1.mat**) is trained on a limited set of classes and can only accurately recognize the following items: toast, pizza, ham, steak, egg, milk, juice, and diet coke.

## Requirements

Install MATLAB and the following toolboxes/support packages before running the app:
1. MATLAB Support Package for USB Webcams
2. Deep Learning Toolbox
3. Deep Learning Toolbox Model for GoogLeNet Network
4. Image Acquisition Toolbox
5. Image Acquisition Toolbox Support Package for OS Generic Video Interface
6. Curve Fitting Toolbox

## Quick Start

1. Download the **“DL Health App” folder**. To ensure the app functions properly, **DO NOT** remove or rename any files within the folder, and make sure that all files are in the same folder with all images saved in **.jpg format**.
2. In MATLAB, open the **.mlapp file** in the “DL Health App” folder.
3. Ensure your webcam (or supported video device) is connected.
4. Run the app:
- Enter name, gender, height, weight, age to view BMI/BMR, category, and suggestions.
- Log food: Use the vision-based recognition module for supported classes.
- Log exercise: Select an exercise and input time to auto-calculate calories burned.
- Review end-of-day net calories and insights.

## How It Works

- BMI/BMR calculated from demographic inputs.
- BMI categories drive personalized suggestions shown in the UI.
- Energy intake estimated from the CNN food recognition module.
- Energy expenditure calculated from selected exercises and durations.
- Net calories displayed in the daily summary. Negative values indicate a weight-loss trend, and positive values indicate a weight-gain trend.

<p align="center">
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.1.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.2a.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.2b.png">
  </kbd>
</p>

<p align="center">
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.2c.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.2d.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.2e.png">
  </kbd>
</p>

<p align="center">
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.3.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.4.png">
  </kbd>
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.5.png">
  </kbd>
</p>

<p align="center">
  <kbd>
    <img width="200" src="https://github.com/kkaiiwen/Deep-Learning-Health-App/blob/main/Graphics/Fig.6.png">
  </kbd>
</p>

## Limitations

The GoogLeNet model in this repo is a lightweight prototype trained on only eight classes. Accuracy is high within these classes but does not generalize beyond them. Consider expanding the training dataset and adding more supported food classes.

Actual nutritional values can vary by brand and portion size. Treat estimates as guidance.

## GoogLeNet Retrain

The **trainNet.m file** retrains GoogLeNet for image classification using transfer learning. Images should be organized into folders where each folder name corresponds to a class label. The training and validation sets must use the same folder structure but contain different images. The script applies data augmentation, including random rotation, reflection, and scaling, to the training set to improve generalization. The final layers of GoogLeNet are replaced to match the number of classes, and the network is trained using stochastic gradient descent with momentum (SGDM). 

During training, MATLAB’s training-progress window displays accuracy and loss curves for both the training and validation sets in real time. Once training is finished, the network is saved as **trainedGoogLeNet1.mat**, which can later be loaded for classification. 

To use the script, update the dataset paths in the code with your prepared training and validation sets, then run **trainNet.m** in MATLAB. The script will automatically handle data preparation, training, and saving of the trained model.

**Note:** If you expand the training dataset with new classes, you must also update the calorie database in the main **.mlapp file** to keep it consistent with the retrained network.

## Disclaimer

This application is for information and educational purposes only and is not medical advice. Consult a healthcare professional for personalized guidance.

## Acknowledgements

GoogLeNet architecture for image classification (via Deep Learning Toolbox model).


