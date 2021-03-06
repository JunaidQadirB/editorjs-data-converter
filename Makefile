.PHONY: help commit close add-all push test phpcs

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

add-all: ## Add all changes to git.
	git add --all

commit: phpcs ## Use this makefile to write a commit message
	git commit -m "$(m)"

close: ## close a branch
	git tag archive/$(b) $(b)
	git branch -d $(b)

push: test ## Push the changes to git
	@echo "${colors[Green]}Pushing:${colors[Color_Off]} git push origin ${colors[Purple]}$$(git rev-parse --abbrev-ref HEAD)${colors[Color_Off]}"
	@git push origin "$$(git rev-parse --abbrev-ref HEAD)" $(options)

test: ## Check if phpunit passes.
	./vendor/bin/phpunit --coverage-text

phpcs: ## Fix the phpcs errors if there are any.
	./vendor/bin/php-cs-fixer fix --config=.php_cs.dist -v $(options)

##########################################
#curl www.bunlongheng.com/code/colors.png
# Reset
colors[Color_Off]=\033[0m# Text Reset

# Regular Colors
colors[Black]=\033[0;30m# Black
colors[Red]=\033[0;31m# Red
colors[Green]=\033[0;32m# Green
colors[Yellow]=\033[0;33m# Yellow
colors[Blue]=\033[0;34m# Blue
colors[Purple]=\033[0;35m# Purple
colors[Cyan]=\033[0;36m# Cyan
colors[White]=\033[0;37m# White

# Bold
colors[BBlack]=\033[1;30m# Black
colors[BRed]=\033[1;31m# Red
colors[BGreen]=\033[1;32m# Green
colors[BYellow]=\033[1;33m# Yellow
colors[BBlue]=\033[1;34m# Blue
colors[BPurple]=\033[1;35m# Purple
colors[BCyan]=\033[1;36m# Cyan
colors[BWhite]=\033[1;37m# White

# Underline
colors[UBlack]=\033[4;30m# Black
colors[URed]=\033[4;31m# Red
colors[UGreen]=\033[4;32m# Green
colors[UYellow]=\033[4;33m# Yellow
colors[UBlue]=\033[4;34m# Blue
colors[UPurple]=\033[4;35m# Purple
colors[UCyan]=\033[4;36m# Cyan
colors[UWhite]=\033[4;37m# White

# Background
colors[On_Black]=\033[40m# Black
colors[On_Red]=\033[41m# Red
colors[On_Green]=\033[42m# Green
colors[On_Yellow]=\033[43m# Yellow
colors[On_Blue]=\033[44m# Blue
colors[On_Purple]=\033[45m# Purple
colors[On_Cyan]=\033[46m# Cyan
colors[On_White]=\033[47m# White

# High Intensity
colors[IBlack]=\033[0;90m# Black
colors[IRed]=\033[0;91m# Red
colors[IGreen]=\033[0;92m# Green
colors[IYellow]=\033[0;93m# Yellow
colors[IBlue]=\033[0;94m# Blue
colors[IPurple]=\033[0;95m# Purple
colors[ICyan]=\033[0;96m# Cyan
colors[IWhite]=\033[0;97m# White

# Bold High Intensity
colors[BIBlack]=\033[1;90m# Black
colors[BIRed]=\033[1;91m# Red
colors[BIGreen]=\033[1;92m# Green
colors[BIYellow]=\033[1;93m# Yellow
colors[BIBlue]=\033[1;94m# Blue
colors[BIPurple]=\033[1;95m# Purple
colors[BICyan]=\033[1;96m# Cyan
colors[BIWhite]=\033[1;97m# White

# High Intensity backgrounds
colors[On_IBlack]=\033[0;100m# Black
colors[On_IRed]=\033[0;101m# Red
colors[On_IGreen]=\033[0;102m# Green
colors[On_IYellow]=\033[0;103m# Yellow
colors[On_IBlue]=\033[0;104m# Blue
colors[On_IPurple]=\033[0;105m# Purple
colors[On_ICyan]=\033[0;106m# Cyan
colors[On_IWhite]=\033[0;107m# White


color=${colors[$input_color]}
white=${colors[White]}
# echo $white
