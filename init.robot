*** Settings ***
Library           BuiltIn
Library           Selenium2Library    30    10
Library           String
Library           ./library/automatic.py

Resource          ./library/apply_lesson.robot
Resource          ./library/common.robot
Resource          ./library/login.robot
Resource          ./library/position.robot

Variables         ./setting.py
