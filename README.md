# Swiftype API Example

This repository contains data and scripts for creating a Swiftype search engine you can experiment with.

## Public example engine

You can find a read-only version of this engine on Swiftype with the engine key `swiftype-api-example`. Here is an example query:

https://api.swiftype.com/api/v1/public/engines/search.json?q=glass&engine_key=swiftype-api-example

## Creating your own engine

To create your own engine, first [sign up for a Swiftype account](https://swiftype.com), then run the `create_engine.sh` command with your API key:

`./create_engine.sh YOUR_API_KEY`

This should work on Unix-based operating systems (patches for a Windows script are welcome).

Note: `curl` is required to run the `create_engine.sh` script.

## Search implementation

Open `search/index.html` in your browser to try out some searches. This example shows how to implement a search for an API-based search engine with the Swiftype jQuery autocomplete and search plugins.
