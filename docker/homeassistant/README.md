## Download HACS into the config directory

Run this on the Docker host, not inside the container:

```sh
cd /path/to/config
sudo mkdir -p custom_components
cd custom_components
```

```sh
sudo wget https://github.com/hacs/integration/releases/latest/download/hacs.zip
sudo unzip hacs.zip -d hacs
sudo rm hacs.zip
```

### Add HACS in the UI

Go to Settings → Devices & Services

Click Add Integration

Search for HACS

Follow the GitHub authorization flow

You’ll need:

A GitHub account

To authorize HACS when prompted

### Finish setup

After authorization:

Restart Home Assistant one more time

HACS will appear in the sidebar
