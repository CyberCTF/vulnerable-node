# Vulnerable Node (NodeBazaar)

[Vulnerable Node](https://github.com/cr0hn/vulnerable-node) by Daniel Garcia (cr0hn), rewritten
in 2026 as NodeBazaar: a working Node.js shop with real vulnerable code paths against PostgreSQL
and MongoDB, mapped to the OWASP Top 10:2025. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, and the
upstream source in [`build/web/app/`](build/web/app) builds with its own Dockerfile.

| Machine | Service |
| --- | --- |
| web | NodeBazaar on port 3000, published on 8888 as upstream |
| db | PostgreSQL 16 on port 5432 |
| mongo | MongoDB 7.0 on port 27017 |
| imds | Mock cloud metadata service on port 8090 (SSRF target, lab network only) |
| vault | Mock secrets vault on port 8091 (SSRF target, lab network only) |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:8888/ and log in as `alice` / `alice123`, `bob` / `bob123` or `admin`
/ `admin123`. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: [docs/labs/](build/web/app/docs/labs) (exploit
guides and fixes). Lab 12 (a secret in Git history) needs a clone of upstream; see
[UPSTREAM.md](UPSTREAM.md).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as Vulnerable Node ([LICENSE](LICENSE)). This application is deliberately
vulnerable: keep it isolated.
