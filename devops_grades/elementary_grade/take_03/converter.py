import json
import csv

# open json for reading
with open('data.json', 'r') as json_file:
    # download json
    data = json.load(json_file)

# open csv for write
with open('data.csv', 'w', newline='') as csv_file:
    # create an object for writing to a CSV file
    writer = csv.writer(csv_file)

    # write headers (first line) to a CSV file
    writer.writerow(data[0].keys())

    # writing values to a CSV file
    for item in data:
        writer.writerow(item.values())

print("The data has been successfully saved to the data.csv file.")