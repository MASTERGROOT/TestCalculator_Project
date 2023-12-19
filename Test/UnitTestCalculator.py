import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time

class TestCalculator(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.implicitly_wait(30)
        self.driver.get("https://mastergroot.github.io/TestCalculator_Project/index.html")
        self.driver.maximize_window()
        

    def test_open_calculator(self):
        driver = self.driver
        self.assertIn("CALCULATOR", driver.title)


    def test_click_calculator(self):
        driver = self.driver
        display_input = driver.find_element(By.ID,'calculator-display')
        for i in [7,8,9,'/',4,5,6,'*',1,2,3,'-',0,'.','+','CLEAR','DEL','=']:
            elem = driver.find_element(By.XPATH, f"//p[@class='button-text'][text() = '{i}']")
            time.sleep(0.5)
            elem.click()
            # self.assertEqual(display_input.get_attribute("value"), "7")

    def test_clickFooter(self):
        driver = self.driver
        time.sleep(1)
        driver.find_element(By.XPATH, f"//p[@class='credit-text'][text() = 'SIMPLE CALCULATOR']").click()
        time.sleep(1)
        


    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
