.. _configuration:

##################
Configuration file
##################

The configuration is kept in the Python dictionary,
where keys are case-sensitive strings and values depend on parameters.
They can be strings, float values, integer values, boolean values, sub-dictionaries, or lists.
Parameters definition can be required or optional. The required definitions must be in the configuration,
whereas optional need not. When definition of optional parameters is missing the default value is taken.
The information whether parameter is required or optional is with the parameter description.
In the case of optional parameter the default value is described.
The configuration file (example name: ``config.json``) is a file in JavaScript Object Notation (JSON)
Here is the example file::

    {
      "station_parameters" : {
        "any" : {
          "phase_parameters": {
            "P" : {
              "Q_0" : 800.0,
              "Q_theta" : 0.0,
              "Q_corner" : 0.0,
              "kappa" : 0.0,
              "distance_exponent" : 1.0,
              "low_frequency" : 7.50000000000000010e-001,
              "high_frequency" : 3.00000000000000000e+001,
              "noise_bias" : 0.00000000000000000e+000,
              "noise_std_bias" : 0.00000000000000000e+000,
              "noise_freq_bias" : 0.00000000000000000e+000
            },
            "S" : {
              "Q_0": 400.0,
              "Q_theta": 0.0,
              "Q_corner": 0.0,
              "kappa": 0.0,
              "distance_exponent": 1.0,
              "low_frequency": 7.50000000000000010e-001,
              "high_frequency": 3.00000000000000000e+001,
              "noise_bias": 0.00000000000000000e+000,
              "noise_std_bias": 0.00000000000000000e+000,
              "noise_freq_bias": 0.00000000000000000e+000
            }
          },
          "far_radial_average_radiation" : 0.52,
          "far_transversal_average_radiation": 0.63,
          "mw_correction" : 0.00000000000000000e+000,
          "consider_intermediate_field": false,
          "consider_near_field": false
        }
      },
      "default_rho": 2700.0,
      "default_vp": 5200.0,
      "default_vs": 3000.0,
      "method": "separate_phases",
      "metric": "lin",
      "source_model": "Brune",
      "taper" : {
        "type" : "cosine_taper",
        "percentage" : 10
      },
      "stream": {
        "source": "arclink",
        "host": "tytan.igf.edu.pl",
        "port": "18001",
        "user": "anonymous@igf.edu.pl",
        "timeout": 300,
        "net": "VN",
        "cache" : "cache_Mw"
      },
      "optimization": {
        "method": "grid_search",
        "mw": [0.0, 5.01, 0.05],
        "log_f0": [-0.6, 1.51, 0.05]
      },
      "inventory": {
        "file_name": "VN_Stations.xml",
        "file_format": "STATIONXML"
      },
      "remove_response": {
        "prefilter": [0.01, 0.2, 45, 50]
      },
      "plot": {
        "draw_the_noise": false,
        "draw_source_spectrum_without_the_noise": true,
        "own_frequencies": [0.1, 30, 0.1],
        "view": "DISP",
        "how_to_show": "many figures inline"
      }
    }

Below is the description of parameters. Not all described bellow parameters are in the example,
not all parameters are required and some of them are optional.
If optional parameters are not defined, default values are assumed.

:station_parameters: (dict) describe all parameters required to estimate the Mw
    at the station. The value is the list of stations, where keys are station names
    and vales are sub-dictionaries of parameters for the current station.
    The magic station's name is ``any``. When the station configuration is missing or
    the specific station parameter is missing, it will be taken from the ``any`` station.
    (required)
:velocity_model: (str) (optional, default value is "constant"). Now, only "constant" is available.
    Other velocity models have not been implemented yet.
:default_rho: (float) Default value of density [kg/m^3] (required),
:default_vp: (float)  Default value of the P wave velocity [m/s] (required),
:default_vs: (float) Default value of the S wave velocity [m/s] (required),
:method: (str) (required) the moment magnitude spectral estimation method.
    Two options are available:

    * "separate_phases" - estimation of Mw base on P wave and/or S wave, and the common magnitude is
      calculated based on :math:`Mw^{(P)}` and :math:`Mw^{(S)}`
    * "multiphase" - estimate Mw base signal covering both P and S wave.

:metric: (str) The metric distances used for spectra fitting.
    Two metrics are available: p_norm (lin) and log (See :ref:`inversion_method`),
    (optional, default value is "p_norm"),
:p_value: (float) The power of the values distances in the metric. (See :ref:`inversion_method`)
    (optional, default value is 2.0)
:source_model: (str) (optional, default value is "Brune")
:Boatwright gamma: (float) (optional, default value is 1.0)
:Boatwright n: (float) (optional, default value is 2.0)
:taper: (dict) the signal :ref:`Taper parameters` for Fourier transform (required)
:stream: (dict) :ref:`Stream parameters` describing how to get streams for magnitude estimation (required)
:optimization: (dict) :ref:`Optimization parameters` defining the minimization method of signal and source spectra
    difference (required)
:inventory: (dict) (required) The dictionary of parameters defining how to get the inventory of all stations
    (see :ref:`Inventory parameters`)
:remove_response: (dict) Parameters required for stream preprocessing (required).
    They are described in the :ref:`Remove response parameters` section.
:plot: (dict) define the results :ref:`Plot parameters`
    (optional, if the position is not defined no plot is performed)
:output_file: (str) The name of the output file in which the catalog with estimated magnitudes will be saved
    (optional, default value is "output.xml")
:module: (str) (optional, default value is "MinimizeInGrid")
:method: (str) (optional, default value is "minimize")
:catalog_file: (str) The catalog file name (required unless the name is the call parameter).
:allowed_channels": (list(str(2)) The list of two first letters of allowed channel names, e.g., ["HH", "EH"]
    (optional, if missing channel names are not verified)
:no_noise_windows: (optional, default value is 6)
:remove_outliers: (dict) Removing station magnitude outliers parameters
    described in the :ref:`Remove outliers parameters` section.

Not predefined parameters
#########################

Not predefined parameters are created during computation and should not be predefined.

:Plotter: (PlotMw) It keeps the plotter class object. Do not define it.

Station parameters
##################

Station parameters consts of

**phase_parameters:**
    (dict)
    It describes all parameters required to estimate the Mw
    at the phase. There could phases ``P``, ``S``, and ``any``.
    The parameter is taken from the ``any`` phase if the parameter is missing in ``P`` or ``S`` phases sub-dictionaries.
    (see :ref:`Phase parameters`)
**far_radial_average_radiation:**
    (float)
    The average radiation in the far field radial direction.
    It is the same as P wave average radiation in the far field (optional, default value is 0.52)
**far_transversal_average_radiation:**
    (float)
    The average radiation in the far field transversal directions.
    It is the same as S wave average radiation in the far field (optional, default value is 0.63)
**mw_correction:**
    (float)
    Empirical Mw correction at the particular station
    (optional, default value is 1.0).
    It consists of a correction value added to the estimated value before the saving.
    It was shown in :cite:`Wiejacz2006` the correction is required in some cases.
**consider_intermediate_field:**
    (bool)
    If it is true, the source spectrum calculation considers the intermediate field
    (optional, default value is false)
**intermediate_p_radial_average_radiation:**
    (float)
    The average P wave radiation in the intermediate field radial
    direction (optional, default value is 4.0 * far_radial_average_radiation)
**intermediate_p_transversal_average_radiation:**
    (float)
    The average P wave radiation in the far field transversal
    directions (optional, default value is -2.0 * far_transversal_average_radiation)
**intermediate_s_radial_average_radiation:**
    (float)
    The average S wave radiation in the intermediate field radial
    direction (optional, default value is -3.0 * far_radial_average_radiation)
**intermediate_s_transversal_average_radiation:**
    (float)
    The average S wave radiation in the far field transversal
    directions (optional, default value is 3.0 * far_transversal_average_radiation)
**consider_near_field:**
    (bool)
    If it is true,
    the source spectrum calculation for common P and S waves considers the near field
    (optional, default value is false)
**near_radial_average_radiation:**
    (float)
    The average radiation in the far field transversal
    directions(optional, default value is 9.0 * far_radial_average_radiation)
**near_transversal_average_radiation:**
    (float)
    The average S wave radiation in the far field transversal
    directions (optional, default value is -6.0 * far_transversal_average_radiation)
**weight:**
    (float)
    The station weight for computation of the event magnitude part from the current station magnitude
    (optional, default value is 1.0)

Phase parameters
================

Phase parameters (``phase_parameters``) consts of

The parameters below define the internal (inelastic) dumping by the formula

.. math::

    A\left(f\right)=exp\left(\frac{-\pi Tf}{Q\left(f\right)}\right),

where :math:`Q\left(f\right)` is is given by

.. math::

    Q\left(f\right)=Q_0\left(\frac{f_q+f}{f_q}\right)^\vartheta,

or not considering cornel frequency

.. math::

    Q\left(f\right)=Q_0\left( f \right)^\vartheta,

where:

:Q_0: (float) define the :math:`Q_0` value (required)
:Q_theta: (float) define the :math:`Q_{\theta}` value (optional, default value is 0.0)
:Q_corner: (float) define the :math:`f_q` value (optional, default value is 0.0,
    which means the second formula, not considering cornel frequency, is used)

The parameters below define the site near surface amplification and dumping according the formula

.. math::

    R\left(f\right)=R_c \exp\left(-\pi \kappa f\right)

where:

:kappa: (float) define the dumping :math:`\kappa` value (optional, default value is 0.0)
:surface_correction: (float) define the free surface amplification :math:`R_c` value
    (optional, default value is 1.0)


These parameters define the site amplification and dumping by the formula for the current phase
when the signal is calculated in the far field.
In the more fields. The signal correction is accordingly:

* P phase - the radial component of the signal
* S phase - the transversal component of the signal

:distance_exponent: (float) 1.0, **Not used in current solution**

The frequency limits are defined for phases, but in the case of the PS-wave method the
P wave values are considered.

:low_frequency: (float) lowest frequency of spectra fitting (optional, default value is 0.5)
:high_frequency: (float) highest frequency of spectra fitting (optional, default value is 20.0)

The parameters below modify (bias) the noise correction. We notice that slight noise bias
protects occasional estimation of wrong high magnitude and low cornel frequency in the
case of small signals and low-frequency noise
The noise is biased by the formula:

.. math::

    \widehat{N} \left( f \right) =
    \overline{N} \left( f \right)\left( 1+b_Nf^{b_f} \right) + b_{\sigma}\sigma_N

where:

:noise_bias: (float) define the :math:`b_N` value (optional, default value is 0.0)
:noise_std_bias: (float) define the :math:`b_{\sigma}` value (optional, default value is 0.0)
:noise_freq_bias: (float) (optional, default value is 0.0) define the :math:`b_ff` value

:weights: (dict) the definition of fitting weights assessment (optional, default value is None)

:window: (dict) The signal window period for spectra computation
    (optional, if missing, the window is set based on S - P time).
    It contains two coefficients :math:`b_1` and :math:`b_2` defined by keys "b1" and "b2".
    The window time is calculated according to :math:`\tau = r^{b_1} / 10^{b_2}`
:length: The minimal S-wave window (optional, default  = 2 s)
:P-S: The part of P-S time taken as P wave window (optional, default value is 0.9)

Phase weights parameters
------------------------

:use_threshold: (float) the binary weights threshold :math:`T_h`

    .. math::
        w = \left\{ {\begin{matrix} 1:\Delta \le T_h \\
        0:\Delta < T_h \end{matrix}} \right\}

    If the parameter use_threshold is missing or None, weights take real values

    .. math::
        w = \left\{ \begin{matrix}
        0 & : & \Delta \le 0 \\
        \Delta & : & 0 < \Delta < 1\\
        1 & : & \Delta \ge 1
        \end{matrix} \right\}

    (optional, default is None)
:use_logarithm: (bool) the :math:`\Delta` calculation method.
    If the "use_logarithm" parameter exists and is true

    .. math::
        \Delta = \log\left(U \right) - \log\left( N \right)

    else

    .. math::
        \Delta = \frac{U-N}{U}

    where :math:`U` is the seismic signal and :math:`N` is the noise term
    computed based on the mean value and standard deviation of noise
    (optional, default value is false)
:use_std: (float) the coefficient of the part of the standard deviation of noise
    in the nose term computation. When the use_std is set to :math:`s` value

    .. math::
        N = \bar{N} + s\delta{N}

    else

    .. math::
        N = \bar{N}

    where :math:`\widehat{N}` is the mean value of noise,
    :math:`\delta{N}` is the standard deviation of noise,
    and :math:`s` is the "use_std" parameter
    (optional, default is None)

:use_frequency: (float) The option,
    whether use frequencies in as fitting weighting (optional, default is None).
    The parameter defines the value :math:`f_w` in the formula

    .. math::
        w = w\left| f - f_m \right|^{f_w}

:use_main_frequency: The option, whether use main frequency in the middle of testing band
    for fitting weighting (float) (optional, default is 0).
    The parameter defines the value :math:`f_m`

**The phase P parameters are treated as both phase parameters in the case
of multiphase spectral Mw estimation.**


Taper parameters
################

:type: (str) The taper type (required, only available type is now "cosine_taper")
:percentage: (float) Percentage of cosine taper (optional, default value is 10)
:half_cosine: (bool) If it is true, the taper is a half cosine function,
    otherwise, it is a quarter cosine function (optional, default value is true)

Stream parameters
#################

:source: (str) The web server source type (required, available options "arclink", "fdsnws")
:host: (str) Host name (required)
:port: (int) Server port number, (optional)
:user: (int) User name, (required for arclink)
:timeout: The waiting time for the server response (optional)
:net: (str) The network code (required if `stations` parameter is missing)
:loc: (str) The location filter (optional)
:chan: (str) Channels filter (optional)
:stations: (list(str)) list of station names. When stations names are in the form "NN.SSSS"
    where "NN" is the network code and "SSSS" is the station code.
    The "net" parameter can be omitted.
    If stations names are in the form "SSSS", the "net" parameter must be defined.
    It is possible to define in the list individual channels in the form "NN.SSSS.LL.CCC"
    where "LL" is a location code (can be empty) and "CCC" is the channel code.
:cache: (str) the cache directory (optional, if missing data are not cached)

Optimization parameters
#######################

:module: (str) The module name containing the optimization function (optional, default is "MinimizeInGrid"),
:method: (str) The optimization function name (optional, default is "grid_search"),
:mw: (list) This parameter is required for the grid search optimization.
    It is the list of three values describing the grid whose magnitude was checked.
    They are: initial value, upper limit, and the step e.g.  [0.0, 5.01, 0.05],
:log_f0: (list) This is the parameter required for the grid search optimization.
    It is the list of three values describing the grid in which logarithms were checked.
    They are: the initial value, upper limit, and the step, e.g. [-0.6, 1.51, 0.05]

Inventory parameters
####################

The `Inventory parameters` describe how to read station inventories.

:file_name: The file name of the inventory file (optional, default value is "inventory.xml").
    When the file doesn't exist, the program tries to download the inventory to the file
    from the server defined in :ref:`Stream parameters`,
:file_format: The inventory format (optional, default value is "STATIONXML").
    It is not required when the inventory file exists


Remove response parameters
##########################

The remove response parameters are compatible with the ObsPy response removing
:water_level: (int) (optional, default value is 128)
:prefilter: (list(4*float)) The prefilter coefficients.
:output: (str) (optional, default value is "VEL")

Plot parameters
###############

**do_not_draw:**
    (bool)
    When this parameter exists and is true, results are not plotted.
    This parameter allows turn off plotting without erasing plot configuration
    (optional, default value is false)
**draw_the_signal_spectrum:**
    (bool)
    When this parameter exists and is false,
    the signal spectrum is not plotted.
    Usually, this parameter is missing and useless (optional, default value is true)
**draw_the_noise:**
    (bool)
    When this parameter exists and is true,
    the noise spectrum is plotted (optional, default value is false)
**draw_the_noise_uncertainty:**
    (bool) When this parameter exists and is true,
    The dotted linie describing the high noise spectrum uncertainty levels is plotted
    (optional, default value is false)
**draw_the_noise_correction:**
    (bool)
    When this parameter exists and is true,
    the noise correction value, which needn't be the same as the noise, is plotted
    (optional, default value is false)
**draw_source_spectrum_without_the_noise:**
    (bool)
    When this parameter exists and is true,
    the source spectra corrected by Green function but by noise is plotted in green
    (optional, default value is false)
**draw_source_spectrum_with_the_noise:**
    (bool)
    When this parameter is missing or is true,
    the final source spectrum is plotted
    (optional, default value is true)
**own_frequencies:**
    (list(float, float, int))
    Used to define spectra frequency for viewing the source function simulation.
    consists of low frequency, high frequency, and the number of frequency points, e.g. [0.1, 30, 25]
    (required in the `test_greens_function`)
**view:**
    (str)
    Defines the result plotting method
    (optional, allowed values "DISP" - displacement or "VEL" = velocity, default value is "VEL")
**how_to_show:**
    (str)
    Defines the result plotting method. Three methods can be used

    * "single figure" - all stations are plotted in one figure. Each row is one station,
    * "many figures" - each station is plotted in separate figures - signals at the top

Remove outliers parameters
==========================

The remove outliers procedure remove station magnitude
if the station magnitude differs by a multiple of the standard deviation
from the mean magnitude value calculated for a certain central quantile interval.
Two parameters are defined:

:quantile: (float, float) Values of central station magnitude quantile interval
    (optional, default range is [0.25, 0.75])
:multiple_deviation: (float) The multiple of the standard deviation for the station magnitude rejection.
    (optiopal, default value is 3.0)