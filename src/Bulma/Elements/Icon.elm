
module Bulma.Elements.Icon exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Icon Wrapper
@docs Icon
@docs icon

# Icon Body
@docs IconBody
@docs adjust, american_sign_language_interpreting, anchor, archive, area_chart, arrows, arrows_h, arrows_v, asl_interpreting, assistive_listening_systems, asterisk, at, audio_description, automobile, balance_scale, ban, bank, bar_chart, bar_chart_o, barcode, bars, battery_0, battery_1, battery_2, battery_3, battery_4, battery_empty, battery_full, battery_half, battery_quarter, battery_three_quarters, bed, beer, bell, bell_o, bell_slash, bell_slash_o, bicycle, binoculars, birthday_cake, blind, bluetooth, bluetooth_b, bolt, bomb, book, bookmark, bookmark_o, braille, briefcase, bug, building, building_o, bullhorn, bullseye, bus, cab, calculator, calendar, calendar_check_o, calendar_minus_o, calendar_o, calendar_plus_o, calendar_times_o, camera, camera_retro, car, caret_square_o_down, caret_square_o_left, caret_square_o_right, caret_square_o_up, cart_arrow_down, cart_plus, cc, certificate, check, check_circle, check_circle_o, check_square, check_square_o, child, circle, circle_o, circle_o_notch, circle_thin, clock_o, clone, close, cloud, cloud_download, cloud_upload, code, code_fork, coffee, cog, cogs, comment, comment_o, commenting, commenting_o, comments, comments_o, compass, copyright, creative_commons, credit_card, credit_card_alt, crop, crosshairs, cube, cubes, cutlery, dashboard, database, deaf, deafness, desktop, diamond, dot_circle_o, download, edit, ellipsis_h, ellipsis_v, envelope, envelope_o, envelope_square, eraser, exchange, exclamation, exclamation_circle, exclamation_triangle, external_link, external_link_square, eye, eye_slash, eyedropper, fax, feed, female, fighter_jet, file_archive_o, file_audio_o, file_code_o, file_excel_o, file_image_o, file_movie_o, file_pdf_o, file_photo_o, file_picture_o, file_powerpoint_o, file_sound_o, file_video_o, file_word_o, file_zip_o, film, filter, fire, fire_extinguisher, flag, flag_checkered, flag_o, flash, flask, folder, folder_o, folder_open, folder_open_o, frown_o, futbol_o, gamepad, gavel, gear, gears, gift, glass, globe, graduation_cap, group, hand_grab_o, hand_lizard_o, hand_paper_o, hand_peace_o, hand_pointer_o, hand_rock_o, hand_scissors_o, hand_spock_o, hand_stop_o, hard_of_hearing, hashtag, hdd_o, headphones, heart, heart_o, heartbeat, history, home, hotel, hourglass, hourglass_1, hourglass_2, hourglass_3, hourglass_end, hourglass_half, hourglass_o, hourglass_start, i_cursor, image, inbox, industry, info, info_circle, institution, key, keyboard_o, language, laptop, leaf, legal, lemon_o, level_down, level_up, life_bouy, life_buoy, life_ring, life_saver, lightbulb_o, line_chart, location_arrow, lock, low_vision, magic, magnet, mail_forward, mail_reply, mail_reply_all, male, map, map_marker, map_o, map_pin, map_signs, meh_o, microphone, microphone_slash, minus, minus_circle, minus_square, minus_square_o, mobile, mobile_phone, money, moon_o, mortar_board, motorcycle, mouse_pointer, music, navicon, newspaper_o, object_group, object_ungroup, paint_brush, paper_plane, paper_plane_o, paw, pencil, pencil_square, pencil_square_o, percent, phone, phone_square, photo, picture_o, pie_chart, plane, plug, plus, plus_circle, plus_square, plus_square_o, power_off, print, puzzle_piece, qrcode, question, question_circle, question_circle_o, quote_left, quote_right, random, recycle, refresh, registered, remove, reorder, reply, reply_all, retweet, road, rocket, rss, rss_square, search, search_minus, search_plus, send, send_o, server, share, share_alt, share_alt_square, share_square, share_square_o, shield, ship, shopping_bag, shopping_basket, shopping_cart, sign_in, sign_language, sign_out, signal, signing, sitemap, sliders, smile_o, soccer_ball_o, sort, sort_alpha_asc, sort_alpha_desc, sort_amount_asc, sort_amount_desc, sort_asc, sort_desc, sort_down, sort_numeric_asc, sort_numeric_desc, sort_up, space_shuttle, spinner, spoon, square, square_o, star, star_half, star_half_empty, star_half_full, star_half_o, star_o, sticky_note, sticky_note_o, street_view, suitcase, sun_o, support, tablet, tachometer, tag, tags, tasks, taxi, television, terminal, thumb_tack, thumbs_down, thumbs_o_down, thumbs_o_up, thumbs_up, ticket, times, times_circle, times_circle_o, tint, toggle_down, toggle_left, toggle_off, toggle_on, toggle_right, toggle_up, trademark, trash, trash_o, tree, trophy, truck, tty, tv, umbrella, universal_access, university, unlock, unlock_alt, unsorted, upload, user, user_plus, user_secret, user_times, users, video_camera, volume_control_phone, volume_down, volume_off, volume_up, warning, wheelchair, wheelchair_alt, wifi, wrench, fiveHundredPX, adn, amazon, android, angellist, apple, behance, behance_square, bitbucket, bitbucket_square, bitcoin, black_tie, btc, buysellads, cc_amex, cc_diners_club, cc_discover, cc_jcb, cc_mastercard, cc_paypal, cc_stripe, cc_visa, chrome, codepen, codiepie, connectdevelop, contao, css3, dashcube, delicious, deviantart, digg, dribbble, dropbox, drupal, edge, empire, envira, expeditedssl, fa, facebook, facebook_f, facebook_official, facebook_square, firefox, first_order, flickr, font_awesome, fonticons, fort_awesome, forumbee, foursquare, ge, get_pocket, gg, gg_circle, git, git_square, github, github_alt, github_square, gitlab, gittip, glide, glide_g, google, google_plus, google_plus_circle, google_plus_official, google_plus_square, google_wallet, gratipay, hacker_news, houzz, html5, instagram, internet_explorer, ioxhost, joomla, jsfiddle, lastfm, lastfm_square, leanpub, linkedin, linkedin_square, linux, maxcdn, meanpath, medium_, mixcloud, modx, odnoklassniki, odnoklassniki_square, opencart, openid, opera, optin_monster, pagelines, paypal, pied_piper, pied_piper_alt, pied_piper_pp, pinterest, pinterest_p, pinterest_square, product_hunt, qq, ra, rebel, reddit, reddit_alien, reddit_square, renren, resistance, safari, scribd, sellsy, shirtsinbulk, simplybuilt, skyatlas, skype, slack, slideshare, snapchat, snapchat_ghost, snapchat_square, soundcloud, spotify, stack_exchange, stack_overflow, steam, steam_square, stumbleupon, stumbleupon_circle, tencent_weibo, themeisle, trello, tripadvisor, tumblr, tumblr_square, twitch, twitter, twitter_square, usb, viacoin, viadeo, viadeo_square, vimeo, vimeo_square, vine, vk, wechat, weibo, weixin, whatsapp, wikipedia_w, windows, wordpress, wpbeginner, wpforms, xing, xing_square, y_combinator, y_combinator_square, yahoo, yc, yc_square, yelp, yoast, youtube, youtube_play, youtube_square 

-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( Size(..) )

import Html exposing ( Html, Attribute, i, span )
import Html.Attributes as Attr exposing ( class )


-- ICON ------------------------------------------------------------------------

{-| TODO
-}
type alias Icon msg = Html msg

{-| TODO
-}
icon : Size -> Attrs msg -> List (IconBody msg) -> Icon msg
icon size
  = node "span" []
    [ bulma.icon.container
    , case size of
        Small  -> bulma.icon.size.isSmall
        Normal -> ""
        Medium -> bulma.icon.size.isMedium
        Large  -> bulma.icon.size.isLarge
    ] 


-- ICONS -----------------------------------------------------------------------

{-| TODO
-}
type alias IconBody msg = Html msg

{-| TODO
-}
adjust                              : IconBody msg
adjust                              = i [ class "fa fa-adjust" ] []

{-| TODO
-}
american_sign_language_interpreting : IconBody msg
american_sign_language_interpreting = i [ class "fa fa-americansignlanguageinterpreting" ] []

{-| TODO
-}
anchor                              : IconBody msg
anchor                              = i [ class "fa fa-anchor" ] []

{-| TODO
-}
archive                             : IconBody msg
archive                             = i [ class "fa fa-archive" ] []

{-| TODO
-}
area_chart                          : IconBody msg
area_chart                          = i [ class "fa fa-areachart" ] []

{-| TODO
-}
arrows                              : IconBody msg
arrows                              = i [ class "fa fa-arrows" ] []

{-| TODO
-}
arrows_h                            : IconBody msg
arrows_h                            = i [ class "fa fa-arrowsh" ] []

{-| TODO
-}
arrows_v                            : IconBody msg
arrows_v                            = i [ class "fa fa-arrowsv" ] []

{-| TODO
-}
asl_interpreting                    : IconBody msg
asl_interpreting                    = i [ class "fa fa-aslinterpreting" ] []

{-| TODO
-}
assistive_listening_systems         : IconBody msg
assistive_listening_systems         = i [ class "fa fa-assistivelisteningsystems" ] []

{-| TODO
-}
asterisk                            : IconBody msg
asterisk                            = i [ class "fa fa-asterisk" ] []

{-| TODO
-}
at                                  : IconBody msg
at                                  = i [ class "fa fa-at" ] []

{-| TODO
-}
audio_description                   : IconBody msg
audio_description                   = i [ class "fa fa-audiodescription" ] []

{-| TODO
-}
automobile                          : IconBody msg
automobile                          = i [ class "fa fa-automobile" ] []

{-| TODO
-}
balance_scale                       : IconBody msg
balance_scale                       = i [ class "fa fa-balancescale" ] []

{-| TODO
-}
ban                                 : IconBody msg
ban                                 = i [ class "fa fa-ban" ] []

{-| TODO
-}
bank                                : IconBody msg
bank                                = i [ class "fa fa-bank" ] []

{-| TODO
-}
bar_chart                           : IconBody msg
bar_chart                           = i [ class "fa fa-barchart" ] []

{-| TODO
-}
bar_chart_o                         : IconBody msg
bar_chart_o                         = i [ class "fa fa-barcharto" ] []

{-| TODO
-}
barcode                             : IconBody msg
barcode                             = i [ class "fa fa-barcode" ] []

{-| TODO
-}
bars                                : IconBody msg
bars                                = i [ class "fa fa-bars" ] []

{-| TODO
-}
battery_0                           : IconBody msg
battery_0                           = i [ class "fa fa-battery0" ] []

{-| TODO
-}
battery_1                           : IconBody msg
battery_1                           = i [ class "fa fa-battery1" ] []

{-| TODO
-}
battery_2                           : IconBody msg
battery_2                           = i [ class "fa fa-battery2" ] []

{-| TODO
-}
battery_3                           : IconBody msg
battery_3                           = i [ class "fa fa-battery3" ] []

{-| TODO
-}
battery_4                           : IconBody msg
battery_4                           = i [ class "fa fa-battery4" ] []

{-| TODO
-}
battery_empty                       : IconBody msg
battery_empty                       = i [ class "fa fa-batteryempty" ] []

{-| TODO
-}
battery_full                        : IconBody msg
battery_full                        = i [ class "fa fa-batteryfull" ] []

{-| TODO
-}
battery_half                        : IconBody msg
battery_half                        = i [ class "fa fa-batteryhalf" ] []

{-| TODO
-}
battery_quarter                     : IconBody msg
battery_quarter                     = i [ class "fa fa-batteryquarter" ] []

{-| TODO
-}
battery_three_quarters              : IconBody msg
battery_three_quarters              = i [ class "fa fa-batterythreequarters" ] []

{-| TODO
-}
bed                                 : IconBody msg
bed                                 = i [ class "fa fa-bed" ] []

{-| TODO
-}
beer                                : IconBody msg
beer                                = i [ class "fa fa-beer" ] []

{-| TODO
-}
bell                                : IconBody msg
bell                                = i [ class "fa fa-bell" ] []

{-| TODO
-}
bell_o                              : IconBody msg
bell_o                              = i [ class "fa fa-bello" ] []

{-| TODO
-}
bell_slash                          : IconBody msg
bell_slash                          = i [ class "fa fa-bellslash" ] []

{-| TODO
-}
bell_slash_o                        : IconBody msg
bell_slash_o                        = i [ class "fa fa-bellslasho" ] []

{-| TODO
-}
bicycle                             : IconBody msg
bicycle                             = i [ class "fa fa-bicycle" ] []

{-| TODO
-}
binoculars                          : IconBody msg
binoculars                          = i [ class "fa fa-binoculars" ] []

{-| TODO
-}
birthday_cake                       : IconBody msg
birthday_cake                       = i [ class "fa fa-birthdaycake" ] []

{-| TODO
-}
blind                               : IconBody msg
blind                               = i [ class "fa fa-blind" ] []

{-| TODO
-}
bluetooth                           : IconBody msg
bluetooth                           = i [ class "fa fa-bluetooth" ] []

{-| TODO
-}
bluetooth_b                         : IconBody msg
bluetooth_b                         = i [ class "fa fa-bluetoothb" ] []

{-| TODO
-}
bolt                                : IconBody msg
bolt                                = i [ class "fa fa-bolt" ] []

{-| TODO
-}
bomb                                : IconBody msg
bomb                                = i [ class "fa fa-bomb" ] []

{-| TODO
-}
book                                : IconBody msg
book                                = i [ class "fa fa-book" ] []

{-| TODO
-}
bookmark                            : IconBody msg
bookmark                            = i [ class "fa fa-bookmark" ] []

{-| TODO
-}
bookmark_o                          : IconBody msg
bookmark_o                          = i [ class "fa fa-bookmarko" ] []

{-| TODO
-}
braille                             : IconBody msg
braille                             = i [ class "fa fa-braille" ] []

{-| TODO
-}
briefcase                           : IconBody msg
briefcase                           = i [ class "fa fa-briefcase" ] []

{-| TODO
-}
bug                                 : IconBody msg
bug                                 = i [ class "fa fa-bug" ] []

{-| TODO
-}
building                            : IconBody msg
building                            = i [ class "fa fa-building" ] []

{-| TODO
-}
building_o                          : IconBody msg
building_o                          = i [ class "fa fa-buildingo" ] []

{-| TODO
-}
bullhorn                            : IconBody msg
bullhorn                            = i [ class "fa fa-bullhorn" ] []

{-| TODO
-}
bullseye                            : IconBody msg
bullseye                            = i [ class "fa fa-bullseye" ] []

{-| TODO
-}
bus                                 : IconBody msg
bus                                 = i [ class "fa fa-bus" ] []

{-| TODO
-}
cab                                 : IconBody msg
cab                                 = i [ class "fa fa-cab" ] []

{-| TODO
-}
calculator                          : IconBody msg
calculator                          = i [ class "fa fa-calculator" ] []

{-| TODO
-}
calendar                            : IconBody msg
calendar                            = i [ class "fa fa-calendar" ] []

{-| TODO
-}
calendar_check_o                    : IconBody msg
calendar_check_o                    = i [ class "fa fa-calendarchecko" ] []

{-| TODO
-}
calendar_minus_o                    : IconBody msg
calendar_minus_o                    = i [ class "fa fa-calendarminuso" ] []

{-| TODO
-}
calendar_o                          : IconBody msg
calendar_o                          = i [ class "fa fa-calendaro" ] []

{-| TODO
-}
calendar_plus_o                     : IconBody msg
calendar_plus_o                     = i [ class "fa fa-calendarpluso" ] []

{-| TODO
-}
calendar_times_o                    : IconBody msg
calendar_times_o                    = i [ class "fa fa-calendartimeso" ] []

{-| TODO
-}
camera                              : IconBody msg
camera                              = i [ class "fa fa-camera" ] []

{-| TODO
-}
camera_retro                        : IconBody msg
camera_retro                        = i [ class "fa fa-cameraretro" ] []

{-| TODO
-}
car                                 : IconBody msg
car                                 = i [ class "fa fa-car" ] []

{-| TODO
-}
caret_square_o_down                 : IconBody msg
caret_square_o_down                 = i [ class "fa fa-caretsquareodown" ] []

{-| TODO
-}
caret_square_o_left                 : IconBody msg
caret_square_o_left                 = i [ class "fa fa-caretsquareoleft" ] []

{-| TODO
-}
caret_square_o_right                : IconBody msg
caret_square_o_right                = i [ class "fa fa-caretsquareoright" ] []

{-| TODO
-}
caret_square_o_up                   : IconBody msg
caret_square_o_up                   = i [ class "fa fa-caretsquareoup" ] []

{-| TODO
-}
cart_arrow_down                     : IconBody msg
cart_arrow_down                     = i [ class "fa fa-cartarrowdown" ] []

{-| TODO
-}
cart_plus                           : IconBody msg
cart_plus                           = i [ class "fa fa-cartplus" ] []

{-| TODO
-}
cc                                  : IconBody msg
cc                                  = i [ class "fa fa-cc" ] []

{-| TODO
-}
certificate                         : IconBody msg
certificate                         = i [ class "fa fa-certificate" ] []

{-| TODO
-}
check                               : IconBody msg
check                               = i [ class "fa fa-check" ] []

{-| TODO
-}
check_circle                        : IconBody msg
check_circle                        = i [ class "fa fa-checkcircle" ] []

{-| TODO
-}
check_circle_o                      : IconBody msg
check_circle_o                      = i [ class "fa fa-checkcircleo" ] []

{-| TODO
-}
check_square                        : IconBody msg
check_square                        = i [ class "fa fa-checksquare" ] []

{-| TODO
-}
check_square_o                      : IconBody msg
check_square_o                      = i [ class "fa fa-checksquareo" ] []

{-| TODO
-}
child                               : IconBody msg
child                               = i [ class "fa fa-child" ] []

{-| TODO
-}
circle                              : IconBody msg
circle                              = i [ class "fa fa-circle" ] []

{-| TODO
-}
circle_o                            : IconBody msg
circle_o                            = i [ class "fa fa-circleo" ] []

{-| TODO
-}
circle_o_notch                      : IconBody msg
circle_o_notch                      = i [ class "fa fa-circleonotch" ] []

{-| TODO
-}
circle_thin                         : IconBody msg
circle_thin                         = i [ class "fa fa-circlethin" ] []

{-| TODO
-}
clock_o                             : IconBody msg
clock_o                             = i [ class "fa fa-clocko" ] []

{-| TODO
-}
clone                               : IconBody msg
clone                               = i [ class "fa fa-clone" ] []

{-| TODO
-}
close                               : IconBody msg
close                               = i [ class "fa fa-close" ] []

{-| TODO
-}
cloud                               : IconBody msg
cloud                               = i [ class "fa fa-cloud" ] []

{-| TODO
-}
cloud_download                      : IconBody msg
cloud_download                      = i [ class "fa fa-clouddownload" ] []

{-| TODO
-}
cloud_upload                        : IconBody msg
cloud_upload                        = i [ class "fa fa-cloudupload" ] []

{-| TODO
-}
code                                : IconBody msg
code                                = i [ class "fa fa-code" ] []

{-| TODO
-}
code_fork                           : IconBody msg
code_fork                           = i [ class "fa fa-codefork" ] []

{-| TODO
-}
coffee                              : IconBody msg
coffee                              = i [ class "fa fa-coffee" ] []

{-| TODO
-}
cog                                 : IconBody msg
cog                                 = i [ class "fa fa-cog" ] []

{-| TODO
-}
cogs                                : IconBody msg
cogs                                = i [ class "fa fa-cogs" ] []

{-| TODO
-}
comment                             : IconBody msg
comment                             = i [ class "fa fa-comment" ] []

{-| TODO
-}
comment_o                           : IconBody msg
comment_o                           = i [ class "fa fa-commento" ] []

{-| TODO
-}
commenting                          : IconBody msg
commenting                          = i [ class "fa fa-commenting" ] []

{-| TODO
-}
commenting_o                        : IconBody msg
commenting_o                        = i [ class "fa fa-commentingo" ] []

{-| TODO
-}
comments                            : IconBody msg
comments                            = i [ class "fa fa-comments" ] []

{-| TODO
-}
comments_o                          : IconBody msg
comments_o                          = i [ class "fa fa-commentso" ] []

{-| TODO
-}
compass                             : IconBody msg
compass                             = i [ class "fa fa-compass" ] []

{-| TODO
-}
copyright                           : IconBody msg
copyright                           = i [ class "fa fa-copyright" ] []

{-| TODO
-}
creative_commons                    : IconBody msg
creative_commons                    = i [ class "fa fa-creativecommons" ] []

{-| TODO
-}
credit_card                         : IconBody msg
credit_card                         = i [ class "fa fa-creditcard" ] []

{-| TODO
-}
credit_card_alt                     : IconBody msg
credit_card_alt                     = i [ class "fa fa-creditcardalt" ] []

{-| TODO
-}
crop                                : IconBody msg
crop                                = i [ class "fa fa-crop" ] []

{-| TODO
-}
crosshairs                          : IconBody msg
crosshairs                          = i [ class "fa fa-crosshairs" ] []

{-| TODO
-}
cube                                : IconBody msg
cube                                = i [ class "fa fa-cube" ] []

{-| TODO
-}
cubes                               : IconBody msg
cubes                               = i [ class "fa fa-cubes" ] []

{-| TODO
-}
cutlery                             : IconBody msg
cutlery                             = i [ class "fa fa-cutlery" ] []

{-| TODO
-}
dashboard                           : IconBody msg
dashboard                           = i [ class "fa fa-dashboard" ] []

{-| TODO
-}
database                            : IconBody msg
database                            = i [ class "fa fa-database" ] []

{-| TODO
-}
deaf                                : IconBody msg
deaf                                = i [ class "fa fa-deaf" ] []

{-| TODO
-}
deafness                            : IconBody msg
deafness                            = i [ class "fa fa-deafness" ] []

{-| TODO
-}
desktop                             : IconBody msg
desktop                             = i [ class "fa fa-desktop" ] []

{-| TODO
-}
diamond                             : IconBody msg
diamond                             = i [ class "fa fa-diamond" ] []

{-| TODO
-}
dot_circle_o                        : IconBody msg
dot_circle_o                        = i [ class "fa fa-dotcircleo" ] []

{-| TODO
-}
download                            : IconBody msg
download                            = i [ class "fa fa-download" ] []

{-| TODO
-}
edit                                : IconBody msg
edit                                = i [ class "fa fa-edit" ] []

{-| TODO
-}
ellipsis_h                          : IconBody msg
ellipsis_h                          = i [ class "fa fa-ellipsish" ] []

{-| TODO
-}
ellipsis_v                          : IconBody msg
ellipsis_v                          = i [ class "fa fa-ellipsisv" ] []

{-| TODO
-}
envelope                            : IconBody msg
envelope                            = i [ class "fa fa-envelope" ] []

{-| TODO
-}
envelope_o                          : IconBody msg
envelope_o                          = i [ class "fa fa-envelopeo" ] []

{-| TODO
-}
envelope_square                     : IconBody msg
envelope_square                     = i [ class "fa fa-envelopesquare" ] []

{-| TODO
-}
eraser                              : IconBody msg
eraser                              = i [ class "fa fa-eraser" ] []

{-| TODO
-}
exchange                            : IconBody msg
exchange                            = i [ class "fa fa-exchange" ] []

{-| TODO
-}
exclamation                         : IconBody msg
exclamation                         = i [ class "fa fa-exclamation" ] []

{-| TODO
-}
exclamation_circle                  : IconBody msg
exclamation_circle                  = i [ class "fa fa-exclamationcircle" ] []

{-| TODO
-}
exclamation_triangle                : IconBody msg
exclamation_triangle                = i [ class "fa fa-exclamationtriangle" ] []

{-| TODO
-}
external_link                       : IconBody msg
external_link                       = i [ class "fa fa-externallink" ] []

{-| TODO
-}
external_link_square                : IconBody msg
external_link_square                = i [ class "fa fa-externallinksquare" ] []

{-| TODO
-}
eye                                 : IconBody msg
eye                                 = i [ class "fa fa-eye" ] []

{-| TODO
-}
eye_slash                           : IconBody msg
eye_slash                           = i [ class "fa fa-eyeslash" ] []

{-| TODO
-}
eyedropper                          : IconBody msg
eyedropper                          = i [ class "fa fa-eyedropper" ] []

{-| TODO
-}
fax                                 : IconBody msg
fax                                 = i [ class "fa fa-fax" ] []

{-| TODO
-}
feed                                : IconBody msg
feed                                = i [ class "fa fa-feed" ] []

{-| TODO
-}
female                              : IconBody msg
female                              = i [ class "fa fa-female" ] []

{-| TODO
-}
fighter_jet                         : IconBody msg
fighter_jet                         = i [ class "fa fa-fighterjet" ] []

{-| TODO
-}
file_archive_o                      : IconBody msg
file_archive_o                      = i [ class "fa fa-filearchiveo" ] []

{-| TODO
-}
file_audio_o                        : IconBody msg
file_audio_o                        = i [ class "fa fa-fileaudioo" ] []

{-| TODO
-}
file_code_o                         : IconBody msg
file_code_o                         = i [ class "fa fa-filecodeo" ] []

{-| TODO
-}
file_excel_o                        : IconBody msg
file_excel_o                        = i [ class "fa fa-fileexcelo" ] []

{-| TODO
-}
file_image_o                        : IconBody msg
file_image_o                        = i [ class "fa fa-fileimageo" ] []

{-| TODO
-}
file_movie_o                        : IconBody msg
file_movie_o                        = i [ class "fa fa-filemovieo" ] []

{-| TODO
-}
file_pdf_o                          : IconBody msg
file_pdf_o                          = i [ class "fa fa-filepdfo" ] []

{-| TODO
-}
file_photo_o                        : IconBody msg
file_photo_o                        = i [ class "fa fa-filephotoo" ] []

{-| TODO
-}
file_picture_o                      : IconBody msg
file_picture_o                      = i [ class "fa fa-filepictureo" ] []

{-| TODO
-}
file_powerpoint_o                   : IconBody msg
file_powerpoint_o                   = i [ class "fa fa-filepowerpointo" ] []

{-| TODO
-}
file_sound_o                        : IconBody msg
file_sound_o                        = i [ class "fa fa-filesoundo" ] []

{-| TODO
-}
file_video_o                        : IconBody msg
file_video_o                        = i [ class "fa fa-filevideoo" ] []

{-| TODO
-}
file_word_o                         : IconBody msg
file_word_o                         = i [ class "fa fa-filewordo" ] []

{-| TODO
-}
file_zip_o                          : IconBody msg
file_zip_o                          = i [ class "fa fa-filezipo" ] []

{-| TODO
-}
film                                : IconBody msg
film                                = i [ class "fa fa-film" ] []

{-| TODO
-}
filter                              : IconBody msg
filter                              = i [ class "fa fa-filter" ] []

{-| TODO
-}
fire                                : IconBody msg
fire                                = i [ class "fa fa-fire" ] []

{-| TODO
-}
fire_extinguisher                   : IconBody msg
fire_extinguisher                   = i [ class "fa fa-fireextinguisher" ] []

{-| TODO
-}
flag                                : IconBody msg
flag                                = i [ class "fa fa-flag" ] []

{-| TODO
-}
flag_checkered                      : IconBody msg
flag_checkered                      = i [ class "fa fa-flagcheckered" ] []

{-| TODO
-}
flag_o                              : IconBody msg
flag_o                              = i [ class "fa fa-flago" ] []

{-| TODO
-}
flash                               : IconBody msg
flash                               = i [ class "fa fa-flash" ] []

{-| TODO
-}
flask                               : IconBody msg
flask                               = i [ class "fa fa-flask" ] []

{-| TODO
-}
folder                              : IconBody msg
folder                              = i [ class "fa fa-folder" ] []

{-| TODO
-}
folder_o                            : IconBody msg
folder_o                            = i [ class "fa fa-foldero" ] []

{-| TODO
-}
folder_open                         : IconBody msg
folder_open                         = i [ class "fa fa-folderopen" ] []

{-| TODO
-}
folder_open_o                       : IconBody msg
folder_open_o                       = i [ class "fa fa-folderopeno" ] []

{-| TODO
-}
frown_o                             : IconBody msg
frown_o                             = i [ class "fa fa-frowno" ] []

{-| TODO
-}
futbol_o                            : IconBody msg
futbol_o                            = i [ class "fa fa-futbolo" ] []

{-| TODO
-}
gamepad                             : IconBody msg
gamepad                             = i [ class "fa fa-gamepad" ] []

{-| TODO
-}
gavel                               : IconBody msg
gavel                               = i [ class "fa fa-gavel" ] []

{-| TODO
-}
gear                                : IconBody msg
gear                                = i [ class "fa fa-gear" ] []

{-| TODO
-}
gears                               : IconBody msg
gears                               = i [ class "fa fa-gears" ] []

{-| TODO
-}
gift                                : IconBody msg
gift                                = i [ class "fa fa-gift" ] []

{-| TODO
-}
glass                               : IconBody msg
glass                               = i [ class "fa fa-glass" ] []

{-| TODO
-}
globe                               : IconBody msg
globe                               = i [ class "fa fa-globe" ] []

{-| TODO
-}
graduation_cap                      : IconBody msg
graduation_cap                      = i [ class "fa fa-graduationcap" ] []

{-| TODO
-}
group                               : IconBody msg
group                               = i [ class "fa fa-group" ] []

{-| TODO
-}
hand_grab_o                         : IconBody msg
hand_grab_o                         = i [ class "fa fa-handgrabo" ] []

{-| TODO
-}
hand_lizard_o                       : IconBody msg
hand_lizard_o                       = i [ class "fa fa-handlizardo" ] []

{-| TODO
-}
hand_paper_o                        : IconBody msg
hand_paper_o                        = i [ class "fa fa-handpapero" ] []

{-| TODO
-}
hand_peace_o                        : IconBody msg
hand_peace_o                        = i [ class "fa fa-handpeaceo" ] []

{-| TODO
-}
hand_pointer_o                      : IconBody msg
hand_pointer_o                      = i [ class "fa fa-handpointero" ] []

{-| TODO
-}
hand_rock_o                         : IconBody msg
hand_rock_o                         = i [ class "fa fa-handrocko" ] []

{-| TODO
-}
hand_scissors_o                     : IconBody msg
hand_scissors_o                     = i [ class "fa fa-handscissorso" ] []

{-| TODO
-}
hand_spock_o                        : IconBody msg
hand_spock_o                        = i [ class "fa fa-handspocko" ] []

{-| TODO
-}
hand_stop_o                         : IconBody msg
hand_stop_o                         = i [ class "fa fa-handstopo" ] []

{-| TODO
-}
hard_of_hearing                     : IconBody msg
hard_of_hearing                     = i [ class "fa fa-hardofhearing" ] []

{-| TODO
-}
hashtag                             : IconBody msg
hashtag                             = i [ class "fa fa-hashtag" ] []

{-| TODO
-}
hdd_o                               : IconBody msg
hdd_o                               = i [ class "fa fa-hddo" ] []

{-| TODO
-}
headphones                          : IconBody msg
headphones                          = i [ class "fa fa-headphones" ] []

{-| TODO
-}
heart                               : IconBody msg
heart                               = i [ class "fa fa-heart" ] []

{-| TODO
-}
heart_o                             : IconBody msg
heart_o                             = i [ class "fa fa-hearto" ] []

{-| TODO
-}
heartbeat                           : IconBody msg
heartbeat                           = i [ class "fa fa-heartbeat" ] []

{-| TODO
-}
history                             : IconBody msg
history                             = i [ class "fa fa-history" ] []

{-| TODO
-}
home                                : IconBody msg
home                                = i [ class "fa fa-home" ] []

{-| TODO
-}
hotel                               : IconBody msg
hotel                               = i [ class "fa fa-hotel" ] []

{-| TODO
-}
hourglass                           : IconBody msg
hourglass                           = i [ class "fa fa-hourglass" ] []

{-| TODO
-}
hourglass_1                         : IconBody msg
hourglass_1                         = i [ class "fa fa-hourglass1" ] []

{-| TODO
-}
hourglass_2                         : IconBody msg
hourglass_2                         = i [ class "fa fa-hourglass2" ] []

{-| TODO
-}
hourglass_3                         : IconBody msg
hourglass_3                         = i [ class "fa fa-hourglass3" ] []

{-| TODO
-}
hourglass_end                       : IconBody msg
hourglass_end                       = i [ class "fa fa-hourglassend" ] []

{-| TODO
-}
hourglass_half                      : IconBody msg
hourglass_half                      = i [ class "fa fa-hourglasshalf" ] []

{-| TODO
-}
hourglass_o                         : IconBody msg
hourglass_o                         = i [ class "fa fa-hourglasso" ] []

{-| TODO
-}
hourglass_start                     : IconBody msg
hourglass_start                     = i [ class "fa fa-hourglassstart" ] []

{-| TODO
-}
i_cursor                            : IconBody msg
i_cursor                            = i [ class "fa fa-icursor" ] []

{-| TODO
-}
image                               : IconBody msg
image                               = i [ class "fa fa-image" ] []

{-| TODO
-}
inbox                               : IconBody msg
inbox                               = i [ class "fa fa-inbox" ] []

{-| TODO
-}
industry                            : IconBody msg
industry                            = i [ class "fa fa-industry" ] []

{-| TODO
-}
info                                : IconBody msg
info                                = i [ class "fa fa-info" ] []

{-| TODO
-}
info_circle                         : IconBody msg
info_circle                         = i [ class "fa fa-infocircle" ] []

{-| TODO
-}
institution                         : IconBody msg
institution                         = i [ class "fa fa-institution" ] []

{-| TODO
-}
key                                 : IconBody msg
key                                 = i [ class "fa fa-key" ] []

{-| TODO
-}
keyboard_o                          : IconBody msg
keyboard_o                          = i [ class "fa fa-keyboardo" ] []

{-| TODO
-}
language                            : IconBody msg
language                            = i [ class "fa fa-language" ] []

{-| TODO
-}
laptop                              : IconBody msg
laptop                              = i [ class "fa fa-laptop" ] []

{-| TODO
-}
leaf                                : IconBody msg
leaf                                = i [ class "fa fa-leaf" ] []

{-| TODO
-}
legal                               : IconBody msg
legal                               = i [ class "fa fa-legal" ] []

{-| TODO
-}
lemon_o                             : IconBody msg
lemon_o                             = i [ class "fa fa-lemono" ] []

{-| TODO
-}
level_down                          : IconBody msg
level_down                          = i [ class "fa fa-leveldown" ] []

{-| TODO
-}
level_up                            : IconBody msg
level_up                            = i [ class "fa fa-levelup" ] []

{-| TODO
-}
life_bouy                           : IconBody msg
life_bouy                           = i [ class "fa fa-lifebouy" ] []

{-| TODO
-}
life_buoy                           : IconBody msg
life_buoy                           = i [ class "fa fa-lifebuoy" ] []

{-| TODO
-}
life_ring                           : IconBody msg
life_ring                           = i [ class "fa fa-lifering" ] []

{-| TODO
-}
life_saver                          : IconBody msg
life_saver                          = i [ class "fa fa-lifesaver" ] []

{-| TODO
-}
lightbulb_o                         : IconBody msg
lightbulb_o                         = i [ class "fa fa-lightbulbo" ] []

{-| TODO
-}
line_chart                          : IconBody msg
line_chart                          = i [ class "fa fa-linechart" ] []

{-| TODO
-}
location_arrow                      : IconBody msg
location_arrow                      = i [ class "fa fa-locationarrow" ] []

{-| TODO
-}
lock                                : IconBody msg
lock                                = i [ class "fa fa-lock" ] []

{-| TODO
-}
low_vision                          : IconBody msg
low_vision                          = i [ class "fa fa-lowvision" ] []

{-| TODO
-}
magic                               : IconBody msg
magic                               = i [ class "fa fa-magic" ] []

{-| TODO
-}
magnet                              : IconBody msg
magnet                              = i [ class "fa fa-magnet" ] []

{-| TODO
-}
mail_forward                        : IconBody msg
mail_forward                        = i [ class "fa fa-mailforward" ] []

{-| TODO
-}
mail_reply                          : IconBody msg
mail_reply                          = i [ class "fa fa-mailreply" ] []

{-| TODO
-}
mail_reply_all                      : IconBody msg
mail_reply_all                      = i [ class "fa fa-mailreplyall" ] []

{-| TODO
-}
male                                : IconBody msg
male                                = i [ class "fa fa-male" ] []

{-| TODO
-}
map                                 : IconBody msg
map                                 = i [ class "fa fa-map" ] []

{-| TODO
-}
map_marker                          : IconBody msg
map_marker                          = i [ class "fa fa-mapmarker" ] []

{-| TODO
-}
map_o                               : IconBody msg
map_o                               = i [ class "fa fa-mapo" ] []

{-| TODO
-}
map_pin                             : IconBody msg
map_pin                             = i [ class "fa fa-mappin" ] []

{-| TODO
-}
map_signs                           : IconBody msg
map_signs                           = i [ class "fa fa-mapsigns" ] []

{-| TODO
-}
meh_o                               : IconBody msg
meh_o                               = i [ class "fa fa-meho" ] []

{-| TODO
-}
microphone                          : IconBody msg
microphone                          = i [ class "fa fa-microphone" ] []

{-| TODO
-}
microphone_slash                    : IconBody msg
microphone_slash                    = i [ class "fa fa-microphoneslash" ] []

{-| TODO
-}
minus                               : IconBody msg
minus                               = i [ class "fa fa-minus" ] []

{-| TODO
-}
minus_circle                        : IconBody msg
minus_circle                        = i [ class "fa fa-minuscircle" ] []

{-| TODO
-}
minus_square                        : IconBody msg
minus_square                        = i [ class "fa fa-minussquare" ] []

{-| TODO
-}
minus_square_o                      : IconBody msg
minus_square_o                      = i [ class "fa fa-minussquareo" ] []

{-| TODO
-}
mobile                              : IconBody msg
mobile                              = i [ class "fa fa-mobile" ] []

{-| TODO
-}
mobile_phone                        : IconBody msg
mobile_phone                        = i [ class "fa fa-mobilephone" ] []

{-| TODO
-}
money                               : IconBody msg
money                               = i [ class "fa fa-money" ] []

{-| TODO
-}
moon_o                              : IconBody msg
moon_o                              = i [ class "fa fa-moono" ] []

{-| TODO
-}
mortar_board                        : IconBody msg
mortar_board                        = i [ class "fa fa-mortarboard" ] []

{-| TODO
-}
motorcycle                          : IconBody msg
motorcycle                          = i [ class "fa fa-motorcycle" ] []

{-| TODO
-}
mouse_pointer                       : IconBody msg
mouse_pointer                       = i [ class "fa fa-mousepointer" ] []

{-| TODO
-}
music                               : IconBody msg
music                               = i [ class "fa fa-music" ] []

{-| TODO
-}
navicon                             : IconBody msg
navicon                             = i [ class "fa fa-navicon" ] []

{-| TODO
-}
newspaper_o                         : IconBody msg
newspaper_o                         = i [ class "fa fa-newspapero" ] []

{-| TODO
-}
object_group                        : IconBody msg
object_group                        = i [ class "fa fa-objectgroup" ] []

{-| TODO
-}
object_ungroup                      : IconBody msg
object_ungroup                      = i [ class "fa fa-objectungroup" ] []

{-| TODO
-}
paint_brush                         : IconBody msg
paint_brush                         = i [ class "fa fa-paintbrush" ] []

{-| TODO
-}
paper_plane                         : IconBody msg
paper_plane                         = i [ class "fa fa-paperplane" ] []

{-| TODO
-}
paper_plane_o                       : IconBody msg
paper_plane_o                       = i [ class "fa fa-paperplaneo" ] []

{-| TODO
-}
paw                                 : IconBody msg
paw                                 = i [ class "fa fa-paw" ] []

{-| TODO
-}
pencil                              : IconBody msg
pencil                              = i [ class "fa fa-pencil" ] []

{-| TODO
-}
pencil_square                       : IconBody msg
pencil_square                       = i [ class "fa fa-pencilsquare" ] []

{-| TODO
-}
pencil_square_o                     : IconBody msg
pencil_square_o                     = i [ class "fa fa-pencilsquareo" ] []

{-| TODO
-}
percent                             : IconBody msg
percent                             = i [ class "fa fa-percent" ] []

{-| TODO
-}
phone                               : IconBody msg
phone                               = i [ class "fa fa-phone" ] []

{-| TODO
-}
phone_square                        : IconBody msg
phone_square                        = i [ class "fa fa-phonesquare" ] []

{-| TODO
-}
photo                               : IconBody msg
photo                               = i [ class "fa fa-photo" ] []

{-| TODO
-}
picture_o                           : IconBody msg
picture_o                           = i [ class "fa fa-pictureo" ] []

{-| TODO
-}
pie_chart                           : IconBody msg
pie_chart                           = i [ class "fa fa-piechart" ] []

{-| TODO
-}
plane                               : IconBody msg
plane                               = i [ class "fa fa-plane" ] []

{-| TODO
-}
plug                                : IconBody msg
plug                                = i [ class "fa fa-plug" ] []

{-| TODO
-}
plus                                : IconBody msg
plus                                = i [ class "fa fa-plus" ] []

{-| TODO
-}
plus_circle                         : IconBody msg
plus_circle                         = i [ class "fa fa-pluscircle" ] []

{-| TODO
-}
plus_square                         : IconBody msg
plus_square                         = i [ class "fa fa-plussquare" ] []

{-| TODO
-}
plus_square_o                       : IconBody msg
plus_square_o                       = i [ class "fa fa-plussquareo" ] []

{-| TODO
-}
power_off                           : IconBody msg
power_off                           = i [ class "fa fa-poweroff" ] []

{-| TODO
-}
print                               : IconBody msg
print                               = i [ class "fa fa-print" ] []

{-| TODO
-}
puzzle_piece                        : IconBody msg
puzzle_piece                        = i [ class "fa fa-puzzlepiece" ] []

{-| TODO
-}
qrcode                              : IconBody msg
qrcode                              = i [ class "fa fa-qrcode" ] []

{-| TODO
-}
question                            : IconBody msg
question                            = i [ class "fa fa-question" ] []

{-| TODO
-}
question_circle                     : IconBody msg
question_circle                     = i [ class "fa fa-questioncircle" ] []

{-| TODO
-}
question_circle_o                   : IconBody msg
question_circle_o                   = i [ class "fa fa-questioncircleo" ] []

{-| TODO
-}
quote_left                          : IconBody msg
quote_left                          = i [ class "fa fa-quoteleft" ] []

{-| TODO
-}
quote_right                         : IconBody msg
quote_right                         = i [ class "fa fa-quoteright" ] []

{-| TODO
-}
random                              : IconBody msg
random                              = i [ class "fa fa-random" ] []

{-| TODO
-}
recycle                             : IconBody msg
recycle                             = i [ class "fa fa-recycle" ] []

{-| TODO
-}
refresh                             : IconBody msg
refresh                             = i [ class "fa fa-refresh" ] []

{-| TODO
-}
registered                          : IconBody msg
registered                          = i [ class "fa fa-registered" ] []

{-| TODO
-}
remove                              : IconBody msg
remove                              = i [ class "fa fa-remove" ] []

{-| TODO
-}
reorder                             : IconBody msg
reorder                             = i [ class "fa fa-reorder" ] []

{-| TODO
-}
reply                               : IconBody msg
reply                               = i [ class "fa fa-reply" ] []

{-| TODO
-}
reply_all                           : IconBody msg
reply_all                           = i [ class "fa fa-replyall" ] []

{-| TODO
-}
retweet                             : IconBody msg
retweet                             = i [ class "fa fa-retweet" ] []

{-| TODO
-}
road                                : IconBody msg
road                                = i [ class "fa fa-road" ] []

{-| TODO
-}
rocket                              : IconBody msg
rocket                              = i [ class "fa fa-rocket" ] []

{-| TODO
-}
rss                                 : IconBody msg
rss                                 = i [ class "fa fa-rss" ] []

{-| TODO
-}
rss_square                          : IconBody msg
rss_square                          = i [ class "fa fa-rsssquare" ] []

{-| TODO
-}
search                              : IconBody msg
search                              = i [ class "fa fa-search" ] []

{-| TODO
-}
search_minus                        : IconBody msg
search_minus                        = i [ class "fa fa-searchminus" ] []

{-| TODO
-}
search_plus                         : IconBody msg
search_plus                         = i [ class "fa fa-searchplus" ] []

{-| TODO
-}
send                                : IconBody msg
send                                = i [ class "fa fa-send" ] []

{-| TODO
-}
send_o                              : IconBody msg
send_o                              = i [ class "fa fa-sendo" ] []

{-| TODO
-}
server                              : IconBody msg
server                              = i [ class "fa fa-server" ] []

{-| TODO
-}
share                               : IconBody msg
share                               = i [ class "fa fa-share" ] []

{-| TODO
-}
share_alt                           : IconBody msg
share_alt                           = i [ class "fa fa-sharealt" ] []

{-| TODO
-}
share_alt_square                    : IconBody msg
share_alt_square                    = i [ class "fa fa-sharealtsquare" ] []

{-| TODO
-}
share_square                        : IconBody msg
share_square                        = i [ class "fa fa-sharesquare" ] []

{-| TODO
-}
share_square_o                      : IconBody msg
share_square_o                      = i [ class "fa fa-sharesquareo" ] []

{-| TODO
-}
shield                              : IconBody msg
shield                              = i [ class "fa fa-shield" ] []

{-| TODO
-}
ship                                : IconBody msg
ship                                = i [ class "fa fa-ship" ] []

{-| TODO
-}
shopping_bag                        : IconBody msg
shopping_bag                        = i [ class "fa fa-shoppingbag" ] []

{-| TODO
-}
shopping_basket                     : IconBody msg
shopping_basket                     = i [ class "fa fa-shoppingbasket" ] []

{-| TODO
-}
shopping_cart                       : IconBody msg
shopping_cart                       = i [ class "fa fa-shoppingcart" ] []

{-| TODO
-}
sign_in                             : IconBody msg
sign_in                             = i [ class "fa fa-signin" ] []

{-| TODO
-}
sign_language                       : IconBody msg
sign_language                       = i [ class "fa fa-signlanguage" ] []

{-| TODO
-}
sign_out                            : IconBody msg
sign_out                            = i [ class "fa fa-signout" ] []

{-| TODO
-}
signal                              : IconBody msg
signal                              = i [ class "fa fa-signal" ] []

{-| TODO
-}
signing                             : IconBody msg
signing                             = i [ class "fa fa-signing" ] []

{-| TODO
-}
sitemap                             : IconBody msg
sitemap                             = i [ class "fa fa-sitemap" ] []

{-| TODO
-}
sliders                             : IconBody msg
sliders                             = i [ class "fa fa-sliders" ] []

{-| TODO
-}
smile_o                             : IconBody msg
smile_o                             = i [ class "fa fa-smileo" ] []

{-| TODO
-}
soccer_ball_o                       : IconBody msg
soccer_ball_o                       = i [ class "fa fa-soccerballo" ] []

{-| TODO
-}
sort                                : IconBody msg
sort                                = i [ class "fa fa-sort" ] []

{-| TODO
-}
sort_alpha_asc                      : IconBody msg
sort_alpha_asc                      = i [ class "fa fa-sortalphaasc" ] []

{-| TODO
-}
sort_alpha_desc                     : IconBody msg
sort_alpha_desc                     = i [ class "fa fa-sortalphadesc" ] []

{-| TODO
-}
sort_amount_asc                     : IconBody msg
sort_amount_asc                     = i [ class "fa fa-sortamountasc" ] []

{-| TODO
-}
sort_amount_desc                    : IconBody msg
sort_amount_desc                    = i [ class "fa fa-sortamountdesc" ] []

{-| TODO
-}
sort_asc                            : IconBody msg
sort_asc                            = i [ class "fa fa-sortasc" ] []

{-| TODO
-}
sort_desc                           : IconBody msg
sort_desc                           = i [ class "fa fa-sortdesc" ] []

{-| TODO
-}
sort_down                           : IconBody msg
sort_down                           = i [ class "fa fa-sortdown" ] []

{-| TODO
-}
sort_numeric_asc                    : IconBody msg
sort_numeric_asc                    = i [ class "fa fa-sortnumericasc" ] []

{-| TODO
-}
sort_numeric_desc                   : IconBody msg
sort_numeric_desc                   = i [ class "fa fa-sortnumericdesc" ] []

{-| TODO
-}
sort_up                             : IconBody msg
sort_up                             = i [ class "fa fa-sortup" ] []

{-| TODO
-}
space_shuttle                       : IconBody msg
space_shuttle                       = i [ class "fa fa-spaceshuttle" ] []

{-| TODO
-}
spinner                             : IconBody msg
spinner                             = i [ class "fa fa-spinner" ] []

{-| TODO
-}
spoon                               : IconBody msg
spoon                               = i [ class "fa fa-spoon" ] []

{-| TODO
-}
square                              : IconBody msg
square                              = i [ class "fa fa-square" ] []

{-| TODO
-}
square_o                            : IconBody msg
square_o                            = i [ class "fa fa-squareo" ] []

{-| TODO
-}
star                                : IconBody msg
star                                = i [ class "fa fa-star" ] []

{-| TODO
-}
star_half                           : IconBody msg
star_half                           = i [ class "fa fa-starhalf" ] []

{-| TODO
-}
star_half_empty                     : IconBody msg
star_half_empty                     = i [ class "fa fa-starhalfempty" ] []

{-| TODO
-}
star_half_full                      : IconBody msg
star_half_full                      = i [ class "fa fa-starhalffull" ] []

{-| TODO
-}
star_half_o                         : IconBody msg
star_half_o                         = i [ class "fa fa-starhalfo" ] []

{-| TODO
-}
star_o                              : IconBody msg
star_o                              = i [ class "fa fa-staro" ] []

{-| TODO
-}
sticky_note                         : IconBody msg
sticky_note                         = i [ class "fa fa-stickynote" ] []

{-| TODO
-}
sticky_note_o                       : IconBody msg
sticky_note_o                       = i [ class "fa fa-stickynoteo" ] []

{-| TODO
-}
street_view                         : IconBody msg
street_view                         = i [ class "fa fa-streetview" ] []

{-| TODO
-}
suitcase                            : IconBody msg
suitcase                            = i [ class "fa fa-suitcase" ] []

{-| TODO
-}
sun_o                               : IconBody msg
sun_o                               = i [ class "fa fa-suno" ] []

{-| TODO
-}
support                             : IconBody msg
support                             = i [ class "fa fa-support" ] []

{-| TODO
-}
tablet                              : IconBody msg
tablet                              = i [ class "fa fa-tablet" ] []

{-| TODO
-}
tachometer                          : IconBody msg
tachometer                          = i [ class "fa fa-tachometer" ] []

{-| TODO
-}
tag                                 : IconBody msg
tag                                 = i [ class "fa fa-tag" ] []

{-| TODO
-}
tags                                : IconBody msg
tags                                = i [ class "fa fa-tags" ] []

{-| TODO
-}
tasks                               : IconBody msg
tasks                               = i [ class "fa fa-tasks" ] []

{-| TODO
-}
taxi                                : IconBody msg
taxi                                = i [ class "fa fa-taxi" ] []

{-| TODO
-}
television                          : IconBody msg
television                          = i [ class "fa fa-television" ] []

{-| TODO
-}
terminal                            : IconBody msg
terminal                            = i [ class "fa fa-terminal" ] []

{-| TODO
-}
thumb_tack                          : IconBody msg
thumb_tack                          = i [ class "fa fa-thumbtack" ] []

{-| TODO
-}
thumbs_down                         : IconBody msg
thumbs_down                         = i [ class "fa fa-thumbsdown" ] []

{-| TODO
-}
thumbs_o_down                       : IconBody msg
thumbs_o_down                       = i [ class "fa fa-thumbsodown" ] []

{-| TODO
-}
thumbs_o_up                         : IconBody msg
thumbs_o_up                         = i [ class "fa fa-thumbsoup" ] []

{-| TODO
-}
thumbs_up                           : IconBody msg
thumbs_up                           = i [ class "fa fa-thumbsup" ] []

{-| TODO
-}
ticket                              : IconBody msg
ticket                              = i [ class "fa fa-ticket" ] []

{-| TODO
-}
times                               : IconBody msg
times                               = i [ class "fa fa-times" ] []

{-| TODO
-}
times_circle                        : IconBody msg
times_circle                        = i [ class "fa fa-timescircle" ] []

{-| TODO
-}
times_circle_o                      : IconBody msg
times_circle_o                      = i [ class "fa fa-timescircleo" ] []

{-| TODO
-}
tint                                : IconBody msg
tint                                = i [ class "fa fa-tint" ] []

{-| TODO
-}
toggle_down                         : IconBody msg
toggle_down                         = i [ class "fa fa-toggledown" ] []

{-| TODO
-}
toggle_left                         : IconBody msg
toggle_left                         = i [ class "fa fa-toggleleft" ] []

{-| TODO
-}
toggle_off                          : IconBody msg
toggle_off                          = i [ class "fa fa-toggleoff" ] []

{-| TODO
-}
toggle_on                           : IconBody msg
toggle_on                           = i [ class "fa fa-toggleon" ] []

{-| TODO
-}
toggle_right                        : IconBody msg
toggle_right                        = i [ class "fa fa-toggleright" ] []

{-| TODO
-}
toggle_up                           : IconBody msg
toggle_up                           = i [ class "fa fa-toggleup" ] []

{-| TODO
-}
trademark                           : IconBody msg
trademark                           = i [ class "fa fa-trademark" ] []

{-| TODO
-}
trash                               : IconBody msg
trash                               = i [ class "fa fa-trash" ] []

{-| TODO
-}
trash_o                             : IconBody msg
trash_o                             = i [ class "fa fa-trasho" ] []

{-| TODO
-}
tree                                : IconBody msg
tree                                = i [ class "fa fa-tree" ] []

{-| TODO
-}
trophy                              : IconBody msg
trophy                              = i [ class "fa fa-trophy" ] []

{-| TODO
-}
truck                               : IconBody msg
truck                               = i [ class "fa fa-truck" ] []

{-| TODO
-}
tty                                 : IconBody msg
tty                                 = i [ class "fa fa-tty" ] []

{-| TODO
-}
tv                                  : IconBody msg
tv                                  = i [ class "fa fa-tv" ] []

{-| TODO
-}
umbrella                            : IconBody msg
umbrella                            = i [ class "fa fa-umbrella" ] []

{-| TODO
-}
universal_access                    : IconBody msg
universal_access                    = i [ class "fa fa-universalaccess" ] []

{-| TODO
-}
university                          : IconBody msg
university                          = i [ class "fa fa-university" ] []

{-| TODO
-}
unlock                              : IconBody msg
unlock                              = i [ class "fa fa-unlock" ] []

{-| TODO
-}
unlock_alt                          : IconBody msg
unlock_alt                          = i [ class "fa fa-unlockalt" ] []

{-| TODO
-}
unsorted                            : IconBody msg
unsorted                            = i [ class "fa fa-unsorted" ] []

{-| TODO
-}
upload                              : IconBody msg
upload                              = i [ class "fa fa-upload" ] []

{-| TODO
-}
user                                : IconBody msg
user                                = i [ class "fa fa-user" ] []

{-| TODO
-}
user_plus                           : IconBody msg
user_plus                           = i [ class "fa fa-userplus" ] []

{-| TODO
-}
user_secret                         : IconBody msg
user_secret                         = i [ class "fa fa-usersecret" ] []

{-| TODO
-}
user_times                          : IconBody msg
user_times                          = i [ class "fa fa-usertimes" ] []

{-| TODO
-}
users                               : IconBody msg
users                               = i [ class "fa fa-users" ] []

{-| TODO
-}
video_camera                        : IconBody msg
video_camera                        = i [ class "fa fa-videocamera" ] []

{-| TODO
-}
volume_control_phone                : IconBody msg
volume_control_phone                = i [ class "fa fa-volumecontrolphone" ] []

{-| TODO
-}
volume_down                         : IconBody msg
volume_down                         = i [ class "fa fa-volumedown" ] []

{-| TODO
-}
volume_off                          : IconBody msg
volume_off                          = i [ class "fa fa-volumeoff" ] []

{-| TODO
-}
volume_up                           : IconBody msg
volume_up                           = i [ class "fa fa-volumeup" ] []

{-| TODO
-}
warning                             : IconBody msg
warning                             = i [ class "fa fa-warning" ] []

{-| TODO
-}
wheelchair                          : IconBody msg
wheelchair                          = i [ class "fa fa-wheelchair" ] []

{-| TODO
-}
wheelchair_alt                      : IconBody msg
wheelchair_alt                      = i [ class "fa fa-wheelchairalt" ] []

{-| TODO
-}
wifi                                : IconBody msg
wifi                                = i [ class "fa fa-wifi" ] []

{-| TODO
-}
wrench                              : IconBody msg
wrench                              = i [ class "fa fa-wrench" ] []

{-| TODO
-}
fiveHundredPX                       : IconBody msg
fiveHundredPX                       = i [ class "fa fa-fiveHundredPX" ] []

{-| TODO
-}
adn                                 : IconBody msg
adn                                 = i [ class "fa fa-adn" ] []

{-| TODO
-}
amazon                              : IconBody msg
amazon                              = i [ class "fa fa-amazon" ] []

{-| TODO
-}
android                             : IconBody msg
android                             = i [ class "fa fa-android" ] []

{-| TODO
-}
angellist                           : IconBody msg
angellist                           = i [ class "fa fa-angellist" ] []

{-| TODO
-}
apple                               : IconBody msg
apple                               = i [ class "fa fa-apple" ] []

{-| TODO
-}
behance                             : IconBody msg
behance                             = i [ class "fa fa-behance" ] []

{-| TODO
-}
behance_square                      : IconBody msg
behance_square                      = i [ class "fa fa-behancesquare" ] []

{-| TODO
-}
bitbucket                           : IconBody msg
bitbucket                           = i [ class "fa fa-bitbucket" ] []

{-| TODO
-}
bitbucket_square                    : IconBody msg
bitbucket_square                    = i [ class "fa fa-bitbucketsquare" ] []

{-| TODO
-}
bitcoin                             : IconBody msg
bitcoin                             = i [ class "fa fa-bitcoin" ] []

{-| TODO
-}
black_tie                           : IconBody msg
black_tie                           = i [ class "fa fa-blacktie" ] []

{-| TODO
-}
btc                                 : IconBody msg
btc                                 = i [ class "fa fa-btc" ] []

{-| TODO
-}
buysellads                          : IconBody msg
buysellads                          = i [ class "fa fa-buysellads" ] []

{-| TODO
-}
cc_amex                             : IconBody msg
cc_amex                             = i [ class "fa fa-ccamex" ] []

{-| TODO
-}
cc_diners_club                      : IconBody msg
cc_diners_club                      = i [ class "fa fa-ccdinersclub" ] []

{-| TODO
-}
cc_discover                         : IconBody msg
cc_discover                         = i [ class "fa fa-ccdiscover" ] []

{-| TODO
-}
cc_jcb                              : IconBody msg
cc_jcb                              = i [ class "fa fa-ccjcb" ] []

{-| TODO
-}
cc_mastercard                       : IconBody msg
cc_mastercard                       = i [ class "fa fa-ccmastercard" ] []

{-| TODO
-}
cc_paypal                           : IconBody msg
cc_paypal                           = i [ class "fa fa-ccpaypal" ] []

{-| TODO
-}
cc_stripe                           : IconBody msg
cc_stripe                           = i [ class "fa fa-ccstripe" ] []

{-| TODO
-}
cc_visa                             : IconBody msg
cc_visa                             = i [ class "fa fa-ccvisa" ] []

{-| TODO
-}
chrome                              : IconBody msg
chrome                              = i [ class "fa fa-chrome" ] []

{-| TODO
-}
codepen                             : IconBody msg
codepen                             = i [ class "fa fa-codepen" ] []

{-| TODO
-}
codiepie                            : IconBody msg
codiepie                            = i [ class "fa fa-codiepie" ] []

{-| TODO
-}
connectdevelop                      : IconBody msg
connectdevelop                      = i [ class "fa fa-connectdevelop" ] []

{-| TODO
-}
contao                              : IconBody msg
contao                              = i [ class "fa fa-contao" ] []

{-| TODO
-}
css3                                : IconBody msg
css3                                = i [ class "fa fa-css3" ] []

{-| TODO
-}
dashcube                            : IconBody msg
dashcube                            = i [ class "fa fa-dashcube" ] []

{-| TODO
-}
delicious                           : IconBody msg
delicious                           = i [ class "fa fa-delicious" ] []

{-| TODO
-}
deviantart                          : IconBody msg
deviantart                          = i [ class "fa fa-deviantart" ] []

{-| TODO
-}
digg                                : IconBody msg
digg                                = i [ class "fa fa-digg" ] []

{-| TODO
-}
dribbble                            : IconBody msg
dribbble                            = i [ class "fa fa-dribbble" ] []

{-| TODO
-}
dropbox                             : IconBody msg
dropbox                             = i [ class "fa fa-dropbox" ] []

{-| TODO
-}
drupal                              : IconBody msg
drupal                              = i [ class "fa fa-drupal" ] []

{-| TODO
-}
edge                                : IconBody msg
edge                                = i [ class "fa fa-edge" ] []

{-| TODO
-}
empire                              : IconBody msg
empire                              = i [ class "fa fa-empire" ] []

{-| TODO
-}
envira                              : IconBody msg
envira                              = i [ class "fa fa-envira" ] []

{-| TODO
-}
expeditedssl                        : IconBody msg
expeditedssl                        = i [ class "fa fa-expeditedssl" ] []

{-| TODO
-}
fa                                  : IconBody msg
fa                                  = i [ class "fa fa-fa" ] []

{-| TODO
-}
facebook                            : IconBody msg
facebook                            = i [ class "fa fa-facebook" ] []

{-| TODO
-}
facebook_f                          : IconBody msg
facebook_f                          = i [ class "fa fa-facebookf" ] []

{-| TODO
-}
facebook_official                   : IconBody msg
facebook_official                   = i [ class "fa fa-facebookofficial" ] []

{-| TODO
-}
facebook_square                     : IconBody msg
facebook_square                     = i [ class "fa fa-facebooksquare" ] []

{-| TODO
-}
firefox                             : IconBody msg
firefox                             = i [ class "fa fa-firefox" ] []

{-| TODO
-}
first_order                         : IconBody msg
first_order                         = i [ class "fa fa-firstorder" ] []

{-| TODO
-}
flickr                              : IconBody msg
flickr                              = i [ class "fa fa-flickr" ] []

{-| TODO
-}
font_awesome                        : IconBody msg
font_awesome                        = i [ class "fa fa-fontawesome" ] []

{-| TODO
-}
fonticons                           : IconBody msg
fonticons                           = i [ class "fa fa-fonticons" ] []

{-| TODO
-}
fort_awesome                        : IconBody msg
fort_awesome                        = i [ class "fa fa-fortawesome" ] []

{-| TODO
-}
forumbee                            : IconBody msg
forumbee                            = i [ class "fa fa-forumbee" ] []

{-| TODO
-}
foursquare                          : IconBody msg
foursquare                          = i [ class "fa fa-foursquare" ] []

{-| TODO
-}
ge                                  : IconBody msg
ge                                  = i [ class "fa fa-ge" ] []

{-| TODO
-}
get_pocket                          : IconBody msg
get_pocket                          = i [ class "fa fa-getpocket" ] []

{-| TODO
-}
gg                                  : IconBody msg
gg                                  = i [ class "fa fa-gg" ] []

{-| TODO
-}
gg_circle                           : IconBody msg
gg_circle                           = i [ class "fa fa-ggcircle" ] []

{-| TODO
-}
git                                 : IconBody msg
git                                 = i [ class "fa fa-git" ] []

{-| TODO
-}
git_square                          : IconBody msg
git_square                          = i [ class "fa fa-gitsquare" ] []

{-| TODO
-}
github                              : IconBody msg
github                              = i [ class "fa fa-github" ] []

{-| TODO
-}
github_alt                          : IconBody msg
github_alt                          = i [ class "fa fa-githubalt" ] []

{-| TODO
-}
github_square                       : IconBody msg
github_square                       = i [ class "fa fa-githubsquare" ] []

{-| TODO
-}
gitlab                              : IconBody msg
gitlab                              = i [ class "fa fa-gitlab" ] []

{-| TODO
-}
gittip                              : IconBody msg
gittip                              = i [ class "fa fa-gittip" ] []

{-| TODO
-}
glide                               : IconBody msg
glide                               = i [ class "fa fa-glide" ] []

{-| TODO
-}
glide_g                             : IconBody msg
glide_g                             = i [ class "fa fa-glideg" ] []

{-| TODO
-}
google                              : IconBody msg
google                              = i [ class "fa fa-google" ] []

{-| TODO
-}
google_plus                         : IconBody msg
google_plus                         = i [ class "fa fa-googleplus" ] []

{-| TODO
-}
google_plus_circle                  : IconBody msg
google_plus_circle                  = i [ class "fa fa-googlepluscircle" ] []

{-| TODO
-}
google_plus_official                : IconBody msg
google_plus_official                = i [ class "fa fa-googleplusofficial" ] []

{-| TODO
-}
google_plus_square                  : IconBody msg
google_plus_square                  = i [ class "fa fa-googleplussquare" ] []

{-| TODO
-}
google_wallet                       : IconBody msg
google_wallet                       = i [ class "fa fa-googlewallet" ] []

{-| TODO
-}
gratipay                            : IconBody msg
gratipay                            = i [ class "fa fa-gratipay" ] []

{-| TODO
-}
hacker_news                         : IconBody msg
hacker_news                         = i [ class "fa fa-hackernews" ] []

{-| TODO
-}
houzz                               : IconBody msg
houzz                               = i [ class "fa fa-houzz" ] []

{-| TODO
-}
html5                               : IconBody msg
html5                               = i [ class "fa fa-html5" ] []

{-| TODO
-}
instagram                           : IconBody msg
instagram                           = i [ class "fa fa-instagram" ] []

{-| TODO
-}
internet_explorer                   : IconBody msg
internet_explorer                   = i [ class "fa fa-internetexplorer" ] []

{-| TODO
-}
ioxhost                             : IconBody msg
ioxhost                             = i [ class "fa fa-ioxhost" ] []

{-| TODO
-}
joomla                              : IconBody msg
joomla                              = i [ class "fa fa-joomla" ] []

{-| TODO
-}
jsfiddle                            : IconBody msg
jsfiddle                            = i [ class "fa fa-jsfiddle" ] []

{-| TODO
-}
lastfm                              : IconBody msg
lastfm                              = i [ class "fa fa-lastfm" ] []

{-| TODO
-}
lastfm_square                       : IconBody msg
lastfm_square                       = i [ class "fa fa-lastfmsquare" ] []

{-| TODO
-}
leanpub                             : IconBody msg
leanpub                             = i [ class "fa fa-leanpub" ] []

{-| TODO
-}
linkedin                            : IconBody msg
linkedin                            = i [ class "fa fa-linkedin" ] []

{-| TODO
-}
linkedin_square                     : IconBody msg
linkedin_square                     = i [ class "fa fa-linkedinsquare" ] []

{-| TODO
-}
linux                               : IconBody msg
linux                               = i [ class "fa fa-linux" ] []

{-| TODO
-}
maxcdn                              : IconBody msg
maxcdn                              = i [ class "fa fa-maxcdn" ] []

{-| TODO
-}
meanpath                            : IconBody msg
meanpath                            = i [ class "fa fa-meanpath" ] []

{-| TODO
-}
medium_                             : IconBody msg
medium_                             = i [ class "fa fa-medium" ] []

{-| TODO
-}
mixcloud                            : IconBody msg
mixcloud                            = i [ class "fa fa-mixcloud" ] []

{-| TODO
-}
modx                                : IconBody msg
modx                                = i [ class "fa fa-modx" ] []

{-| TODO
-}
odnoklassniki                       : IconBody msg
odnoklassniki                       = i [ class "fa fa-odnoklassniki" ] []

{-| TODO
-}
odnoklassniki_square                : IconBody msg
odnoklassniki_square                = i [ class "fa fa-odnoklassnikisquare" ] []

{-| TODO
-}
opencart                            : IconBody msg
opencart                            = i [ class "fa fa-opencart" ] []

{-| TODO
-}
openid                              : IconBody msg
openid                              = i [ class "fa fa-openid" ] []

{-| TODO
-}
opera                               : IconBody msg
opera                               = i [ class "fa fa-opera" ] []

{-| TODO
-}
optin_monster                       : IconBody msg
optin_monster                       = i [ class "fa fa-optinmonster" ] []

{-| TODO
-}
pagelines                           : IconBody msg
pagelines                           = i [ class "fa fa-pagelines" ] []

{-| TODO
-}
paypal                              : IconBody msg
paypal                              = i [ class "fa fa-paypal" ] []

{-| TODO
-}
pied_piper                          : IconBody msg
pied_piper                          = i [ class "fa fa-piedpiper" ] []

{-| TODO
-}
pied_piper_alt                      : IconBody msg
pied_piper_alt                      = i [ class "fa fa-piedpiperalt" ] []

{-| TODO
-}
pied_piper_pp                       : IconBody msg
pied_piper_pp                       = i [ class "fa fa-piedpiperpp" ] []

{-| TODO
-}
pinterest                           : IconBody msg
pinterest                           = i [ class "fa fa-pinterest" ] []

{-| TODO
-}
pinterest_p                         : IconBody msg
pinterest_p                         = i [ class "fa fa-pinterestp" ] []

{-| TODO
-}
pinterest_square                    : IconBody msg
pinterest_square                    = i [ class "fa fa-pinterestsquare" ] []

{-| TODO
-}
product_hunt                        : IconBody msg
product_hunt                        = i [ class "fa fa-producthunt" ] []

{-| TODO
-}
qq                                  : IconBody msg
qq                                  = i [ class "fa fa-qq" ] []

{-| TODO
-}
ra                                  : IconBody msg
ra                                  = i [ class "fa fa-ra" ] []

{-| TODO
-}
rebel                               : IconBody msg
rebel                               = i [ class "fa fa-rebel" ] []

{-| TODO
-}
reddit                              : IconBody msg
reddit                              = i [ class "fa fa-reddit" ] []

{-| TODO
-}
reddit_alien                        : IconBody msg
reddit_alien                        = i [ class "fa fa-redditalien" ] []

{-| TODO
-}
reddit_square                       : IconBody msg
reddit_square                       = i [ class "fa fa-redditsquare" ] []

{-| TODO
-}
renren                              : IconBody msg
renren                              = i [ class "fa fa-renren" ] []

{-| TODO
-}
resistance                          : IconBody msg
resistance                          = i [ class "fa fa-resistance" ] []

{-| TODO
-}
safari                              : IconBody msg
safari                              = i [ class "fa fa-safari" ] []

{-| TODO
-}
scribd                              : IconBody msg
scribd                              = i [ class "fa fa-scribd" ] []

{-| TODO
-}
sellsy                              : IconBody msg
sellsy                              = i [ class "fa fa-sellsy" ] []

{-| TODO
-}
shirtsinbulk                        : IconBody msg
shirtsinbulk                        = i [ class "fa fa-shirtsinbulk" ] []

{-| TODO
-}
simplybuilt                         : IconBody msg
simplybuilt                         = i [ class "fa fa-simplybuilt" ] []

{-| TODO
-}
skyatlas                            : IconBody msg
skyatlas                            = i [ class "fa fa-skyatlas" ] []

{-| TODO
-}
skype                               : IconBody msg
skype                               = i [ class "fa fa-skype" ] []

{-| TODO
-}
slack                               : IconBody msg
slack                               = i [ class "fa fa-slack" ] []

{-| TODO
-}
slideshare                          : IconBody msg
slideshare                          = i [ class "fa fa-slideshare" ] []

{-| TODO
-}
snapchat                            : IconBody msg
snapchat                            = i [ class "fa fa-snapchat" ] []

{-| TODO
-}
snapchat_ghost                      : IconBody msg
snapchat_ghost                      = i [ class "fa fa-snapchatghost" ] []

{-| TODO
-}
snapchat_square                     : IconBody msg
snapchat_square                     = i [ class "fa fa-snapchatsquare" ] []

{-| TODO
-}
soundcloud                          : IconBody msg
soundcloud                          = i [ class "fa fa-soundcloud" ] []

{-| TODO
-}
spotify                             : IconBody msg
spotify                             = i [ class "fa fa-spotify" ] []

{-| TODO
-}
stack_exchange                      : IconBody msg
stack_exchange                      = i [ class "fa fa-stackexchange" ] []

{-| TODO
-}
stack_overflow                      : IconBody msg
stack_overflow                      = i [ class "fa fa-stackoverflow" ] []

{-| TODO
-}
steam                               : IconBody msg
steam                               = i [ class "fa fa-steam" ] []

{-| TODO
-}
steam_square                        : IconBody msg
steam_square                        = i [ class "fa fa-steamsquare" ] []

{-| TODO
-}
stumbleupon                         : IconBody msg
stumbleupon                         = i [ class "fa fa-stumbleupon" ] []

{-| TODO
-}
stumbleupon_circle                  : IconBody msg
stumbleupon_circle                  = i [ class "fa fa-stumbleuponcircle" ] []

{-| TODO
-}
tencent_weibo                       : IconBody msg
tencent_weibo                       = i [ class "fa fa-tencentweibo" ] []

{-| TODO
-}
themeisle                           : IconBody msg
themeisle                           = i [ class "fa fa-themeisle" ] []

{-| TODO
-}
trello                              : IconBody msg
trello                              = i [ class "fa fa-trello" ] []

{-| TODO
-}
tripadvisor                         : IconBody msg
tripadvisor                         = i [ class "fa fa-tripadvisor" ] []

{-| TODO
-}
tumblr                              : IconBody msg
tumblr                              = i [ class "fa fa-tumblr" ] []

{-| TODO
-}
tumblr_square                       : IconBody msg
tumblr_square                       = i [ class "fa fa-tumblrsquare" ] []

{-| TODO
-}
twitch                              : IconBody msg
twitch                              = i [ class "fa fa-twitch" ] []

{-| TODO
-}
twitter                             : IconBody msg
twitter                             = i [ class "fa fa-twitter" ] []

{-| TODO
-}
twitter_square                      : IconBody msg
twitter_square                      = i [ class "fa fa-twittersquare" ] []

{-| TODO
-}
usb                                 : IconBody msg
usb                                 = i [ class "fa fa-usb" ] []

{-| TODO
-}
viacoin                             : IconBody msg
viacoin                             = i [ class "fa fa-viacoin" ] []

{-| TODO
-}
viadeo                              : IconBody msg
viadeo                              = i [ class "fa fa-viadeo" ] []

{-| TODO
-}
viadeo_square                       : IconBody msg
viadeo_square                       = i [ class "fa fa-viadeosquare" ] []

{-| TODO
-}
vimeo                               : IconBody msg
vimeo                               = i [ class "fa fa-vimeo" ] []

{-| TODO
-}
vimeo_square                        : IconBody msg
vimeo_square                        = i [ class "fa fa-vimeosquare" ] []

{-| TODO
-}
vine                                : IconBody msg
vine                                = i [ class "fa fa-vine" ] []

{-| TODO
-}
vk                                  : IconBody msg
vk                                  = i [ class "fa fa-vk" ] []

{-| TODO
-}
wechat                              : IconBody msg
wechat                              = i [ class "fa fa-wechat" ] []

{-| TODO
-}
weibo                               : IconBody msg
weibo                               = i [ class "fa fa-weibo" ] []

{-| TODO
-}
weixin                              : IconBody msg
weixin                              = i [ class "fa fa-weixin" ] []

{-| TODO
-}
whatsapp                            : IconBody msg
whatsapp                            = i [ class "fa fa-whatsapp" ] []

{-| TODO
-}
wikipedia_w                         : IconBody msg
wikipedia_w                         = i [ class "fa fa-wikipediaw" ] []

{-| TODO
-}
windows                             : IconBody msg
windows                             = i [ class "fa fa-windows" ] []

{-| TODO
-}
wordpress                           : IconBody msg
wordpress                           = i [ class "fa fa-wordpress" ] []

{-| TODO
-}
wpbeginner                          : IconBody msg
wpbeginner                          = i [ class "fa fa-wpbeginner" ] []

{-| TODO
-}
wpforms                             : IconBody msg
wpforms                             = i [ class "fa fa-wpforms" ] []

{-| TODO
-}
xing                                : IconBody msg
xing                                = i [ class "fa fa-xing" ] []

{-| TODO
-}
xing_square                         : IconBody msg
xing_square                         = i [ class "fa fa-xingsquare" ] []

{-| TODO
-}
y_combinator                        : IconBody msg
y_combinator                        = i [ class "fa fa-ycombinator" ] []

{-| TODO
-}
y_combinator_square                 : IconBody msg
y_combinator_square                 = i [ class "fa fa-ycombinatorsquare" ] []

{-| TODO
-}
yahoo                               : IconBody msg
yahoo                               = i [ class "fa fa-yahoo" ] []

{-| TODO
-}
yc                                  : IconBody msg
yc                                  = i [ class "fa fa-yc" ] []

{-| TODO
-}
yc_square                           : IconBody msg
yc_square                           = i [ class "fa fa-ycsquare" ] []

{-| TODO
-}
yelp                                : IconBody msg
yelp                                = i [ class "fa fa-yelp" ] []

{-| TODO
-}
yoast                               : IconBody msg
yoast                               = i [ class "fa fa-yoast" ] []

{-| TODO
-}
youtube                             : IconBody msg
youtube                             = i [ class "fa fa-youtube" ] []

{-| TODO
-}
youtube_play                        : IconBody msg
youtube_play                        = i [ class "fa fa-youtubeplay" ] []

{-| TODO
-}
youtube_square                      : IconBody msg
youtube_square                      = i [ class "fa fa-youtubesquare" ] []
