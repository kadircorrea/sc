import os
import base64
from appium import webdriver
from selenium.webdriver.common.by import By, ByType
from time import sleep
from appium import webdriver
from appium.options.android import UiAutomator2Options
from appium.options.ios import XCUITestOptions
from appium.webdriver.common.appiumby import AppiumBy
from appium.webdriver.common.appiumby import AppiumBy
import json
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.actions import interaction
from selenium.webdriver.common.actions.action_builder import ActionBuilder
from selenium.webdriver.common.actions.pointer_input import PointerInput
from appium.webdriver.extensions.location import Location
from selenium.webdriver import ActionChains
from selenium.webdriver.common.actions.pointer_input import PointerInput
from selenium.webdriver.common.actions import interaction
from selenium.webdriver.common.actions.interaction import POINTER_TOUCH




def find_element_with_retries(driver, locator_strategy, locator_value, retries=3, timeout_per_try=5):
    for attempt in range(retries):
        try:
            print(f"Attempt {attempt+1} to find element: {locator_value}")
            element = WebDriverWait(driver, timeout_per_try).until(
                EC.presence_of_element_located((locator_strategy, locator_value))
            )
            print("Element found!")
            return element
        except TimeoutException:
            print(f"Attempt {attempt+1} failed. Retrying...")
    raise Exception(f"Element not found after {retries} retries: {locator_value}")


username = os.environ.get('SAUCE_USERNAME')
access_key = os.environ.get('SAUCE_ACCESS_KEY')

url_us = f'https://{username}:{access_key}@ondemand.eu-central-1.saucelabs.com:443/wd/hub'

desired_caps = {
    "platformName": "iOS",
    "browserName": "Safari",
    "appium:platformVersion": "17",
    "appium:automationName": "XCUITest",
    "appium:deviceName": "iPhone.*",
    "sauce:options": {
        "name": "Checking appium with IOS",
        #"armRequired": True,
        "appiumVersion":"2.0.0"
    }
}

driver = webdriver.Remote(
    command_executor=url_us,
    options=XCUITestOptions().load_capabilities(desired_caps)
)
screenshot = driver.get_screenshot_as_base64()
print(screenshot)
driver.get('https://www.google.es')

driver.quit()
