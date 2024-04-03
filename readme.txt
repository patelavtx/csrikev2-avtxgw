Dec22>>

1.  Commented out in mc-transit to use existing RG (cleaner for module run sourced GH repo)
2.  Local provider.tf.orig > move to *tf if running locally
3.  As per point1.   Locally can modify mc-transit and add variable 'rg' back in variables.tf to run

Module run
1.  Runs well using the respective csrikev1 or 2  repos.
2.  Uses folder 'csr-runasmode'