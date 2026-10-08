# Upstream

| | |
| --- | --- |
| Project | Vulnerable Node (NodeBazaar) |
| Repository | https://github.com/cr0hn/vulnerable-node |
| Version | v2.1.0 |
| Commit | ff93add1036199aea62de2942418d92c6201b4c8 |
| Licence | BSD-3-Clause (GitHub reports NOASSERTION; the LICENSE text is the BSD 3-clause licence) |

`build/web/app/` is that release, unchanged, without its Git history. `build/web/Dockerfile` is
upstream's Dockerfile with two changes: npm installs from upstream's package-lock.json (upstream
copies package.json alone before `npm install`), and the environment upstream's
docker-compose.yml sets for the web service is baked in as `ENV`. `build/db/Dockerfile` is
upstream's `postgres:16-alpine` service with its environment baked in; MongoDB is the stock
`mongo:7.0` image (upstream: `mongo:7`). The mock IMDS and vault machines build from upstream's
own `mocks/imds` and `mocks/vault` folders, unchanged.

Two upstream labs depend on the upstream Git repository rather than the running app: lab 12
(a secret left in Git history) needs a clone of upstream, since the vendored copy carries no
history, and lab 11 (poisoned CI pipelines) is about the workflow files, which are vendored but
not run here. To update, replace `build/web/app/` with a newer release, then change this table.
