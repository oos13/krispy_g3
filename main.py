from flask import Flask, render_template
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)





# this routes to the home page
@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('home.html')


@app.route('/', methods=['GET', 'POST'])
def cart():
    return render_template('cart.html')

# @app.route('/cart/')
# def cart():
#     return render_template("cart.html")

@app.route('/registration/')
def registration():
    return render_template("register.html")

@app.route('/login/')
def login():
    return render_template("login.html")

@app.route('/menu/')
def menu():
    return render_template("menu.html")


if __name__ == '__main__':
    app.run(debug=True)
