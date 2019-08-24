import os
from flask import Flask
app = Flask(__name__)

def print_env_vars(var_keys):
    try:
        return "".join(
            ["<code>%s: %s</code><br>" % (var_key, os.environ[var_key]) for var_key in var_keys]
        )
    except Exception as ex:
        return "There was a problem reading some ENV vars: %s" % str(ex)

@app.route('/')
def index():
    return (
        """<h1>Fake Webserver Service</h1>""" +
        """<p>This is a fake service for demoing Docker Swarm services.</p>""" +
        """<br>\n""" +
        """<h3>Env Vars:</h3>""" +
        """%s"""
    ) % print_env_vars([
        "PORT",
        "RATE_LIMITER",
        "SITE_NAME",
        "THEME",
    ])

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=os.environ['PORT']
    )
