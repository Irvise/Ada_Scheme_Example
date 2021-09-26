# Ada_Scheme example

An example application of Scheme calling into Ada, and Ada calling back to Scheme.

## Build instructions

For the time being, it only supports GPRBuild (Ada) and Chicken Scheme. The quickest way to build it is to have both tools installed and run:
```
make
```
That will create an executable in the root folder called `scheme_ada`. Run it and see what you get.

---

The more manual approach would be to execute the `gprbuild` (Ada build tool) and `csc` (Chicken compiler) separately in the root folder.
```
gprbuild -Pscheme.gpr

csc chicken_ada.scm -L./lib -L -lscheme_hello -Wl,-R./lib -v -o scheme_ada
```

### GNATTools

For the time being, the GNATTools toolsuite is not working. I am having tremendous issues with the linking step. Everything else seems to function. The `Makefile` is of horrible quality, but it has automatic detection of `gprbuild`. If it is not present in the system, it tries to use GNATTools.

## Explanation

We have a piece of Ada code (the `.ads, .adb` files in `./src`) that is built as a dynamic library, which is placed under `./lib`. Then we have a small Scheme file `chicken_ada.scm` in the root of the project.

The Ada code contains a procedure called `hello_ada` which is exported as a `C` function. In Scheme, we write the prototype of that function so that it can be called. At the same time, in Scheme we create a Scheme function, `hello_scheme` that will be exported as a `C` function. During the execution of `hello_ada`, we call `hello_scheme` to fully prove the interoperability.

## Acknowledgments

I would like to thank the `#chicken` community for dealing with my questions and mistakes. Specially jjhoo.

I would also like to thank the `#ada` community and specially onox, who found the missing link.
