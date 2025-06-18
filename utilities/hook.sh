#!/bin/bash

finance_app() {
	session="$1"
	project_path="~/workspace/FinanceApp/"

	tmux has-session -t $session 2>/dev/null

	if [ $? != 0 ]; then
		tmux new-session -d -s $session -n nvim "cd $project_path && nvim ."
		tmux new-window -t $session:1 -n testing "cd $project_path && bash"
		tmux new-window -t $session:2 -n docker "cd $project_path/docker-setup && bash"
		tmux select-window -t $session:0
	fi

	tmux attach -t $session
}

interview() {
	session="$1"
	project_path="~/workspace/InterviewPrep/"

	tmux has-session -t $session 2>/dev/null

	if [ $? != 0 ]; then
		tmux new-session -d -s $session -n nvim "cd $project_path && nvim ."
		tmux new-window -t $session:1 -n testing "cd $project_path && bash"
		tmux select-window -t $session:0
	fi

	tmux attach -t $session
}

case $1 in
	"financeapp")
		finance_app $1 
		;;
	"interview")
		interview $1
		;;
esac
