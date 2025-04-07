.. _description:

######################
Theoretical Background
######################

Overview
========

Anthropogenic Mw inverts the P, S, or PS waves displacement spectral amplitude from
station recordings of a single event.

The source parameters are estimated at a station on a recording of the single wave :math:`c` (P, S)
or both waves (PS) by minimisation of

.. math::
    \underset{M_0,f_0} {\min} L^{\left(c\right)}= \|\widehat{U}^{(c)}\left( f|M_0,f_0\right),
    \widetilde{U}^{\left(c\right)}\left( f \right)\|

where :math:`\widehat{U}^{(c))}\left( f|M_0,f_0\right)` is the simulated spectrum of the wave
and :math:`\widetilde{U}^{(c)}\left(f\right)` is the displacement spectrum of the recorded wave.

Signal and noise spectrum
=========================

For each station, the code computes P, S, or PS waves displacement spectral amplitude
for each component :math:`x` (e.g., Z, N, E), within a predefined time window.

.. math::

   \widetilde{U}^{(c)}_x \left(f\right) =\frac{1}{2\pi f}
   \left| \int_{t^{(c)}_1}^{t^{(c)}_2} v_x(t)w(t) e^{-2 j \pi f t} dt \right|

where the exponent :math:`(c)` means that we are considering either P,
S, or both P and S waves, :math:`t^{(c)}_*` are the start and end times of
the P, S, or both P and S waves time window, :math:`v_x(t)` is the velocity time signal
for component :math:`x`, :math:`w(t)` is the tapper, and :math:`f` is the frequency.
The spectrum signal is scaled to the time signal according to Parseval's theorem

The same thing is done for a noise time window. However, it is done for a few separate time windows of noise
(Fig. 1), which allows us to estimate the mean noise spectrum and the variation of the noise spectrum,
which are used to modify the simulated spectrum and to weigh the spectral fitting.

.. figure:: ../imgs/example_with_noise.png
  :alt: Example stream plot with signal, source, and noise spectra
  :width: 600

  Example three-component trace plot (displacement), showing noise and S+P wave
  windows. Pick pointed as read at traces. The colors of traces are: Z - blue, NS - cyan, and EW - green.
  Windows and tappers are presented as dotted lines.
  The colors of spectra are: signal - black, pure source spectra at the station - green,
  source spectra with noise correction at the station - red, noise - blue
  (dotted lines mark the noise uncertainty)



The 3-D signal and noise spectra are the square root of the sum of component squares (e.g., Z, N, E) :

.. math::

    \widetilde{U}^{(c)} \left(f\right) = \sqrt{
    \left( \widetilde{U}^{(c)}_Z \left(f\right) \right)^2 +
    \left( \widetilde{U}^{(c)}_N \left(f\right) \right)^2 +
    \left( \widetilde{U}^{(c)}_E \left(f\right) \right)^2
    }.

Source spectral model
=====================

Assuming no correlation of the signal and noise :cite:t:`Pikoulis2020`,
the amplitude spectrum of the P or S, or both PS waves displacement spectra
in far, intermediate, and near fields for fitting to the signal (Fig. 1)
are modelled as

.. math::

    {\hat{U}}^{(c)}\left(f|M_0{,f}_0\right)=
    \sqrt{\left[S\left(f|M_0{,f}_0\right)G^{(c)}\left(f\right)\right]^2
    +\left[\hat{N}\left(f\right)\right]^2},

where :math:`S\left(f|M_0{,f}_0\right)` is the source function,
:math:`G^{(c)}\left(f\right)` is the response term,
the product propagation terms in far, intermediate, and near fields,
inelastic (internal) attenuation, and site effect,
:math:`\hat{N}\left(f\right)` is the noise estimated at a station including
the response of the recorder.

The :cite:t:`Boatwright1978`, :cite:t:`Boatwright1980` source frequency function is used

.. math::

    S\left(f|M_0,f_0\right)=
    {{\frac{1}{2\pi f}M}_0\left[{1+\left(\frac{f}{f_0}\right)}^{n\gamma}\right]}^\frac{-1}{\gamma}

where constant values :math:`\gamma` and :math:`n` controls the sharpness of the corners of the spectrum.
:cite:t:`Brune1970`, :cite:t:`Brune1971` model is a particular case of Boatwright's model
for :math:`n=2` and :math:`\gamma=1`.
However, there are no contraindications to using other source models.

More detailed information about the response term is described in the :ref:`api_main`.

.. _inversion_method:

Inversion method
================

The parameters determined from the spectral inversion are moment magnitude :math:`M_w` and scalar moment  :math:`M_0`
and corner frequency.

The inversion is performed by weighted spectra fitting.
Two distances were investigated:

1. The p-norm distance
    .. math::
        \left\| \textbf{x},\textbf{y} \right\|=
        \left[\sum_{f=f_{low}}^{f_{high}}{\left|x\left(f\right)-y\left(f\right)\right|^p\cdot
        w\left(f\right)}\right]^\frac{1}{p}

2. The logarithmic distance
    .. math::
        \left\| \textbf{x},\textbf{y} \right\|=
        \left[\sum_{f=f_{low}}^{f_{high}}{\left| \log\left( x\left(f\right) \right)-
        \log\left( y\left(f\right) \right)\right|^p\cdot
        w\left(f\right)}\right]^\frac{1}{p}

The weight coefficients are functions of frequency, signal spectrum,
and noise spectrum estimators:

.. math::

    w^{(c)}\left(f\right)=
    w\left(f,\ {\widetilde{U}}^{(c)}\left(f\right),\hat{N}\left(f\right),\sigma_N\left(f\right)\right),

where :math:`\sigma_N\left(f\right)` is a standard deviation of the noise spectrum estimator.

Different inversion algorithms can be used,
but a simple grid search algorithm is  built into the program,
which is sufficiently fast and accurate.
