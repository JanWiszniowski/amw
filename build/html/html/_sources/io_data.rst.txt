.. _io_data:

#################
Input/Output data
#################

General input data are
* ObsPy catalogs
* ObsPy streams
* ObsPy inventory

All data can be read from files or downloaded from seismic servers.
The downloaded depends on the server type,
but preferred are `MiniSEED`_ for waveforms and `StationXML`_ for the inventory
and `QuakeML`_ for the catalogue.

Two types of servers are defined
* FDSN web server
* ArcLink server
The FDSN web server communication is supported by ObsPy library.
The ArcLink server is obsolete in the ObsPy, therefore it required an additional library
from the older ObsPy version. Communication with the server is performed in the cache mode
(see Downloading data from servers)

Downloading data from servers
=============================

Downloading data from servers is performed in the cache mode
(see Downloading data from servers).
It means that the downloaded are stored in the disk cache, and next downloading
takes data from the file in the cache. It allows faster downloading in repeated calculations
or taking the data in the cache to the computer, which cannot access the server.
The downloaded data are preprocessed before storing on the cache disk. It speedup rereading,
but in the case of changing preprocessing, data must be reloaded.
The cache consists of downloaded stream or inventory files
and the file containing a description of what was downloaded.

Here is the example downloading file::

    {
        "smi:igf.edu.pl/LGCD_CIBIS_800586_PL.KWLC": {
            "source": {
                "source": "arclink",
                "host": "tytan.igf.edu.pl",
                "port": "18001",
                "user": "anonymous@igf.edu.pl",
                "timeout": 300,
                "net": "PL",
                "cache": "cache_Mw"
            },
            "stations": [
                "PL.KWLC"
            ],
            "begin_time": "2015-08-19T01:06:10.915125",
            "end_time": "2015-08-19T01:06:17.349625",
            "file_name": "cache_Mw/96559972-cee2-4da9-a30e-d997dd2736b2.msd",
            "preprocess_name": "Mw_preprocessing_1",
            "processing": {
                "PL.KWLC..EHZ": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 17, 344734)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 10, 914734))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ],
                "PL.KWLC..EHN": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 17, 344734)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 10, 914734))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ],
                "PL.KWLC..EHE": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 17, 344734)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 10, 914734))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ]
            }
        },
        "smi:igf.edu.pl/LGCD_CIBIS_800586_PL.MOSK": {
            "source": {
                "source": "arclink",
                "host": "tytan.igf.edu.pl",
                "port": "18001",
                "user": "anonymous@igf.edu.pl",
                "timeout": 300,
                "net": "PL",
                "cache": "cache_Mw"
            },
            "stations": [
                "PL.MOSK"
            ],
            "begin_time": "2015-08-19T01:06:13.726250",
            "end_time": "2015-08-19T01:06:16.183250",
            "file_name": "cache_Mw/4ca4c2fd-9131-46b7-83a2-d4874d09102a.msd",
            "preprocess_name": "Mw_preprocessing_1",
            "processing": {
                "PL.MOSK..EHN": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 16, 186531)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 13, 726531))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ],
                "PL.MOSK..EHZ": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 16, 186531)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 13, 726531))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ],
                "PL.MOSK..EHE": [
                    "ObsPy 1.4.1: trim(endtime=UTCDateTime(2015, 8, 19, 1, 6, 16, 186531)::fill_value=None::nearest_sample=True::pad=False::starttime=UTCDateTime(2015, 8, 19, 1, 6, 13, 726531))",
                    "ObsPy 1.4.1: remove_response(fig=None::inventory=<obspy.core.inventory.inventory.Inventory object at 0x000001C9B8CEF2B0>::output='VEL'::plot=False::pre_filt=[0.01, 0.05, 45, 50]::taper=True::taper_fraction=0.05::water_level=128::zero_mean=True)"
                ]
            }
        }
    }

The file in JSON format contains a dictionary,
where the dictionary key is the downloading event ID
and the dictionary value is the directory describing
the downloading parameters:

:source: (str) The server parameters,
:station: (list(str)) The list of station names. It must be the list even if one station is defined.
    **WARNING! The list contains all requested stations, not only downloaded.**,
:begin_time: (`UTCDateTime`_) The request begin time,
:end_time: (`UTCDateTime`_) The request end time,
:file_name: (str) The name of the stream file,
:preprocess_name: (str) The name of the preprocessing method,
:processing: (dict(str,list(str))) The preprocessing description - copy of the trace class
    processing instance.

File formats
============

All the `stream and inventory formats supported by
ObsPy <https://docs.obspy.org/packages/autogen/obspy.core.stream.read.html>`__
can be read from files or they are downloaded from seismic servers. The downloaded depends
on the server type.

Preferred are `MiniSEED`_ for waveforms and `StationXML`_ for inventory

ObsPy catalog are read from the `QuakeML`_ files

Output file
===========

The output file is the seismic catalogue supplemented with new moment magnitudes
in the `QuakeML`_ format

.. File format links:
.. _MiniSEED: http://ds.iris.edu/ds/nodes/dmc/data/formats/miniseed/
.. _QuakeML: https://quake.ethz.ch/quakeml/
.. _StationXML: http://docs.fdsn.org/projects/stationxml/en/latest/
.. _UTCDateTime: https://docs.obspy.org/packages/autogen/obspy.core.utcdatetime.UTCDateTime.html