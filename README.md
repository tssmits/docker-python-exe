# Build .exe from Python script with a Docker container

These are the steps that allowed me to freeze a simple Python script to a Windows executable.

## Making an .exe file from a script

These steps will guide you towards your very own .exe file.

### Prerequisites

You must be able to run Windows containers for Docker.

One way to achieve this is with the excellent [StefanScherer/windows-docker-machine] repository.(https://github.com/StefanScherer/windows-docker-machine).

This works for Windows, macOS and GNU/Linux, because Vagrant runs on all three.

The `2016-box` will suffice.

### Building the Docker image

1. `git clone https://github.com/tssmits/docker-python-exe`
2. `cd docker-python-exe`
3. `docker build -t buildtools2017:latest -m 2G .`

### Run Docker container

4. `docker run -v C:$(pwd):C:/exampledir buildtools2017 -it`

### Preparation for building the .exe

Now that you're in the running Docker container, please surf to the example script.

5. `cd exampledir`

Please initiate a virtualenv.

6. `python -m venv venv`

Activate it.

7. `.\venv\Scripts\activate`

Now you can install the required packages.

8. `pip install pyinstaller`

### Building the .exe

Just one more command and your .exe is ready!

9. `pyinstaller --onefile hello.py`

### Running the resulting exe

You can now run the .exe file.

`.\dist\hello.exe`

## Known issues

### PyInstaller gives me: "WARNING: lib not found: api-ms-win-crt-math-l1-1-0.dll dependency"

You can ignore these warnings. The .exe will still run. Read more about this issue at [https://github.com/pyinstaller/pyinstaller/issues/1566](https://github.com/pyinstaller/pyinstaller/issues/1566).
