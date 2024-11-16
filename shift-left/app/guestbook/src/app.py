from flask import Flask, request, render_template_string

app = Flask(__name__)

entries = []

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        name = request.form.get("name")
        message = request.form.get("message")
        if name and message:
            entries.append({"name": name, "message": message})
    return render_template_string("""
        <!doctype html>
        <title>Guestbook</title>
        <h1>Guestbook</h1>
        <form method="post">
            <input type="text" name="name" placeholder="Your name" required>
            <textarea name="message" placeholder="Your message" required></textarea>
            <button type="submit">Submit</button>
        </form>
        <h2>Entries:</h2>
        <ul>
        {% for entry in entries %}
            <li><b>{{ entry.name }}</b>: {{ entry.message }}</li>
        {% endfor %}
        </ul>
    """, entries=entries)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
