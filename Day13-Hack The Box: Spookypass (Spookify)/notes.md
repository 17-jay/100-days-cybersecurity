## Objective

Identify and exploit a Server-Side Template Injection (SSTI) vulnerability in a Flask web application using the Mako template engine, in order to read a sensitive server-side file (flag.txt) and retrieve the flag.

## Lab Overview

The target application is a Flask-based web service that takes user input via a GET parameter and renders it inside a Mako HTML template. Due to lack of input sanitization, user-controlled input is evaluated as Python code on the server. This leads to arbitrary server-side code execution.

## Technologies Observed

- Flask (Python web framework)
- Mako (template engine)
- Docker (containerized deployment)





Template Injection Point

Inside templates/index.html, the following syntax is used:

Happy Halloween $(output)

Why this is important

$(...) is Mako syntax

Mako evaluates Python expressions inside $(...)

Any user-controlled data reaching this point can be executed server-side


## What is Server-Side Template Injection (SSTI)?

- SSTI occurs when user input is embedded directly into a template
- The template engine evaluates the input as code
- This allows attackers to execute commands or access server resources
In this lab, SSTI allows Python code execution.


## Exploitation Concept

- Inject a Python expression through the text parameter
- The expression is executed by Mako
- Server-side files can be accessed
- The output must evaluate to a string
- The content of flag.txt is returned in the HTTP response
Non-string return values (lists, objects, file handles) result in application errors.




## Key Takeaways

- SSTI is more dangerous than XSS because it executes on the server
- Template engines must never render unsanitized user input
- Understanding template syntax is critical in web exploitation
- Output data types matter during exploitation
