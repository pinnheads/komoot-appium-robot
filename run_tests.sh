set -e

# config
VENV_PATH="./venv"
APPIUM_CMD=appium
WAIT_TIME=5
LOG_FILE=./reports/appium.log
TAGS_INPUT=$1
ROBOT_TAGS=""

echo "Starting appium in a new window"

alacritty --command bash -c "echo 'Starting appium...'; $APPIUM_CMD | tee $LOG_FILE" &

ALACRITTY_PID=$!

echo "Alacritty PID: $ALACRITTY_PID"

echo "Waiting for appium..."
sleep $WAIT_TIME


source "$VENV_PATH/bin/activate"

if [ -n "$TAGS_INPUT" ]; then
  TAGS_OR=$(echo "$TAGS_INPUT" | sed 's/,/OR/g')

  ROBOT_TAGS="--include $TAGS_OR"

  echo "Running with tags: $TAGS_INPUT"
else
  echo "Running all tests (no tags specified)"
fi

echo "Running Robot tests...."

robot \
  ${ROBOT_TAGS} \
  --pythonpath ./ \
  --report index.html \
  --output output.xml \
  --log log.html \
  --outputdir reports/ \
  tests/

TEST_STATUS=$?

echo "Tests finished. Status: $TEST_STATUS"

echo "Stopping appium..."

kill -9 $ALACRITTY_PID 2>/dev/null || true

echo "Check reports at: file:///home/pinnheads/personal/appium-robot/reports/index.html"

deactivate

exit $TEST_STATUS



