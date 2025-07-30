# 🚀 MyPaperHive Django App

Welcome to **MyPaperHive** — your friendly, consumer-oriented Document Management System (DMS) designed to help households effortlessly archive personal documents. Inspired by my experience with Kofax, ABBYY, and Therefore, this app makes it easy to organize important papers, set reminders for invoices, subscriptions, or document expirations, and keep everything under control — all tailored for everyday home use.

---

## Bee Theme & Branding 🐝

Just like busy bees in a hive, **MyPaperHive** is designed to buzz around your documents — organizing, securing, and helping you find what you need quickly and easily.  
Our friendly, smiling bee mascot symbolizes productivity, care, and community — all core values we want to bring to your paper organization experience.

Expect honeycomb-inspired design elements, warm yellow and black colors, and even little animated bees fluttering on the site to make your document management journey as pleasant as a sunny day in the garden! 🌼🐝✨


<div style="display: flex; justify-content: center; gap: 100px;">
  <img src="resources/images/B-Smiling.png" alt="B Smiling" width="150" />
  <img src="resources/images/B-Organizing.png" alt="B Organizing" width="150" />
</div>





---

## Why MyPaperHive? 🐝

* Simple, user-first experience — no tech jargon!
* Django backend with REST API for power and scalability
* PostgreSQL database for reliable storage
* Secure deployment using Docker, Nginx, and SSL
* Built-in workflow automation, metadata tagging, OCR integration
* Collaboration, version control, and lightning-fast search

---

## Important info

* VPS Server: `212.227.161.134` by Strato
* Domain: [mypaperhive.com](https://mypaperhive.com) by NameCheap

---

Ready to build something awesome? Let’s do this! 🐝✨

---

## Quick Start Guide & TODOs ✅

### Phase 0: Domain & Server Setup 🌐 — *Almost there! Keep going!*

* [x] Find your VPS public IP address: `212.227.161.134` (Strato VPS)
* [x] Log in to your Namecheap account
* [x] Go to **Domain List** → Click **Manage** next to `mypaperhive.com`
* [x] Open the **Advanced DNS** tab
* [x] Add or update **A Record** for your domain pointing to VPS IP
* [x] (Optional) Add **CNAME Record** for `www`
* [x] Save DNS changes and wait for propagation
* [x] SSH into your VPS and run a quick HTTP server test
* [x] Stop test server, install and configure Nginx
* [x] Configure Nginx for Django app with Gunicorn/uWSGI
* [x] Install Certbot and get Let’s Encrypt SSL certificate
* [x] Open firewall ports 80 and 443
* [x] Test SSL-enabled website access

🎉 **Phase 0 done! Your foundation is rock solid. Onward!**

---

### Phase 1: Setup & Basic Framework ⚙️ — *Let's lay the groundwork!*

* [ ] Set up Python virtual environment
* [ ] Install Django and Django REST Framework
* [ ] Initialize Django project and main app (`mypaperhive`)
* [ ] Configure PostgreSQL database
* [ ] Set up user authentication (register, login, logout)
* [ ] Create user model (extend `AbstractUser` if needed)

💡 *Tip: Take breaks and celebrate small wins — each step moves you closer!*

---

### Phase 2: Document Upload & Storage 📁 — *Time to let users upload their precious docs!*

* [ ] Design document model (file, metadata, user link)
* [ ] Implement file upload with validation (file types, size)
* [ ] Configure media storage (local dev, cloud prod)

Keep the momentum going — you’re doing great! 💪

---

### Phase 3: OCR Integration 🔍 — *Make those docs searchable with magic text extraction!*

* [ ] Choose OCR engine (Tesseract, ABBYY Cloud SDK, etc.)
* [ ] Integrate OCR with document upload
* [ ] Store OCR text with documents
* [ ] Display extracted text on document detail page

Almost like building your own superpower! ⚡

---

### Phase 4: Document Organization & Search 🗂️ — *Help users find stuff lightning fast!*

* [ ] Implement tagging & categorization
* [ ] Add search on metadata & OCR text
* [ ] Create UI for folders, tags, filters

Stay curious and creative — your users will thank you! 🙌

---

### Phase 5: Background Processing & Performance ⚡ — *Smooth and speedy, just how we like it!*

* [ ] Set up Celery and Redis for async OCR tasks
* [ ] Add progress/status indicators for OCR jobs

Pro tip: Async tasks = happy users 😄

---

### Phase 6: User Interface & Experience 🎨 — *Make it pretty and easy on the eyes!*

* [ ] Design clean, responsive frontend (Django templates or React/Vue)
* [ ] Build dashboard with recent docs & stats
* [ ] Ensure mobile-friendly design

Design + function = ❤️

---

### Phase 7: Security & Deployment 🔐 — *Lock it down and go live!*

* [ ] Enforce permissions: users access only their own data
* [ ] Set up HTTPS & security best practices
* [ ] Deploy to cloud platform (Heroku, AWS, DigitalOcean, etc.)
* [ ] Configure automated backups and monitoring

You’re the gatekeeper of your kingdom 👑

---

### Phase 8: Future Features & Expansion 🌟 — *Dream big, build bigger!*

* [ ] Integrate cloud storage (Google Drive, Dropbox, etc.)
* [ ] Add document sharing & collaboration
* [ ] Export options (PDF, CSV, Excel)
* [ ] Explore mobile app using REST API

The future is bright — keep imagining and building! 🚀

---

## Getting Involved 💡

* Start small, build MVP features first
* Use Git and push your code to GitHub/GitLab (for backups and version control)
* Write tests for critical features
* Celebrate progress daily — you’ve got this! 🎉
