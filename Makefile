bucket = s3://badhri.net
clean:
	docpad clean

dev: clean
	docpad generate --env static,development

prod: clean
	docpad -o prod generate --env static,production

run:
	cd out && \
	python -c "import SimpleHTTPServer,BaseHTTPServer; BaseHTTPServer.HTTPServer((\"\", "1080"), SimpleHTTPServer.SimpleHTTPRequestHandler).serve_forever()"

list-bucket:
	s3cmd ls $(bucket)

sync:
	s3cmd sync  prod/ --exclude 'drafts/*' --delete-removed s3://badhri.net/

help:
	@echo list-bucket, prod, dev, clean, run, help
