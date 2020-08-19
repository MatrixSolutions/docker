# Teamcity windows agents

## locked-npm-version-for-mobile 

** Do not try to rebuild this image **

This image is locked because npm-windows-upgrade was broke due to an update in one of its dependencies.  For this reason we cannot rebuild this docker image without getting npm-windows-upgrade working again.

As a workaround we've created a new image based on locked-npm-version-for-mobile which we'll use for additional changes moving forward.

## latest

This is the image we'll use for future change to the windows build agent.
