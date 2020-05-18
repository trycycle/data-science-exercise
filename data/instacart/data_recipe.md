# Instacartデータセットの詳細
食料品即日配達サービス[Instacart](https://www.instacart.com)の注文データ．[データダウンロードリンク](https://www.instacart.com/datasets/grocery-shopping-2017)よりデータが納められたzipファイル（約200MB）をダウンロードすることができる．

### ``departments.csv``
商品売り場（カテゴリ）に関するデータ（21件）
* `department_id`: 商品売り場ID
* `department`: 商品売り場名

### ``aisles.csv``
商品棚（サブカテゴリ）に関するデータ（134件）
* `aisle_id`: 商品棚ID
* `aisle`: 商品棚名

### ``products.csv``
商品に関するデータ（約5万件）
* `product_id`: 商品ID
* `product_name`: 商品名
* `aisle_id`: 商品棚ID（外部キー）
* `department_id`: 商品売り場ID（外部キー）

### ``orders.csv``
注文に関するデータ（約20万6000ユーザによる約340万件の注文）
* `order_id`: 注文ID
* `user_id`: 顧客ID
* `eval_set`: 対応する注文詳細データの分類（``prior``，``train``，``test``のいずれか）
* `order_number`: 対象顧客にとって何回目の注文かを表す数（1 = 初回, n = n回目）
* `order_dow`: 注文された曜日（0=土曜日，6=金曜日）
* `order_hour_of_day`: 注文された時間帯（時）
* `days_since_prior`: 前回の注文からの経過日数（空の場合は`order_number`=1を意味する）

### ``order_products__train.csv``
各Instacartユーザが最も最近行った注文の明細データ
* `order_id`: 注文ID（外部キー）
* `product_id`: 商品ID（外部キー）
* `add_to_cart_order`: 対象商品が「カート」に入れられた順番
* `reordered`: 再注文フラグ．対象顧客が対象商品を過去に注文したことがあれば1，そうでなければ0

### ``order_products__prior.csv``
各Instacartユーザが過去に行った注文の明細データ（最も最近の注文を除く）
* `order_id`: 注文ID（外部キー）
* `product_id`: 商品ID（外部キー）
* `add_to_cart_order`: 対象商品が「カート」に入れられた順番
* `reordered`: 再注文フラグ．対象顧客が対象商品を過去に注文したことがあれば1，そうでなければ0