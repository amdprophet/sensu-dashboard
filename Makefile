COFFEE_BIN = coffee
SASS_BIN = sass
SLIM_BIN = slim
ASSETS_DIR = assets
PUBLIC_DIR = public
TMP_DIR = tmp

# Compile CoffeeScript
COFFEE_DIR = $(ASSETS_DIR)/javascripts
COFFEE_APP = $(TMP_DIR)/app.coffee
COFFEE_FILES := $(shell find $(COFFEE_DIR) -regex ".*/[a-z_-]*.coffee" -print)
JS_APP = $(PUBLIC_DIR)/js/app.js

$(COFFEE_APP): $(COFFEE_FILES)
	mkdir -p $(TMP_DIR)
	cat > $@ $^

$(JS_APP): $(COFFEE_APP)
	$(COFFEE_BIN) -bcp $< > $@

.PHONY: js
js: $(COFFEE_APP) $(JS_APP)

# Compile SASS
SASS_DIR = $(ASSETS_DIR)/stylesheets
SASS_APP = $(TMP_DIR)/app.scss
SASS_FILES := $(shell find $(SASS_DIR) -regex ".*/[a-z_-]*.scss" -print)
CSS_APP = $(PUBLIC_DIR)/css/app.css

$(SASS_APP): $(SASS_FILES)
	mkdir -p $(TMP_DIR)
	cat > $@ $^

$(CSS_APP): $(SASS_APP)
	$(SASS_BIN) -C $< > $@

.PHONY: css
css: $(SASS_APP) $(CSS_APP)

SLIM_DIR = $(ASSETS_DIR)/views
SLIM_APP = $(TMP_DIR)/index.html.slim
SLIM_APP_FILE =

.PHONY: html
html: $(SLIM_APP) $(HTML_APP)

.PHONY: all
all: js css

.PHONY: clean
clean:
	rm -rf $(TMP_DIR)
	rm -f $(JS_APP)
	rm -f $(CSS_APP)
