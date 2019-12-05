# hive-test-data

Simple tool to download a sample csv and load into hive.
Original data source: https://www.sample-videos.com/csv/

Usage:
1. Clone this repo to hiveserver2's machine
```
git clone https://github.com/abstractdog/hive-test-data
```
2. Set a valid beeline connection string to variable BEELINE
```
export BEELINE='beeline -u "jdbc:hive2://blablablabla"'
```
3. Load sample csv to hive
```
./load_10000.sh
```
