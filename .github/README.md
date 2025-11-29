# GitHub Actions CI/CD

## AdDisplayAreaType自動生成

このプロジェクトでは、`ad_display_area_types.yaml`ファイルを編集することで、Dartファイルと JSONファイルが自動的に生成されます。

### 仕組み

mainブランチに`ad_display_area_types.yaml`への変更がマージされると、GitHub Actionsが自動的に以下のファイルを更新します:

- `Flutter/enums/ad_display_area_type/ad_display_area_type.dart`
- `data/ad_display_area_type.json`

### 実装方式

現在は**Pull Request方式**を採用しています。

#### 方式1: Pull Request方式（デフォルト）
- ファイル: `generate_ad_display_area_type.yml`
- 動作:
  1. YAMLの変更を検知してファイルを自動生成
  2. 自動的にPull Requestを作成
  3. レビュー後、PRをマージすることで変更を反映
- メリット:
  - 生成されたコードをレビューできる
  - より安全な運用が可能
  - 権限設定が簡単

#### 方式2: 直接Push方式（オプション）
- ファイル: `generate_ad_display_area_type_direct.yml.example`
- 動作:
  1. YAMLの変更を検知してファイルを自動生成
  2. 自動的にmainブランチにコミット&プッシュ
- 使用方法:
  1. `.example`拡張子を削除してリネーム
  2. リポジトリ設定で権限を付与:
     - Settings > Actions > General > Workflow permissions
     - "Read and write permissions" を選択
  3. 元の`generate_ad_display_area_type.yml`を削除または無効化
- メリット:
  - より迅速な反映
  - PRの手間が不要

### ワークフロー

#### Pull Request方式の場合:
1. `ad_display_area_types.yaml`を編集
2. ブランチにcommit & push
3. Pull Requestを作成
4. mainブランチにマージ
5. GitHub Actionsが自動的にPRを作成
6. 自動生成されたPRをレビュー&マージ

#### 直接Push方式の場合:
1. `ad_display_area_types.yaml`を編集
2. ブランチにcommit & push
3. Pull Requestを作成
4. mainブランチにマージ
5. GitHub Actionsが自動的にDartとJSONファイルを生成し、コミット

### ローカルでの生成

ローカルで生成をテストしたい場合:

```bash
# PyYAMLのインストール
pip3 install pyyaml

# Dartファイルの生成
python3 .github/scripts/generate_dart_from_yaml.py

# JSONファイルの生成
python3 .github/scripts/generate_json_from_yaml.py
```

### 権限エラーのトラブルシューティング

`403 Permission denied`エラーが発生する場合:

1. リポジトリ設定を確認:
   - Settings > Actions > General > Workflow permissions
   - "Read and write permissions" を選択
   - "Allow GitHub Actions to create and approve pull requests" をチェック

2. それでも解決しない場合は、直接Push方式を試してください

### 注意事項

- 生成されたファイル（DartとJSON）は直接編集しないでください
- 全ての変更は`ad_display_area_types.yaml`経由で行ってください
- Pull Request方式では、自動生成されたPRを必ずレビューしてからマージしてください
