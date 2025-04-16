package infratest

default allow = false

allow { input.infratest.success == true }

violations["infratest_failed"] { input.infratest.success == false }