# AMW Changelog

Earthquake source parameters from P, S, or PS waves displacement spectra
in far, intermediate, and near fields

Copyright (c) 2024-2025 Jan Wiszniowski <jwisz@igf.edu.pl>

## v0.0.1 - 2024-12-06

Initial Python version.

[Discussions]: https://github.com/JanWiszniowski/amw/discussions

## v0.0.2 - 2025-04-07

Removing channels, which names are not at the list
Configuration of number of windows for noise estimation
Removing station magnitude outliers parameters

## v0.0.3 - 2025-05-01

Choosing the right station when reading waveforms from a file
Handling the case when the file does not have enough signal interval
before the P-wave onset for the noise estimation.

## v0.0.4 - 2025-07-01

Extended ArcLink and FDSNWS connection configuration options
to all library capabilities

## v0.0.5 - 2026-02-21

Ability to not report many times the same initial downloading failure.
Ability to retry waveform downloading if a previous downloading failure.
Corrected bug with finding a specified magnitude type from an event.
The bug of none preprocessing description 