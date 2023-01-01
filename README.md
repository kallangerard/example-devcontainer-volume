# example-devcontainer-volume

Example to show how to clone to a devcontainer in Visual Studio Code without an intermediary host bind mount

## Dev Container Settings

These setting are ignored when cloning into a volume.

```json
// .devcontainer/devcontainer.json
{
// ...
"workspaceFolder": "/workspaces/example-devcontainer-volume",
"build": {
"dockerfile": "../Dockerfile",
"args": {}
},
// ...
}
```

When you clone into a volume, as opposed to opening a devcontainer from a repository already cloned in your host filesystem, the following differences take place:

1. An anonymous volume is created
1. A temporary container clones the repository into this volume
1. Either the Dockerfile or a docker-compose in the root of the repository is used to create the Dev Container
1. The devcontainer is created with the volume mounted at `/workspaces` inside the container
1. The workspace starts with the workspace directory of `/workspaces/${respositoryName}`

## System Requirements

- Visual Studio Code
- [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Usage

To get started, follow these steps in Visual Studio Code.

1. Run the Dev Containers: Clone Repository in Container Volume... command
2. Enter the Git URL for this repository
    - `https://github.com/kallangerard/example-devcontainer-volume.git`
3. VSCode will clone the repository into an anonymous volume and open the repository in a remote devcontainer workspace

## Testing

To test that the repository was cloned into the devcontainer volume, run the following command in the integrated terminal.

```bash
pytest

=== test session starts ===
platform linux -- Python 3.11.1, pytest-7.2.0, pluggy-1.0.0
rootdir: /workspaces/example-devcontainer-volume
plugins: anyio-3.6.2
collected 1 item
example_api/test_main.py .     [100%]

=== 1 passed in 0.10s ===
```

> 📘 Info
> You may need to create a new terminal in vscode after the virtual environment has been created

## Development Server

To start the development server, run the following command in the integrated terminal.

```bash
uvicorn example_api.main:app --reload
```

> 📘 Info
> You may need to create a new terminal in vscode after the virtual environment has been created

You should then be able to view the development server at <http://localhost:8000> on your host machines web brwosers with code reloading
