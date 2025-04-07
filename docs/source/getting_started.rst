.. _getting_started:

###############
Getting Started
###############

.. note::

    For the impatient

    To run the example, call

    ``spectral_Mw -c example\STr2_test.xml example\STr2_Mw.json``

    or

    ``spectral_Mw -c example\LUMINEOS_test.xml example\LUMINEOS_Mw.json``

    The example catalog you can download from https://github.com/JanWiszniowski/amw/example

Both Mw programs ``spectral_Mw`` and ``view_green_fun`` require the configuration file
in the `JSON`_ format.
The configuration file name is the only calling parameter that is always required.
It is described in the :ref:`Configuration file <configuration>` section.
Seismic signal can be read from the MiniSEED file or downloaded from servers.

Spectral Mw calculation
#######################

The spectral Mw is calculated by ``spectral_Mw``

Use case: external server
=========================

You must modify the :ref:`configuration` file and then run ::

    spectral_Mw -q event.xml configuration.json,

where event.xml is an example of the catalog file name
and configuration.json is an example of the configuration file name.

`FDSNWS`_
---------

If you have access to `FDSNWS`_ server configure at least::

    "stream": {
        "source": "fdsnws",
        "host": host_name,
        "net": net_code
    },

`ArcLink`_
----------

If you have access to `ArcLink`_ server configure at least::

    "stream": {
        "source": "arclink",
        "host": host_name,
        "port": "18001",
        "user": "anonymous@",
        "net": net_code
    },

Use case: files
===============

1. Prepare the the :ref:`configuration` file
2. Run ``spectral_Mw -s traces.mseed -q event1.xml configuration.json``,
    where seismic recordings are in `miniSEED`_ format (e.g., ``traces.mseed``),
    metadata are in `StationXML`_ format (metadata file name is in the configration file, e.g., ``station.xml``)
    and event information is in `QuakeML`_ format (e.g., ``event.xml``).

Command line arguments
======================

After successfully installing Anthropogenic Mw (see :ref:`installation`),
you can get help on the command line arguments used by each code by typing from
your terminal:

::

    spectral_Mw -h

Source spectra visualization
############################

Source spectra are plotted by ``view_green_function``.
Call ::

    view_green_fun configuration.json

.. File format links:
.. _miniSEED: http://ds.iris.edu/ds/nodes/dmc/data/formats/miniseed/
.. _QuakeML: https://quake.ethz.ch/quakeml/
.. _StationXML: http://docs.fdsn.org/projects/stationxml/en/latest/
.. _JSON: https://www.json.org/json-en.html
.. _FDSNWS: https://www.fdsn.org/webservices/
.. _ArcLink: https://www.seiscomp.de/seiscomp3/doc/applications/arclink.html