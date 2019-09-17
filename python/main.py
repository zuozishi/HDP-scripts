import io
import os
import bs4
import requests
from xml.dom.minidom import Document

threadUrl = "https://www.discuz.net/thread-{id}-1-1.html"
forumUrl = "https://www.discuz.net/forum-plugin-{page}.html"
pageCount = 10

def parsePage(threadId):
    url = threadUrl.format(id=threadId)
    print("GET: " + url)
    response = requests.get(url)
    html = bs4.BeautifulSoup(response.text, "html.parser")
    #标题
    title = html.select_one("#thread_subject").string
    #查看次数
    viewCount = html.select(".xi1")[0].string
    #回复数
    postCount = html.select(".xi1")[1].string
    doc = Document()
    thread = doc.createElement("Thread")
    thread.setAttribute("Title", title)
    thread.setAttribute("ViewCount", viewCount)
    thread.setAttribute("PostCount", postCount)
    posts = html.select(".plhin")
    for post in posts:
        postNode = doc.createElement("Post")
        postNode.setAttribute("ID", post.select_one(".xw1").text)
        postNode.setAttribute("Time", post.select("em")[1].text)
        text = doc.createTextNode(post.select_one(".pcb").text)
        postNode.appendChild(text)
        thread.appendChild(postNode)
        pass
    doc.appendChild(thread)
    file = open(os.path.realpath("data/{}.xml".format(threadId)), mode='w', encoding='utf-8')
    file.write(doc.toprettyxml())
    file.close()
    return

def parseListPage(html):
    html = bs4.BeautifulSoup(html, "html.parser")
    tbodys = html.find_all("tbody")
    for tbody in tbodys:
        if (tbody.attrs.__contains__('id') and tbody.attrs['id'].__contains__('normalthread_')):
            parsePage(tbody.attrs['id'].replace("normalthread_",""))
        pass
    return

def getForum(page):
    url = forumUrl.format(page=page)
    print("GET: " + url)
    response = requests.get(url)
    parseListPage(response.text)
    return

if os.path.isdir("data"):
    os.removedirs("data")
os.mkdir("data")
for page in range(1, pageCount + 1):
    getForum(page)
    pass