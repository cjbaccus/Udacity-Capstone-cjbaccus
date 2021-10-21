#!/usr/bin/env python3

''' This will return the current values of ethereum blockchain based on daily market values'''

from cryptocmd import CmcScraper
#import pandas

# initialise scraper without time interval
scraper = CmcScraper("ETH", "23-09-2021", "20-10-2021")

# get raw data as list of list
headers, data = scraper.get_data()

# get data in a json format
eth_json_data = scraper.get_data("json")

# export the data as csv file, you can also pass optional `name` parameter
scraper.export("csv", name="eth_all_time")

# Pandas dataFrame for the same data
df = scraper.get_dataframe()

print(df)
