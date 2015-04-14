# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://badhri.net"

			# The default title of our website
			title: "Badhri Sampathkumar"

			# The website author's name
			author: "Badhri Sampathkumar"

			# The website author's email
			email: "me@badhri.net"

			# Styles
			styles: [    		
    			"//fonts.googleapis.com/css?family=Ubuntu"
				"//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
				"//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
				"/styles/custom.css"
			]

			# Scripts
			scripts: [
				"//cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"
				"//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"
				"//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"
				"/scripts/script.js"
			]



		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		getCuttedContent: (content) ->            
			i = content.search('<!-- Read more -->')
			if i >= 0
				content[0..i-1]                
			else
				content

		hasReadMore: (content) ->
			content.search('<!-- Read more -->') >= 0

		getFormattedDate: (date) ->
			timeStamp = [date.getFullYear(), (date.getMonth() + 1), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()].join(" ")
			RE_findSingleDigits = /\b(\d)\b/g			
			timeStamp = timeStamp.replace( RE_findSingleDigits, "0$1" )
			timeStamp.replace /\s/g, ""
			timeStamp		

		getPageUrlWithHostname: ->
			"#{@site.url}#{@document.url}"

		# Discus.com settings
		disqusShortName: 'badhri-net'

	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		posts: ->
			@getCollection('documents').findAllLive({relativeDirPath: 'posts'}, [date: -1])

	environments:
		development:
			collections:
				pages: (database) ->
					database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

				posts: ->
					@getCollection('documents').findAllLive({relativeDirPath: {'$in' : ['posts', 'drafts']}}, [relativeDirPath: 1,  date: -1])
		production:
			collections:
				pages: (database) ->
					database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

				posts: ->
					@getCollection('documents').findAllLive({relativeDirPath: {'$in' : ['posts']}}, [relativeDirPath: 1,  date: -1])


	# =================================
	# Plugins

	plugins:
		moment:
			formats: [
				{raw: 'date', format: 'MMMM Do YYYY', formatted: 'humanDate'}
				{raw: 'date', format: 'YYYY-MM-DD', formatted: 'computerDate'}
			]			
		tags:
			extension: '.html.eco'
			injectDocumentHelper: (document) ->
				document.setMeta(
					layout: 'default'
					styles: '/styles/blog-home.css'
					data: """
						<%- @partial('abstract-list', {collection: @getFiles(tags: $has: @document.tag)}) %>
					"""
				)
		cleanurls:
			trailingSlashes: true
		dateurls:
			cleanurl: true
			trailingSlashes: true
			keepOriginalUrls: false
			collectionName: 'posts'
			dateIncludesTime: true

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()
}


# Export our DocPad Configuration
module.exports = docpadConfig
