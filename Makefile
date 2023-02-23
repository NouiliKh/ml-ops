install:
	pip install --upgrade pip && pip install pipenv && pipenv install

test:
	pipenv run python -m pytest -vv tests/sum_test.py

lint:
	pipenv run pylint --disable=R,C main.py

format:
	pipenv run black *.py

run:
	pipenv run python main.py
