#!/bin/bash

# ========================================
# Jets Sales Analytics - Deployment Helper
# ========================================

echo "🚀 Jets Sales Analytics Dashboard - Deployment Helper"
echo "======================================================"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null
then
    echo "❌ Git tidak terinstall. Download di: https://git-scm.com/downloads"
    exit 1
fi

echo "✅ Git terdeteksi"
echo ""

# Check current directory
echo "📂 Current directory: $(pwd)"
echo ""

# Menu
echo "Pilih opsi deployment:"
echo "1. Setup Git & Push ke GitHub (First time)"
echo "2. Update & Push changes ke GitHub"
echo "3. Test locally (jalankan app)"
echo "4. Check dependencies"
echo "5. Exit"
echo ""

read -p "Pilih opsi (1-5): " option

case $option in
    1)
        echo ""
        echo "🔧 Setting up Git repository..."
        
        # Initialize Git if not already
        if [ ! -d .git ]; then
            git init
            echo "✅ Git repository initialized"
        else
            echo "✅ Git repository already exists"
        fi
        
        # Add all files
        git add .
        echo "✅ Files added to staging"
        
        # Commit
        read -p "Enter commit message: " commit_msg
        git commit -m "$commit_msg"
        echo "✅ Commit created"
        
        # Add remote
        echo ""
        echo "📝 Sekarang buat repository di GitHub:"
        echo "   1. Buka https://github.com/new"
        echo "   2. Buat repository baru (public)"
        echo "   3. Copy URL repository (format: https://github.com/username/repo-name.git)"
        echo ""
        read -p "Paste repository URL: " repo_url
        
        git remote add origin $repo_url
        echo "✅ Remote repository added"
        
        # Push
        git branch -M main
        git push -u origin main
        echo "✅ Pushed to GitHub!"
        echo ""
        echo "🎉 Repository setup complete!"
        echo "Next steps:"
        echo "1. Go to https://share.streamlit.io/"
        echo "2. Sign in with GitHub"
        echo "3. Deploy your app!"
        ;;
        
    2)
        echo ""
        echo "🔄 Updating repository..."
        
        # Add changes
        git add .
        echo "✅ Changes added"
        
        # Commit
        read -p "Enter commit message: " commit_msg
        git commit -m "$commit_msg"
        echo "✅ Commit created"
        
        # Push
        git push
        echo "✅ Changes pushed to GitHub!"
        echo ""
        echo "🎉 Update complete! App akan auto-deploy di Streamlit Cloud."
        ;;
        
    3)
        echo ""
        echo "🧪 Testing locally..."
        echo "Opening browser at http://localhost:8501"
        streamlit run app.py
        ;;
        
    4)
        echo ""
        echo "📦 Checking dependencies..."
        
        if [ -f requirements.txt ]; then
            echo "✅ requirements.txt found"
            echo ""
            echo "Dependencies:"
            cat requirements.txt
            echo ""
            read -p "Install/update dependencies? (y/n): " install
            if [ "$install" = "y" ]; then
                pip install -r requirements.txt
                echo "✅ Dependencies installed!"
            fi
        else
            echo "❌ requirements.txt not found!"
        fi
        ;;
        
    5)
        echo "👋 Goodbye!"
        exit 0
        ;;
        
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac
