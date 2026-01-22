#User input is retrieved from the text parameter and passed directly to the template renderer.

@web.route('/')
def index():
    text = request.args.get('text')
    if(text):
        converted = spookify(text)
        return render_template('index.html', output=converted)

    return render_template('index.html', output='')
