#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function
import time
import pyhfcus
from pyhfcus.rest import ApiException
from pprint import pprint

import json
import time
import datetime
import argparse
from pprint import pprint


def main():
    """This is run if file is directly executed, but not if imported as
    module. Having this in a separate function  allows importing the file
    into interactive python, and still able to execute the
    function for testing"""
    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--url",
                        required=False,
                        default="http://hfcus.b12x.org:8080",
                        help="HFCuS URL",
                        type=str)

    parser.add_argument("-f", "--freqfile",
                        required=False,
                        help="Inpute frequency file",
                        type=str)

    parser.add_argument("-c", "--config",
                        required=False,
                        help="Configuration file",
                        type=str)

    parser.add_argument("-v", "--verbose",
                        help="Option for running in verbose",
                        default=False,
                        type=bool)

    args = parser.parse_args()
    url = args.url
    freqfile = args.freqfile
    config = args.config
    client = pyhfcus.ApiClient(host=url)
    api_instance = pyhfcus.DefaultApi(api_client=client)
    with open(config) as data_file:    
        data = json.load(data_file)
    print(data)

if __name__ == '__main__':
    """The following will be run if file is executed directly,
    but not if imported as a module"""
    main()


