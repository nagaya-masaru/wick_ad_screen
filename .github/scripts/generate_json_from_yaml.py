#!/usr/bin/env python3
"""
YAMLファイルからJSONファイルを生成するスクリプト
"""

import yaml
import json
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
                'dart_name': item['dart_name']
            })

    # indexでソート
    all_types.sort(key=lambda x: x['index'])
    return all_types


def generate_json(types):
    """JSON形式の辞書を生成"""
    json_data = {}

    for item in types:
        json_data[str(item['index'])] = item['dart_name']

    return json_data


def main():
    """メイン処理"""
    # YAMLを読み込み
    data = load_yaml()

    # タイプ定義を収集
    types = collect_types(data)

    # JSON形式に変換
    json_data = generate_json(types)

    # ファイルに書き込み
    output_path = Path('data/ad_display_area_type.json')
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(json_data, f, indent=2, ensure_ascii=False)
        f.write('\n')  # 最後に改行を追加

    print(f'✅ Generated {output_path}')
    print(f'   Total types: {len(types)}')


if __name__ == '__main__':
    main()
