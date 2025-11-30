# GitHub Actions CI/CD

## AdDisplayAreaType自動生成

このプロジェクトでは、`ad_display_area_types.yaml`ファイルを編集することで、Dartファイルと JSONファイルが自動的に生成されます。

### 仕組み

mainブランチに`ad_display_area_types.yaml`への変更がマージされると、GitHub Actionsが自動的に以下のファイルを更新します:

- `lib/enums/ad_display_area_type.dart`
- `data/ad_display_area_type.json`

### 実装方式

現在は**直接Push方式**を採用しています。

#### 直接Push方式（デフォルト）
- ファイル: `generate_ad_display_area_type.yml`
- 動作:
  1. YAMLの変更を検知してファイルを自動生成
  2. 自動的にmainブランチにコミット&プッシュ
  3. `[skip ci]`タグにより無限ループを防止
- メリット:
  - より迅速な反映
  - PRの手間が不要
  - シンプルで確実な動作

### ワークフロー

1. `ad_display_area_types.yaml`を編集
2. ブランチにcommit & push
3. Pull Requestを作成
4. mainブランチにマージ
5. GitHub Actionsが自動的にDartとJSONファイルを生成し、mainに直接コミット

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

### 権限設定

以下のリポジトリ設定が必要です:

**Settings > Actions > General > Workflow permissions**
- "Read and write permissions" を選択

この設定により、GitHub Actionsがmainブランチに直接コミットできるようになります。

### 注意事項

- 生成されたファイル（DartとJSON）は直接編集しないでください
- 全ての変更は`ad_display_area_types.yaml`経由で行ってください
- コミットメッセージに`[skip ci]`が含まれるため、無限ループは発生しません
