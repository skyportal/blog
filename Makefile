.PHONY: github html serve clean

html:
	@hugo
	@touch public/.nojekyll
	@echo "blog.skyportal.io" > public/CNAME

serve:
	@hugo --i18n-warnings server

clean:
	rm -rf public

github: | clean html
	./tools/push_docs_to_repo.py \
	    --message "Blog update" \
	    --committer "SkyPortal-CI" \
	    --email "ci@skyportal.io" \
	    --branch "gh-pages" \
	    --force \
	    public \
	    git@github.com:skyportal/blog
