import { QWidget, QLabel, FlexLayout, QListView, QStandardItem, QStandardItemModel } from '@nodegui/nodegui';

/*
class ExamplesWidget extends QWidget {
  constructor(examples) {
    super();
    const layout = new FlexLayout();
    this.setLayout(layout);
    examples.forEach(example => {
      const label = new QLabel();
      // TODO: make it nice with numbers
      label.setText(JSON.stringify(example, null, 2));
      layout.addWidget(label);
    });
  }
}

class ResultEntryWidget extends QListWidgetItem {
  constructor(data) {
    super();
    const layout = new FlexLayout();
    this.setLayout(layout);

    const word = data.word;
    const part = data.part;
    const wordPartLabel = new QLabel();
    wordPartLabel.setText(word + "\t\t(" + part + ")"); // TODO: prettier
    layout.addWidget(wordPartLabel);

    const region = data.regions.join(", "); // TODO: add this

    const meaning = data.meaning;
    const meaningLabel = new QLabel();
    meaningLabel.setText(meaning);
    layout.addWidget(meaningLabel);

    layout.addWidget(new ExamplesWidget(data.examples));
  }
}*/

function createItemModelFromResults(results) {
  console.log(JSON.stringify(results, null, 2));
  results.forEach((result) => {
    // TODO
  });
}

export class ResultView extends QListView {
  constructor() {
    super();
    this._data = {};
  }

  get data() {
    return this._data;
  }

  set data(results) {
    this._data = results;
    //this.setModel(createItemModelFromResults(results));
  }
}
