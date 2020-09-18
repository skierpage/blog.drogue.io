all: build

build: static/wood.3840w.jpg static/wood.1920w.jpg static/wood.768w.jpg
build: static/wood.3840w.webp static/wood.1920w.webp static/wood.768w.webp

# copy base images from assets
static/wood.3840w.jpg: assets/wood.jpg
	convert $< -shave "0x30%" -resize "3840" $@
static/wood.1920w.jpg: assets/wood.jpg
	convert $< -shave "0x30%" -resize "1920" $@
static/wood.768w.jpg: assets/wood.jpg
	convert $< -shave "0x30%" -resize "768" $@

# rule to convert from jpeg to webp
%.webp: %.jpg
	cwebp -m 6 $< -o $@

## Cleanup

clean:
	rm -Rf static/wood*.{jpg,webp}

## Meta

.PHONY: all clean build
