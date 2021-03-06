#!/usr/bin/env python3

''' This will return the current values of helium blockchain based on daily market values'''

from cryptocmd import CmcScraper

# import pandas as pd
# from flask import Flask
# from flask.logging import create_logger
# import logging

# initialise scraper without time interval
scraper = CmcScraper("HNT", "23-09-2021", "27-12-2021")

# get raw data as list of list
headers, data = scraper.get_data()

# get data in a json format
eth_json_data = scraper.get_data("json")

# export the data as csv file, you can also pass optional `name` parameter
scraper.export("csv", name="HNT_all_time")

# Pandas dataFrame for the same data
df = scraper.get_dataframe()

print(df)

