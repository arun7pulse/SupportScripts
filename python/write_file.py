#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: Writting to file.

from datetime import datetime

LOG_DATE = datetime.now().strftime('%Y%m%d%H')
LOG_FILE = 'sample-' + str(LOG_DATE)+'.log'

with open(LOG_FILE, 'w') as f:
    print("Sample File name - {}".format(LOG_FILE), file=f)

with open(LOG_FILE, 'a') as f:
    print("Sample text ", file=f)
