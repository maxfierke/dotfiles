step() {
  echo -e "\x1B[1;36m› $1\x1B[0m"
}

step_ok() {
  echo -e "\x1B[1;32m✓ $1\x1B[0m"
}

step_err() {
  echo -e "\x1B[1;31m✗ $1\x1B[0m"
}

step_skip() {
  echo -e "\x1B[1;33m⚠ $1\x1B[0m"
}
