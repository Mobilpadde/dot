#!/bin/sh

get_icon() {
  case $1 in
  # Icons for weather-icons
  01d) icon="☀️ " ;;
  01n) icon="🌙 " ;;
  02*) icon="🌤️ " ;;
  03*) icon="☁️ " ;;
  04*) icon="☁️ " ;;
  09*) icon="🌧️ " ;;
  10*) icon="🌦️ " ;;
  11*) icon="🌩️ " ;;
  13*) icon="🌨️ " ;;
  50*) icon="🌫️ " ;;
  *) icon="🤷 " ;;

    # Icons for Font Awesome 5 Pro
    #01d) icon="";;
    #01n) icon="";;
    #02d) icon="";;
    #02n) icon="";;
    #03d) icon="";;
    #03n) icon="";;
    #04*) icon="";;
    #09*) icon="";;
    #10d) icon="";;
    #10n) icon="";;
    #11*) icon="";;
    #13*) icon="";;
    #50*) icon="";;
    #*) icon="";
  esac

  echo $icon
}

KEY="acb1fdd339b590242cbc68eaa5750a0e"
CITY="2615876"
UNITS="metric"
SYMBOL="°C "

API="https://api.openweathermap.org/data/2.5"
weather=$(curl -sf "$API/weather?appid=$KEY&id=$CITY&units=$UNITS")

if [ -n "$weather" ]; then
  weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
  weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

  echo "$(get_icon "$weather_icon")"" ""$weather_temp$SYMBOL"
fi
