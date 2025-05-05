# 🚀 FastDeploy: Simple Template for Deploying Python Projects

This project is designed to accelerate the setup and deployment of Python applications using `rsync`, `systemd`, and `nohup` on remote server.

Your need working ssh setup, best with keys authorization.

---

## 📁 Project Structure

```bash
.
├── config.py               # Loads config from .env
├── logger.py               # Named logger based on project folder
├── .env                    # Prohect environment variables (e.g., LOG_LEVEL)
├── .gitignore              # Git exclusions
├── .rsync-filter           # rsync exclusion rules
├── .deploy_config.sh       # -->>Deployment config (private)
├── deploy_sync.sh          # Syncs project to remote server
├── deployservice.sh        # Sync + restart systemd service
├── deploynohup.sh          # Sync + pkill + nohup for non-systemd apps
├── example.service         # Example systemd unit file
└── requirements.txt        # Python dependencies file
```

---

## ⚙️ Setup

1. Clone the repository:

```bash
git clone your-repo-url
cd project_name
rename dir for your projectn ame
```

2. Place in `.env` file your secrets etc.:

```env
LOG_LEVEL=INFO
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

---

## 🌐 Server Configuration

Edit `.deploy_config.sh` with your server settings:

```bash
REMOTE_USER="username"
REMOTE_HOST="server.org"
REMOTE_PORT="22" # ssh port, change if not default
REMOTE_PATH="/home/username/project_name" # project path at server
SERVICE_NAME="project_name"  # if use used sistemd, example included
SCRIPT_NAME="mainstartpoint.py"  # main program to run
```

> 🔐 `.deploy_config.sh` is excluded from Git and deployment (see `.gitignore` and `.rsync-filter`).

---

## 🚀 Deployment Scripts

### `./deploy_sync.sh`

Sync project files only:

```bash
./deploy_sync.sh
```

---

### `./deployservice.sh`

Sync + restart systemd service:

```bash
./deployservice.sh
```

---

### `./deploynohup.sh`

Sync + kill old process + launch with `nohup`:

```bash
./deploynohup.sh
```

> Make sure `SCRIPT_NAME` is executable and starts with a shebang like `#!./venv/bin/python` for venv .

---

## 🛠 Example systemd Service

Save as `/etc/systemd/system/project_name.service`:

```ini
[Unit]
Description=Your project service
After=network.target

[Service]
User=username
WorkingDirectory=/home/username/projectname/
ExecStart=/home/username/projectname/venv/bin/python /home/username/projectname/mainstartpoint.py
Restart=always
Environment="PYTHONUNBUFFERED=1"

[Install]
WantedBy=multi-user.target
```

Reload and enable the service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable project_name
sudo systemctl start project_name
```

---

## 📜 Logging

Uses a named logger based on the current project directory:

```python
logger = logging.getLogger(current_dir_name)
```

Format includes timestamp, log level, and logger name.
use `import logger from logger` and example: `logger.info('Info string')` in your files
---

## 🔐 Security Notes

- Files like `.env`, `.deploy_config.sh`, `.git`, `venv`, and temp files are excluded from both Git and deployment via `.rsync-filter`.
- Keeps secrets and local settings out of the repository.

---

## 🧪 Minimal Dependencies

```txt
python-dotenv
```

---

## ✅ Ideal For

- Telegram bots
- Backend microservices
- CLI tools deployed on Linux servers
- Lightweight API backends
- For any others.

---

## 📄 License

MIT — free to use, modify, and distribute.
