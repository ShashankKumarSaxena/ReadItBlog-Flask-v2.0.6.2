from flask import Flask, render_template, redirect, request, session, flash, send_from_directory
from flask_sqlalchemy import SQLAlchemy
import os
from datetime import datetime 
import math
import json
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'super-secret-key'
db = SQLAlchemy(app)

local_server = True

app.config['UPLOAD_FOLDER'] = "D:\\Flask python learn1\\My own practice\\website1prc\\upload_files"

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:@localhost/flaskprac2"
else:
    pass


class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)
    subject = db.Column(db.String, nullable=False)
    message = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=True)

class Posts(db.Model):
    '''This will add posts to our blog '''
    ''' main-post-image, intro-title, intro-para, main-title, main-para, post-tags, publisher-name, publisher-desc, total-comments, post_slug, comments, *comment poster * '''
    sno = db.Column(db.Integer, primary_key=True)
    main_post_image = db.Column(db.String, nullable=False)
    intro_title = db.Column(db.String, nullable=False)
    intro_para = db.Column(db.String, nullable=False)
    main_title = db.Column(db.String, nullable=False)
    main_para = db.Column(db.String, nullable=False)
    post_tag = db.Column(db.String, nullable=False)
    publisher_name = db.Column(db.String, nullable=False)
    publisher_desc = db.Column(db.String, nullable=False)
    post_slug = db.Column(db.String, nullable=False)
    # main_post_image  = db.Column(db.String, nullable=False)
    main_img = db.Column(db.String, nullable=True)
    main_para2 = db.Column(db.String, nullable=False)
    pub_img = db.Column(db.String, nullable=True)
    date = db.Column(db.String, nullable=True)

class Comments(db.Model):
    ''' This will fetch all the comments on the blog '''
    ''' sno, name, email, website, message '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Integer, nullable=False)
    email = db.Column(db.Integer, nullable=False)
    website = db.Column(db.Integer, nullable=True)
    message = db.Column(db.Integer, nullable=False)
    date = db.Column(db.String, nullable=True)
    image = db.Column(db.String,nullable=True)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/6)
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*6:(page-1)*6+6]

    # pagination
    if (page == 1):
        prev = "#"
        next = "/?page="+str(page+1)
    elif(page == last):
        prev = "/?page="+str(page - 1)
        next = "#"
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)

    return render_template("index.html", posts=posts, date=datetime.now(), prev=prev, next=next)

# @app.route("/blog-single")
# def blog_single():
#     return render_template("blog-single.html")

# @app.route("/dashboard",methods=['GET','POST'])
# def dashboard():
#     post = Posts.query.all()
#     return render_template("dashboard.html",post=post)

@app.route("/blog", methods=['GET'])
def blog():
    # posts = Posts.query.filter_by().all()
    post = Posts.query.filter_by().all()
    last = math.ceil(len(post)/6)
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    post = post[(page-1)*6:(page-1)*6+6]

    # Pagination
    if (page == 1):
        prev = "#"
        next = "/?page="+str(page+1)
    elif(page == last):
        prev = "/?page="+str(page - 1)
        next = "#"
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)

    return render_template('blog.html',post=post, prev=prev, next=next)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/contact", methods = ['GET','POST'])
def contact():
    if(request.method == 'POST'):
        # name, email, subject, message
        name = request.form.get('name')
        email = request.form.get('email')
        subject = request.form.get('subject')
        message = request.form.get('message')
        entry = Contact(name=name, email=email, subject=subject, message=message, date=datetime.now())
        try:
            db.session.add(entry)
            db.session.commit()
        # return "Successfully sent! We will reach you shortly."
            flash("Message successfully sent! We will reach you shortly.")
        except:
            flask("Could not send message, please try again later.")
        # return render_template("cont-msg-snt1.html")
    return render_template("contact.html")

@app.route("/blog-single/<string:post_slug>", methods=['GET','POST'])
def post(post_slug):
    '''This wil display posts to the post page '''
    post = Posts.query.filter_by(post_slug=post_slug).first()
    posts = Posts.query.filter_by().all()
    postss = Posts.query.filter_by().all()
    comment = Comments.query.filter_by().all()

    ''' Fetch the comments here '''
    if(request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        website = request.form.get('website')
        message = request.form.get('message')

        entry = Comments(name=name, email=email, website=website, message=message, date=datetime.now())
        try:
            db.session.add(entry)
            db.session.commit()
            # return "Your comment has been added"
            flash("Your comment has been added successfully!")
        except:
            flash("Sorry! We are unable to add your comment this time. Please try again later.")
    # Flash a message to inform user

    last = math.ceil(len(posts)/4)
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*4:(page-1)*4+4]
    return render_template('blog-single.html',post=post, posts=posts, postss=postss, comment=comment)

@app.route("/blog-single/<string:post_tag>",methods=['GET'])
def post_using_tag():
    post = Posts.query.filter_by(post_tag=post_tag).first()
    return render_template("blog-single.html",post=post)


@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if('user' in session and session['user'] == "shashank@27"):
        ''' main-post-image, intro-title, intro-para, main-title, main-para, post-tags, publisher-name, publisher-desc, total-comments, post_slug'''
        if request.method == 'POST':
            main_post_image = request.form.get("main_post_image")
            intro_title = request.form.get("intro_title")
            intro_para = request.form.get("intro_para")
            main_title = request.form.get("main_title")
            main_para = request.form.get("main_para")
            main_para2 = request.form.get("main_para2")
            main_img = request.form.get("main_img")
            post_tags = request.form.get("post_tag")
            publisher_name = request.form.get("pub_name")
            publisher_img = request.form.get("pub_img")
            publisher_desc = request.form.get("pub_desc")
            post_slug = request.form.get("post_slug")
            date = datetime.now()

            if sno == '0':
                post = Posts(main_post_image=main_post_image,intro_title=intro_title, intro_para = intro_para, main_title= main_title, main_para=main_para, main_para2 = main_para2, post_tag=post_tags,publisher_name=publisher_name,publisher_desc=publisher_desc,post_slug=post_slug,date=datetime.now())
                try:
                    db.session.add(post)
                    db.session.commit()
                    flash("New post added successfully!")
                except:
                    flash("Unexpected error occured. Please chech database.")

            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.main_post_image = main_post_image
                post.intro_title = intro_title
                post.intro_para = intro_para
                post.main_title = main_title
                post.main_para = main_para
                post.main_para2 = main_para2
                post.main_img = main_img
                post.post_tag = post_tags
                post.publisher_name = publisher_name
                post.pub_img = publisher_img
                post.publisher_desc = publisher_desc
                post.date = date
                try:
                    db.session.commit()
                    flash("Edit Successful!")
                except:
                    flash("The post cant be edited this time")
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',post=post,sno=sno)
    else:
        # return "You are not allowed here. Sorry!"
        return render_template("signin.html")
        flash("Please sign in first")

                
@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/ad-panel')

@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if('user' in session and session['user'] == "shashank@27"):
        post = Posts.query.filter_by(sno=sno).first()
        try:
            db.session.delete(post)
            db.session.commit()
            flash("The post deleted successfully!")
        except:
            flash("The post cannot be deleted this time. Sorry")
        # return "Delete successful"
    return redirect('/dashboard')

@app.route("/upload",methods=['GET','POST'])
def uploader():
    if('user' in session and session['user'] == "shashank@27"):
        if(request.method == "POST"):
            file = request.files['file']
            try:
                file.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(file.filename)))
                return "Upload Successful"
                # flash("Upload Successful!")
            except:
                # flash("Upload unsuccessful")
                return "Upload unsuccessful"
    else:
        flash("Please sign in first")
        return render_template("signin.html")
    return "An error occured"

@app.route("/download/<filename>")
def download_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'],filename)    

@app.route("/ad-panel",methods=['GET','POST'])
def adpanel():
    if('user' in session and session['user'] == "shashank@27"):
        flash("Welcome admin!")
        post = Posts.query.all()
        render_template("dashboard.html",post=post)

    if request.method == 'POST':
        username = request.form.get("uname")
        passsword = request.form.get("pass")
        if(username == "shashank@27" and passsword == "vishu@2004blogadmin27"):
            # set the session variable
            session['user'] = username
            post = Posts.query.all()
            return render_template("dashboard.html",post=post)

    return render_template("signin.html")

@app.route("/zee-live")
def zee():
    return render_template("zee-news.html")

@app.route("/abp-live")
def abp():
    return render_template("abp-live.html")

@app.route("/indiatv-live")
def indiatv():
    return render_template("indiatv-live.html")

@app.route("/music-lofi")
def music_lofi():
    return render_template("music-lofi.html")

@app.route("/music-local")  
def music_local():
    flash("Good News! Request player is under contruction.")
    return render_template("music-local.html")

app.run(debug=True)