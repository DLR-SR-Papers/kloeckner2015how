
% This file requires Dymola M-files installed to import Dymola results.
% The converted result files are provided in the repository.

%% Convert FilterAndConvolution
file = 'D:/FilterAndConvolution.mat';
d               = dymload(file);
time            = dymget(d, 'Time');
position        = dymget(d, 'position.y');
noise           = dymget(d, 'spaceDomainNoiseWhite.y');
filter          = dymget(d, 'spaceDomainFilter.y');
convolution     = dymget(d, 'spaceDomainNoiseMinimum.y');
save FilterAndConvolution time position noise filter convolution

%% Convert SpaceAndTimeDomain
file = 'D:/SpaceAndTimeDomain.mat';
d               = dymload(file);
time            = dymget(d, 'Time');
position        = dymget(d, 'position.y');
filter          = dymget(d, 'timeDomainFilter.y');
convolution     = dymget(d, 'spaceDomainNoiseMinimum.y');
save SpaceAndTimeDomain time position filter convolution

%% Convert MinimumAndZeroPhase
file = 'D:/MinimumAndZeroPhase.mat';
d               = dymload(file);
time            = dymget(d, 'Time');
position        = dymget(d, 'position.y');
zero            = dymget(d, 'spaceDomainNoiseZero.y');
minimum         = dymget(d, 'spaceDomainNoiseMinimum.y');
sample          = dymget(d, 'spaceDomainNoiseMinimum.samplePeriod')'*[1 0]';
save MinimumAndZeroPhase time position zero minimum sample

