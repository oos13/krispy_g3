from flask import Flask, render_template, request, redirect, url_for, jsonify
from flask_restful import Api, Resource
from db_config import MySql
from app import app


api = Api(app)





# this routes to the home page
@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('home.html')

@app.route('/cart/')
def cart():
    return render_template("cart.html")

@app.route('/register/')
def register():
    return render_template("register.html")

@app.route('/login/', methods = ['POST'])
def login():
    try:
        json = request.json
        _email = json['Email']
        _cust_password = json['Customer_password']

        if _email and _cust_password and request.method == 'POST':
            conn = MySql.connect()
            cursor = conn.cursor()

            SQL_Query = "SELECT * FROM Customers WHERE Email=%s"
            SQL_where = (_email)
            
            if cursor.execute(SQL_Query, SQL_where):
                return render_template('home.html')

            else:
                return render_template("login.html")
    except Exception():
        print("error")
    finally:
        cursor.close()
        conn.close()


            



    



@app.route('/menu/')
def menu():
    return render_template("menu.html")

@app.route('/employee/')
def employee():
    return render_template("employee.html")


if __name__ == '__main__':
    app.run(debug=True)
