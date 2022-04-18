<a href="https://www.jizt.it"><p align="center"><img width="450" src="https://github.com/jizt-it/jizt-backend/blob/main/docs/source/_static/images/jizt-logo.png" alt="Jizt"></p></a>

<p align="center" display="inline-block">
  <a href="https://github.com/dmlls/jizt-app/actions?query=workflow%3A%22Test+build%22">
    <img src="https://github.com/dmlls/jizt-app/workflows/Test%20build/badge.svg?branch=main" alt="Build">
  </a>
  <a href="https://github.com/dmlls/jizt-app/actions?query=workflow%3A%22Deploy+Android+app%22">
    <img src="https://github.com/dmlls/jizt-app/workflows/Deploy%20Android%20app/badge.svg" alt="Deploy Android app">
  </a>
  <a href="https://github.com/dmlls/jizt-app/actions?query=workflow%3A%22Deploy+Web+app%22">
    <img src="https://github.com/dmlls/jizt-app/workflows/Deploy%20Web%20app/badge.svg" alt="Deploy Web app">
  </a>
</p>

<h3 align="center">AI Text Summarization in the Cloud</h3>
<br/>

Jizt makes use of the latest advances in Natural Language Processing (NLP), using state-of-the-art language generation models, such as Google's <a href="https://arxiv.org/abs/1910.10683">T5</a> model, to provide accurate and complete abstractive summaries.

## What is Jizt?

📄 Jizt generates abstractive summaries, i.e. summaries containing words or expressions that do not appear in the original text. In addition, it allows you to adjust the parameters of the summary, such as its length or the generation method to be used.

✨ You can access the app at [app.jizt.it](https://app.jizt.it) and through [Google Play](https://play.google.com/store/apps/details?id=it.jizt.app).

## Docs

You can access the project documentation through [docs.jizt.it](https://docs.jizt.it).

## Quick Start

1. Clone the app repository:
```
git clone https://github.com/jizt-it/jizt-app.git
```
2. Run the code generation tool:
```
flutter pub run build_runner build --delete-conflicting-outputs
```
3. Compile the app (available environments: `mock`|`dev`|`prod`):
```
flutter run --dart-define=JIZT_APP_ENV=dev
```

## Contribute

Do you want to contribute to the project? Awesome! At [CONTRIBUTING.md](https://github.com/dmlls/jizt/blob/main/CONTRIBUTING.md) you will find helpful information. Also, if you want to financially support the project, you can do so at [paypal.me/jiztit](https://www.paypal.com/paypalme/jiztit).

## What's coming next?

You can take a look at the [Jizt Roadmap](https://github.com/orgs/jizt-it/projects/1) GitHub project to find information about the tasks we are currently working on, and those that will be implemented soon.
