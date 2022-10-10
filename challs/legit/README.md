# LeGIT
> Aljaž Medič, 10. 10. 2022
---

## Setup
Specify flag as argument to the Dockerfile. By default, port 80 is open on the container. Specify accordingly in `docker-compose.yml`.


### Writeup

The vulnerability is, that the server has `.git` folder exposed. Upon using the tool `gitjacker`, we leak two commits. Current one has secret removed,
but the last one has flag intact.
```bash
git log --oneline
git checkout HEAD^1
cat secret.php | grep frictf
```

#### Development
Git is iffy about pushing sub-repositories in folders, so everything is zipped in `html.zip`. Use `util/{unpack,pack}-subrepo.sh` after clone/before push respectively.