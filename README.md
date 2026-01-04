# Steam Achievement interface for DragonRuby

## Installation

Grab the precompiled binaries from [/releases](./releases) and place them in `mygame/vendor/steam_stats`

## API

```rb
def boot(args)
  GTK.dlopen("vendor/steam_stats")
  require "vendor/steam_stats"
  # Will register `Steam::ClientStats`
end

def tick(args)

end
```

## API

```rb

```

## Developing locally

```
git clone https://github.com/KonnorRogers/dragonruby-steam-achievements
cd dragonruby-steam-achievements
```

Download the Steam SDK here:

<https://partner.steamgames.com/downloads/list>

Unzip your files to `./steam-sdk` within `dragonruby-steam-achievements`

## Build

`make`

## Test

`make test`

