# wick_ad_screen

Wickアプリケーション用の広告表示エリアタイプ定義パッケージ

## 概要

このパッケージは、Wickアプリケーションで使用される全ての広告表示エリアの定義を提供します。

- Dart enum定義: `AdDisplayAreaType`
- JSON形式のマッピングデータ
- YAMLファイルによる一元管理

## インストール

`pubspec.yaml`に以下を追加:

```yaml
dependencies:
  wick_ad_screen:
    git:
      url: https://github.com/nagaya-masaru/wick_ad_screen.git
      ref: main
```

または特定のバージョンを指定:

```yaml
dependencies:
  wick_ad_screen:
    git:
      url: https://github.com/nagaya-masaru/wick_ad_screen.git
      ref: v1.0.0  # タグ指定
```

## 使用方法

### Dartでの使用

```dart
import 'package:wick_ad_screen/wick_ad_screen.dart';

// 広告表示エリアタイプの使用
final areaType = AdDisplayAreaType.mangaDetailPage;

// JSON値への変換（内部的に使用）
final jsonValue = areaType._toJsonValue(); // 'manga_detail_page'

// エリア名からindexを取得
final index = AdDisplayAreaTypeExtension.getIndexFromAreaName('manga_detail_page');
print(index); // 0
```

### JSONデータの使用

`data/ad_display_area_type.json`ファイルには、indexと名前のマッピングが含まれています:

```json
{
  "0": "mangaDetailPage",
  "1": "mangaPageViewer",
  ...
}
```

## 広告表示エリア一覧

### 漫画関連 (5箇所)
- 漫画詳細ページ
- 漫画ページビューアー
- 漫画ビューアー次話読み込みコンテンツ
- 漫画読み込みダイアログ
- 同人コミック読み込みダイアログ

### ポイント受け取り関連 (5箇所)
- ポイント一括受け取り確認ダイアログ
- キャンペーンポイント受け取りタブ
- ポイント受け取りダイアログ
- 5分間リワードタブ
- 即座受け取り確認ダイアログ

### キャンペーン関連 (9箇所)
- キャンペーンページ
- キャンペーンアイテムページ
- キャンペーン詳細ページ
- キャンペーン招待完了ダイアログ
- キャンペーンコード入力ダイアログ
- キャンペーン応募ダイアログ1/2
- キャンペーンチケット使用確認
- 抽選結果ダイアログ

### イベント・ゲーム関連 (5箇所)
- イベントページ
- 当選履歴ページ
- ドリームチャンスページ
- ルーレットページ
- ルーレット準備ダイアログ

### その他 (5箇所)
- ログインボーナスページ
- アプリ読み込みダイアログ1/2
- AppLovinリワード広告視聴完了ダイアログ
- AppLovinリワード広告

## 開発者向け

### 新しいエリアタイプの追加

1. `ad_display_area_types.yaml`を編集
2. mainブランチにマージ
3. GitHub Actionsが自動的にDartとJSONファイルを生成

詳細は `.github/README.md` を参照してください。

### ローカルでの生成

```bash
# PyYAMLのインストール
pip3 install pyyaml

# ファイル生成
python3 .github/scripts/generate_dart_from_yaml.py
python3 .github/scripts/generate_json_from_yaml.py
```

## ライセンス

このパッケージはWickアプリケーション専用です。
