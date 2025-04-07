.. _installation:

###############
Mw installation
###############

Magnitude Mw requires at least Python 3.7. All the required dependencies
will be downloaded and installed during the setup process.

Installing the latest release
-----------------------------

To keep Anthropogenic Mw updated, run:

::

   pip install --upgrade amw

from within your environment.


Using pip and PyPI
~~~~~~~~~~~~~~~~~~

The latest release of Anthropogenic Mw is available on the `Python Package
Index <https://pypi.org/project/amw/>`__.

You can install it easily through ``pip``:

::

   pip install amw

To upgrade from a previously installed version:

::

   pip install --upgrade amw

Installing a developer snapshot
-------------------------------

If you need a recent feature that is not in the latest release (see the
"unreleased" section in :ref:`changelog`),
you want to use the more recent development snapshot from the `Anthropogenic Mw
GitHub repository <https://github.com/JanWiszniowski/amw>`__.

Using pip
~~~~~~~~~

The easiest way to install the most recent development snapshot is to download
and install it through ``pip``, using its builtin ``git`` client:

::

    pip install git+https://github.com/JanWiszniowski/amw.git

Run this command again, from time to time, to keep Anthropogenic Mw updated with
the development version.

Cloning the Anthropogenic Mw and Mw GitHub repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you want to take a look at the source code (and possibly modify it 😉),
clone the project using ``git``:

::

    git clone https://github.com/JanWiszniowski/amw.git

or using SSH:

::

    git clone git@github.com:SeismicSource/amw.git

(avoid using the "Download ZIP" option from the green "Code" button, since
version number is lost).

Then, go into the ``amw`` main directory and install the code in
"editable mode" by running:

::

    pip install -e .

You can keep your local Anthropogenic Mw repository updated by running ``git pull``
from time to time. Thanks to ``pip``'s "editable mode", you don't need to
reinstall Anthropogenic Mw after each update.
