### ⚠️ Under construction – Service Temporarily Unavailable ⚠️
The [Jizt backend](https://docs.jizt.it/backend/1_architecture.html) has proven to work great in the frame of a distributed, microservices architecture. However, the implementation of this architecture has actually taken most part of our development time, and due to our (yet) limited resources, has slowed down the actual implementation of new features.

With this in mind, we have decided to migrate the Jizt backend to a simpler monolithic architecture in pursuit of focusing our efforts on our main goal: provide a great summarization tool. Because let's be honest, we still don't have that many users and therefore powering our summarization pipeline with Kubernetes and Kafka is overkill at this point.

**So stay tuned! Jizt will be back soon! Meanwhile, you can follow the migration process here: [jizt-it/jizt-backend-mono](https://github.com/jizt-it/jizt-backend-mono).**

---

<p align="center"><img width="400" src="https://github.com/dmlls/jizt/blob/main/img/readme/JIZT-logo.svg" alt="Jizt"></p>

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
