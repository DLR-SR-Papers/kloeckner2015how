# How to Shape Noise Spectra for Continuous System Simulation

[Andreas Klöckner](https://github.com/akloeckner),
Andreas Knoblach and 
Andreas Heckmann.
How to Shape Noise Spectra for Continuous System Simulation. 
*11th International Modelica Conference*, **in press**

## Howto
1. The conceptual work-flow of our method is illustrated in [IRF_by_IFFT.m](IRF_by_IFFT.m) by reproducing Figure 6 from the paper.
2. The simulation results can be reprocued using the libraries provided on GitHub:
   * Download the [AdvancedNoise](https://github.com/DLR-SR/AdvancedNoise/releases/tag/v0.9.0) library.
   * Download the [Modelica_Noise](https://github.com/DLR-SR/Noise/releases/tag/v1.0-beta.1) library.
   * All results can be reproduced by simulating the models in `AdvancedNoise.Examples.RailIrregularities`.
   * For your convenience, the simulation data is provided as .mat files in the [data](data) folder.
3. Comparisons of the data are available via the following functions:
   * [CompareConvolution.m](CompareConvolution.m) to reproduce Figure 8.
   * [CompareSpaceDomain.m](CompareSpaceDomain.m) to reproduce Figure 9.
   * [ComparePhases.m](ComparePhases.m) to reproduce Figure 10.
   * [CompareCarModel.m](CompareCarModel.m) to reproduce Figure 11.
  

## BibTeX Reference
```
@INPROCEEDINGS{kloeckner2015how,
  author = {Andreas Kl{\"o}ckner and Andreas Knoblach and Andreas Heckmann},
  title = {How to Shape Noise Spectra for Continuous System Simulation},
  booktitle = {11th International Modelica Conference},
  year = {2015},
  address = {Versailles, France},
}
```

## Link to full text PDF
https://modelica.org/events/modelica2015/proceedings/html/submissions/ecp15118411_KlocknerKnoblachHeckmann.pdf

