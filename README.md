
# PRADclass: predicting the differentiation and aggressiveness of prostate cancers

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7844579.svg)](https://doi.org/10.5281/zenodo.7844579)

[PRADclass](https://apalania.shinyapps.io/PRADclass) is a web-server / standalone tool providing a model for predicting the differentiation and aggressiveness of prostate cancers based on gene expression data of select biomarkers. PRADclass is written in R and meant for academic use; commercial uses require license from the Authors ([Dr Ashok Palaniappan](mailto:apalania@scbt.sastra.edu)). 

#### Confusion Matrix: 
This is the performance of PRADclass for the external validation described in our manuscript. Setting a prediction probability threshold ~ 0.4 obtains the following multi-class confusion matrix: 

| *Ref/Pred* |C  |I  |A  |
|:---:|---|---|---|
| __C__ |3  |0  |0  |
| __I__ | 2 |82 |16 |
| __A__ | 1 |3  |14 |

where Reference (ground truth) in rows & Predicted class in columns; C: Control, I: Indolent, A: Aggressive.
This yields a balanced accuracy of ~  0.86. Instances with prediction probability < 0.4 were deemed ambiguous, and the four such instances were ignored in constructing the confusion matrix. 


PRADclass.R
------------

    > source PRADclass.R
    
* Requests sample input from user, containing gene expression values of selected biomarkers (for a sample dataset, please see 'Datasets' below).
* Loads the Random_Forest.rds model object and predicts the sample class (benign, indolent, or aggressive) along with the probability of the predicted class. 
	- If the prediction probability is weaker than 0.4, then the predicted class is deemed '_Ambiguous_'. 
* Provides a refined command-line interface for: [PRADclass](https://apalania.shinyapps.io/PRADclass) webserver.
    
Models
-------

We provide the RDS objects of the best-performing models from our work (refer the Citation). These could be used in an Ensemble Classifier model for academic purposes.
	
    1. Random_Forest.rds: The Random Forest model built on the full TCGA PRAD dataset that is at the heart of [PRADclass](https://apalania.shinyapps.io/PRADclass)
    2. XGBoost.rds: One of the other best-performing models based on XGBoost (refer the Citation)
    3. SVM_radial.rds: One of the other best-performing models; these could be used in an e 


Datasets
--------
    
1. valid_dataset.csv: File format used as input to PRADclass, both the web-server and command-line tool. Expression values of the biomarkers are provided one sample per line, in a comma-separated format, with a header line indicating the order of the biomarkers. 
        
2. valid_dataset_PredProb.csv: Input file used for validating PRADclass, with samples from DKFZ-PRAD and Suntova et al (please refer our manuscript for details and citation). Provides the predicted class of each sample, concordance with the ground truth, and the probabilitiy of the point prediction. A prediction probability threshold ~0.4 has been applied, highlighting the four predictions with weak evidence.  
        
Citation
----------

Please cite us!

Balraj AS*, Muthamilselvan S*, Raaja R, Palaniappan A. (2023) PRADclass: Hybrid Gleason grade-informed computational strategy identifies consensus biomarker features of prostate adenocarcinoma that predict aggressive cancer. **Technology in Cancer Research and Treatment** (accepted); doi: 10.1177/15330338231222389

Copyright & License
-------------------

Copyright (c) 2023, the Authors @ [SASTRA University](https://www.sastra.edu). MIT License. 


