# Inherit from your own community maintained image

This repo is an example of inheriting from a base community maintained image to add a few packages
or make other customizations on top. It can be then used in one of two ways:

1. If Dynamic image building is enabled in your hub, you can simply copy paste the URL of the repo
   to the 'repo' field, and it will automatically build it for you!

2. An image is built and pushed from here with GitHub actions, using [repo2docker-action](https://github.com/jupyterhub/repo2docker-action).
   This can be then used via the "Other..." option when selecting image to launch from a hub.
   See The `./.github/build.yaml` and `./.github/test.yaml` files for more info. Additional documentation
   is available [on the 2i2c docs site](https://docs.2i2c.org/admin/howto/environment/update-community-image/).


## Features

1. Inherits from a specific tagged version of an image, whole image can be upgraded by changing
   the `FROM` tag in `Dockerfile`
2. All modifications happen in `environment.yml` file, which is not container specific. Regular users can use this too.
3. Users can test out their image **interactively** by making a PR, which will automatically create a comment with a link to
   mybinder.org, which will build the image *exactly* the same way our action does. This allows users to contribute packages
   and changes to this repo without needing docker installed locally. [See example PR](https://github.com/yuvipanda/example-inherit-from-community-image/pull/1)
4. On making PRs, a GitHub action builds the image to make sure it can be built. This catches issues with syntax errors and
   missing versions.
5. Tests inside the `image-tests/` directory are also run on each PR, allowing for more fine-grained tests - either as
   `pytest` tests or as jupyter notebooks that must reproduce exactly. This helps catch issues with version upgrades breaking
   your instructional code. The tests are invoked as part of the [`jupyterhub/repo2docker` action](https://github.com/jupyterhub/repo2docker-action). See [here](https://github.com/jupyterhub/repo2docker-action#testing-the-built-image#testing-the-built-image) for more details.
6. If you set up `./.github/build.yaml` correctly, on merging a PR, the image is built and pushed to a repository on
   quay.io. You can use any other docker registry as you wish.
