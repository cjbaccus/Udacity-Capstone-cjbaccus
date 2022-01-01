from flask import Flask, request
from flask import jsonify
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

#print(df)

app = Flask(__name__)
fp = open("config.txt", encoding="utf-8")
for line in fp.readlines():
    tmp = line.split('=')
    if tmp[0] == 'CURRENT':
        CURRENT_VER = tmp[1].rstrip()
    elif tmp[0] == 'LAST':
        LAST_VER = tmp[1].rstrip()

@app.route("/", methods=["GET"])
def check_status():
    return jsonify({'success': True,
                    'app_ver': CURRENT_VER})

@app.route("/get_ip", methods=["GET"])
def get_my_ip():
    return jsonify({'ip': request.environ['REMOTE_ADDR'],
                    'success': True})
    return df
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)