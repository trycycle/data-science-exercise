# Data Science Exercise
このリポジトリは，データサイエンスの重要技術や理論を実践的に学習するための課題集です．
この課題集では，
* 典型的なデータ分析課題であれば，ライブラリを使ってそれなりに解けるようになること
* データサイエンスで用いられる基本的なアルゴリズムについて，きちんと理解すること
* 実際にデータ分析を行う際に必要となる最低限の作法について習得すること

を目標としています．


## 想定レベル
課題レベルはデータサイエンス初心者を想定しているが，基本的なPythonのプログラミング技術を有していることを前提としています．特に``numpy``や``pandas``の操作については，ある程度経験があることを想定しています．

Pythonコーディングに不安がある場合は，[Data Science Bootcamp for Beginners](https://github.com/trycycle/data-science-bootcamp)のQ30くらいまでは解けるようにしてください．


## 扱う内容
1. [SQL & 探索的データ解析（10問）](/exploratory-data-analaysis.ipynb)
2. [教師なし学習（クラスタリング & 次元圧縮）（10問）](/unsupervised-learning.ipynb)
3. [回帰（15問）](/regression.ipynb)
4. [分類（15問）](/classification.ipynb)
5. [効果検証と因果推論（10問）](/causal-analysis.ipynb)
6. [グラフ解析（10問）](/graph-analysis.ipynb)
7. [機械学習アラカルト（勾配法 & 次元の呪い & 特徴量選択）（10問）](/misc.ipynb)



## コーディング環境
本課題集では，Python 3.xを開発環境を使って課題に取り組みます．
環境がない場合は，Pythonが実行できる環境を構築してください

また，ライブラリとして下記を用いますので，別途インストールしておいてください．
* pandas
* matplotlib
* seaborn
* numpy
* scipy
* scikit-learn
* statsmodels
* networkx

