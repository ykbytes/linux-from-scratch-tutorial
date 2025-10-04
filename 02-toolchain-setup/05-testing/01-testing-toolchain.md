# Testing the Toolchain

## Introduction

After building the toolchain components, it's crucial to test that everything works together. This ensures our cross-compilation environment is functional before proceeding to build the basic system.

## Test Components

- Compiler functionality
- Linker operation
- Library linking
- Basic program execution

## Test Program

Create a simple test program:

```c
// test.c
#include <stdio.h>

int main() {
    printf("Hello from LFS toolchain!\n");
    return 0;
}
```

## Test Steps

1. **Compile the test**:

   ```bash
   cd $LFS
   cat > test.c << "EOF"
   #include <stdio.h>

   int main() {
       printf("Hello from LFS toolchain!\n");
       return 0;
   }
   EOF
   ```

2. **Build with our toolchain**:

   ```bash
   $LFS_TGT-gcc test.c -o test
   ```

3. **Verify the binary**:

   ```bash
   file test
   $LFS_TGT-readelf -l test | head -20
   ```

4. **Test execution** (if possible):
   ```bash
   # This may not work in host environment, but check for errors
   ./test 2>&1 || echo "Expected failure in host environment"
   ```

## Expected Output

- Compilation should succeed without errors
- `file` should show it's an ELF executable for the target architecture
- `readelf` should show proper linking

## Troubleshooting

- **Compilation errors**: Check if all toolchain components are in PATH
- **Linking issues**: Verify glibc installation
- **Runtime failures**: Expected when running on host; will work in target environment

## Security Validation

- Ensure the binary doesn't link to host libraries
- Check for proper PIE (Position Independent Executable) if enabled

## Exercises

- **Exercise 1**: Compile and analyze the test program. Record the output of `file` and `readelf`.
- **Exercise 2**: Modify the test program to use more library functions and recompile.

## Next Steps

If testing passes, proceed to Chapter 3 for building the basic system packages.
