# Deployment Guide

This guide covers multiple options for deploying your Flutter web portfolio.

## 🚀 Quick Deploy Options

1. **Firebase Hosting** (Recommended) - Free, fast, and reliable
2. **Netlify** - Easy deployment with continuous integration
3. **GitHub Pages** - Free hosting for GitHub repositories
4. **Vercel** - Modern platform with excellent performance

---

## Option 1: Firebase Hosting (Recommended)

### Prerequisites
- Google account
- Node.js installed

### Steps

1. **Install Firebase CLI**
```bash
npm install -g firebase-tools
```

2. **Login to Firebase**
```bash
firebase login
```

3. **Initialize Firebase in your project**
```bash
cd portfolio_web
firebase init hosting
```

When prompted:
- Select "Use an existing project" or create a new one
- Set public directory: `build/web`
- Configure as single-page app: `Yes`
- Set up automatic builds: `No`

4. **Build your Flutter app**
```bash
flutter build web --release
```

5. **Deploy**
```bash
firebase deploy --only hosting
```

Your site will be live at: `https://your-project-id.web.app`

### Custom Domain
1. Go to Firebase Console → Hosting
2. Click "Add custom domain"
3. Follow the DNS configuration steps

---

## Option 2: Netlify

### Method A: Drag & Drop (Easiest)

1. Build your app:
```bash
flutter build web --release
```

2. Go to [Netlify](https://netlify.com)
3. Drag and drop the `build/web` folder

### Method B: Git Integration

1. Push your code to GitHub/GitLab/Bitbucket

2. Create `netlify.toml` in project root:
```toml
[build]
  command = "flutter build web --release"
  publish = "build/web"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

3. Connect repository on Netlify dashboard
4. Deploy automatically on push

### Environment Variables
If you need Flutter version:
- Key: `FLUTTER_VERSION`
- Value: `3.9.2`

---

## Option 3: GitHub Pages

### Steps

1. **Create a GitHub repository** and push your code

2. **Build with base href**
```bash
flutter build web --release --base-href "/your-repo-name/"
```

3. **Deploy to gh-pages branch**

Option A - Using gh-pages package:
```bash
npm install -g gh-pages
gh-pages -d build/web
```

Option B - Manual:
```bash
cd build/web
git init
git add .
git commit -m "Deploy"
git branch -M gh-pages
git remote add origin https://github.com/username/repo.git
git push -f origin gh-pages
```

4. **Enable GitHub Pages**
- Go to repository Settings → Pages
- Source: gh-pages branch
- Save

Your site will be at: `https://username.github.io/repo-name/`

### Custom Domain
1. Add `CNAME` file to `web/` folder with your domain:
```
yourdomain.com
```

2. Configure DNS:
- Add A records pointing to GitHub IPs:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153

3. Rebuild and deploy

---

## Option 4: Vercel

### Method A: Vercel CLI

1. **Install Vercel CLI**
```bash
npm install -g vercel
```

2. **Build your app**
```bash
flutter build web --release
```

3. **Deploy**
```bash
cd build/web
vercel --prod
```

### Method B: Git Integration

1. Push code to GitHub

2. Create `vercel.json` in project root:
```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "devCommand": "flutter run -d web-server --web-port=3000",
  "framework": null,
  "routes": [
    { "handle": "filesystem" },
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
```

3. Import project on [Vercel](https://vercel.com)
4. Deploy automatically

---

## Option 5: AWS S3 + CloudFront

### Prerequisites
- AWS Account
- AWS CLI installed and configured

### Steps

1. **Build your app**
```bash
flutter build web --release
```

2. **Create S3 bucket**
```bash
aws s3 mb s3://your-portfolio-bucket
```

3. **Configure bucket for website hosting**
```bash
aws s3 website s3://your-portfolio-bucket --index-document index.html --error-document index.html
```

4. **Set bucket policy** (make it public)
Create `policy.json`:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-portfolio-bucket/*"
    }
  ]
}
```

Apply policy:
```bash
aws s3api put-bucket-policy --bucket your-portfolio-bucket --policy file://policy.json
```

5. **Upload files**
```bash
aws s3 sync build/web s3://your-portfolio-bucket --delete
```

6. **Create CloudFront distribution** (optional, for HTTPS and CDN)
- Go to CloudFront console
- Create distribution
- Origin: your S3 bucket
- Enable HTTPS

---

## Option 6: Docker + Any Cloud Provider

### Dockerfile

Create `Dockerfile`:
```dockerfile
FROM nginx:alpine
COPY build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### nginx.conf

Create `nginx.conf`:
```nginx
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # Enable gzip compression
    gzip on;
    gzip_vary on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

### Build and Deploy

1. **Build Flutter app**
```bash
flutter build web --release
```

2. **Build Docker image**
```bash
docker build -t portfolio-web .
```

3. **Run locally to test**
```bash
docker run -p 8080:80 portfolio-web
```

4. **Deploy to:**
- **Google Cloud Run**
  ```bash
  gcloud run deploy portfolio --source .
  ```

- **AWS ECS/Fargate**
  ```bash
  aws ecr get-login-password | docker login --username AWS --password-stdin <your-registry>
  docker tag portfolio-web:latest <your-registry>/portfolio-web:latest
  docker push <your-registry>/portfolio-web:latest
  ```

- **DigitalOcean App Platform**
  - Connect GitHub repo
  - Select Dockerfile
  - Deploy

---

## Performance Optimization

### Before Deployment

1. **Optimize images**
```bash
# Use tinypng.com or imagemagick
for img in assets/images/*.{jpg,png}; do
  convert "$img" -quality 85 -strip "$img"
done
```

2. **Choose renderer**
```bash
# HTML renderer (smaller, faster load)
flutter build web --release --web-renderer html

# CanvasKit renderer (better graphics, larger)
flutter build web --release --web-renderer canvaskit

# Auto (default)
flutter build web --release --web-renderer auto
```

3. **Enable tree shaking**
```bash
flutter build web --release --tree-shake-icons
```

4. **Analyze size**
```bash
flutter build web --release --analyze-size
```

### After Deployment

1. **Enable Compression**
   - All platforms support gzip compression
   - Configure in platform settings

2. **Set Cache Headers**
   - Static assets: Cache for 1 year
   - HTML: No cache or short cache

3. **Use CDN**
   - Firebase Hosting: Built-in CDN
   - Netlify: Built-in CDN
   - Others: CloudFlare (free CDN)

4. **Monitor Performance**
   - Google PageSpeed Insights
   - Lighthouse (Chrome DevTools)
   - WebPageTest.org

---

## CI/CD Automation

### GitHub Actions

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Firebase Hosting

on:
  push:
    branches:
      - main

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.9.2'
          
      - name: Install dependencies
        run: flutter pub get
        
      - name: Build web
        run: flutter build web --release
        
      - name: Deploy to Firebase
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
          channelId: live
          projectId: your-project-id
```

---

## Troubleshooting

### Issue: Blank page after deployment
**Solution**: Check base-href in build command
```bash
flutter build web --release --base-href "/"
```

### Issue: 404 on page refresh
**Solution**: Configure server for SPA routing (see platform-specific config above)

### Issue: Slow loading
**Solutions**:
- Use HTML renderer for faster load
- Optimize images
- Enable compression
- Use CDN
- Lazy load resources

### Issue: Icons not showing
**Solution**: Ensure fonts are loading correctly. Check CORS headers.

---

## Cost Comparison

| Platform | Free Tier | Bandwidth | Custom Domain | SSL |
|----------|-----------|-----------|---------------|-----|
| Firebase | 10GB storage, 360MB/day | Limited | Yes (free) | Yes (free) |
| Netlify | 100GB/month | Limited | Yes (free) | Yes (free) |
| GitHub Pages | 100GB/month | Soft limit | Yes (free) | Yes (free) |
| Vercel | 100GB/month | Limited | Yes (free) | Yes (free) |
| AWS S3 | 5GB storage (12 months) | Limited | Yes (paid) | Via CloudFront |

---

## Recommended Setup

For most users:
1. **Development**: Use Firebase Hosting or Netlify
2. **Custom Domain**: Configure DNS with your provider
3. **CI/CD**: Set up GitHub Actions or platform auto-deploy
4. **Monitoring**: Use Google Analytics (add to `web/index.html`)

---

## Next Steps

After deployment:
1. ✅ Test on multiple devices and browsers
2. ✅ Run Lighthouse audit
3. ✅ Set up Google Analytics
4. ✅ Submit to Google Search Console
5. ✅ Share your portfolio! 🎉

Happy deploying! 🚀

