# Unit Testing

## Introduction

Unit testing validates individual components of our system. We'll set up testing frameworks for our custom packages and scripts.

## Prerequisites

- Python installed
- Testing frameworks available

## Python Testing Setup

```bash
# Install pytest
pip install pytest

# Create test structure
mkdir -p tests/
cat > tests/test_example.py << EOF
def test_example():
    assert 1 + 1 == 2

def test_system_import():
    import os
    assert os.path.exists('/')
EOF
```

## Running Tests

```bash
# Run tests
pytest tests/

# With coverage
pip install pytest-cov
pytest --cov=myapp tests/
```

## Package Testing

```bash
# Test package installation
pacman -S --test package-name

# Verify package integrity
pacman -Qkk package-name
```

## Exercises

- **Exercise 1**: Set up pytest and create basic unit tests.
- **Exercise 2**: Test a custom package installation.

## Next Steps

Proceed to Chapter 10.2 for integration testing.
