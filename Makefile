
all:
	for d in $(player) $(libraries); \
	do                               \
		$(MAKE) --directory=$$d;       \
        done


clean:
	rm -rf ./bin/*
	FOO=bar
	$(info $(FOO) $(origin FOO))

