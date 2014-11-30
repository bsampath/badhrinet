clean:
	docpad clean

dev: clean
	docpad generate --env static,development

prod: clean
	docpad generate --env static,production

run:
	cd out && \
	python -c "import SimpleHTTPServer,BaseHTTPServer; BaseHTTPServer.HTTPServer((\"\", "1080"), SimpleHTTPServer.SimpleHTTPRequestHandler).serve_forever()"
