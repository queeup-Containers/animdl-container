
# animdl-container

**A highly efficient, fast, powerful and light-weight anime downloader and streamer for your favorite anime.**

Powered by [animdl](https://github.com/justfoolingaround/animdl)

### Pull from hub.docker.com

```bash
docker pull queeup/animdl-container
```

### Pull from ghcr.io

```bash
docker pull ghcr.io/queeup-containers/animdl-container
```

### Volumes

- `-v $HOME/Downloads:/downloads`
- `-v $HOME/.config/animdl_config.yml:/config/animdl_config.yml`

### Environment

- ANIMDL_CONFIG=/config/animdl_config.yml

**_Example usage:_**

- Print animdl help

  ```bash
  docker run --rm --interactive --tty --name animdl \
      queeup/animdl-container --help
  ```

- Search an anime
  
  ```bash
  docker run --rm --interactive --tty --name animdl \
      queeup/animdl-container search chainsaw
  ```

- Grab an anime's episode link
  
  ```bash
  docker run --rm --interactive --tty --name animdl \
      --volume "$HOME/Downloads:/downloads" \
      queeup/animdl-container grab --index 1 --range 1 "One piece"
  ```

- Download an anime:
  - Please check [animdl](https://github.com/justfoolingaround/animdl/blob/master/readme.md) docs
