# Installs nvm, nodejs, npm, and Elm

# Download NVM install script
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Use NVM in the same terminal session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Node JS
nvm install node

# Switch over to the latest version of nodejs
nvm use node
nvm alias default node

# Install elm
npm i -g elm