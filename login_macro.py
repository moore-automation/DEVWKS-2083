"""
MkDocs Macros hook – reads resources/login.yaml at build time
and exposes VPN seat data to Jinja2 templates.

Credentials live in login.yaml (gitignored) and are injected
into the rendered site only; they never appear in the markdown source.
"""

import os
import re
import yaml


def define_env(env):
    """Load seat data from resources/login.yaml and register as a template variable."""

    login_file = os.path.join(os.path.dirname(__file__), "resources", "login.yaml")

    seats = []
    speakers = []

    if not os.path.exists(login_file):
        env.variables["seats"] = seats
        env.variables["speakers"] = speakers
        return

    with open(login_file, "r") as f:
        data = yaml.safe_load(f)

    if not data:
        env.variables["seats"] = seats
        env.variables["speakers"] = speakers
        return

    for entry in data:
        for name, info in entry.items():
            if "-seat" in name:
                # Extract seat number from e.g. "devwks-2083-ws2-seat12"
                match = re.search(r"seat(\d+)$", name)
                seat_num = int(match.group(1)) if match else 0
                seats.append(
                    {
                        "num": seat_num,
                        "name": name,
                        "vpn_address": info.get("vpn_address", ""),
                        "vpn_password": info.get("vpn_password", ""),
                    }
                )
            elif "-speaker" in name:
                match = re.search(r"speaker(\d+)$", name)
                spk_num = int(match.group(1)) if match else 0
                speakers.append(
                    {
                        "num": spk_num,
                        "name": name,
                        "vpn_address": info.get("vpn_address", ""),
                        "vpn_password": info.get("vpn_password", ""),
                    }
                )

    seats.sort(key=lambda s: s["num"])
    speakers.sort(key=lambda s: s["num"])

    env.variables["seats"] = seats
    env.variables["speakers"] = speakers
