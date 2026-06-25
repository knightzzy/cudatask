# cudatask — Docker image for Salad GPU deployment

3 files:
- `Dockerfile` — bakes the worker binary into the image
- `entrypoint.sh` — launches with `ADDR` (wallet) + `WORKER` (name) env vars at runtime
- `.github/workflows/build.yml` — auto build & push on every commit to `main`

## One-time setup
1. Create a public GitHub repo (any name)
2. Push these files to `main`
3. In repo → Settings → Secrets and variables → Actions → New repository secret:
   - `DOCKERHUB_USER` = `knightzzy`
   - `DOCKERHUB_TOKEN` = `dckr_pat_...` (your Docker Hub access token)
4. GitHub Actions auto-runs → builds + pushes `knightzzy/cudatask:1` & `:latest` to Docker Hub (~2-3 min)

## Deploy on Salad
See parent Salad-deploy script. Image: `docker.io/knightzzy/cudatask:1`. Env vars: `ADDR` (wallet) + `WORKER` (name).
