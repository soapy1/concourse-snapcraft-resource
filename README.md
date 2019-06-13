# concourse-snapcraft-resource
[concourse.ci](https://concourse.ci/ "concourse.ci Homepage") [resource](https://concourse.ci/implementing-resources.html "Implementing a resource") for persisting build artifacts on a shared storage location with rsync and ssh.

Builds snaps using snapcraft

## Source Config
* `name` name of snap
* `channels` __optional__ the channel to release to
* `login_email` __optional__ the email to use to push to snapstore
* `login_unboud_discharge` __optional__ snapstore token discharge
* `login_macroon` __optional__ snapstore token macroon


### Example

``` yaml
resource_types:
- name: snapcraft-resource
  type: docker-image
  source:
      repository: sophiacastellarin/concourse-snapcraft-resource
      tag: latest

resources:
- name: snapcraft-build-resource
  type: snapcraft-resource
  source:
    name: my-snap

jobs:
-name: my_great_job
  plan:
    ...
    put: sync-resource
      params:
        snapcraft_yaml:
```

## Behavior
### `check` : Check for new snaps
The current snap is fetched

### `in` : No inputs

### `out` : Build snap
Builds a new snap
#### Parameters

* `snapcraft_yaml`: snapcraft.yaml for the snap
* `output_dir`: folder to drop snap in once it's built
* `revision`: __optional__ revision of the snap
* `push`: __optional__ bool defaults to false, if set to true will push to the snap store
