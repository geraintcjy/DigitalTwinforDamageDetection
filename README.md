## Digital Twin for Damage Detection

This is the online repository supporting my undergraduate final paper *Structural Damage Detection Based on Digital Twin and Physics-based Machine Learning*. The Matlab code uploaded here is for generating digital models, constructing datasets, running convolutional neural network trainings, and plotting drawings. I tried to make every piece of code as readable as possible, as plenty of comments were added to elaborate functionalities. However, feel free to reach out to me if you run into any trouble.

### Generating models and simulating structural responses under different conditions

Run command line in Matlab:

```matlab
RUN;
```

There're variables you need to customize. See comments inside.

### Constructing Datasets for  CNN training

Run command line in Matlab:

```matlab
PRECNN;
```

This makes saved .mat files loaded and reshaped for future CNN trainings.

### CNN

Run command line in Matlab:

```matlab
ALL_TRAIN; % 0-1 classification
C_TRAIN; % C classification
K_TRAIN; % K regression
```

Each command is for a unique training process of the digital twin prediction. ~~Read my paper for more details.~~ My paper is being revised for publication. I'll upload it as soon as I can. Thanks! XD

## Contact Me

geraintcjy@gmail.com





