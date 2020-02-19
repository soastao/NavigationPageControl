// -------------------------------------------------------------------------
//
//
// NavigationPageControl
//
// Version 1.0.0.0
// Update Date: 2020.02.19
// Author: soastao
//
// Copyright(C)  All rights reserved
// --- 版权所有，请勿用于商业用途 ---
//
//
// -------------------------------------------------------------------------
//

unit NavigationPageControl;

interface

{$R googleicon.res}

uses
  Classes, FMX.Types, FMX.Controls, FMX.Graphics, Types, System.UITypes,
  FMX.StdCtrls, System.Generics.Collections, FMX.Objects,
  System.UIConsts, FMX.Layouts, FMX.TextLayout;

const
  C_Normal_Tab_Font_Size = 11;
  C_Selected_Tab_Font_Size = 12;
  C_Default_Tab_Height = 50;

type

  TNavigationPageControl = class;
  TNavTabItem = class;

  TNavTabBarPosition = (tbBottom, tbNone, tbTop);

  TNavTabBarClickTabEvent = procedure(Sender: TObject; ATab: TNavTabItem) of object;

  TGoodIcon = (ic_3d_rotation, ic_accessibility, ic_accessible, ic_access_alarms, ic_access_alarm, ic_access_time, ic_account_balance,
    ic_account_balance_wallet, ic_account_box, ic_account_circle, ic_ac_unit, ic_adb, ic_add_alarm, ic_add_alert, ic_add_a_photo, ic_add, ic_add_box,
    ic_add_circle, ic_add_circle_outline, ic_add_location, ic_add_shopping_cart, ic_add_to_photos, ic_add_to_queue, ic_adjust,
    ic_airline_seat_flat_angled, ic_airline_seat_flat, ic_airline_seat_individual_suite, ic_airline_seat_legroom_extra,
    ic_airline_seat_legroom_normal, ic_airline_seat_legroom_reduced, ic_airline_seat_recline_extra, ic_airline_seat_recline_normal,
    ic_airplanemode_active, ic_airplanemode_inactive, ic_airplay, ic_airport_shuttle, ic_alarm_add, ic_alarm, ic_alarm_off, ic_alarm_on, ic_album,
    ic_all_inclusive, ic_all_out, ic_android, ic_announcement, ic_apps, ic_archive, ic_arrow_back, ic_arrow_downward, ic_arrow_drop_down,
    ic_arrow_drop_down_circle, ic_arrow_drop_up, ic_arrow_forward, ic_arrow_upward, ic_art_track, ic_aspect_ratio, ic_assessment, ic_assignment,
    ic_assignment_ind, ic_assignment_late, ic_assignment_returned, ic_assignment_return, ic_assignment_turned_in, ic_assistant, ic_assistant_photo,
    ic_attachment, ic_attach_file, ic_attach_money, ic_audiotrack, ic_autorenew, ic_av_timer, ic_backspace, ic_backup, ic_battery_20, ic_battery_30,
    ic_battery_50, ic_battery_60, ic_battery_80, ic_battery_90, ic_battery_alert, ic_battery_charging_20, ic_battery_charging_30,
    ic_battery_charging_50, ic_battery_charging_60, ic_battery_charging_80, ic_battery_charging_90, ic_battery_charging_full, ic_battery_full,
    ic_battery_std, ic_battery_unknown, ic_beach_access, ic_beenhere, ic_block, ic_bluetooth_audio, ic_bluetooth, ic_bluetooth_connected,
    ic_bluetooth_disabled, ic_bluetooth_searching, ic_blur_circular, ic_blur_linear, ic_blur_off, ic_blur_on, ic_bookmark, ic_bookmark_border,
    ic_book, ic_border_all, ic_border_bottom, ic_border_clear, ic_border_color, ic_border_horizontal, ic_border_inner, ic_border_left,
    ic_border_outer, ic_border_right, ic_border_style, ic_border_top, ic_border_vertical, ic_branding_watermark, ic_brightness_1, ic_brightness_2,
    ic_brightness_3, ic_brightness_4, ic_brightness_5, ic_brightness_6, ic_brightness_7, ic_brightness_auto, ic_brightness_high, ic_brightness_low,
    ic_brightness_medium, ic_broken_image, ic_brush, ic_bubble_chart, ic_bug_report, ic_build, ic_burst_mode, ic_business, ic_business_center,
    ic_cached, ic_cake, ic_call, ic_call_end, ic_call_made, ic_call_merge, ic_call_missed, ic_call_missed_outgoing, ic_call_received, ic_call_split,
    ic_call_to_action, ic_camera_alt, ic_camera, ic_camera_enhance, ic_camera_front, ic_camera_rear, ic_camera_roll, ic_cancel, ic_card_giftcard,
    ic_card_membership, ic_card_travel, ic_casino, ic_cast, ic_cast_connected, ic_center_focus_strong, ic_center_focus_weak, ic_change_history,
    ic_chat, ic_chat_bubble, ic_chat_bubble_outline, ic_check, ic_check_circle, ic_chevron_left, ic_chevron_right, ic_child_care, ic_child_friendly,
    ic_chrome_reader_mode, ic_class, ic_clear_all, ic_clear, ic_closed_caption, ic_close, ic_cloud, ic_cloud_circle, ic_cloud_done, ic_cloud_download,
    ic_cloud_off, ic_cloud_queue, ic_cloud_upload, ic_code, ic_collections, ic_collections_bookmark, ic_colorize, ic_color_lens, ic_comment,
    ic_compare_arrows, ic_compare, ic_computer, ic_confirmation_number, ic_contacts, ic_contact_mail, ic_contact_phone, ic_content_copy,
    ic_content_cut, ic_content_paste, ic_control_point, ic_control_point_duplicate, ic_copyright, ic_create, ic_create_new_folder, ic_credit_card,
    ic_crop_16_9, ic_crop_3_2, ic_crop_5_4, ic_crop_7_5, ic_crop, ic_crop_din, ic_crop_free, ic_crop_landscape, ic_crop_original, ic_crop_portrait,
    ic_crop_rotate, ic_crop_square, ic_dashboard, ic_data_usage, ic_date_range, ic_dehaze, ic_delete, ic_delete_forever, ic_delete_sweep,
    ic_description, ic_desktop_mac, ic_desktop_windows, ic_details, ic_developer_board, ic_developer_mode, ic_devices, ic_devices_other,
    ic_device_hub, ic_dialer_sip, ic_dialpad, ic_directions_bike, ic_directions, ic_directions_boat, ic_directions_bus, ic_directions_car,
    ic_directions_railway, ic_directions_run, ic_directions_subway, ic_directions_transit, ic_directions_walk, ic_disc_full, ic_dns, ic_dock,
    ic_domain, ic_done_all, ic_done, ic_donut_large, ic_donut_small, ic_do_not_disturb_alt, ic_do_not_disturb, ic_do_not_disturb_off,
    ic_do_not_disturb_on, ic_drafts, ic_drag_handle, ic_drive_eta, ic_dvr, ic_edit, ic_edit_location, ic_eject, ic_email, ic_enhanced_encryption,
    ic_equalizer, ic_error, ic_error_outline, ic_euro_symbol, ic_event_available, ic_event, ic_event_busy, ic_event_note, ic_event_seat,
    ic_ev_station, ic_exit_to_app, ic_expand_less, ic_expand_more, ic_explicit, ic_explore, ic_exposure, ic_exposure_neg_1, ic_exposure_neg_2,
    ic_exposure_plus_1, ic_exposure_plus_2, ic_exposure_zero, ic_extension, ic_face, ic_fast_forward, ic_fast_rewind, ic_favorite, ic_favorite_border,
    ic_featured_play_list, ic_featured_video, ic_feedback, ic_fiber_dvr, ic_fiber_manual_record, ic_fiber_new, ic_fiber_pin, ic_fiber_smart_record,
    ic_file_download, ic_file_upload, ic_filter_1, ic_filter_2, ic_filter_3, ic_filter_4, ic_filter_5, ic_filter_6, ic_filter_7, ic_filter_8,
    ic_filter_9, ic_filter_9_plus, ic_filter, ic_filter_b_and_w, ic_filter_center_focus, ic_filter_drama, ic_filter_frames, ic_filter_hdr,
    ic_filter_list, ic_filter_none, ic_filter_tilt_shift, ic_filter_vintage, ic_find_in_page, ic_find_replace, ic_fingerprint, ic_first_page,
    ic_fitness_center, ic_flag, ic_flare, ic_flash_auto, ic_flash_off, ic_flash_on, ic_flight, ic_flight_land, ic_flight_takeoff, ic_flip,
    ic_flip_to_back, ic_flip_to_front, ic_folder, ic_folder_open, ic_folder_shared, ic_folder_special, ic_font_download, ic_format_align_center,
    ic_format_align_justify, ic_format_align_left, ic_format_align_right, ic_format_bold, ic_format_clear, ic_format_color_fill,
    ic_format_color_reset, ic_format_color_text, ic_format_indent_decrease, ic_format_indent_increase, ic_format_italic, ic_format_line_spacing,
    ic_format_list_bulleted, ic_format_list_numbered, ic_format_paint, ic_format_quote, ic_format_shapes, ic_format_size, ic_format_strikethrough,
    ic_format_textdirection_l_to_r, ic_format_textdirection_r_to_l, ic_format_underlined, ic_forum, ic_forward_10, ic_forward_30, ic_forward_5,
    ic_forward, ic_free_breakfast, ic_fullscreen, ic_fullscreen_exit, ic_functions, ic_gamepad, ic_games, ic_gavel, ic_gesture, ic_get_app, ic_gif,
    ic_golf_course, ic_gps_fixed, ic_gps_not_fixed, ic_gps_off, ic_grade, ic_gradient, ic_grain, ic_graphic_eq, ic_grid_off, ic_grid_on, ic_group_add,
    ic_group, ic_group_work, ic_g_translate, ic_hdr_off, ic_hdr_on, ic_hdr_strong, ic_hdr_weak, ic_hd, ic_headset, ic_headset_mic, ic_healing,
    ic_hearing, ic_help, ic_help_outline, ic_highlight, ic_highlight_off, ic_high_quality, ic_history, ic_home, ic_hotel, ic_hot_tub,
    ic_hourglass_empty, ic_hourglass_full, ic_https, ic_http, ic_image_aspect_ratio, ic_image, ic_important_devices, ic_import_contacts,
    ic_import_export, ic_inbox, ic_info, ic_info_outline, ic_input, ic_insert_chart, ic_insert_comment, ic_insert_drive_file, ic_insert_emoticon,
    ic_insert_invitation, ic_insert_link, ic_insert_photo, ic_invert_colors, ic_invert_colors_off, ic_iso, ic_keyboard_arrow_down,
    ic_keyboard_arrow_left, ic_keyboard_arrow_right, ic_keyboard_arrow_up, ic_keyboard_backspace, ic_keyboard, ic_keyboard_capslock, ic_keyboard_hide,
    ic_keyboard_return, ic_keyboard_tab, ic_keyboard_voice, ic_kitchen, ic_label, ic_label_outline, ic_landscape, ic_language, ic_laptop,
    ic_laptop_chromebook, ic_laptop_mac, ic_laptop_windows, ic_last_page, ic_launch, ic_layers, ic_layers_clear, ic_leak_add, ic_leak_remove, ic_lens,
    ic_library_add, ic_library_books, ic_library_music, ic_lightbulb_outline, ic_linear_scale, ic_line_style, ic_line_weight, ic_linked_camera,
    ic_link, ic_list, ic_live_help, ic_live_tv, ic_local_activity, ic_local_airport, ic_local_atm, ic_local_bar, ic_local_cafe, ic_local_car_wash,
    ic_local_convenience_store, ic_local_dining, ic_local_drink, ic_local_florist, ic_local_gas_station, ic_local_grocery_store, ic_local_hospital,
    ic_local_hotel, ic_local_laundry_service, ic_local_library, ic_local_mall, ic_local_movies, ic_local_offer, ic_local_parking, ic_local_pharmacy,
    ic_local_phone, ic_local_pizza, ic_local_play, ic_local_post_office, ic_local_printshop, ic_local_see, ic_local_shipping, ic_local_taxi,
    ic_location_city, ic_location_disabled, ic_location_off, ic_location_on, ic_location_searching, ic_lock, ic_lock_open, ic_lock_outline,
    ic_looks_3, ic_looks_4, ic_looks_5, ic_looks_6, ic_looks, ic_looks_one, ic_looks_two, ic_loop, ic_loupe, ic_low_priority, ic_loyalty, ic_mail,
    ic_mail_outline, ic_map, ic_markunread, ic_markunread_mailbox, ic_memory, ic_menu, ic_merge_type, ic_message, ic_mic, ic_mic_none, ic_mic_off,
    ic_mms, ic_mode_comment, ic_mode_edit, ic_monetization_on, ic_money_off, ic_monochrome_photos, ic_mood_bad, ic_mood, ic_more, ic_more_horiz,
    ic_more_vert, ic_motorcycle, ic_mouse, ic_move_to_inbox, ic_movie, ic_movie_creation, ic_movie_filter, ic_multiline_chart, ic_music_note,
    ic_music_video, ic_my_location, ic_nature, ic_nature_people, ic_navigate_before, ic_navigate_next, ic_navigation, ic_near_me, ic_network_cell,
    ic_network_check, ic_network_locked, ic_network_wifi, ic_new_releases, ic_next_week, ic_nfc, ic_note_add, ic_note, ic_notifications_active,
    ic_notifications, ic_notifications_none, ic_notifications_off, ic_notifications_paused, ic_not_interested, ic_no_encryption, ic_no_sim,
    ic_offline_pin, ic_ondemand_video, ic_opacity, ic_open_in_browser, ic_open_in_new, ic_open_with, ic_pages, ic_pageview, ic_palette, ic_panorama,
    ic_panorama_fish_eye, ic_panorama_horizontal, ic_panorama_vertical, ic_panorama_wide_angle, ic_pan_tool, ic_party_mode, ic_pause,
    ic_pause_circle_filled, ic_pause_circle_outline, ic_payment, ic_people, ic_people_outline, ic_perm_camera_mic, ic_perm_contact_calendar,
    ic_perm_data_setting, ic_perm_device_information, ic_perm_identity, ic_perm_media, ic_perm_phone_msg, ic_perm_scan_wifi, ic_personal_video,
    ic_person_add, ic_person, ic_person_outline, ic_person_pin, ic_person_pin_circle, ic_pets, ic_phonelink, ic_phonelink_erase, ic_phonelink_lock,
    ic_phonelink_off, ic_phonelink_ring, ic_phonelink_setup, ic_phone_android, ic_phone, ic_phone_bluetooth_speaker, ic_phone_forwarded,
    ic_phone_in_talk, ic_phone_iphone, ic_phone_locked, ic_phone_missed, ic_phone_paused, ic_photo_album, ic_photo, ic_photo_camera, ic_photo_filter,
    ic_photo_library, ic_photo_size_select_actual, ic_photo_size_select_large, ic_photo_size_select_small, ic_picture_as_pdf,
    ic_picture_in_picture_alt, ic_picture_in_picture, ic_pie_chart, ic_pie_chart_outlined, ic_pin_drop, ic_place, ic_playlist_add,
    ic_playlist_add_check, ic_playlist_play, ic_play_arrow, ic_play_circle_filled, ic_play_circle_filled_white, ic_play_circle_outline,
    ic_play_for_work, ic_plus_one, ic_poll, ic_polymer, ic_pool, ic_portable_wifi_off, ic_portrait, ic_power, ic_power_input, ic_power_settings_new,
    ic_pregnant_woman, ic_present_to_all, ic_print, ic_priority_high, ic_public, ic_publish, ic_query_builder, ic_question_answer, ic_queue,
    ic_queue_music, ic_queue_play_next, ic_radio, ic_rate_review, ic_receipt, ic_recent_actors, ic_record_voice_over, ic_redeem, ic_redo, ic_refresh,
    ic_remove, ic_remove_circle, ic_remove_circle_outline, ic_remove_from_queue, ic_remove_red_eye, ic_remove_shopping_cart, ic_reorder, ic_repeat,
    ic_repeat_one, ic_replay_10, ic_replay_30, ic_replay_5, ic_replay, ic_reply_all, ic_reply, ic_report, ic_report_problem, ic_restaurant,
    ic_restaurant_menu, ic_restore, ic_restore_page, ic_ring_volume, ic_room, ic_room_service, ic_rotate_90_degrees_ccw, ic_rotate_left,
    ic_rotate_right, ic_rounded_corner, ic_router, ic_rowing, ic_rss_feed, ic_rv_hookup, ic_satellite, ic_save, ic_scanner, ic_schedule, ic_school,
    ic_screen_lock_landscape, ic_screen_lock_portrait, ic_screen_lock_rotation, ic_screen_rotation, ic_screen_share, ic_sd_card, ic_sd_storage,
    ic_search, ic_security, ic_select_all, ic_send, ic_sentiment_dissatisfied, ic_sentiment_neutral, ic_sentiment_satisfied,
    ic_sentiment_very_dissatisfied, ic_sentiment_very_satisfied, ic_settings_applications, ic_settings_backup_restore, ic_settings,
    ic_settings_bluetooth, ic_settings_brightness, ic_settings_cell, ic_settings_ethernet, ic_settings_input_antenna, ic_settings_input_component,
    ic_settings_input_composite, ic_settings_input_hdmi, ic_settings_input_svideo, ic_settings_overscan, ic_settings_phone, ic_settings_power,
    ic_settings_remote, ic_settings_system_daydream, ic_settings_voice, ic_share, ic_shopping_basket, ic_shopping_cart, ic_shop, ic_shop_two,
    ic_short_text, ic_show_chart, ic_shuffle, ic_signal_cellular_0_bar, ic_signal_cellular_1_bar, ic_signal_cellular_2_bar, ic_signal_cellular_3_bar,
    ic_signal_cellular_4_bar, ic_signal_cellular_connected_no_internet_0_bar, ic_signal_cellular_connected_no_internet_1_bar,
    ic_signal_cellular_connected_no_internet_2_bar, ic_signal_cellular_connected_no_internet_3_bar, ic_signal_cellular_connected_no_internet_4_bar,
    ic_signal_cellular_no_sim, ic_signal_cellular_null, ic_signal_cellular_off, ic_signal_wifi_0_bar, ic_signal_wifi_1_bar, ic_signal_wifi_1_bar_lock,
    ic_signal_wifi_2_bar, ic_signal_wifi_2_bar_lock, ic_signal_wifi_3_bar, ic_signal_wifi_3_bar_lock, ic_signal_wifi_4_bar, ic_signal_wifi_4_bar_lock,
    ic_signal_wifi_off, ic_sim_card_alert, ic_sim_card, ic_skip_next, ic_skip_previous, ic_slideshow, ic_slow_motion_video, ic_smartphone,
    ic_smoke_free, ic_smoking_rooms, ic_sms, ic_sms_failed, ic_snooze, ic_sort, ic_sort_by_alpha, ic_space_bar, ic_spa, ic_speaker, ic_speaker_group,
    ic_speaker_notes, ic_speaker_notes_off, ic_speaker_phone, ic_spellcheck, ic_stars, ic_star, ic_star_border, ic_star_half,
    ic_stay_current_landscape, ic_stay_current_portrait, ic_stay_primary_landscape, ic_stay_primary_portrait, ic_stop, ic_stop_screen_share,
    ic_storage, ic_store, ic_store_mall_directory, ic_straighten, ic_streetview, ic_strikethrough_s, ic_style, ic_subdirectory_arrow_left,
    ic_subdirectory_arrow_right, ic_subject, ic_subscriptions, ic_subtitles, ic_subway, ic_supervisor_account, ic_surround_sound, ic_swap_calls,
    ic_swap_horiz, ic_swap_vertical_circle, ic_swap_vert, ic_switch_camera, ic_switch_video, ic_sync, ic_sync_disabled, ic_sync_problem,
    ic_system_update_alt, ic_system_update, ic_tablet_android, ic_tablet, ic_tablet_mac, ic_tab, ic_tab_unselected, ic_tag_faces, ic_tap_and_play,
    ic_terrain, ic_textsms, ic_texture, ic_text_fields, ic_text_format, ic_theaters, ic_thumbs_up_down, ic_thumb_down, ic_thumb_up, ic_timelapse,
    ic_timeline, ic_timer_10, ic_timer_3, ic_timer, ic_timer_off, ic_time_to_leave, ic_title, ic_toc, ic_today, ic_toll, ic_tonality, ic_touch_app,
    ic_toys, ic_track_changes, ic_traffic, ic_train, ic_tram, ic_transfer_within_a_station, ic_transform, ic_translate, ic_trending_down,
    ic_trending_flat, ic_trending_up, ic_tune, ic_turned_in, ic_turned_in_not, ic_tv, ic_unarchive, ic_undo, ic_unfold_less, ic_unfold_more,
    ic_update, ic_usb, ic_verified_user, ic_vertical_align_bottom, ic_vertical_align_center, ic_vertical_align_top, ic_vibration, ic_videocam,
    ic_videocam_off, ic_videogame_asset, ic_video_call, ic_video_label, ic_video_library, ic_view_agenda, ic_view_array, ic_view_carousel,
    ic_view_column, ic_view_comfy, ic_view_compact, ic_view_day, ic_view_headline, ic_view_list, ic_view_module, ic_view_quilt, ic_view_stream,
    ic_view_week, ic_vignette, ic_visibility, ic_visibility_off, ic_voicemail, ic_voice_chat, ic_volume_down, ic_volume_mute, ic_volume_off,
    ic_volume_up, ic_vpn_key, ic_vpn_lock, ic_wallpaper, ic_warning, ic_watch, ic_watch_later, ic_wb_auto, ic_wb_cloudy, ic_wb_incandescent,
    ic_wb_iridescent, ic_wb_sunny, ic_wc, ic_web_asset, ic_web, ic_weekend, ic_whatshot, ic_widgets, ic_wifi, ic_wifi_lock, ic_wifi_tethering,
    ic_work, ic_wrap_text, ic_youtube_searched_for, ic_zoom_in, ic_zoom_out, ic_zoom_out_map);

  TBadge = class(TPersistent)
  private
    FTabControl: TNavigationPageControl;
    FBadgeColor: TAlphaColor;
    fShowBadge, fShowBadgeValue: boolean;
    fBadgeCircleRadius: integer;

    procedure Changed;
    procedure SetBadgeColor(Value: TAlphaColor);
    procedure SetShowBadge(Value: boolean);
    procedure SetShowBadgeValue(Value: boolean);
    procedure SetBadgeCircleRadius(Value: integer);
  public
    constructor Create(ATabControl: TNavigationPageControl);
  published
    property BadgeColor: TAlphaColor read FBadgeColor write SetBadgeColor;
    property ShowBadge: boolean read fShowBadge write SetShowBadge;
    property ShowBadgeValue: boolean read fShowBadgeValue write SetShowBadgeValue;
    property BadgeCircleRadius: integer read fBadgeCircleRadius write SetBadgeCircleRadius;
  end;

  TSelectedTabItem = class(TPersistent)
  private
    FTabControl: TNavigationPageControl;
    FSelectedColor: TAlphaColor;
    fSelectedFont: TFont;
    fSelectedIconSize: integer;
    procedure Changed;
    procedure SetSelectedColor(Value: TAlphaColor);
    procedure SetSelectedFont(Value: TFont);
    procedure SetSelectedIconSize(Value: integer);
  public
    constructor Create(ATabControl: TNavigationPageControl);
    destructor Destroy; override;
  published
    property SelectedColor: TAlphaColor read FSelectedColor write SetSelectedColor default claDodgerblue;
    property SelectedFont: TFont read fSelectedFont write SetSelectedFont;
    property SelectedIconSize: integer read fSelectedIconSize write SetSelectedIconSize;
  end;

  TNormalTabItem = class(TPersistent)
  private
    FTabControl: TNavigationPageControl;
    FNormalColor: TAlphaColor;
    fNormalFont: TFont;
    fNormalIconSize: integer;
    procedure Changed;
    procedure SetNormalColor(Value: TAlphaColor);
    procedure SetNormalFont(Value: TFont);
    procedure SetNormalIconSize(Value: integer);
  public
    constructor Create(ATabControl: TNavigationPageControl);
    destructor Destroy; override;
  published
    property NormalColor: TAlphaColor read FNormalColor write SetNormalColor default claDimgray;
    property NormalFont: TFont read fNormalFont write SetNormalFont;
    property NormalIconSize: integer read fNormalIconSize write SetNormalIconSize;
  end;

  TNavAppearence = class(TPersistent)
  private
    FTabControl: TNavigationPageControl;
    FTabbarBackgroundColor, fTabBarDividingLineColor, fSheetBackgroundColor: TAlphaColor;
    fTabBarHeight, fTabbarBottomMarginHeight, fTabbarTopMarginHeight: integer;

    fBadge: TBadge;
    fSelectedTabItem: TSelectedTabItem;
    fNormalTabItem: TNormalTabItem;
    FTabbarPosition: TNavTabBarPosition;

    procedure SetTabbarBackgroundColor(const Value: TAlphaColor);
    procedure SetTabBarDividingLineColor(const Value: TAlphaColor);
    procedure Changed;
    procedure SetTabBarHeight(Value: integer);
    procedure SetSheetBackgroundColor(Value: TAlphaColor);
    procedure SetTabBarPosition(const Value: TNavTabBarPosition);
    procedure SetTabbarBottomMarginHeight(Value: integer);
    procedure SetTabbarTopMarginHeight(Value: integer);
  public
    constructor Create(ATabControl: TNavigationPageControl);
    destructor Destroy; override;
  published
    property TabbarBackgroundColor: TAlphaColor read FTabbarBackgroundColor write SetTabbarBackgroundColor default claWhite;
    property TabBarHeight: integer read fTabBarHeight write SetTabBarHeight;
    property TabBarDividingLineColor: TAlphaColor read fTabBarDividingLineColor write SetTabBarDividingLineColor;
    property TabbarPosition: TNavTabBarPosition read FTabbarPosition write SetTabBarPosition;
    property TabbarBottomMarginHeight: integer read fTabbarBottomMarginHeight write SetTabbarBottomMarginHeight;
    property TabbarTopMarginHeight: integer read fTabbarTopMarginHeight write SetTabbarTopMarginHeight;
    property Badge: TBadge read fBadge write fBadge;
    property SelectedTabItem: TSelectedTabItem read fSelectedTabItem write fSelectedTabItem;
    property NormalTabItem: TNormalTabItem read fNormalTabItem write fNormalTabItem;
    property SheetBackgroundColor: TAlphaColor read fSheetBackgroundColor write SetSheetBackgroundColor;
  end;

  TNavTabItem = class(TControl)
  private
    FPresetIcon, FNormalIconWhenCustom, fSelectedIconWhenCustom: TBitmap;
    fPresetItemIconName: TGoodIcon;
    fTabIndex: integer;
    FText: string;
    FBadgeValue: integer;
    fUsePresetIcon: boolean;

    procedure SetText(const Value: string);
    procedure SetBadgeValue(const Value: integer);
    procedure UpdateTabs;
    procedure SetPresetIcon(const Value: TBitmap);
    procedure SetPresetItemIconName(const Value: TGoodIcon);
    procedure SetTabIndex(const Value: integer);
    procedure SetUsePresetIcon(Value: boolean);
    procedure SetNormalIconWhenCustom(Value: TBitmap);
    procedure SetSelectedIconWhenCustom(Value: TBitmap);

  public
    constructor Create(AOwner: TComponent); override;
    procedure BeforeDestruction; override;
    destructor Destroy; override;
    procedure DrawTab(ACanvas: TCanvas; AIndex: integer; ARect: TRectF; AFont: TFont);

  published
    property Text: string read FText write SetText;

    property BadgeValue: integer read FBadgeValue write SetBadgeValue;
    property PresetIcon: TBitmap read FPresetIcon write SetPresetIcon;
    property PresetItemIconName: TGoodIcon read fPresetItemIconName write SetPresetItemIconName;
    property TabIndex: integer read fTabIndex write SetTabIndex stored False;

    property UsePresetIcon: boolean read fUsePresetIcon write SetUsePresetIcon;
    property NormalIconWhenCustom: TBitmap read FNormalIconWhenCustom write SetNormalIconWhenCustom;
    property SelectedIconWhenCustom: TBitmap read fSelectedIconWhenCustom write SetSelectedIconWhenCustom;

  end;

  TNavTabItemList = class(TObjectList<TNavTabItem>)
  private
    FTabControl: TNavigationPageControl;
  protected
    procedure Notify(const Value: TNavTabItem; Action: TCollectionNotification); override;
  public
    constructor Create(ATabControl: TNavigationPageControl);

  end;

  TNavTabBar = class(TControl)
  private
    FTabControl: TNavigationPageControl;
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    property Size;
    property Width;
    property Height;
    property Position;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or
{$IFDEF XE8_OR_NEWER} pidiOSDevice32 or pidiOSDevice64
{$ELSE} pidiOSDevice {$ENDIF} or pidiOSSimulator or pidAndroid)]
  TNavigationPageControl = class(TControl, IItemsContainer)
  private
    FTabBar: TNavTabBar;
    fSelectedTabIndex: integer;
    FTabItemList: TNavTabItemList;
    FAppearence: TNavAppearence;
    FOnChange: TNotifyEvent;
    FOnClickTab: TNavTabBarClickTabEvent;

    procedure SetTabIndex(const Value: integer);
    function GetTabRect(AIndex: integer): TRectF;
    function GetTabIndexFromXPos(AXPos: Single): integer;
    function GetTabFromXPos(AXPos: Single): TNavTabItem;
    function GetTabCount: integer;
    function GetActiveTab: TNavTabItem;
    function GetSelectedTab: TNavTabItem;

    procedure SetActiveTab(const Value: TNavTabItem);

  protected
    procedure DoRealign; override;
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure Paint; override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    function GetItemsCount: integer;
    function GetItem(const AIndex: integer): TFmxObject;
    function GetObject: TFmxObject;
    procedure DoClickTab(ATab: TNavTabItem);
    function GetDeviceScreenScale: Single;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateTabs;
    function AddTab: TNavTabItem;
    procedure PrevTab;
    procedure NextTab;
    property ActiveTab: TNavTabItem read GetActiveTab write SetActiveTab;
    property TabItemList: TNavTabItemList read FTabItemList;
    property SelectedTab: TNavTabItem read GetSelectedTab;

    property TabCount: integer read GetTabCount;
    property DeviceScreenScale: Single read GetDeviceScreenScale;
  published
    property Align;
    property Appearence: TNavAppearence read FAppearence write FAppearence;

    property SelectedTabIndex: integer read fSelectedTabIndex write SetTabIndex default -1;

    property Margins;
    property Position;
    property Width;
    property Size;
    property Height;

    property Visible;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClickTab: TNavTabBarClickTabEvent read FOnClickTab write FOnClickTab;
  end;

procedure Register;

implementation

uses FMX.Platform, SysUtils, Math, FMX.Forms, TypInfo, FMX.Ani, FMX.dialogs, FMX.Utils
{$IFDEF IOS}
    , IOSApi.Foundation
{$ENDIF}
{$IFDEF USE_TMS_HTML_ENGINE} , FMX.TMSHTMLEngine {$ENDIF};

var
  AScreenScale: Single;

procedure Register;
begin

  RegisterComponents('ST FMX', [TNavigationPageControl]);
end;

{ Tools }

function GetScreenScale: Single;
var
  Service: IFMXScreenService;
begin
  if AScreenScale > 0 then
  begin
    Result := AScreenScale;
    Exit;
  end;
  Service := IFMXScreenService(TPlatformServices.Current.GetPlatformService(IFMXScreenService));

  Result := Service.GetScreenScale;

{$IFDEF IOS}
  if Result < 2 then
    Result := 2;
{$ENDIF}
  AScreenScale := Result;
end;

procedure ReplaceOpaqueColor(ABmp: TBitmap; Color: TAlphaColor);
var
  X, Y: integer;
  AMap: TBitmapData;
  PixelColor: TAlphaColor;
  PixelWhiteColor: TAlphaColor;
  C: PAlphaColorRec;
begin
  if (Assigned(ABmp)) then
  begin
    if ABmp.Map(TMapAccess.ReadWrite, AMap) then
      try
        AlphaColorToPixel(Color, @PixelColor, AMap.PixelFormat);
        AlphaColorToPixel(claWhite, @PixelWhiteColor, AMap.PixelFormat);
        for Y := 0 to ABmp.Height - 1 do
        begin
          for X := 0 to ABmp.Width - 1 do
          begin
            C := @PAlphaColorArray(AMap.Data)[Y * (AMap.Pitch div 4) + X];
            if (C^.Color <> claWhite) and (C^.A > 0) then
              C^.Color := PremultiplyAlpha(MakeColor(PixelColor, C^.A / $FF));
          end;
        end;
      finally
        ABmp.Unmap(AMap);
      end;
  end;
end;

procedure GenerateBadge(ACanvas: TCanvas; ATopLeft: TPointF; AValue: integer; AColor, ABackgroundColor, ATextColor: TAlphaColor;
  AShowBadgeValue: boolean; BadgeCircleRadius: integer);

  procedure DrawEllipse(ACanvas: TCanvas; ARect: TRectF; AColor: TAlphaColor);
  begin
    ACanvas.Fill.Color := AColor;
    ACanvas.FillEllipse(ARect, 1);
    ACanvas.Stroke.Color := AColor;
    ACanvas.Stroke.Thickness := 1;
    ACanvas.DrawEllipse(ARect, 1);
  end;

var
  ABmp: TBitmap;
  AOutlineRect: TRectF;
  ARect: TRectF;
  r, r2: TRectF;
  s: Single;
begin
  s := GetScreenScale;
  ABmp := TBitmap.Create(Round(BadgeCircleRadius * 2 * s), Round(BadgeCircleRadius * 2 * s));
  try
    ARect := RectF(ATopLeft.X, ATopLeft.Y, ATopLeft.X + BadgeCircleRadius, ATopLeft.Y + BadgeCircleRadius);

    AOutlineRect := ARect;
    InflateRect(AOutlineRect, GetScreenScale, GetScreenScale);

    ABmp.Clear(claNull);
    ABmp.Canvas.BeginScene;
    r := RectF(2, 2, (BadgeCircleRadius * 2 - 2) * s, (BadgeCircleRadius * 2 - 2) * s);
    r2 := RectF(0, 0, BadgeCircleRadius * s, BadgeCircleRadius * s);
    DrawEllipse(ABmp.Canvas, r2, ABackgroundColor);
    DrawEllipse(ABmp.Canvas, r, AColor);
    ABmp.Canvas.EndScene;
    ACanvas.DrawBitmap(ABmp, RectF(0, 0, ABmp.Width, ABmp.Height), ARect, 1, False);
    ACanvas.Fill.Color := ATextColor;
    if AShowBadgeValue then
    begin
      ACanvas.Font.Size := 9;
      ACanvas.FillText(ARect, IntToStr(AValue), False, 1, [], TTextAlign.Center);
    end;
  finally
    FreeAndNil(ABmp);
  end;
end;

{ TksTabSheTksTabItemet }

procedure TNavTabItem.BeforeDestruction;
begin
  inherited;
  if (Parent is TNavigationPageControl) then
    TNavigationPageControl(Parent).TabItemList.Remove(Self);
end;

constructor TNavTabItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPresetIcon := TBitmap.Create;
  ClipChildren := True;
  Stored := True;
  Locked := True;
  HitTest := False;
  Text := Name;

  fUsePresetIcon := True;
  FNormalIconWhenCustom := TBitmap.Create;
  fSelectedIconWhenCustom := TBitmap.Create;

end;

destructor TNavTabItem.Destroy;
begin
  FreeAndNil(FPresetIcon);
  FreeAndNil(FNormalIconWhenCustom);
  FreeAndNil(fSelectedIconWhenCustom);
  inherited;
end;

procedure TNavTabItem.DrawTab(ACanvas: TCanvas; AIndex: integer; ARect: TRectF; AFont: TFont);
var
  AAppearence: TNavAppearence;
  ABmp: TBitmap;
  ADestRect: TRectF;
begin
  AAppearence := TNavigationPageControl(Parent).Appearence;
  InflateRect(ARect, 0, -AAppearence.TabbarBottomMarginHeight);

  if AIndex = TNavigationPageControl(Parent).SelectedTabIndex then
    ACanvas.Fill.Color := AAppearence.SelectedTabItem.SelectedColor
  else
    ACanvas.Fill.Color := AAppearence.NormalTabItem.NormalColor;

  ACanvas.Font.Size := AFont.Size;
  ACanvas.Font.Style := AFont.Style;
  ACanvas.Font.Family := AFont.Family;
  ACanvas.FillText(ARect, FText, False, 1, [], TTextAlign.Center, TTextAlign.Trailing);

  ABmp := TBitmap.Create;
  try
    ABmp.Assign(FPresetIcon);

    if (AIndex = TNavigationPageControl(Parent).SelectedTabIndex) then
      ReplaceOpaqueColor(ABmp, AAppearence.SelectedTabItem.SelectedColor)
    else
      ReplaceOpaqueColor(ABmp, AAppearence.NormalTabItem.NormalColor);

    if not fUsePresetIcon then
    begin
      if AIndex = TNavigationPageControl(Parent).SelectedTabIndex then
        ABmp.Assign(fSelectedIconWhenCustom)
      else
        ABmp.Assign(FNormalIconWhenCustom);
    end;

    if AIndex = TNavigationPageControl(Parent).SelectedTabIndex then
      ADestRect := RectF(0, 0, AAppearence.SelectedTabItem.SelectedIconSize, AAppearence.SelectedTabItem.SelectedIconSize)
    else
      ADestRect := RectF(0, 0, AAppearence.NormalTabItem.NormalIconSize, AAppearence.NormalTabItem.NormalIconSize);

    if AIndex = TNavigationPageControl(Parent).SelectedTabIndex then
      OffsetRect(ADestRect, ARect.Left + ((ARect.Width - AAppearence.SelectedTabItem.SelectedIconSize) / 2), 0)
    else
      OffsetRect(ADestRect, ARect.Left + ((ARect.Width - AAppearence.NormalTabItem.NormalIconSize) / 2), 0);

    OffsetRect(ADestRect, 0, AAppearence.TabbarTopMarginHeight);

    ACanvas.DrawBitmap(ABmp, RectF(0, 0, ABmp.Width, ABmp.Height), ADestRect, 1, True);

    if (FBadgeValue > 0) and TNavigationPageControl(Parent).Appearence.Badge.ShowBadge then
    begin
      GenerateBadge(ACanvas, PointF(ADestRect.Right - 7, ADestRect.Top - 2), FBadgeValue, AAppearence.Badge.BadgeColor,
        AAppearence.TabbarBackgroundColor, claWhite, TNavigationPageControl(Parent).Appearence.Badge.ShowBadgeValue,
        TNavigationPageControl(Parent).Appearence.Badge.BadgeCircleRadius);
    end;
  finally
    FreeAndNil(ABmp);
  end;
end;

procedure TNavTabItem.SetPresetItemIconName(const Value: TGoodIcon);
var
  AStream: TResourceStream;
  AEnumName: String;
begin

  AEnumName := GetENumName(TypeInfo(TGoodIcon), Ord(Value));
  AStream := TResourceStream.Create(HInstance, AEnumName, RT_RCDATA);
  try
    FPresetIcon.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;

  fPresetItemIconName := Value;
  UpdateTabs;
end;

procedure TNavTabItem.SetBadgeValue(const Value: integer);
begin
  if FBadgeValue <> Value then
  begin
    FBadgeValue := Value;
    UpdateTabs;
  end;
end;

procedure TNavTabItem.SetPresetIcon(const Value: TBitmap);
begin
  FPresetIcon.Assign(Value);
  UpdateTabs;
end;

procedure TNavTabItem.SetTabIndex(const Value: integer);
var
  ATabs: TNavTabItemList;
  ANewIndex: integer;
begin
  if fTabIndex <> Value then
  begin
    ATabs := TNavigationPageControl(Parent).TabItemList;
    ANewIndex := Value;
    if ANewIndex < 0 then
      fTabIndex := 0;
    if ANewIndex > ATabs.Count - 1 then
      ANewIndex := ATabs.Count - 1;
    ATabs.Move(fTabIndex, ANewIndex);
    fTabIndex := ANewIndex;
    UpdateTabs;
  end;
end;

procedure TNavTabItem.SetText(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    UpdateTabs;
  end;
end;

procedure TNavTabItem.UpdateTabs;
begin

  TNavigationPageControl(Parent).UpdateTabs;
end;

procedure TNavTabItem.SetUsePresetIcon(Value: boolean);
begin
  if fUsePresetIcon <> Value then
  begin
    fUsePresetIcon := Value;
    UpdateTabs;
  end;
end;

procedure TNavTabItem.SetNormalIconWhenCustom(Value: TBitmap);
begin
  FNormalIconWhenCustom.Assign(Value);
  UpdateTabs;
end;

procedure TNavTabItem.SetSelectedIconWhenCustom(Value: TBitmap);
begin
  fSelectedIconWhenCustom.Assign(Value);
  UpdateTabs;
end;

{ TNavigationPageControl }

function TNavigationPageControl.AddTab: TNavTabItem;
var
  ATab: TNavTabItem;
begin
  ATab := TNavTabItem.Create(Self);

  AddObject(ATab);

  Result := ATab;
end;

constructor TNavigationPageControl.Create(AOwner: TComponent);
begin
  inherited;
  FAppearence := TNavAppearence.Create(Self);
  FTabItemList := TNavTabItemList.Create(Self);
  FTabBar := TNavTabBar.Create(Self);

  SetAcceptsControls(True);
  Size.Height := 420;
  Size.Width := 280;

  FTabBar.Align := TAlignLayout.Bottom;
  Align := TAlignLayout.Client;
  AddObject(FTabBar);
end;

destructor TNavigationPageControl.Destroy;
begin

  FreeAndNil(FTabItemList);
  FAppearence.DisposeOf;
  inherited;
end;

procedure TNavigationPageControl.DoAddObject(const AObject: TFmxObject);
var
  ATab: TNavTabItem;
begin
  inherited;

  if AObject.ClassType = TNavTabItem then
  begin

    ATab := TNavTabItem(AObject);
    FTabItemList.Add(ATab);
    if not(csLoading in ComponentState) then
    begin
      ATab.Text := '页面' + IntToStr(TabCount - 1);
      if TabCount = 1 then
        ATab.PresetItemIconName := TGoodIcon.ic_home
      else if TabCount = 2 then
        ATab.PresetItemIconName := TGoodIcon.ic_description
      else if TabCount = 3 then
        ATab.PresetItemIconName := TGoodIcon.ic_video_library
      else if TabCount = 4 then
        ATab.PresetItemIconName := TGoodIcon.ic_person
      else
        ATab.PresetItemIconName := TGoodIcon.ic_poll;
    end;
    UpdateTabs;
    Exit;
  end;

  if (SelectedTab <> nil) and (AObject <> FTabBar) then
  begin
    SelectedTab.AddObject(AObject);
  end;
end;

procedure TNavigationPageControl.DoClickTab(ATab: TNavTabItem);
begin
  if Assigned(FOnClickTab) then
    FOnClickTab(Self, ATab);
end;

procedure TNavigationPageControl.DoRealign;
begin
  inherited;
  UpdateTabs;
  Repaint;
end;

function TNavigationPageControl.GetActiveTab: TNavTabItem;
begin
  if InRange(SelectedTabIndex, 0, GetTabCount - 1) then
    Result := TabItemList[SelectedTabIndex]
  else
    Result := nil;
end;

function TNavigationPageControl.GetItem(const AIndex: integer): TFmxObject;
begin
  Result := TabItemList[AIndex];
end;

function TNavigationPageControl.GetItemsCount: integer;
begin
  Result := FTabItemList.Count;
end;

function TNavigationPageControl.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TNavigationPageControl.GetSelectedTab: TNavTabItem;
begin
  Result := nil;
  if (fSelectedTabIndex > -1) and (fSelectedTabIndex <= FTabItemList.Count - 1) then
    Result := FTabItemList[fSelectedTabIndex];
end;

function TNavigationPageControl.GetTabCount: integer;
begin
  Result := 0;
  if FTabItemList <> nil then
    Result := FTabItemList.Count;
end;

function TNavigationPageControl.GetTabFromXPos(AXPos: Single): TNavTabItem;
var
  ICount: integer;
begin
  Result := nil;
  for ICount := 0 to GetTabCount - 1 do
  begin
    if PtInRect(GetTabRect(ICount), PointF(AXPos, 1)) then
    begin
      Result := TabItemList[ICount];
      Exit;
    end;
  end;
end;

function TNavigationPageControl.GetTabIndexFromXPos(AXPos: Single): integer;
var
  ICount: integer;
begin
  Result := -1;
  for ICount := 0 to GetTabCount - 1 do
  begin
    if PtInRect(GetTabRect(ICount), PointF(AXPos, 1)) then
    begin
      Result := ICount;
      Exit;
    end;
  end;
end;

function TNavigationPageControl.GetTabRect(AIndex: integer): TRectF;
var
  AWidth: Single;
begin
  AWidth := Width / GetTabCount;
  Result := RectF(0, 0, AWidth, Appearence.TabBarHeight);
  OffsetRect(Result, AWidth * AIndex, 0)
end;

function TNavigationPageControl.GetDeviceScreenScale: Single;
begin
  Result := GetScreenScale;
end;

procedure TNavigationPageControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;

end;

procedure TNavigationPageControl.NextTab;
begin
  SelectedTabIndex := SelectedTabIndex + 1;
end;

procedure TNavigationPageControl.Paint;
begin
  Canvas.Clear(FAppearence.SheetBackgroundColor);
  if (csDesigning in ComponentState) then
  begin
    DrawDesignBorder(claDimgray, claDimgray);
    Canvas.Fill.Color := claBlack;
{$IFDEF MSWINDOWS}
    if GetTabCount = 0 then
    begin
      Canvas.Font.Size := 14;
      Canvas.FillText(ClipRect, '右键菜单中可选新建页面' + #13#10 + 'Right-click to add new tab', True, 1, [], TTextAlign.Center);
    end;
{$ENDIF}
  end;
end;

procedure TNavigationPageControl.PrevTab;
begin
  SelectedTabIndex := SelectedTabIndex - 1;
end;

procedure TNavigationPageControl.Resize;
begin
  inherited;
  UpdateTabs;
  Repaint;
end;

procedure TNavigationPageControl.SetActiveTab(const Value: TNavTabItem);
begin
  if Value <> nil then
  begin
    SelectedTabIndex := TabItemList.IndexOf(Value);
  end;
end;

procedure TNavigationPageControl.SetTabIndex(const Value: integer);
begin
  if (TabItemList.Count > 0) and ((Value < 0) or (Value > TabItemList.Count - 1)) then
    Exit;
  if fSelectedTabIndex <> Value then
  begin
    fSelectedTabIndex := Value;
    UpdateTabs;
    if Assigned(FOnChange) then
      FOnChange(Self);

  end;
end;

procedure TNavigationPageControl.UpdateTabs;
var
  i: integer;
  ATabItem: TNavTabItem;
begin
  for i := 0 to GetTabCount - 1 do
  begin
    case Appearence.TabbarPosition of
      tbBottom:
        FTabBar.Align := TAlignLayout.Bottom;
      tbTop:
        FTabBar.Align := TAlignLayout.Top;
    end;
    ATabItem := TabItemList[i];
    ATabItem.fTabIndex := i;
    ATabItem.Width := Self.Width;
    case Appearence.TabbarPosition of
      tbBottom:
        ATabItem.Height := Self.Height - 50;
      tbNone:
        ATabItem.Height := Self.Height;
      tbTop:
        ATabItem.Height := Self.Height - 50;
    end;
    ATabItem.Position.Y := 0;
    if FAppearence.TabbarPosition = tbTop then
      ATabItem.Position.Y := 50;

    ATabItem.Position.X := 0;

    ATabItem.Visible := (i = fSelectedTabIndex);
    ATabItem.Realign;
  end;
  Repaint;
end;

{ TNavTabBar }

constructor TNavTabBar.Create(AOwner: TComponent);
begin
  inherited;
  FTabControl := (AOwner as TNavigationPageControl);
  Size.Height := FTabControl.Appearence.TabBarHeight;
  Stored := False;
  FDesignInteractive := True;
end;

procedure TNavTabBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  ATab: TNavTabItem;
begin
  inherited;
  TNavigationPageControl(Parent).SelectedTabIndex := TNavigationPageControl(FTabControl).GetTabIndexFromXPos(X);
  ATab := TNavigationPageControl(FTabControl).GetTabFromXPos(X);
{$IFDEF MSWINDOWS}
  if (csDesigning in ComponentState) and (TCommonCustomForm(FTabControl.Owner).Designer <> nil) then
  begin
    if ATab <> nil then
    begin
      TCommonCustomForm(FTabControl.Owner).Focused := nil;
      TCommonCustomForm(FTabControl.Owner).Designer.SelectComponent(ATab);
      TCommonCustomForm(FTabControl.Owner).Designer.Modified;
    end;
    Repaint;
  end;
{$ENDIF}
  if ATab <> nil then
    FTabControl.DoClickTab(ATab);
end;

procedure TNavTabBar.Paint;
var
  AState: TCanvasSaveState;
  i: integer;
  ARect: TRectF;
  ATabControl: TNavigationPageControl;
begin
  inherited;
  ATabControl := TNavigationPageControl(FTabControl);
  Size.Height := FTabControl.Appearence.TabBarHeight;
  with Canvas do
  begin
    AState := SaveState;
    try
      ARect := RectF(0, 0, Size.Width, Size.Height);
      if (csDesigning in ComponentState) then
        InflateRect(ARect, -1, -1);
      IntersectClipRect(ARect);

      Clear(claNull);

      if FTabControl.Appearence.TabbarPosition = tbNone then
        Exit;
      Fill.Kind := TBrushKind.Solid;

      Canvas.Clear(ATabControl.Appearence.TabbarBackgroundColor);

      Stroke.Kind := TBrushKind.Solid;
      Stroke.Color := ATabControl.Appearence.TabBarDividingLineColor;

      if (csDesigning in ComponentState) then
        DrawDesignBorder(claDimgray, claDimgray);

      case ATabControl.Appearence.TabbarPosition of
        tbBottom:
          DrawRectSides(ARect, 0, 0, AllCorners, 1, [TSide.Top]);
        tbTop:
          DrawRectSides(ARect, 0, 0, AllCorners, 1, [TSide.Bottom]);
      end;

      for i := 0 to TNavigationPageControl(FTabControl).GetTabCount - 1 do
      begin
        if (i = ATabControl.SelectedTabIndex) then
          ATabControl.TabItemList[i].DrawTab(Canvas, i, ATabControl.GetTabRect(i), ATabControl.Appearence.SelectedTabItem.SelectedFont)
        else
          ATabControl.TabItemList[i].DrawTab(Canvas, i, ATabControl.GetTabRect(i), ATabControl.Appearence.NormalTabItem.NormalFont);
      end;
    finally
      RestoreState(AState);
      Font.Size := 10;

    end;
  end;
end;

{ TBadge }

constructor TBadge.Create(ATabControl: TNavigationPageControl);
begin
  inherited Create;
  FTabControl := ATabControl;
  fShowBadge := False;
  FBadgeColor := claRed;
  fShowBadgeValue := True;
  fBadgeCircleRadius := 16;
end;

procedure TBadge.Changed;
begin
  FTabControl.Repaint;
end;

procedure TBadge.SetBadgeColor(Value: TAlphaColor);
begin
  if FBadgeColor <> Value then
  begin
    FBadgeColor := Value;
    Changed;
  end;
end;

procedure TBadge.SetShowBadge(Value: boolean);
begin
  if fShowBadge <> Value then
  begin
    fShowBadge := Value;
    Changed;
  end;
end;

procedure TBadge.SetShowBadgeValue(Value: boolean);
begin
  if fShowBadgeValue <> Value then
  begin
    fShowBadgeValue := Value;
    Changed;
  end;
end;

procedure TBadge.SetBadgeCircleRadius(Value: integer);
begin
  if fBadgeCircleRadius <> Value then
  begin
    fBadgeCircleRadius := Value;
    if Value < 3 then
      fBadgeCircleRadius := 3;
    Changed;
  end;
end;

{ TSelectedTabItem }
constructor TSelectedTabItem.Create(ATabControl: TNavigationPageControl);
begin
  inherited Create;
  FTabControl := ATabControl;
  FSelectedColor := claDodgerblue;
  fSelectedFont := TFont.Create;
  fSelectedFont.Size := C_Selected_Tab_Font_Size;
  fSelectedIconSize := 28;
end;

destructor TSelectedTabItem.Destroy;
begin
  FreeAndNil(fSelectedFont);
  inherited;
end;

procedure TSelectedTabItem.Changed;
begin
  FTabControl.Repaint;
end;

procedure TSelectedTabItem.SetSelectedColor(Value: TAlphaColor);
begin
  if FSelectedColor <> Value then
  begin
    FSelectedColor := Value;
    Changed;
  end;
end;

procedure TSelectedTabItem.SetSelectedFont(Value: TFont);
begin
  if fSelectedFont <> Value then
  begin
    fSelectedFont := Value;
    Changed;
  end;
end;

procedure TSelectedTabItem.SetSelectedIconSize(Value: integer);
begin
  if fSelectedIconSize <> Value then
  begin
    fSelectedIconSize := Value;
    Changed;
  end;
end;

{ TNormalTabItem }
constructor TNormalTabItem.Create(ATabControl: TNavigationPageControl);
begin
  inherited Create;
  FTabControl := ATabControl;
  FNormalColor := claDimgray;
  fNormalFont := TFont.Create;
  fNormalFont.Size := C_Normal_Tab_Font_Size;
  fNormalIconSize := 28;
end;

destructor TNormalTabItem.Destroy;
begin
  FreeAndNil(fNormalFont);
  inherited;
end;

procedure TNormalTabItem.Changed;
begin
  FTabControl.UpdateTabs;
end;

procedure TNormalTabItem.SetNormalColor(Value: TAlphaColor);
begin
  if FNormalColor <> Value then
  begin
    FNormalColor := Value;
    Changed;
  end;
end;

procedure TNormalTabItem.SetNormalFont(Value: TFont);
begin
  if fNormalFont <> Value then
  begin
    fNormalFont := Value;
    Changed;
  end;
end;

procedure TNormalTabItem.SetNormalIconSize(Value: integer);
begin
  if fNormalIconSize <> Value then
  begin
    fNormalIconSize := Value;
    Changed;
  end;
end;
{ TNavAppearence }

procedure TNavAppearence.Changed;
begin
  TNavigationPageControl(FTabControl).UpdateTabs;
end;

constructor TNavAppearence.Create(ATabControl: TNavigationPageControl);
begin
  inherited Create;
  FTabControl := ATabControl;

  FTabbarBackgroundColor := claWhite;
  fTabBarDividingLineColor := claBlack;
  fSheetBackgroundColor := claWhite;
  fTabbarBottomMarginHeight := 3;
  fTabbarTopMarginHeight := 4;

  TabBarHeight := C_Default_Tab_Height;

  fBadge := TBadge.Create(FTabControl);
  fSelectedTabItem := TSelectedTabItem.Create(FTabControl);
  fNormalTabItem := TNormalTabItem.Create(FTabControl);

  FTabbarPosition := tbBottom;
end;

destructor TNavAppearence.Destroy;
begin
  FreeAndNil(fSelectedTabItem);
  FreeAndNil(fNormalTabItem);
  FreeAndNil(fBadge);

  inherited;
end;

procedure TNavAppearence.SetTabbarBackgroundColor(const Value: TAlphaColor);
begin
  if FTabbarBackgroundColor <> Value then
  begin
    FTabbarBackgroundColor := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetTabBarDividingLineColor(const Value: TAlphaColor);
begin
  if fTabBarDividingLineColor <> Value then
  begin
    fTabBarDividingLineColor := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetSheetBackgroundColor(Value: TAlphaColor);
begin
  if fSheetBackgroundColor <> Value then
  begin
    fSheetBackgroundColor := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetTabBarHeight(Value: integer);
begin
  if fTabBarHeight <> Value then
  begin
    fTabBarHeight := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetTabBarPosition(const Value: TNavTabBarPosition);
begin
  if FTabbarPosition <> Value then
  begin
    FTabbarPosition := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetTabbarBottomMarginHeight(Value: integer);
begin
  if fTabbarBottomMarginHeight <> Value then
  begin
    fTabbarBottomMarginHeight := Value;
    Changed;
  end;
end;

procedure TNavAppearence.SetTabbarTopMarginHeight(Value: integer);
begin
  if fTabbarTopMarginHeight <> Value then
  begin
    fTabbarTopMarginHeight := Value;
    Changed;
  end;
end;

{ TNavTabItemList }

constructor TNavTabItemList.Create(ATabControl: TNavigationPageControl);
begin
  inherited Create(False);
  FTabControl := ATabControl;
end;

procedure TNavTabItemList.Notify(const Value: TNavTabItem; Action: TCollectionNotification);
begin
  inherited;
  if csDestroying in FTabControl.ComponentState then
    Exit;
  if (Action = TCollectionNotification.cnRemoved) and (not(csDesigning in FTabControl.ComponentState)) then
  begin
    Value.DisposeOf;
  end;
end;

initialization

AScreenScale := 0;

RegisterFmxClasses([TNavigationPageControl, TNavTabItem]);

end.
