# Komoot Appium Robot Tests

This is a simple suite of tests for the Komoot Android Application for demo purposes.

<video width="320" height="240" controls>
  <source src="./assets/2026-02-01 14-16-52.mp4" type="video/mp4">
</video>

## Requirements

1. Python 3.XX
2. [Appium](https://appium.io/docs/en/latest/)

## Usage

1. Clone the Repository
2. Run `pip install -r requirements.txt`
3. Create `resources/.secrets.yaml` (Check `resources/sample.secrets.yaml` to see what to add in the file)
4. Run the tests with `./run_tests.sh [<tags>]` (Passing no tags will run all)
