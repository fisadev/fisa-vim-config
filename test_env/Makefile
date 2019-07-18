build_test_env:
	cp ../config.vim .
	docker build -t vim_config_test_env . 
	rm ./config.vim

disposable_test_env:
	# docker run --rm -i -t -v $(PWD)/:/fisa-vim-config vim_config_test_env bash
	docker run --rm -i -t vim_config_test_env
