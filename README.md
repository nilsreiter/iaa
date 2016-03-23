# Inter-Annotator-Agreement

This repository contains code to calculate inter-annotator-agreement (Fleiss' Kappa at the moment) on the command line using awk.

## Fleiss' Kappa

Calculates [Fleiss' kappa](https://en.wikipedia.org/wiki/Fleiss%27_kappa)
```
$ awk -f kappa.awk FILENAME
```

Testing
```
$ awk -f kappa.awk test.csv
0.209931
```

`test.csv` contains the same data as on the Wikipedia page as an example.


## Accuracy
```
$ awk -f accuracy.awk FILENAME
```

Testing 
```
$ awk -f accuracy.awk test-accuracy.tsv
0.528571
```