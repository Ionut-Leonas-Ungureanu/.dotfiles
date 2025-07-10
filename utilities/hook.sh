#!/bin/bash

SESSION="$1"

finance_app() {
	project_path="~/workspace/FinanceApp/"

	tmux has-session -t $SESSION 2>/dev/null

	if [ $? != 0 ]; then
		tmux new-session -d -s $SESSION -n nvim "cd $project_path && nvim ."
		tmux new-window -t $SESSION:1 -n testing "cd $project_path && bash"
		tmux new-window -t $SESSION:2 -n docker "cd $project_path/docker-setup && bash"
		tmux select-window -t $SESSION:0
	fi

	tmux attach -t $SESSION
	tmux kill-session -t $SESSION
}

interview() {
	project_path="~/workspace/interview-prep/InterviewPrep/"

	tmux has-session -t $SESSION 2>/dev/null

	if [ $? != 0 ]; then
		tmux new-session -d -s $SESSION -n nvim "cd $project_path && nvim ."
		tmux new-window -t $SESSION:1 -n testing "cd $project_path && bash"
		tmux select-window -t $SESSION:0
	fi

	tmux attach -t $SESSION
	tmux kill-session -t $SESSION
}

tankaboom() {
	project_path="~/workspace/tankaboom"
	frontend_path="$project_path/tankaboom.frontend/src"

	tmux has-session -t $SESSION 2>/dev/null

	if [ $? != 0 ]; then
		tmux new-session -d -s $SESSION -n frontend "cd $frontend_path && nvim ."
		tmux new-window -t $SESSION:1 -n frontend-testing "cd $frontend_path && python serve.py"
		tmux new-window -t $SESSION:2 -n README "cd $project_path && nvim README.md"
		tmux select-window -t $SESSION:0
	fi

	tmux attach -t $SESSION
	tmux kill-session -t $SESSION
}

case $SESSION in
	"financeapp")
		finance_app 
		;;
	"interview")
		interview
		;;
	"tankaboom")
		tankaboom
		;;
esac
