from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    #return "index.html"
    return render_template('index.html')
    
# Run in port 80    
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)