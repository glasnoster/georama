# georama [![Circle CI](https://circleci.com/gh/glasnoster/georama/tree/master.svg?style=svg)](https://circleci.com/gh/glasnoster/georama/tree/master) [![Gem Version](https://badge.fury.io/rb/georama.svg)](https://badge.fury.io/rb/georama)


A simple google maps url parser

## Installation

Simply add the following line to your `Gemfile`:
```
gem 'georama'
```

## Usage

### Parsing a general maps url:

```
url = "https://www.google.com/maps/@-33.9218305,18.4296954,15z?hl=en"
map_url = Georama::Url.new(url)

map_url.coordinates
# => {latitude: -33.9218305, longitude: 18.4296954}

map_url.latitude
# => -33.9218305

map_url.matadata
# => {zoom: 15}

map_url.zoom
# => 15

```

### Parsing a place url:

```
url = "https://www.google.com/maps/place/Cape+Town/@-33.9218305,18.4296954,15z/data=foobar"
map_url = Georama::Url.new(url)

map_url.coordinates
# => {latitude: -33.9218305, longitude: 18.4296954}

map_url.place
# => "Cape Town"

```

## TODO:

* Parse directions urls

