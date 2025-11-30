import 'package:freezed_annotation/freezed_annotation.dart';

enum AdDisplayAreaType {
// === 漫画関連 ===

  /// 漫画詳細ページ
  @JsonValue('manga_detail_page')
  mangaDetailPage,

  /// 漫画ページビューアー
  @JsonValue('manga_page_viewer')
  mangaPageViewer,

  /// 漫画ビューアー次話読み込みコンテンツ
  @JsonValue('manga_viewer_read_next_contents')
  mangaViewerReadNextContents,

  /// 漫画読み込みダイアログ
  @JsonValue('manga_loading_dialog')
  mangaLoadingDialog,

  /// 同人コミック読み込みダイアログ
  @JsonValue('doujin_comic_loading_dialog')
  doujinComicLoadingDialog,


// === ポイント受け取り関連 ===

  /// ポイント一括受け取り確認ダイアログ
  @JsonValue('once_get_point_confirm_dialog')
  onceGetPointConfirmDialog,

  /// キャンペーンポイント受け取りタブ
  @JsonValue('receive_campaign_point_tab')
  receiveCampaignPointTab,

  /// ポイント受け取りダイアログ
  @JsonValue('point_receive_dialog')
  pointReceiveDialog,

  /// 5分間リワードタブ
  @JsonValue('five_minutes_reward_tab')
  fiveMinutesRewardTab,

  /// 即座受け取り確認ダイアログ
  @JsonValue('confirm_receive_now_dialog')
  confirmReceiveNowDialog,


// === キャンペーン関連 ===

  /// キャンペーンページ
  @JsonValue('campaign_page')
  campaignPage,

  /// キャンペーンアイテムページ
  @JsonValue('campaign_item_page')
  campaignItemPage,

  /// キャンペーン詳細ページ
  @JsonValue('campaign_detail_page')
  campaignDetailPage,

  /// キャンペーン招待完了ダイアログ
  @JsonValue('campaign_invite_done_dialog')
  campaignInviteDoneDialog,

  /// キャンペーンコード入力ダイアログ
  @JsonValue('campaign_code_input_dialog')
  campaignCodeInputDialog,

  /// キャンペーン応募ダイアログ1
  @JsonValue('app_campaign_application_dialog_1')
  appCampaignApplicationDialog1,

  /// キャンペーン応募ダイアログ2
  @JsonValue('app_campaign_application_dialog_2')
  appCampaignApplicationDialog2,

  /// キャンペーンチケット使用確認
  @JsonValue('app_confirm_use_campaign_ticket')
  appConfirmUseCampaignTicket,

  /// 抽選結果ダイアログ
  @JsonValue('app_entry_result_dialog')
  appEntryResultDialog,


// === イベント・ゲーム関連 ===

  /// イベントページ
  @JsonValue('event_page')
  eventPage,

  /// 当選履歴ページ
  @JsonValue('win_history_page')
  winHistoryPage,

  /// ドリームチャンスページ
  @JsonValue('dream_chance_page')
  dreamChancePage,

  /// ルーレットページ
  @JsonValue('roulette_page')
  roulettePage,

  /// ルーレット準備ダイアログ
  @JsonValue('app_roulette_ready_dialog')
  appRouletteReadyDialog,


// === その他 ===

  /// ログインボーナスページ
  @JsonValue('login_bonus_page')
  loginBonusPage,

  /// アプリ読み込みダイアログ1
  @JsonValue('app_loading_dialog_1')
  appLoadingDialog1,

  /// アプリ読み込みダイアログ2
  @JsonValue('app_loading_dialog_2')
  appLoadingDialog2,

  /// AppLovinリワード広告視聴完了ダイアログ
  @JsonValue('applovin_reward_ad_watch_complete_dialog')
  applovinRewardAdWatchCompleteDialog,


// === AppLovin Reward Ad ===

  /// AppLovinリワード広告
  @JsonValue('applovin_reward_ad')
  applovinRewardAd,


// === test ===

  /// test
  @JsonValue('test')
  test,
}

extension AdDisplayAreaTypeExtension on AdDisplayAreaType {
  String _toJsonValue() {
    switch (this) {
      case AdDisplayAreaType.mangaDetailPage:
        return 'manga_detail_page';
      case AdDisplayAreaType.mangaPageViewer:
        return 'manga_page_viewer';
      case AdDisplayAreaType.mangaViewerReadNextContents:
        return 'manga_viewer_read_next_contents';
      case AdDisplayAreaType.mangaLoadingDialog:
        return 'manga_loading_dialog';
      case AdDisplayAreaType.doujinComicLoadingDialog:
        return 'doujin_comic_loading_dialog';
      case AdDisplayAreaType.onceGetPointConfirmDialog:
        return 'once_get_point_confirm_dialog';
      case AdDisplayAreaType.receiveCampaignPointTab:
        return 'receive_campaign_point_tab';
      case AdDisplayAreaType.pointReceiveDialog:
        return 'point_receive_dialog';
      case AdDisplayAreaType.fiveMinutesRewardTab:
        return 'five_minutes_reward_tab';
      case AdDisplayAreaType.confirmReceiveNowDialog:
        return 'confirm_receive_now_dialog';
      case AdDisplayAreaType.campaignPage:
        return 'campaign_page';
      case AdDisplayAreaType.campaignItemPage:
        return 'campaign_item_page';
      case AdDisplayAreaType.campaignDetailPage:
        return 'campaign_detail_page';
      case AdDisplayAreaType.campaignInviteDoneDialog:
        return 'campaign_invite_done_dialog';
      case AdDisplayAreaType.campaignCodeInputDialog:
        return 'campaign_code_input_dialog';
      case AdDisplayAreaType.appCampaignApplicationDialog1:
        return 'app_campaign_application_dialog_1';
      case AdDisplayAreaType.appCampaignApplicationDialog2:
        return 'app_campaign_application_dialog_2';
      case AdDisplayAreaType.appConfirmUseCampaignTicket:
        return 'app_confirm_use_campaign_ticket';
      case AdDisplayAreaType.appEntryResultDialog:
        return 'app_entry_result_dialog';
      case AdDisplayAreaType.eventPage:
        return 'event_page';
      case AdDisplayAreaType.winHistoryPage:
        return 'win_history_page';
      case AdDisplayAreaType.dreamChancePage:
        return 'dream_chance_page';
      case AdDisplayAreaType.roulettePage:
        return 'roulette_page';
      case AdDisplayAreaType.appRouletteReadyDialog:
        return 'app_roulette_ready_dialog';
      case AdDisplayAreaType.loginBonusPage:
        return 'login_bonus_page';
      case AdDisplayAreaType.appLoadingDialog1:
        return 'app_loading_dialog_1';
      case AdDisplayAreaType.appLoadingDialog2:
        return 'app_loading_dialog_2';
      case AdDisplayAreaType.applovinRewardAdWatchCompleteDialog:
        return 'applovin_reward_ad_watch_complete_dialog';
      case AdDisplayAreaType.applovinRewardAd:
        return 'applovin_reward_ad';
      case AdDisplayAreaType.test:
        return 'test';
    }
  }

  /// エリア名からindexを取得
  static int? getIndexFromAreaName(String areaName) {
    try {
      final areaType = AdDisplayAreaType.values.firstWhere(
        (type) => type._toJsonValue() == areaName,
      );
      return areaType.index;
    } catch (e) {
      return null;
    }
  }
}
