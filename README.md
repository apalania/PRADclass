


# PRADclass: predicting the differentiation and aggressiveness of prostate cancers

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7844578.svg)](https://doi.org/10.5281/zenodo.7844578)

[PRADclass](https://apalania.shinyapps.io/PRADclass) is a web-server / standalone tool providing a model for predicting the differentiation and aggressiveness of prostate cancers based on gene expression data of select biomarkers. PRADclass is strictly for academic use; commercial uses require license from the Authors. 

with Prediction probabilities.
Confusion Matrix
Predicted
Aggressive 
Control 
Indolent
Reference
Aggressive 
14
1
3
Control 
0
3
0
Indolent
16
2
82
A balanced accuracy of ~  0.86 was obtained on excluding the inconclusive predictions based on analyzing the prediction probability

PRADclass.R
------------

    > source PRADclass.R
    
    1. Requests sample input from user, containing gene expression values of selected biomarkers (for a sample dataset, please see 'Datasets' below).
    2. Predicts the sample class (benign, indolent, or aggressive) along with the probability of the predicted class. 
    3. A prediction probability threshold 0f 0.4 is suggested; if the prediction probability is weaker than 0.4, then the predicted class may be unreliable. 
    4. Provides a command-line interface for [PRADclass](https://apalania.shinyapps.io/PRADclass)
    
MODELS
-------

We provide the RDS objects of the best-performing models from our work (refer the Citation). These could be used in an Ensemble Classifier model for academic purposes.
	
    1. Random_Forest.rds: The Random Forest model built on the full TCGA PRAD dataset that is at the heart of [PRADclass](https://apalania.shinyapps.io/PRADclass)
    2. XGBoost.rds: One of the other best-performing models based on XGBoost (refer the Citation)
    3. SVM_radial.rds: One of the other best-performing models; these could be used in an e 


Datasets
--------
    
    1. valid-csv: Create's a Picked Model for each of the sklearn classifers stated below:
        AdaBoostClassifier(),
        GaussianNB(),
        KNeighborsClassifier(),
        DecisionTreeClassifier(),
        RandomForestClassifier(),
        MLPClassifier()
    2. valid_dataset_PredProb.csv
    
    
Citation
----------

Please cite and support us!
Balraj AS*, Muthamilselvan S*, Raaja R, Palaniappan A. (2023) PRADclass: Hybrid Gleason grade-informed computational strategy identifies consensus biomarker features of prostate adenocarcinoma that predict aggressive cancer. (medxriv preprint; submitted)

Copyright & License
-------------------

Copyright (c) 2023, the Authors @ [SASTRA University](www.sastra.edu). MIT License. 


