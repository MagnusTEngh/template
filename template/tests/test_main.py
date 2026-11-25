import runpy


def test_main_runs():
    runpy.run_path("src/main.py", run_name="__main__")
