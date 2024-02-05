# Introduction
## What is 'OpenLayers'?
[Openlayers](https://openlayers.org/) is an open-source JavaScript library for displaying maps and map data in web browsers. It is simmilar to [Google Maps](https://www.google.com/maps), [Bing Maps](https://www.bing.com/maps), [Leaflet](https://leafletjs.com/ and many other libraries. Like Leaflet it is open-source.
The library renders data like the OpenGIS Consortiums [Web Mapping Service](http://www.opengeospatial.org/standards/wms) (WMS), [Web Feature Service](http://www.opengeospatial.org/standards/wfs) (WFS) protocols and other standards like [GeoJSON](https://geojson.org), [GML](http://www.opengeospatial.org/standards/gml) and many others.

It was developed by a software company [MetaCarta](https://en.wikipedia.org/wiki/MetaCarta) ahead of the O'Reilly 'Where 2.0' conference in June 2006, supposedly as an alternative to Google Maps.
# Installing
## Installing build tools for developing OpenLayers based maps on Ubuntu 22.04
### Prerequisites on Ubuntu 22.04
Before installing the build tools and sources for developing OpenLayers based mappings on a plain Ubuntu 22.04 system make sure 'curl' and a version of 'node.js' later than version 14 are installed, for instance by running:

```
sudo apt install curl
sudo snap install node --classic --channel=19
```

Install npm:

```
curl -0 -L https://npmjs.org/install.sh | sudo sh
```

** Warning! Be aware that it is risky to pipe a shell script fetched from the internet into a root shell, only do this from a site you trust and on a system that is disposable.**
Then install 'git':

```
sudo apt install git
```

## OpenLayers 'Getting Started'
Now you are able to create the OpenLayers 'getting started app':


```
npm create ol-app <your app name>
cd <your app name>
```


In order to make the vite development server run on IP address 0.0.0.0 instead of 'localhost' add '--host' to the "start": "vite" line in 'package.json'.
And start the development server:
```

npm start
```

If you point your browser to the development server the result should look like:
![](/images/openlayers.001.jpg)

# The Anatomy of OpenLayers 'Getting Started'
## Directory structure and files
At this moment the following directories and files will have been created in your application development directory:

```
myapp/
├── .github
├── .gitignore
├── <u>index.html</u>
├── <u>main.js</u>
├── <u>style.css</u>
├── node_modules
│   ├── .bin
│   .
│   .
│   ├── xml-utils
│   └── zstddec
├── package.json
├── package-lock.json
├── readme.md
├── style.css
└── vite.config.js
```

The most important files are:
## index.html

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/x-icon" href="https://openlayers.org/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Using OpenLayers with Vite</title>
  </head>
  <body>
    <div id="map"></div>
    <script type="module" src="./main.js"></script>
  </body>
</html>
```

And
## main.js

```
import './style.css';
import {Map, View} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new OSM()
    })
  ],
  view: new View({
    center: [0, 0],
    zoom: 2
  })
});
```

## Basic Concepts
The main.js file shows some basic concepts of OpenLayers:

- [Map](https://openlayers.org/en/latest/apidoc/module-ol_Map-Map.html): from the ol/map module is the core component of OpenLayers. For a map to render, a view, one or more layers, and a target container are needed.
- [View](https://openlayers.org/en/latest/apidoc/module-ol_View-View.html): represents a simple 2D view of the map. This is the object to act upon to change the center, resolution, and rotation of the map. A View has a projection.
- [Source](https://openlayers.org/en/latest/apidoc/module-ol_source.html): this function gets (remote) data for a layer.
- Layer: a map can have multiple layers of different types like Tile, Image or Vector.

## Under the hood of OpenLayers 'getting started'
In order to gain some more understanding of the anatomy of the application you can look at the network traffic between your browser and the development server (depends on your browser, but in Firefox: run 'developer tools &gt; network' and  'save as har' then filter the 'url' lines):<br><br>
![](/images/openlayers.003.jpg)

```
          "url": "http://192.168.50.97:5173/",
          "url": "http://192.168.50.97:5173/@vite/client", ............
          "url": "http://192.168.50.97:5173/main.js",
          "url": "http://192.168.50.97:5173/style.css",
          "url": "http://192.168.50.97:5173/node_modules/.vite/deps/ol.js?v=ef44a998", ........

          "url": "http://192.168.50.97:5173/node_modules/.vite/deps/chunk-ZRN6TD7N.js?v=ef44a998",
          "url": "http://192.168.50.97:5173/node_modules/.vite/deps/chunk-N7KRV6Z5.js?v=ef44a998",
          "url": "http://192.168.50.97:5173/node_modules/.vite/deps/chunk-4TDXP2QV.js?v=ef44a998",
          "url": "https://tile.openstreetmap.org/3 of t/4/4.png",
          "url": "https://tile.openstreetmap.org/3/4/3.png",
.
.
          "url": "https://tile.openstreetmap.org/3/5/5.png",
          "url": "https://tile.openstreetmap.org/3/2/5.png",
          "url": "https://openlayers.org/favicon.ico", .............
          "url": "https://tile.openstreetmap.org/3/6/3.png",
          "url": "https://tile.openstreetmap.org/3/6/4.png",
.
          "url": "https://tile.openstreetmap.org/3/0/5.png",
          "url": "https://tile.openstreetmap.org/3/0/2.png",
```

Your browser will load the index.html, main.js javascript and then the openlayer modules followed by the map image which is build of 'png' files which are retreived from the openstreetmap website.

The OpenLayers TileLayer is a map displayed in a web browser by joining dozens of individually requested image (or vector) data files usually 256x256 pixel PNG files. The number of tiles in a map is 2 to the power of the zoom level.

### Zoom level 0
![](/images/zoom.0.png)

### Zoom level 1
![](/images/zoom.1.png)

### Zoom level 2
![](/images/zoom.2.png)

### Zoom level 3
![](/images/zoom.3.png)




