from wttr import Wttr

weather = Wttr(
    lang='en',
    location={
        'Minsk': 'Minsk',
        '64.127146,-21.873472': 'Reykjavik',
        '~Vostok Station': 'Nice place',
    },
  format='%l: %C, temp: %t, feels: %f',
  units='m',
  update_interval=30,
)

print(weather)
