#!/usr/bin/env python3 


import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'

def retrieve_events(url):
    """Download recent GitHub events from url and return them as a Python list."""
    response_text = requests.get(url).text
    return json.loads(response_text)

def print_events(events, n=5):
    """Print the first n events in the form 'type :: repo'."""
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)

def main():
    """Print the user and URL, then fetch and print recent events."""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()

