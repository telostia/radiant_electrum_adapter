# sample:
# make git b=main t="" m=""
git:
	git add .
	git commit -m "[$t]: $m"
	git push -u github $b

.PHONY: git