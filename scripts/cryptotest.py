#!/usr/bin/env python3

''' This will return the current values of helium blockchain based on daily market values'''

from cryptocmd import CmcScraper
from http.server import BaseHTTPRequestHandler, HTTPServer

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


hostName = "localhost"
serverPort = 8080

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes("<html><head><title>Cryptptest</title></head>", "utf-8"))
        self.wfile.write(bytes("<body>", "utf-8"))
        self.wfile.write(bytes("<p>{{ df }}</p>", "utf-8"))
        self.wfile.write(bytes("</body></html>", "utf-8"))

if __name__ == "__main__":        
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")

# app = Flask(__name__)
# # LOG = create_logger(app)
# # LOG.setLevel(logging.INFO)

# @app.route("/")
# def home():
#     ''' docstring'''
#     html = "<h3>Price of Helium from September 2021 - December 2021 </h3><h4>{{ df }}<h4>"
#     # data2html = "{{ df }}"
#     return html.format(format)
#     #return data2html.format(format)

# app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
