import { QMainWindow, QWidget, QLabel, FlexLayout, QLineEdit, QPushButton, QScrollArea } from "@nodegui/nodegui";
import { ResultView } from "./resultview";
import sdapi from "sdapi";


const win = new QMainWindow();
win.setWindowTitle("SpanishDict");

const rootWidget = new QWidget();
rootWidget.setLayout(new FlexLayout());
rootWidget.setObjectName("root");

// ====== The search bar at the top ======
const searchBarWidget = new QWidget();
searchBarWidget.setLayout(new FlexLayout());
searchBarWidget.setObjectName("searchBar");

const searchInputBox = new QLineEdit();
searchInputBox.setObjectName("searchTextEdit");
searchInputBox.addEventListener("textChanged", (text) => {
  searchButton.setEnabled(!!text);
});
searchBarWidget.layout.addWidget(searchInputBox);

const searchButton = new QPushButton();
searchButton.setEnabled(false);
searchButton.setText("Search");
searchButton.addEventListener("clicked", async () => {
  const word = searchInputBox.text();
  console.debug(`Searching ${word} on SpanishDict`);
  const results = await sdapi.translate(word);
  console.debug(`Results from SpanishDict`, results);
  resultView.data = results;
});
searchBarWidget.layout.addWidget(searchButton);


// ====== The result view ======
const resultView = new ResultView();
resultView.setObjectName("resultArea");

rootWidget.layout.addWidget(searchBarWidget);
rootWidget.layout.addWidget(resultView);
rootWidget.setStyleSheet(`
  #root {
    height: 340px;
    width: 480px;
  }
  #searchBar {
    flex-direction: row;
  }
  #searchTextEdit {
    flex: 1;
  }
  #resultArea {
    flex: 1;
    margin-top: 5px;
  }
`);

win.setCentralWidget(rootWidget);
win.show();

global.win = win;
