# Introduction
## What is 'OpenLayers'?
[Openlayers](https://openlayers.org/) is an open-source JavaScript library for displaying maps and map data in web browsers. It is simmilar to [Google Maps](https://www.google.com/maps), [Bing Maps](https://www.bing.com/maps), [Leaflet](https://leafletjs.com/ and many other libraries. Like Leaflet it is open-source.
The library renders data like the OpenGIS Consortiums [Web Mapping Service](http://www.opengeospatial.org/standards/wms) (WMS), [Web Feature Service](http://www.opengeospatial.org/standards/wfs) (WFS) protocols and other standards like [GeoJSON](https://geojson.org), [GML](http://www.opengeospatial.org/standards/gml) and many others.

It was developed by a software company [MetaCarta](https://en.wikipedia.org/wiki/MetaCarta) ahead of the O'Reilly 'Where 2.0' conference in June 2006, supposedly as an alternative to Google Maps.
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

### Install OpenLayers 'getting started'
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
![](../images/openlayers.001.jpg)
