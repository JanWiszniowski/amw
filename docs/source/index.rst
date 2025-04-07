.. Mw documentation master file, created by
   sphinx-quickstart on Wed Nov 13 15:12:56 2024.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Mw documentation
================
**Moment magnitude estimation of small local earthquakes**

:Copyright: 2024-2025 Jan Wiszniowski jwisz@igf.edu.pl
:Version: |version|
:Release: |release|

The Anthropogenic Mw package is designed for the determination of the moment magnitude (Mw)
of small and local earthquakes, where stations are close to hypocenters.
Such situations often occur in anthropogenic events, and this algorithm was developed to calculate Mw
of mining-induced and reservoir-triggered earthquakes. Hence, the package name is *Anthropogenic Mw*.
However, it can also be used for natural events and is recommended for local ones.

The method of Mw computation based on spectral displacement amplitude is elaborated.
Mw is computed using a fitting of displacement spectra of seismic waves recorded at stations
to the simulated spectrum in the far field with the estimation of the noise.
As proposed, it allows for estimating Mw based on a single P or S wave spectra.
However, a combined spectrum of two waves together and spectrum simulation in intermediate and near fields
was applied to Mw estimation as an innovation.
The algorithm automatically estimates the station magnitude of small and close events.

Go to section :ref:`Theoretical Background <description>`
to get more information on how the code works.

Mw is written in Python and requires a working Python
environment and same Python packages to run (see :ref:`Installation <installation>`).

The *Anthropogenic Mw* package primarily provides several functions and classes for estimating Mw,
but it also provides a few command line tools:

-  :code:`spectral_Mw`: Compute moment magnitudes from all events in the QuakeMl catalog
   and add them to the catalog.
-  :code:`view_greens_function`: Direct modelling of P, S, and PS waves spectra in far, intermediate,
   and near fields based on user-defined earthquake source parameters,
   for various hypocentral distances and
   plot the results in the frequency domain.

.. toctree::
   :numbered:
   :maxdepth: 4

   description
   getting_started
   configuration
   io_data
   installation
   getting_help
   contributing
   citing
   api
   changelog
   bibliography

##################
Indices and tables
##################

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`