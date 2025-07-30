# Navigate to your project folder
cd /home/johan/mypaperhive.com

# Initialize git if not already done
git init

# Add all files
git add .

# Commit your changes
git commit -m "Initial commit"

# Add your GitHub remote
git remote add origin https://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@github.com/Johan1974/mypaperhive.git

# Set main branch and push
git branch -M main
git push -u origin main
