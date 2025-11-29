# GitHub Actions CI/CD

## AdDisplayAreaType自動生成

このプロジェクトでは、`ad_display_area_types.yaml`ファイルを編集することで、Dartファイルと JSONファイルが自動的に生成されます。

### 仕組み

mainブランチに`ad_display_area_types.yaml`への変更がマージされると、GitHub Actionsが自動的に以下のファイルを更新します:

- `Flutter/enums/ad_display_area_type/ad_display_area_type.dart`
- `data/ad_display_area_type.json`

### ワークフロー

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

### 注意事項

- 生成されたファイル（DartとJSON）は直接編集しないでください
- 全ての変更は`ad_display_area_types.yaml`経由で行ってください
- GitHub Actionsによる自動コミットには`[skip ci]`タグが含まれるため、無限ループは発生しません
