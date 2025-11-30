#!/usr/bin/env python3
"""
YAMLファイルからDartのenumファイルを生成するスクリプト
"""

import yaml
from pathlib import Path


def load_yaml():
    """YAMLファイルを読み込む"""
    yaml_path = Path('ad_display_area_types.yaml')
    with open(yaml_path, 'r', encoding='utf-8') as f:
        return yaml.safe_load(f)


def collect_types(data):
    """全てのタイプ定義を収集し、indexでソート"""
    all_types = []

    for category_name, items in data['ad_display_area_types'].items():
        for item in items:
            all_types.append({
                'index': item['index'],
                'dart_name': item['dart_name'],
                'json_value': item['json_value'],
                'description': item['description'],
                'category': item['category'],
                'category_name': category_name
            })

    # indexでソート
    all_types.sort(key=lambda x: x['index'])
    return all_types


def generate_enum_section(types):
    """enum定義部分を生成"""
    lines = []
    current_category = None

    for item in types:
        # カテゴリが変わったらコメントを挿入
        if current_category != item['category_name']:
            if current_category is not None:
                lines.append('')

            category_comments = {
                'manga_related': '// === 漫画関連 ===',
                'point_receive_related': '// === ポイント受け取り関連 ===',
                'campaign_related': '// === キャンペーン関連 ===',
                'event_game_related': '// === イベント・ゲーム関連 ===',
                'others': '// === その他 ===',
                'applovin_ads': '// === AppLovin Reward Ad ==='
            }
            lines.append(category_comments.get(item['category_name'], f"// === {item['category_name']} ==="))
            lines.append('')
            current_category = item['category_name']

        # enum値を追加
        lines.append(f"  /// {item['description']}")
        lines.append(f"  @JsonValue('{item['json_value']}')")
        lines.append(f"  {item['dart_name']},")
        lines.append('')

    return '\n'.join(lines)


def generate_switch_cases(types):
    """switch文のcase部分を生成"""
    lines = []

    for item in types:
        lines.append(f"      case AdDisplayAreaType.{item['dart_name']}:")
        lines.append(f"        return '{item['json_value']}';")

    return '\n'.join(lines)


def generate_dart_file(types):
    """完全なDartファイルを生成"""
    enum_section = generate_enum_section(types)
    switch_cases = generate_switch_cases(types)

    dart_code = f"""import 'package:freezed_annotation/freezed_annotation.dart';

enum AdDisplayAreaType {{
{enum_section}}}

extension AdDisplayAreaTypeExtension on AdDisplayAreaType {{
  String _toJsonValue() {{
    switch (this) {{
{switch_cases}
    }}
  }}

  /// エリア名からindexを取得
  static int? getIndexFromAreaName(String areaName) {{
    try {{
      final areaType = AdDisplayAreaType.values.firstWhere(
        (type) => type._toJsonValue() == areaName,
      );
      return areaType.index;
    }} catch (e) {{
      return null;
    }}
  }}
}}
"""

    return dart_code


def main():
    """メイン処理"""
    # YAMLを読み込み
    data = load_yaml()

    # タイプ定義を収集
    types = collect_types(data)

    # Dartファイルを生成
    dart_code = generate_dart_file(types)

    # ファイルに書き込み
    output_path = Path('lib/enums/ad_display_area_type.dart')
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(dart_code)

    print(f'✅ Generated {output_path}')
    print(f'   Total types: {len(types)}')


if __name__ == '__main__':
    main()
