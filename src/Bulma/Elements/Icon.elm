
module Bulma.Elements.Icon exposing (..)

-- TODO: update icons

-- DOCS ------------------------------------------------------------------------

{-| Icon elements! Includes aliases for all the icons in Font Awesome 4.7.0.

    import Bulma.CDN exposing (fontAwesome)
    import Bulma.Modifiers exposing (Size(Large))
    import Bulma.Elements.Icon exposing (icon,meh_o)

    view : Model -> Html msg
    view model
      = div []
        [ fontAwesome
        , icon Large [] [             meh_o  ]
        , icon Large [] [ i [] "fa fa-meh-o" ]
        ]

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

{-| -}
type alias Icon msg = Html msg

{-| -}
icon : Size -> List (Attribute msg) -> List (IconBody msg) -> Icon msg
icon size
  = node "span" []
    [ bulma.icon.container
    , case size of
        Small  -> bulma.icon.size.isSmall
        Standard -> ""
        Medium -> bulma.icon.size.isMedium
        Large  -> bulma.icon.size.isLarge
    ] 


-- ICONS -----------------------------------------------------------------------

{-| -}
type alias IconBody msg = Html msg

{-| -}
adjust                              : IconBody msg
adjust                              = i [ class "fa fa-adjust" ] []

{-| -}
american_sign_language_interpreting : IconBody msg
american_sign_language_interpreting = i [ class "fa fa-american-sign-language-interpreting" ] []

{-| -}
anchor                              : IconBody msg
anchor                              = i [ class "fa fa-anchor" ] []

{-| -}
archive                             : IconBody msg
archive                             = i [ class "fa fa-archive" ] []

{-| -}
area_chart                          : IconBody msg
area_chart                          = i [ class "fa fa-area-chart" ] []

{-| -}
arrows                              : IconBody msg
arrows                              = i [ class "fa fa-arrows" ] []

{-| -}
arrows_h                            : IconBody msg
arrows_h                            = i [ class "fa fa-arrows-h" ] []

{-| -}
arrows_v                            : IconBody msg
arrows_v                            = i [ class "fa fa-arrows-v" ] []

{-| -}
asl_interpreting                    : IconBody msg
asl_interpreting                    = i [ class "fa fa-asl-interpreting" ] []

{-| -}
assistive_listening_systems         : IconBody msg
assistive_listening_systems         = i [ class "fa fa-assistive-listening-systems" ] []

{-| -}
asterisk                            : IconBody msg
asterisk                            = i [ class "fa fa-asterisk" ] []

{-| -}
at                                  : IconBody msg
at                                  = i [ class "fa fa-at" ] []

{-| -}
audio_description                   : IconBody msg
audio_description                   = i [ class "fa fa-audio-description" ] []

{-| -}
automobile                          : IconBody msg
automobile                          = i [ class "fa fa-automobile" ] []

{-| -}
balance_scale                       : IconBody msg
balance_scale                       = i [ class "fa fa-balance-scale" ] []

{-| -}
ban                                 : IconBody msg
ban                                 = i [ class "fa fa-ban" ] []

{-| -}
bank                                : IconBody msg
bank                                = i [ class "fa fa-bank" ] []

{-| -}
bar_chart                           : IconBody msg
bar_chart                           = i [ class "fa fa-bar-chart" ] []

{-| -}
bar_chart_o                         : IconBody msg
bar_chart_o                         = i [ class "fa fa-bar-chart-o" ] []

{-| -}
barcode                             : IconBody msg
barcode                             = i [ class "fa fa-barcode" ] []

{-| -}
bars                                : IconBody msg
bars                                = i [ class "fa fa-bars" ] []

{-| -}
battery_0                           : IconBody msg
battery_0                           = i [ class "fa fa-battery-0" ] []

{-| -}
battery_1                           : IconBody msg
battery_1                           = i [ class "fa fa-battery-1" ] []

{-| -}
battery_2                           : IconBody msg
battery_2                           = i [ class "fa fa-battery-2" ] []

{-| -}
battery_3                           : IconBody msg
battery_3                           = i [ class "fa fa-battery-3" ] []

{-| -}
battery_4                           : IconBody msg
battery_4                           = i [ class "fa fa-battery-4" ] []

{-| -}
battery_empty                       : IconBody msg
battery_empty                       = i [ class "fa fa-battery-empty" ] []

{-| -}
battery_full                        : IconBody msg
battery_full                        = i [ class "fa fa-battery-full" ] []

{-| -}
battery_half                        : IconBody msg
battery_half                        = i [ class "fa fa-battery-half" ] []

{-| -}
battery_quarter                     : IconBody msg
battery_quarter                     = i [ class "fa fa-battery-quarter" ] []

{-| -}
battery_three_quarters              : IconBody msg
battery_three_quarters              = i [ class "fa fa-battery-three-quarters" ] []

{-| -}
bed                                 : IconBody msg
bed                                 = i [ class "fa fa-bed" ] []

{-| -}
beer                                : IconBody msg
beer                                = i [ class "fa fa-beer" ] []

{-| -}
bell                                : IconBody msg
bell                                = i [ class "fa fa-bell" ] []

{-| -}
bell_o                              : IconBody msg
bell_o                              = i [ class "fa fa-bell-o" ] []

{-| -}
bell_slash                          : IconBody msg
bell_slash                          = i [ class "fa fa-bell-slash" ] []

{-| -}
bell_slash_o                        : IconBody msg
bell_slash_o                        = i [ class "fa fa-bell-slash-o" ] []

{-| -}
bicycle                             : IconBody msg
bicycle                             = i [ class "fa fa-bicycle" ] []

{-| -}
binoculars                          : IconBody msg
binoculars                          = i [ class "fa fa-binoculars" ] []

{-| -}
birthday_cake                       : IconBody msg
birthday_cake                       = i [ class "fa fa-birthday-cake" ] []

{-| -}
blind                               : IconBody msg
blind                               = i [ class "fa fa-blind" ] []

{-| -}
bluetooth                           : IconBody msg
bluetooth                           = i [ class "fa fa-bluetooth" ] []

{-| -}
bluetooth_b                         : IconBody msg
bluetooth_b                         = i [ class "fa fa-bluetooth-b" ] []

{-| -}
bolt                                : IconBody msg
bolt                                = i [ class "fa fa-bolt" ] []

{-| -}
bomb                                : IconBody msg
bomb                                = i [ class "fa fa-bomb" ] []

{-| -}
book                                : IconBody msg
book                                = i [ class "fa fa-book" ] []

{-| -}
bookmark                            : IconBody msg
bookmark                            = i [ class "fa fa-bookmark" ] []

{-| -}
bookmark_o                          : IconBody msg
bookmark_o                          = i [ class "fa fa-bookmark-o" ] []

{-| -}
braille                             : IconBody msg
braille                             = i [ class "fa fa-braille" ] []

{-| -}
briefcase                           : IconBody msg
briefcase                           = i [ class "fa fa-briefcase" ] []

{-| -}
bug                                 : IconBody msg
bug                                 = i [ class "fa fa-bug" ] []

{-| -}
building                            : IconBody msg
building                            = i [ class "fa fa-building" ] []

{-| -}
building_o                          : IconBody msg
building_o                          = i [ class "fa fa-building-o" ] []

{-| -}
bullhorn                            : IconBody msg
bullhorn                            = i [ class "fa fa-bullhorn" ] []

{-| -}
bullseye                            : IconBody msg
bullseye                            = i [ class "fa fa-bullseye" ] []

{-| -}
bus                                 : IconBody msg
bus                                 = i [ class "fa fa-bus" ] []

{-| -}
cab                                 : IconBody msg
cab                                 = i [ class "fa fa-cab" ] []

{-| -}
calculator                          : IconBody msg
calculator                          = i [ class "fa fa-calculator" ] []

{-| -}
calendar                            : IconBody msg
calendar                            = i [ class "fa fa-calendar" ] []

{-| -}
calendar_check_o                    : IconBody msg
calendar_check_o                    = i [ class "fa fa-calendar-check-o" ] []

{-| -}
calendar_minus_o                    : IconBody msg
calendar_minus_o                    = i [ class "fa fa-calendar-minus-o" ] []

{-| -}
calendar_o                          : IconBody msg
calendar_o                          = i [ class "fa fa-calendar-o" ] []

{-| -}
calendar_plus_o                     : IconBody msg
calendar_plus_o                     = i [ class "fa fa-calendar-plus-o" ] []

{-| -}
calendar_times_o                    : IconBody msg
calendar_times_o                    = i [ class "fa fa-calendar-times-o" ] []

{-| -}
camera                              : IconBody msg
camera                              = i [ class "fa fa-camera" ] []

{-| -}
camera_retro                        : IconBody msg
camera_retro                        = i [ class "fa fa-camera-retro" ] []

{-| -}
car                                 : IconBody msg
car                                 = i [ class "fa fa-car" ] []

{-| -}
caret_square_o_down                 : IconBody msg
caret_square_o_down                 = i [ class "fa fa-caret-square-o-down" ] []

{-| -}
caret_square_o_left                 : IconBody msg
caret_square_o_left                 = i [ class "fa fa-caret-square-o-left" ] []

{-| -}
caret_square_o_right                : IconBody msg
caret_square_o_right                = i [ class "fa fa-caret-square-o-right" ] []

{-| -}
caret_square_o_up                   : IconBody msg
caret_square_o_up                   = i [ class "fa fa-caret-square-o-up" ] []

{-| -}
cart_arrow_down                     : IconBody msg
cart_arrow_down                     = i [ class "fa fa-caret-arrow-down" ] []

{-| -}
cart_plus                           : IconBody msg
cart_plus                           = i [ class "fa fa-cart-plus" ] []

{-| -}
cc                                  : IconBody msg
cc                                  = i [ class "fa fa-cc" ] []

{-| -}
certificate                         : IconBody msg
certificate                         = i [ class "fa fa-certificate" ] []

{-| -}
check                               : IconBody msg
check                               = i [ class "fa fa-check" ] []

{-| -}
check_circle                        : IconBody msg
check_circle                        = i [ class "fa fa-check-circle" ] []

{-| -}
check_circle_o                      : IconBody msg
check_circle_o                      = i [ class "fa fa-check-circle-o" ] []

{-| -}
check_square                        : IconBody msg
check_square                        = i [ class "fa fa-check-square" ] []

{-| -}
check_square_o                      : IconBody msg
check_square_o                      = i [ class "fa fa-check-square-o" ] []

{-| -}
child                               : IconBody msg
child                               = i [ class "fa fa-child" ] []

{-| -}
circle                              : IconBody msg
circle                              = i [ class "fa fa-circle" ] []

{-| -}
circle_o                            : IconBody msg
circle_o                            = i [ class "fa fa-circle-o" ] []

{-| -}
circle_o_notch                      : IconBody msg
circle_o_notch                      = i [ class "fa fa-circle-o-notch" ] []

{-| -}
circle_thin                         : IconBody msg
circle_thin                         = i [ class "fa fa-circle-thin" ] []

{-| -}
clock_o                             : IconBody msg
clock_o                             = i [ class "fa fa-clock-o" ] []

{-| -}
clone                               : IconBody msg
clone                               = i [ class "fa fa-clone" ] []

{-| -}
close                               : IconBody msg
close                               = i [ class "fa fa-close" ] []

{-| -}
cloud                               : IconBody msg
cloud                               = i [ class "fa fa-cloud" ] []

{-| -}
cloud_download                      : IconBody msg
cloud_download                      = i [ class "fa fa-cloud-download" ] []

{-| -}
cloud_upload                        : IconBody msg
cloud_upload                        = i [ class "fa fa-cloud-upload" ] []

{-| -}
code                                : IconBody msg
code                                = i [ class "fa fa-code" ] []

{-| -}
code_fork                           : IconBody msg
code_fork                           = i [ class "fa fa-code-fork" ] []

{-| -}
coffee                              : IconBody msg
coffee                              = i [ class "fa fa-coffee" ] []

{-| -}
cog                                 : IconBody msg
cog                                 = i [ class "fa fa-cog" ] []

{-| -}
cogs                                : IconBody msg
cogs                                = i [ class "fa fa-cogs" ] []

{-| -}
comment                             : IconBody msg
comment                             = i [ class "fa fa-comment" ] []

{-| -}
comment_o                           : IconBody msg
comment_o                           = i [ class "fa fa-comment-o" ] []

{-| -}
commenting                          : IconBody msg
commenting                          = i [ class "fa fa-commenting" ] []

{-| -}
commenting_o                        : IconBody msg
commenting_o                        = i [ class "fa fa-commenting-o" ] []

{-| -}
comments                            : IconBody msg
comments                            = i [ class "fa fa-comments" ] []

{-| -}
comments_o                          : IconBody msg
comments_o                          = i [ class "fa fa-comments-o" ] []

{-| -}
compass                             : IconBody msg
compass                             = i [ class "fa fa-compass" ] []

{-| -}
copyright                           : IconBody msg
copyright                           = i [ class "fa fa-copyright" ] []

{-| -}
creative_commons                    : IconBody msg
creative_commons                    = i [ class "fa fa-creative-commons" ] []

{-| -}
credit_card                         : IconBody msg
credit_card                         = i [ class "fa fa-credit-card" ] []

{-| -}
credit_card_alt                     : IconBody msg
credit_card_alt                     = i [ class "fa fa-credit-card-alt" ] []

{-| -}
crop                                : IconBody msg
crop                                = i [ class "fa fa-crop" ] []

{-| -}
crosshairs                          : IconBody msg
crosshairs                          = i [ class "fa fa-crosshairs" ] []

{-| -}
cube                                : IconBody msg
cube                                = i [ class "fa fa-cube" ] []

{-| -}
cubes                               : IconBody msg
cubes                               = i [ class "fa fa-cubes" ] []

{-| -}
cutlery                             : IconBody msg
cutlery                             = i [ class "fa fa-cutlery" ] []

{-| -}
dashboard                           : IconBody msg
dashboard                           = i [ class "fa fa-dashboard" ] []

{-| -}
database                            : IconBody msg
database                            = i [ class "fa fa-database" ] []

{-| -}
deaf                                : IconBody msg
deaf                                = i [ class "fa fa-deaf" ] []

{-| -}
deafness                            : IconBody msg
deafness                            = i [ class "fa fa-deafness" ] []

{-| -}
desktop                             : IconBody msg
desktop                             = i [ class "fa fa-desktop" ] []

{-| -}
diamond                             : IconBody msg
diamond                             = i [ class "fa fa-diamond" ] []

{-| -}
dot_circle_o                        : IconBody msg
dot_circle_o                        = i [ class "fa fa-dot-circle-o" ] []

{-| -}
download                            : IconBody msg
download                            = i [ class "fa fa-download" ] []

{-| -}
edit                                : IconBody msg
edit                                = i [ class "fa fa-edit" ] []

{-| -}
ellipsis_h                          : IconBody msg
ellipsis_h                          = i [ class "fa fa-ellipsis-h" ] []

{-| -}
ellipsis_v                          : IconBody msg
ellipsis_v                          = i [ class "fa fa-ellipsis-v" ] []

{-| -}
envelope                            : IconBody msg
envelope                            = i [ class "fa fa-envelope" ] []

{-| -}
envelope_o                          : IconBody msg
envelope_o                          = i [ class "fa fa-envelope-o" ] []

{-| -}
envelope_square                     : IconBody msg
envelope_square                     = i [ class "fa fa-envelope-square" ] []

{-| -}
eraser                              : IconBody msg
eraser                              = i [ class "fa fa-eraser" ] []

{-| -}
exchange                            : IconBody msg
exchange                            = i [ class "fa fa-exchange" ] []

{-| -}
exclamation                         : IconBody msg
exclamation                         = i [ class "fa fa-exclamation" ] []

{-| -}
exclamation_circle                  : IconBody msg
exclamation_circle                  = i [ class "fa fa-exclamation-circle" ] []

{-| -}
exclamation_triangle                : IconBody msg
exclamation_triangle                = i [ class "fa fa-exclamation-triangle" ] []

{-| -}
external_link                       : IconBody msg
external_link                       = i [ class "fa fa-external-link" ] []

{-| -}
external_link_square                : IconBody msg
external_link_square                = i [ class "fa fa-external-link-square" ] []

{-| -}
eye                                 : IconBody msg
eye                                 = i [ class "fa fa-eye" ] []

{-| -}
eye_slash                           : IconBody msg
eye_slash                           = i [ class "fa fa-eye-slash" ] []

{-| -}
eyedropper                          : IconBody msg
eyedropper                          = i [ class "fa fa-eyedropper" ] []

{-| -}
fax                                 : IconBody msg
fax                                 = i [ class "fa fa-fax" ] []

{-| -}
feed                                : IconBody msg
feed                                = i [ class "fa fa-feed" ] []

{-| -}
female                              : IconBody msg
female                              = i [ class "fa fa-female" ] []

{-| -}
fighter_jet                         : IconBody msg
fighter_jet                         = i [ class "fa fa-fighter-jet" ] []

{-| -}
file_archive_o                      : IconBody msg
file_archive_o                      = i [ class "fa fa-file-archive-o" ] []

{-| -}
file_audio_o                        : IconBody msg
file_audio_o                        = i [ class "fa fa-file-audio-o" ] []

{-| -}
file_code_o                         : IconBody msg
file_code_o                         = i [ class "fa fa-file-code-o" ] []

{-| -}
file_excel_o                        : IconBody msg
file_excel_o                        = i [ class "fa fa-file-excel-o" ] []

{-| -}
file_image_o                        : IconBody msg
file_image_o                        = i [ class "fa fa-file-image-o" ] []

{-| -}
file_movie_o                        : IconBody msg
file_movie_o                        = i [ class "fa fa-file-movie-o" ] []

{-| -}
file_pdf_o                          : IconBody msg
file_pdf_o                          = i [ class "fa fa-file-pdf-o" ] []

{-| -}
file_photo_o                        : IconBody msg
file_photo_o                        = i [ class "fa fa-file-photo-o" ] []

{-| -}
file_picture_o                      : IconBody msg
file_picture_o                      = i [ class "fa fa-file-picture-o" ] []

{-| -}
file_powerpoint_o                   : IconBody msg
file_powerpoint_o                   = i [ class "fa fa-file-powerpoint-o" ] []

{-| -}
file_sound_o                        : IconBody msg
file_sound_o                        = i [ class "fa fa-file-sound-o" ] []

{-| -}
file_video_o                        : IconBody msg
file_video_o                        = i [ class "fa fa-file-video-o" ] []

{-| -}
file_word_o                         : IconBody msg
file_word_o                         = i [ class "fa fa-file-word-o" ] []

{-| -}
file_zip_o                          : IconBody msg
file_zip_o                          = i [ class "fa fa-file-zip-o" ] []

{-| -}
film                                : IconBody msg
film                                = i [ class "fa fa-film" ] []

{-| -}
filter                              : IconBody msg
filter                              = i [ class "fa fa-filter" ] []

{-| -}
fire                                : IconBody msg
fire                                = i [ class "fa fa-fire" ] []

{-| -}
fire_extinguisher                   : IconBody msg
fire_extinguisher                   = i [ class "fa fa-fire-extinguisher" ] []

{-| -}
flag                                : IconBody msg
flag                                = i [ class "fa fa-flag" ] []

{-| -}
flag_checkered                      : IconBody msg
flag_checkered                      = i [ class "fa fa-flag-checkered" ] []

{-| -}
flag_o                              : IconBody msg
flag_o                              = i [ class "fa fa-flag-o" ] []

{-| -}
flash                               : IconBody msg
flash                               = i [ class "fa fa-flash" ] []

{-| -}
flask                               : IconBody msg
flask                               = i [ class "fa fa-flask" ] []

{-| -}
folder                              : IconBody msg
folder                              = i [ class "fa fa-folder" ] []

{-| -}
folder_o                            : IconBody msg
folder_o                            = i [ class "fa fa-folder-o" ] []

{-| -}
folder_open                         : IconBody msg
folder_open                         = i [ class "fa fa-folder-open" ] []

{-| -}
folder_open_o                       : IconBody msg
folder_open_o                       = i [ class "fa fa-folder-open-o" ] []

{-| -}
frown_o                             : IconBody msg
frown_o                             = i [ class "fa fa-frown-o" ] []

{-| -}
futbol_o                            : IconBody msg
futbol_o                            = i [ class "fa fa-futbol-o" ] []

{-| -}
gamepad                             : IconBody msg
gamepad                             = i [ class "fa fa-gamepad" ] []

{-| -}
gavel                               : IconBody msg
gavel                               = i [ class "fa fa-gavel" ] []

{-| -}
gear                                : IconBody msg
gear                                = i [ class "fa fa-gear" ] []

{-| -}
gears                               : IconBody msg
gears                               = i [ class "fa fa-gears" ] []

{-| -}
gift                                : IconBody msg
gift                                = i [ class "fa fa-gift" ] []

{-| -}
glass                               : IconBody msg
glass                               = i [ class "fa fa-glass" ] []

{-| -}
globe                               : IconBody msg
globe                               = i [ class "fa fa-globe" ] []

{-| -}
graduation_cap                      : IconBody msg
graduation_cap                      = i [ class "fa fa-graduation-cap" ] []

{-| -}
group                               : IconBody msg
group                               = i [ class "fa fa-group" ] []

{-| -}
hand_grab_o                         : IconBody msg
hand_grab_o                         = i [ class "fa fa-hand-grab-o" ] []

{-| -}
hand_lizard_o                       : IconBody msg
hand_lizard_o                       = i [ class "fa fa-hand-lizard-o" ] []

{-| -}
hand_paper_o                        : IconBody msg
hand_paper_o                        = i [ class "fa fa-hand-paper-o" ] []

{-| -}
hand_peace_o                        : IconBody msg
hand_peace_o                        = i [ class "fa fa-hand-peace-o" ] []

{-| -}
hand_pointer_o                      : IconBody msg
hand_pointer_o                      = i [ class "fa fa-hand-pointer-o" ] []

{-| -}
hand_rock_o                         : IconBody msg
hand_rock_o                         = i [ class "fa fa-hand-rock-o" ] []

{-| -}
hand_scissors_o                     : IconBody msg
hand_scissors_o                     = i [ class "fa fa-hand-scissors-o" ] []

{-| -}
hand_spock_o                        : IconBody msg
hand_spock_o                        = i [ class "fa fa-hand-spock-o" ] []

{-| -}
hand_stop_o                         : IconBody msg
hand_stop_o                         = i [ class "fa fa-hand-stop-o" ] []

{-| -}
hard_of_hearing                     : IconBody msg
hard_of_hearing                     = i [ class "fa fa-hard-of-hearing" ] []

{-| -}
hashtag                             : IconBody msg
hashtag                             = i [ class "fa fa-hashtag" ] []

{-| -}
hdd_o                               : IconBody msg
hdd_o                               = i [ class "fa fa-hdd-o" ] []

{-| -}
headphones                          : IconBody msg
headphones                          = i [ class "fa fa-headphones" ] []

{-| -}
heart                               : IconBody msg
heart                               = i [ class "fa fa-heart" ] []

{-| -}
heart_o                             : IconBody msg
heart_o                             = i [ class "fa fa-heart-o" ] []

{-| -}
heartbeat                           : IconBody msg
heartbeat                           = i [ class "fa fa-heartbeat" ] []

{-| -}
history                             : IconBody msg
history                             = i [ class "fa fa-history" ] []

{-| -}
home                                : IconBody msg
home                                = i [ class "fa fa-home" ] []

{-| -}
hotel                               : IconBody msg
hotel                               = i [ class "fa fa-hotel" ] []

{-| -}
hourglass                           : IconBody msg
hourglass                           = i [ class "fa fa-hourglass" ] []

{-| -}
hourglass_1                         : IconBody msg
hourglass_1                         = i [ class "fa fa-hourglass-1" ] []

{-| -}
hourglass_2                         : IconBody msg
hourglass_2                         = i [ class "fa fa-hourglass-2" ] []

{-| -}
hourglass_3                         : IconBody msg
hourglass_3                         = i [ class "fa fa-hourglass-3" ] []

{-| -}
hourglass_end                       : IconBody msg
hourglass_end                       = i [ class "fa fa-hourglass-end" ] []

{-| -}
hourglass_half                      : IconBody msg
hourglass_half                      = i [ class "fa fa-hourglass-half" ] []

{-| -}
hourglass_o                         : IconBody msg
hourglass_o                         = i [ class "fa fa-hourglass-o" ] []

{-| -}
hourglass_start                     : IconBody msg
hourglass_start                     = i [ class "fa fa-hourglass-start" ] []

{-| -}
i_cursor                            : IconBody msg
i_cursor                            = i [ class "fa fa-i-cursor" ] []

{-| -}
image                               : IconBody msg
image                               = i [ class "fa fa-image" ] []

{-| -}
inbox                               : IconBody msg
inbox                               = i [ class "fa fa-inbox" ] []

{-| -}
industry                            : IconBody msg
industry                            = i [ class "fa fa-industry" ] []

{-| -}
info                                : IconBody msg
info                                = i [ class "fa fa-info" ] []

{-| -}
info_circle                         : IconBody msg
info_circle                         = i [ class "fa fa-info-circle" ] []

{-| -}
institution                         : IconBody msg
institution                         = i [ class "fa fa-institution" ] []

{-| -}
key                                 : IconBody msg
key                                 = i [ class "fa fa-key" ] []

{-| -}
keyboard_o                          : IconBody msg
keyboard_o                          = i [ class "fa fa-keyboard-o" ] []

{-| -}
language                            : IconBody msg
language                            = i [ class "fa fa-language" ] []

{-| -}
laptop                              : IconBody msg
laptop                              = i [ class "fa fa-laptop" ] []

{-| -}
leaf                                : IconBody msg
leaf                                = i [ class "fa fa-leaf" ] []

{-| -}
legal                               : IconBody msg
legal                               = i [ class "fa fa-legal" ] []

{-| -}
lemon_o                             : IconBody msg
lemon_o                             = i [ class "fa fa-lemon-o" ] []

{-| -}
level_down                          : IconBody msg
level_down                          = i [ class "fa fa-level-down" ] []

{-| -}
level_up                            : IconBody msg
level_up                            = i [ class "fa fa-level-up" ] []

{-| -}
life_bouy                           : IconBody msg
life_bouy                           = i [ class "fa fa-life-bouy" ] []

{-| -}
life_buoy                           : IconBody msg
life_buoy                           = i [ class "fa fa-life-buoy" ] []

{-| -}
life_ring                           : IconBody msg
life_ring                           = i [ class "fa fa-life-ring" ] []

{-| -}
life_saver                          : IconBody msg
life_saver                          = i [ class "fa fa-life-saver" ] []

{-| -}
lightbulb_o                         : IconBody msg
lightbulb_o                         = i [ class "fa fa-lightbulb-o" ] []

{-| -}
line_chart                          : IconBody msg
line_chart                          = i [ class "fa fa-line-chart" ] []

{-| -}
location_arrow                      : IconBody msg
location_arrow                      = i [ class "fa fa-location-arrow" ] []

{-| -}
lock                                : IconBody msg
lock                                = i [ class "fa fa-lock" ] []

{-| -}
low_vision                          : IconBody msg
low_vision                          = i [ class "fa fa-low-vision" ] []

{-| -}
magic                               : IconBody msg
magic                               = i [ class "fa fa-magic" ] []

{-| -}
magnet                              : IconBody msg
magnet                              = i [ class "fa fa-magnet" ] []

{-| -}
mail_forward                        : IconBody msg
mail_forward                        = i [ class "fa fa-mail-forward" ] []

{-| -}
mail_reply                          : IconBody msg
mail_reply                          = i [ class "fa fa-mail-reply" ] []

{-| -}
mail_reply_all                      : IconBody msg
mail_reply_all                      = i [ class "fa fa-mail-reply-all" ] []

{-| -}
male                                : IconBody msg
male                                = i [ class "fa fa-male" ] []

{-| -}
map                                 : IconBody msg
map                                 = i [ class "fa fa-map" ] []

{-| -}
map_marker                          : IconBody msg
map_marker                          = i [ class "fa fa-map-marker" ] []

{-| -}
map_o                               : IconBody msg
map_o                               = i [ class "fa fa-map-o" ] []

{-| -}
map_pin                             : IconBody msg
map_pin                             = i [ class "fa fa-map-pin" ] []

{-| -}
map_signs                           : IconBody msg
map_signs                           = i [ class "fa fa-map-signs" ] []

{-| -}
meh_o                               : IconBody msg
meh_o                               = i [ class "fa fa-meh-o" ] []

{-| -}
microphone                          : IconBody msg
microphone                          = i [ class "fa fa-microphone" ] []

{-| -}
microphone_slash                    : IconBody msg
microphone_slash                    = i [ class "fa fa-microphone-slash" ] []

{-| -}
minus                               : IconBody msg
minus                               = i [ class "fa fa-minus" ] []

{-| -}
minus_circle                        : IconBody msg
minus_circle                        = i [ class "fa fa-minus-circle" ] []

{-| -}
minus_square                        : IconBody msg
minus_square                        = i [ class "fa fa-minus-square" ] []

{-| -}
minus_square_o                      : IconBody msg
minus_square_o                      = i [ class "fa fa-minus-square-o" ] []

{-| -}
mobile                              : IconBody msg
mobile                              = i [ class "fa fa-mobile" ] []

{-| -}
mobile_phone                        : IconBody msg
mobile_phone                        = i [ class "fa fa-mobile-phone" ] []

{-| -}
money                               : IconBody msg
money                               = i [ class "fa fa-money" ] []

{-| -}
moon_o                              : IconBody msg
moon_o                              = i [ class "fa fa-moon-o" ] []

{-| -}
mortar_board                        : IconBody msg
mortar_board                        = i [ class "fa fa-mortar-board" ] []

{-| -}
motorcycle                          : IconBody msg
motorcycle                          = i [ class "fa fa-motorcycle" ] []

{-| -}
mouse_pointer                       : IconBody msg
mouse_pointer                       = i [ class "fa fa-mouse-pointer" ] []

{-| -}
music                               : IconBody msg
music                               = i [ class "fa fa-music" ] []

{-| -}
navicon                             : IconBody msg
navicon                             = i [ class "fa fa-navicon" ] []

{-| -}
newspaper_o                         : IconBody msg
newspaper_o                         = i [ class "fa fa-newspaper-o" ] []

{-| -}
object_group                        : IconBody msg
object_group                        = i [ class "fa fa-object-group" ] []

{-| -}
object_ungroup                      : IconBody msg
object_ungroup                      = i [ class "fa fa-object-ungroup" ] []

{-| -}
paint_brush                         : IconBody msg
paint_brush                         = i [ class "fa fa-paint-brush" ] []

{-| -}
paper_plane                         : IconBody msg
paper_plane                         = i [ class "fa fa-paper-plane" ] []

{-| -}
paper_plane_o                       : IconBody msg
paper_plane_o                       = i [ class "fa fa-paper-plane-o" ] []

{-| -}
paw                                 : IconBody msg
paw                                 = i [ class "fa fa-paw" ] []

{-| -}
pencil                              : IconBody msg
pencil                              = i [ class "fa fa-pencil" ] []

{-| -}
pencil_square                       : IconBody msg
pencil_square                       = i [ class "fa fa-pencil-square" ] []

{-| -}
pencil_square_o                     : IconBody msg
pencil_square_o                     = i [ class "fa fa-pencil-square-o" ] []

{-| -}
percent                             : IconBody msg
percent                             = i [ class "fa fa-percent" ] []

{-| -}
phone                               : IconBody msg
phone                               = i [ class "fa fa-phone" ] []

{-| -}
phone_square                        : IconBody msg
phone_square                        = i [ class "fa fa-phone-square" ] []

{-| -}
photo                               : IconBody msg
photo                               = i [ class "fa fa-photo" ] []

{-| -}
picture_o                           : IconBody msg
picture_o                           = i [ class "fa fa-picture-o" ] []

{-| -}
pie_chart                           : IconBody msg
pie_chart                           = i [ class "fa fa-pie-chart" ] []

{-| -}
plane                               : IconBody msg
plane                               = i [ class "fa fa-plane" ] []

{-| -}
plug                                : IconBody msg
plug                                = i [ class "fa fa-plug" ] []

{-| -}
plus                                : IconBody msg
plus                                = i [ class "fa fa-plus" ] []

{-| -}
plus_circle                         : IconBody msg
plus_circle                         = i [ class "fa fa-plus-circle" ] []

{-| -}
plus_square                         : IconBody msg
plus_square                         = i [ class "fa fa-plus-square" ] []

{-| -}
plus_square_o                       : IconBody msg
plus_square_o                       = i [ class "fa fa-plus-square-o" ] []

{-| -}
power_off                           : IconBody msg
power_off                           = i [ class "fa fa-power-off" ] []

{-| -}
print                               : IconBody msg
print                               = i [ class "fa fa-print" ] []

{-| -}
puzzle_piece                        : IconBody msg
puzzle_piece                        = i [ class "fa fa-puzzle-piece" ] []

{-| -}
qrcode                              : IconBody msg
qrcode                              = i [ class "fa fa-qrcode" ] []

{-| -}
question                            : IconBody msg
question                            = i [ class "fa fa-question" ] []

{-| -}
question_circle                     : IconBody msg
question_circle                     = i [ class "fa fa-question-circle" ] []

{-| -}
question_circle_o                   : IconBody msg
question_circle_o                   = i [ class "fa fa-question-circle-o" ] []

{-| -}
quote_left                          : IconBody msg
quote_left                          = i [ class "fa fa-quote-left" ] []

{-| -}
quote_right                         : IconBody msg
quote_right                         = i [ class "fa fa-quote-right" ] []

{-| -}
random                              : IconBody msg
random                              = i [ class "fa fa-random" ] []

{-| -}
recycle                             : IconBody msg
recycle                             = i [ class "fa fa-recycle" ] []

{-| -}
refresh                             : IconBody msg
refresh                             = i [ class "fa fa-refresh" ] []

{-| -}
registered                          : IconBody msg
registered                          = i [ class "fa fa-registered" ] []

{-| -}
remove                              : IconBody msg
remove                              = i [ class "fa fa-remove" ] []

{-| -}
reorder                             : IconBody msg
reorder                             = i [ class "fa fa-reorder" ] []

{-| -}
reply                               : IconBody msg
reply                               = i [ class "fa fa-reply" ] []

{-| -}
reply_all                           : IconBody msg
reply_all                           = i [ class "fa fa-reply-all" ] []

{-| -}
retweet                             : IconBody msg
retweet                             = i [ class "fa fa-retweet" ] []

{-| -}
road                                : IconBody msg
road                                = i [ class "fa fa-road" ] []

{-| -}
rocket                              : IconBody msg
rocket                              = i [ class "fa fa-rocket" ] []

{-| -}
rss                                 : IconBody msg
rss                                 = i [ class "fa fa-rss" ] []

{-| -}
rss_square                          : IconBody msg
rss_square                          = i [ class "fa fa-rss-square" ] []

{-| -}
search                              : IconBody msg
search                              = i [ class "fa fa-search" ] []

{-| -}
search_minus                        : IconBody msg
search_minus                        = i [ class "fa fa-search-minus" ] []

{-| -}
search_plus                         : IconBody msg
search_plus                         = i [ class "fa fa-search-plus" ] []

{-| -}
send                                : IconBody msg
send                                = i [ class "fa fa-send" ] []

{-| -}
send_o                              : IconBody msg
send_o                              = i [ class "fa fa-send-o" ] []

{-| -}
server                              : IconBody msg
server                              = i [ class "fa fa-server" ] []

{-| -}
share                               : IconBody msg
share                               = i [ class "fa fa-share" ] []

{-| -}
share_alt                           : IconBody msg
share_alt                           = i [ class "fa fa-share-alt" ] []

{-| -}
share_alt_square                    : IconBody msg
share_alt_square                    = i [ class "fa fa-share-alt-square" ] []

{-| -}
share_square                        : IconBody msg
share_square                        = i [ class "fa fa-share-square" ] []

{-| -}
share_square_o                      : IconBody msg
share_square_o                      = i [ class "fa fa-share-square-o" ] []

{-| -}
shield                              : IconBody msg
shield                              = i [ class "fa fa-shield" ] []

{-| -}
ship                                : IconBody msg
ship                                = i [ class "fa fa-ship" ] []

{-| -}
shopping_bag                        : IconBody msg
shopping_bag                        = i [ class "fa fa-shopping-bag" ] []

{-| -}
shopping_basket                     : IconBody msg
shopping_basket                     = i [ class "fa fa-shopping-basket" ] []

{-| -}
shopping_cart                       : IconBody msg
shopping_cart                       = i [ class "fa fa-shopping-cart" ] []

{-| -}
sign_in                             : IconBody msg
sign_in                             = i [ class "fa fa-sign-in" ] []

{-| -}
sign_language                       : IconBody msg
sign_language                       = i [ class "fa fa-sign-language" ] []

{-| -}
sign_out                            : IconBody msg
sign_out                            = i [ class "fa fa-sign-out" ] []

{-| -}
signal                              : IconBody msg
signal                              = i [ class "fa fa-signal" ] []

{-| -}
signing                             : IconBody msg
signing                             = i [ class "fa fa-signing" ] []

{-| -}
sitemap                             : IconBody msg
sitemap                             = i [ class "fa fa-sitemap" ] []

{-| -}
sliders                             : IconBody msg
sliders                             = i [ class "fa fa-sliders" ] []

{-| -}
smile_o                             : IconBody msg
smile_o                             = i [ class "fa fa-smile-o" ] []

{-| -}
soccer_ball_o                       : IconBody msg
soccer_ball_o                       = i [ class "fa fa-soccer-ball-o" ] []

{-| -}
sort                                : IconBody msg
sort                                = i [ class "fa fa-sort" ] []

{-| -}
sort_alpha_asc                      : IconBody msg
sort_alpha_asc                      = i [ class "fa fa-sort-alpha-asc" ] []

{-| -}
sort_alpha_desc                     : IconBody msg
sort_alpha_desc                     = i [ class "fa fa-sort-alpha-desc" ] []

{-| -}
sort_amount_asc                     : IconBody msg
sort_amount_asc                     = i [ class "fa fa-sort-amount-asc" ] []

{-| -}
sort_amount_desc                    : IconBody msg
sort_amount_desc                    = i [ class "fa fa-sort-amount-desc" ] []

{-| -}
sort_asc                            : IconBody msg
sort_asc                            = i [ class "fa fa-sort-asc" ] []

{-| -}
sort_desc                           : IconBody msg
sort_desc                           = i [ class "fa fa-sort-desc" ] []

{-| -}
sort_down                           : IconBody msg
sort_down                           = i [ class "fa fa-sort-down" ] []

{-| -}
sort_numeric_asc                    : IconBody msg
sort_numeric_asc                    = i [ class "fa fa-sort-numeric-asc" ] []

{-| -}
sort_numeric_desc                   : IconBody msg
sort_numeric_desc                   = i [ class "fa fa-sort-numeric-desc" ] []

{-| -}
sort_up                             : IconBody msg
sort_up                             = i [ class "fa fa-sort-up" ] []

{-| -}
space_shuttle                       : IconBody msg
space_shuttle                       = i [ class "fa fa-space-shuttle" ] []

{-| -}
spinner                             : IconBody msg
spinner                             = i [ class "fa fa-spinner" ] []

{-| -}
spoon                               : IconBody msg
spoon                               = i [ class "fa fa-spoon" ] []

{-| -}
square                              : IconBody msg
square                              = i [ class "fa fa-square" ] []

{-| -}
square_o                            : IconBody msg
square_o                            = i [ class "fa fa-square-o" ] []

{-| -}
star                                : IconBody msg
star                                = i [ class "fa fa-star" ] []

{-| -}
star_half                           : IconBody msg
star_half                           = i [ class "fa fa-star-half" ] []

{-| -}
star_half_empty                     : IconBody msg
star_half_empty                     = i [ class "fa fa-star-half-empty" ] []

{-| -}
star_half_full                      : IconBody msg
star_half_full                      = i [ class "fa fa-star-half-full" ] []

{-| -}
star_half_o                         : IconBody msg
star_half_o                         = i [ class "fa fa-star-half-o" ] []

{-| -}
star_o                              : IconBody msg
star_o                              = i [ class "fa fa-star-o" ] []

{-| -}
sticky_note                         : IconBody msg
sticky_note                         = i [ class "fa fa-sticky-note" ] []

{-| -}
sticky_note_o                       : IconBody msg
sticky_note_o                       = i [ class "fa fa-sticky-note-o" ] []

{-| -}
street_view                         : IconBody msg
street_view                         = i [ class "fa fa-street-view" ] []

{-| -}
suitcase                            : IconBody msg
suitcase                            = i [ class "fa fa-suitcase" ] []

{-| -}
sun_o                               : IconBody msg
sun_o                               = i [ class "fa fa-sun-o" ] []

{-| -}
support                             : IconBody msg
support                             = i [ class "fa fa-support" ] []

{-| -}
tablet                              : IconBody msg
tablet                              = i [ class "fa fa-tablet" ] []

{-| -}
tachometer                          : IconBody msg
tachometer                          = i [ class "fa fa-tachometer" ] []

{-| -}
tag                                 : IconBody msg
tag                                 = i [ class "fa fa-tag" ] []

{-| -}
tags                                : IconBody msg
tags                                = i [ class "fa fa-tags" ] []

{-| -}
tasks                               : IconBody msg
tasks                               = i [ class "fa fa-tasks" ] []

{-| -}
taxi                                : IconBody msg
taxi                                = i [ class "fa fa-taxi" ] []

{-| -}
television                          : IconBody msg
television                          = i [ class "fa fa-television" ] []

{-| -}
terminal                            : IconBody msg
terminal                            = i [ class "fa fa-terminal" ] []

{-| -}
thumb_tack                          : IconBody msg
thumb_tack                          = i [ class "fa fa-thumb-tack" ] []

{-| -}
thumbs_down                         : IconBody msg
thumbs_down                         = i [ class "fa fa-thumbs-down" ] []

{-| -}
thumbs_o_down                       : IconBody msg
thumbs_o_down                       = i [ class "fa fa-thumbs-o-down" ] []

{-| -}
thumbs_o_up                         : IconBody msg
thumbs_o_up                         = i [ class "fa fa-thumbs-o-up" ] []

{-| -}
thumbs_up                           : IconBody msg
thumbs_up                           = i [ class "fa fa-thumbs-up" ] []

{-| -}
ticket                              : IconBody msg
ticket                              = i [ class "fa fa-ticket" ] []

{-| -}
times                               : IconBody msg
times                               = i [ class "fa fa-times" ] []

{-| -}
times_circle                        : IconBody msg
times_circle                        = i [ class "fa fa-times-circle" ] []

{-| -}
times_circle_o                      : IconBody msg
times_circle_o                      = i [ class "fa fa-times-circle-o" ] []

{-| -}
tint                                : IconBody msg
tint                                = i [ class "fa fa-tint" ] []

{-| -}
toggle_down                         : IconBody msg
toggle_down                         = i [ class "fa fa-toggle-down" ] []

{-| -}
toggle_left                         : IconBody msg
toggle_left                         = i [ class "fa fa-toggle-left" ] []

{-| -}
toggle_off                          : IconBody msg
toggle_off                          = i [ class "fa fa-toggle-off" ] []

{-| -}
toggle_on                           : IconBody msg
toggle_on                           = i [ class "fa fa-toggle-on" ] []

{-| -}
toggle_right                        : IconBody msg
toggle_right                        = i [ class "fa fa-toggle-right" ] []

{-| -}
toggle_up                           : IconBody msg
toggle_up                           = i [ class "fa fa-toggle-up" ] []

{-| -}
trademark                           : IconBody msg
trademark                           = i [ class "fa fa-trademark" ] []

{-| -}
trash                               : IconBody msg
trash                               = i [ class "fa fa-trash" ] []

{-| -}
trash_o                             : IconBody msg
trash_o                             = i [ class "fa fa-trash-o" ] []

{-| -}
tree                                : IconBody msg
tree                                = i [ class "fa fa-tree" ] []

{-| -}
trophy                              : IconBody msg
trophy                              = i [ class "fa fa-trophy" ] []

{-| -}
truck                               : IconBody msg
truck                               = i [ class "fa fa-truck" ] []

{-| -}
tty                                 : IconBody msg
tty                                 = i [ class "fa fa-tty" ] []

{-| -}
tv                                  : IconBody msg
tv                                  = i [ class "fa fa-tv" ] []

{-| -}
umbrella                            : IconBody msg
umbrella                            = i [ class "fa fa-umbrella" ] []

{-| -}
universal_access                    : IconBody msg
universal_access                    = i [ class "fa fa-universal-access" ] []

{-| -}
university                          : IconBody msg
university                          = i [ class "fa fa-university" ] []

{-| -}
unlock                              : IconBody msg
unlock                              = i [ class "fa fa-unlock" ] []

{-| -}
unlock_alt                          : IconBody msg
unlock_alt                          = i [ class "fa fa-unlock-alt" ] []

{-| -}
unsorted                            : IconBody msg
unsorted                            = i [ class "fa fa-unsorted" ] []

{-| -}
upload                              : IconBody msg
upload                              = i [ class "fa fa-upload" ] []

{-| -}
user                                : IconBody msg
user                                = i [ class "fa fa-user" ] []

{-| -}
user_plus                           : IconBody msg
user_plus                           = i [ class "fa fa-user-plus" ] []

{-| -}
user_secret                         : IconBody msg
user_secret                         = i [ class "fa fa-user-secret" ] []

{-| -}
user_times                          : IconBody msg
user_times                          = i [ class "fa fa-user-times" ] []

{-| -}
users                               : IconBody msg
users                               = i [ class "fa fa-users" ] []

{-| -}
video_camera                        : IconBody msg
video_camera                        = i [ class "fa fa-video-camera" ] []

{-| -}
volume_control_phone                : IconBody msg
volume_control_phone                = i [ class "fa fa-volume-control-phone" ] []

{-| -}
volume_down                         : IconBody msg
volume_down                         = i [ class "fa fa-volume-down" ] []

{-| -}
volume_off                          : IconBody msg
volume_off                          = i [ class "fa fa-volume-off" ] []

{-| -}
volume_up                           : IconBody msg
volume_up                           = i [ class "fa fa-volume-up" ] []

{-| -}
warning                             : IconBody msg
warning                             = i [ class "fa fa-warning" ] []

{-| -}
wheelchair                          : IconBody msg
wheelchair                          = i [ class "fa fa-wheelchair" ] []

{-| -}
wheelchair_alt                      : IconBody msg
wheelchair_alt                      = i [ class "fa fa-wheelchair-alt" ] []

{-| -}
wifi                                : IconBody msg
wifi                                = i [ class "fa fa-wifi" ] []

{-| -}
wrench                              : IconBody msg
wrench                              = i [ class "fa fa-wrench" ] []

{-| -}
fiveHundredPX                       : IconBody msg
fiveHundredPX                       = i [ class "fa fa-fiveHundredPX" ] []

{-| -}
adn                                 : IconBody msg
adn                                 = i [ class "fa fa-adn" ] []

{-| -}
amazon                              : IconBody msg
amazon                              = i [ class "fa fa-amazon" ] []

{-| -}
android                             : IconBody msg
android                             = i [ class "fa fa-android" ] []

{-| -}
angellist                           : IconBody msg
angellist                           = i [ class "fa fa-angellist" ] []

{-| -}
apple                               : IconBody msg
apple                               = i [ class "fa fa-apple" ] []

{-| -}
behance                             : IconBody msg
behance                             = i [ class "fa fa-behance" ] []

{-| -}
behance_square                      : IconBody msg
behance_square                      = i [ class "fa fa-behance-square" ] []

{-| -}
bitbucket                           : IconBody msg
bitbucket                           = i [ class "fa fa-bitbucket" ] []

{-| -}
bitbucket_square                    : IconBody msg
bitbucket_square                    = i [ class "fa fa-bitbucket-square" ] []

{-| -}
bitcoin                             : IconBody msg
bitcoin                             = i [ class "fa fa-bitcoin" ] []

{-| -}
black_tie                           : IconBody msg
black_tie                           = i [ class "fa fa-black-tie" ] []

{-| -}
btc                                 : IconBody msg
btc                                 = i [ class "fa fa-btc" ] []

{-| -}
buysellads                          : IconBody msg
buysellads                          = i [ class "fa fa-buysellads" ] []

{-| -}
cc_amex                             : IconBody msg
cc_amex                             = i [ class "fa fa-cc-amex" ] []

{-| -}
cc_diners_club                      : IconBody msg
cc_diners_club                      = i [ class "fa fa-cc-diners-club" ] []

{-| -}
cc_discover                         : IconBody msg
cc_discover                         = i [ class "fa fa-cc-discover" ] []

{-| -}
cc_jcb                              : IconBody msg
cc_jcb                              = i [ class "fa fa-cc-jcb" ] []

{-| -}
cc_mastercard                       : IconBody msg
cc_mastercard                       = i [ class "fa fa-cc-mastercard" ] []

{-| -}
cc_paypal                           : IconBody msg
cc_paypal                           = i [ class "fa fa-cc-paypal" ] []

{-| -}
cc_stripe                           : IconBody msg
cc_stripe                           = i [ class "fa fa-cc-stripe" ] []

{-| -}
cc_visa                             : IconBody msg
cc_visa                             = i [ class "fa fa-cc-visa" ] []

{-| -}
chrome                              : IconBody msg
chrome                              = i [ class "fa fa-chrome" ] []

{-| -}
codepen                             : IconBody msg
codepen                             = i [ class "fa fa-codepen" ] []

{-| -}
codiepie                            : IconBody msg
codiepie                            = i [ class "fa fa-codiepie" ] []

{-| -}
connectdevelop                      : IconBody msg
connectdevelop                      = i [ class "fa fa-connectdevelop" ] []

{-| -}
contao                              : IconBody msg
contao                              = i [ class "fa fa-contao" ] []

{-| -}
css3                                : IconBody msg
css3                                = i [ class "fa fa-css" ] []

{-| -}
dashcube                            : IconBody msg
dashcube                            = i [ class "fa fa-dashcube" ] []

{-| -}
delicious                           : IconBody msg
delicious                           = i [ class "fa fa-delicious" ] []

{-| -}
deviantart                          : IconBody msg
deviantart                          = i [ class "fa fa-deviantart" ] []

{-| -}
digg                                : IconBody msg
digg                                = i [ class "fa fa-digg" ] []

{-| -}
dribbble                            : IconBody msg
dribbble                            = i [ class "fa fa-dribbble" ] []

{-| -}
dropbox                             : IconBody msg
dropbox                             = i [ class "fa fa-dropbox" ] []

{-| -}
drupal                              : IconBody msg
drupal                              = i [ class "fa fa-drupal" ] []

{-| -}
edge                                : IconBody msg
edge                                = i [ class "fa fa-edge" ] []

{-| -}
empire                              : IconBody msg
empire                              = i [ class "fa fa-empire" ] []

{-| -}
envira                              : IconBody msg
envira                              = i [ class "fa fa-envira" ] []

{-| -}
expeditedssl                        : IconBody msg
expeditedssl                        = i [ class "fa fa-expeditedssl" ] []

{-| -}
fa                                  : IconBody msg
fa                                  = i [ class "fa fa-fa" ] []

{-| -}
facebook                            : IconBody msg
facebook                            = i [ class "fa fa-facebook" ] []

{-| -}
facebook_f                          : IconBody msg
facebook_f                          = i [ class "fa fa-facebook-f" ] []

{-| -}
facebook_official                   : IconBody msg
facebook_official                   = i [ class "fa fa-facebook-official" ] []

{-| -}
facebook_square                     : IconBody msg
facebook_square                     = i [ class "fa fa-facebook-square" ] []

{-| -}
firefox                             : IconBody msg
firefox                             = i [ class "fa fa-firefox" ] []

{-| -}
first_order                         : IconBody msg
first_order                         = i [ class "fa fa-first-order" ] []

{-| -}
flickr                              : IconBody msg
flickr                              = i [ class "fa fa-flickr" ] []

{-| -}
font_awesome                        : IconBody msg
font_awesome                        = i [ class "fa fa-font-awesome" ] []

{-| -}
fonticons                           : IconBody msg
fonticons                           = i [ class "fa fa-fonticons" ] []

{-| -}
fort_awesome                        : IconBody msg
fort_awesome                        = i [ class "fa fa-fort-awesome" ] []

{-| -}
forumbee                            : IconBody msg
forumbee                            = i [ class "fa fa-forumbee" ] []

{-| -}
foursquare                          : IconBody msg
foursquare                          = i [ class "fa fa-foursquare" ] []

{-| -}
ge                                  : IconBody msg
ge                                  = i [ class "fa fa-ge" ] []

{-| -}
get_pocket                          : IconBody msg
get_pocket                          = i [ class "fa fa-get-pocket" ] []

{-| -}
gg                                  : IconBody msg
gg                                  = i [ class "fa fa-gg" ] []

{-| -}
gg_circle                           : IconBody msg
gg_circle                           = i [ class "fa fa-gg-circle" ] []

{-| -}
git                                 : IconBody msg
git                                 = i [ class "fa fa-git" ] []

{-| -}
git_square                          : IconBody msg
git_square                          = i [ class "fa fa-git-square" ] []

{-| -}
github                              : IconBody msg
github                              = i [ class "fa fa-github" ] []

{-| -}
github_alt                          : IconBody msg
github_alt                          = i [ class "fa fa-github-alt" ] []

{-| -}
github_square                       : IconBody msg
github_square                       = i [ class "fa fa-github-square" ] []

{-| -}
gitlab                              : IconBody msg
gitlab                              = i [ class "fa fa-gitlab" ] []

{-| -}
gittip                              : IconBody msg
gittip                              = i [ class "fa fa-gittip" ] []

{-| -}
glide                               : IconBody msg
glide                               = i [ class "fa fa-glide" ] []

{-| -}
glide_g                             : IconBody msg
glide_g                             = i [ class "fa fa-glide-g" ] []

{-| -}
google                              : IconBody msg
google                              = i [ class "fa fa-google" ] []

{-| -}
google_plus                         : IconBody msg
google_plus                         = i [ class "fa fa-google-plus" ] []

{-| -}
google_plus_circle                  : IconBody msg
google_plus_circle                  = i [ class "fa fa-google-plus-circle" ] []

{-| -}
google_plus_official                : IconBody msg
google_plus_official                = i [ class "fa fa-google-plus-official" ] []

{-| -}
google_plus_square                  : IconBody msg
google_plus_square                  = i [ class "fa fa-google-plus-square" ] []

{-| -}
google_wallet                       : IconBody msg
google_wallet                       = i [ class "fa fa-google-wallet" ] []

{-| -}
gratipay                            : IconBody msg
gratipay                            = i [ class "fa fa-gratipay" ] []

{-| -}
hacker_news                         : IconBody msg
hacker_news                         = i [ class "fa fa-hacker-news" ] []

{-| -}
houzz                               : IconBody msg
houzz                               = i [ class "fa fa-houzz" ] []

{-| -}
html5                               : IconBody msg
html5                               = i [ class "fa fa-html" ] []

{-| -}
instagram                           : IconBody msg
instagram                           = i [ class "fa fa-instagram" ] []

{-| -}
internet_explorer                   : IconBody msg
internet_explorer                   = i [ class "fa fa-internet-explorer" ] []

{-| -}
ioxhost                             : IconBody msg
ioxhost                             = i [ class "fa fa-ioxhost" ] []

{-| -}
joomla                              : IconBody msg
joomla                              = i [ class "fa fa-joomla" ] []

{-| -}
jsfiddle                            : IconBody msg
jsfiddle                            = i [ class "fa fa-jsfiddle" ] []

{-| -}
lastfm                              : IconBody msg
lastfm                              = i [ class "fa fa-lastfm" ] []

{-| -}
lastfm_square                       : IconBody msg
lastfm_square                       = i [ class "fa fa-lastfm-square" ] []

{-| -}
leanpub                             : IconBody msg
leanpub                             = i [ class "fa fa-leanpub" ] []

{-| -}
linkedin                            : IconBody msg
linkedin                            = i [ class "fa fa-linkedin" ] []

{-| -}
linkedin_square                     : IconBody msg
linkedin_square                     = i [ class "fa fa-linkedin-square" ] []

{-| -}
linux                               : IconBody msg
linux                               = i [ class "fa fa-linux" ] []

{-| -}
maxcdn                              : IconBody msg
maxcdn                              = i [ class "fa fa-maxcdn" ] []

{-| -}
meanpath                            : IconBody msg
meanpath                            = i [ class "fa fa-meanpath" ] []

{-| -}
medium_                             : IconBody msg
medium_                             = i [ class "fa fa-medium" ] []

{-| -}
mixcloud                            : IconBody msg
mixcloud                            = i [ class "fa fa-mixcloud" ] []

{-| -}
modx                                : IconBody msg
modx                                = i [ class "fa fa-modx" ] []

{-| -}
odnoklassniki                       : IconBody msg
odnoklassniki                       = i [ class "fa fa-odnoklassniki" ] []

{-| -}
odnoklassniki_square                : IconBody msg
odnoklassniki_square                = i [ class "fa fa-odnoklassniki-square" ] []

{-| -}
opencart                            : IconBody msg
opencart                            = i [ class "fa fa-opencart" ] []

{-| -}
openid                              : IconBody msg
openid                              = i [ class "fa fa-openid" ] []

{-| -}
opera                               : IconBody msg
opera                               = i [ class "fa fa-opera" ] []

{-| -}
optin_monster                       : IconBody msg
optin_monster                       = i [ class "fa fa-optin-monster" ] []

{-| -}
pagelines                           : IconBody msg
pagelines                           = i [ class "fa fa-pagelines" ] []

{-| -}
paypal                              : IconBody msg
paypal                              = i [ class "fa fa-paypal" ] []

{-| -}
pied_piper                          : IconBody msg
pied_piper                          = i [ class "fa fa-pied-piper" ] []

{-| -}
pied_piper_alt                      : IconBody msg
pied_piper_alt                      = i [ class "fa fa-pied-piper-alt" ] []

{-| -}
pied_piper_pp                       : IconBody msg
pied_piper_pp                       = i [ class "fa fa-pied-piper-pp" ] []

{-| -}
pinterest                           : IconBody msg
pinterest                           = i [ class "fa fa-pinterest" ] []

{-| -}
pinterest_p                         : IconBody msg
pinterest_p                         = i [ class "fa fa-pinterest-p" ] []

{-| -}
pinterest_square                    : IconBody msg
pinterest_square                    = i [ class "fa fa-pinterest-square" ] []

{-| -}
product_hunt                        : IconBody msg
product_hunt                        = i [ class "fa fa-product-hunt" ] []

{-| -}
qq                                  : IconBody msg
qq                                  = i [ class "fa fa-qq" ] []

{-| -}
ra                                  : IconBody msg
ra                                  = i [ class "fa fa-ra" ] []

{-| -}
rebel                               : IconBody msg
rebel                               = i [ class "fa fa-rebel" ] []

{-| -}
reddit                              : IconBody msg
reddit                              = i [ class "fa fa-reddit" ] []

{-| -}
reddit_alien                        : IconBody msg
reddit_alien                        = i [ class "fa fa-reddit-alien" ] []

{-| -}
reddit_square                       : IconBody msg
reddit_square                       = i [ class "fa fa-reddit-square" ] []

{-| -}
renren                              : IconBody msg
renren                              = i [ class "fa fa-renren" ] []

{-| -}
resistance                          : IconBody msg
resistance                          = i [ class "fa fa-resistance" ] []

{-| -}
safari                              : IconBody msg
safari                              = i [ class "fa fa-safari" ] []

{-| -}
scribd                              : IconBody msg
scribd                              = i [ class "fa fa-scribd" ] []

{-| -}
sellsy                              : IconBody msg
sellsy                              = i [ class "fa fa-sellsy" ] []

{-| -}
shirtsinbulk                        : IconBody msg
shirtsinbulk                        = i [ class "fa fa-shirtsinbulk" ] []

{-| -}
simplybuilt                         : IconBody msg
simplybuilt                         = i [ class "fa fa-simplybuilt" ] []

{-| -}
skyatlas                            : IconBody msg
skyatlas                            = i [ class "fa fa-skyatlas" ] []

{-| -}
skype                               : IconBody msg
skype                               = i [ class "fa fa-skype" ] []

{-| -}
slack                               : IconBody msg
slack                               = i [ class "fa fa-slack" ] []

{-| -}
slideshare                          : IconBody msg
slideshare                          = i [ class "fa fa-slideshare" ] []

{-| -}
snapchat                            : IconBody msg
snapchat                            = i [ class "fa fa-snapchat" ] []

{-| -}
snapchat_ghost                      : IconBody msg
snapchat_ghost                      = i [ class "fa fa-snapchat-ghost" ] []

{-| -}
snapchat_square                     : IconBody msg
snapchat_square                     = i [ class "fa fa-snapchat-square" ] []

{-| -}
soundcloud                          : IconBody msg
soundcloud                          = i [ class "fa fa-soundcloud" ] []

{-| -}
spotify                             : IconBody msg
spotify                             = i [ class "fa fa-spotify" ] []

{-| -}
stack_exchange                      : IconBody msg
stack_exchange                      = i [ class "fa fa-stack-exchange" ] []

{-| -}
stack_overflow                      : IconBody msg
stack_overflow                      = i [ class "fa fa-stack-overflow" ] []

{-| -}
steam                               : IconBody msg
steam                               = i [ class "fa fa-steam" ] []

{-| -}
steam_square                        : IconBody msg
steam_square                        = i [ class "fa fa-steam-square" ] []

{-| -}
stumbleupon                         : IconBody msg
stumbleupon                         = i [ class "fa fa-stumbleupon" ] []

{-| -}
stumbleupon_circle                  : IconBody msg
stumbleupon_circle                  = i [ class "fa fa-stumbleupon-circle" ] []

{-| -}
tencent_weibo                       : IconBody msg
tencent_weibo                       = i [ class "fa fa-tencent-weibo" ] []

{-| -}
themeisle                           : IconBody msg
themeisle                           = i [ class "fa fa-themeisle" ] []

{-| -}
trello                              : IconBody msg
trello                              = i [ class "fa fa-trello" ] []

{-| -}
tripadvisor                         : IconBody msg
tripadvisor                         = i [ class "fa fa-tripadvisor" ] []

{-| -}
tumblr                              : IconBody msg
tumblr                              = i [ class "fa fa-tumblr" ] []

{-| -}
tumblr_square                       : IconBody msg
tumblr_square                       = i [ class "fa fa-tumblr-square" ] []

{-| -}
twitch                              : IconBody msg
twitch                              = i [ class "fa fa-twitch" ] []

{-| -}
twitter                             : IconBody msg
twitter                             = i [ class "fa fa-twitter" ] []

{-| -}
twitter_square                      : IconBody msg
twitter_square                      = i [ class "fa fa-twitter-square" ] []

{-| -}
usb                                 : IconBody msg
usb                                 = i [ class "fa fa-usb" ] []

{-| -}
viacoin                             : IconBody msg
viacoin                             = i [ class "fa fa-viacoin" ] []

{-| -}
viadeo                              : IconBody msg
viadeo                              = i [ class "fa fa-viadeo" ] []

{-| -}
viadeo_square                       : IconBody msg
viadeo_square                       = i [ class "fa fa-viadeo-square" ] []

{-| -}
vimeo                               : IconBody msg
vimeo                               = i [ class "fa fa-vimeo" ] []

{-| -}
vimeo_square                        : IconBody msg
vimeo_square                        = i [ class "fa fa-vimeo-square" ] []

{-| -}
vine                                : IconBody msg
vine                                = i [ class "fa fa-vine" ] []

{-| -}
vk                                  : IconBody msg
vk                                  = i [ class "fa fa-vk" ] []

{-| -}
wechat                              : IconBody msg
wechat                              = i [ class "fa fa-wechat" ] []

{-| -}
weibo                               : IconBody msg
weibo                               = i [ class "fa fa-weibo" ] []

{-| -}
weixin                              : IconBody msg
weixin                              = i [ class "fa fa-weixin" ] []

{-| -}
whatsapp                            : IconBody msg
whatsapp                            = i [ class "fa fa-whatsapp" ] []

{-| -}
wikipedia_w                         : IconBody msg
wikipedia_w                         = i [ class "fa fa-wikipedia-w" ] []

{-| -}
windows                             : IconBody msg
windows                             = i [ class "fa fa-windows" ] []

{-| -}
wordpress                           : IconBody msg
wordpress                           = i [ class "fa fa-wordpress" ] []

{-| -}
wpbeginner                          : IconBody msg
wpbeginner                          = i [ class "fa fa-wpbeginner" ] []

{-| -}
wpforms                             : IconBody msg
wpforms                             = i [ class "fa fa-wpforms" ] []

{-| -}
xing                                : IconBody msg
xing                                = i [ class "fa fa-xing" ] []

{-| -}
xing_square                         : IconBody msg
xing_square                         = i [ class "fa fa-xing-square" ] []

{-| -}
y_combinator                        : IconBody msg
y_combinator                        = i [ class "fa fa-y-combinator" ] []

{-| -}
y_combinator_square                 : IconBody msg
y_combinator_square                 = i [ class "fa fa-y-combinator-square" ] []

{-| -}
yahoo                               : IconBody msg
yahoo                               = i [ class "fa fa-yahoo" ] []

{-| -}
yc                                  : IconBody msg
yc                                  = i [ class "fa fa-yc" ] []

{-| -}
yc_square                           : IconBody msg
yc_square                           = i [ class "fa fa-yc-square" ] []

{-| -}
yelp                                : IconBody msg
yelp                                = i [ class "fa fa-yelp" ] []

{-| -}
yoast                               : IconBody msg
yoast                               = i [ class "fa fa-yoast" ] []

{-| -}
youtube                             : IconBody msg
youtube                             = i [ class "fa fa-youtube" ] []

{-| -}
youtube_play                        : IconBody msg
youtube_play                        = i [ class "fa fa-youtube-play" ] []

{-| -}
youtube_square                      : IconBody msg
youtube_square                      = i [ class "fa fa-youtube-square" ] []
