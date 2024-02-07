#!/bin/python
from bs4 import BeautifulSoup as bsoup
import requests as req
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

options = webdriver.ChromeOptions() 
options.add_argument("/home/kirito/Downloads") # Set the download Path
options.binary_location = "/usr/bin/google-chrome-beta"

parentUrl = "https://ww4.kissanime2.org/Anime/su-shen-xiao-ren/1"
driver = webdriver.Chrome(options=options)
driver.get(parentUrl)
driver.find_element(By.ID,"playerframe").click()
time.sleep(20)



exit()
parentUrl = "https://animepahe.ru/anime/a0e39953-4bdd-6449-8ca1-3cf6e5532660"
driver = webdriver.Chrome(options=options)
driver.get(parentUrl)
urlsList = []
for tag in driver.find_elements(By.CLASS_NAME, "play"):
    urlsList.append(tag.get_attribute('href'))
driver.close()


options = webdriver.ChromeOptions() 
options.add_argument("/home/kirito/Downloads") # Set the download Path
options.binary_location = "/usr/bin/google-chrome-beta"
options.add_experimental_option("detach", True)
for url in urlsList:
    url = "https://animepahe.ru/play/a0e39953-4bdd-6449-8ca1-3cf6e5532660/8a711cb8fc16578ffe80231a51925c17ffd62eee9fba1fc9b9115015c5228ca4"
    soup = bsoup(req.get(url).content, "html.parser")
    link = soup.find('div', attrs={'id': 'pickDownload'}).findNext('a')['href']
    nsoup = bsoup(req.get(link).content, "html.parser")
    downloadpagelink = nsoup.find('a', attrs={'class': 'btn btn-primary btn-block redirect'})['href']
    driver = webdriver.Chrome(options=options)
    driver.get(downloadpagelink)
    WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.XPATH, '//*[@title="Sorry for the ads, we really need them to pay server bills and to keep the site up!"]'))).click()
    time.sleep(15)
