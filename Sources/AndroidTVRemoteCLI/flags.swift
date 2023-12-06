import Foundation
import Security
import Crypto
import X509
import SwiftASN1

enum RemoteKeyCode: Int {
    case UNKNOWN = 0
    case SOFTLEFT = 1
    case SOFTRIGHT = 2
    case HOME = 3
    case BACK = 4
    case CALL = 5
    case ENDCALL = 6
    case KEYCODE0 = 7
    case KEYCODE1 = 8
    case KEYCODE2 = 9
    case KEYCODE3 = 10
    case KEYCODE4 = 11
    case KEYCODE5 = 12
    case KEYCODE6 = 13
    case KEYCODE7 = 14
    case KEYCODE8 = 15
    case KEYCODE9 = 16
    case STAR = 17
    case POUND = 18
    case DPADUP = 19
    case DPADDOWN = 20
    case DPADLEFT = 21
    case DPADRIGHT = 22
    case DPADCENTER = 23
    case VOLUMEUP = 24
    case VOLUMEDOWN = 25
    case POWER = 26
    case CAMERA = 27
    case CLEAR = 28
    case KEYCODEA = 29
    case KEYCODEB = 30
    case KEYCODEC = 31
    case KEYCODED = 32
    case KEYCODEE = 33
    case KEYCODEF = 34
    case KEYCODEG = 35
    case KEYCODEH = 36
    case KEYCODEI = 37
    case KEYCODEJ = 38
    case KEYCODEK = 39
    case KEYCODEL = 40
    case KEYCODEM = 41
    case KEYCODEN = 42
    case KEYCODEO = 43
    case KEYCODEP = 44
    case KEYCODEQ = 45
    case KEYCODER = 46
    case KEYCODES = 47
    case KEYCODET = 48
    case KEYCODEU = 49
    case KEYCODEV = 50
    case KEYCODEW = 51
    case KEYCODEX = 52
    case KEYCODEY = 53
    case KEYCODEZ = 54
    case COMMA = 55
    case PERIOD = 56
    case ALTLEFT = 57
    case ALTRIGHT = 58
    case SHIFTLEFT = 59
    case SHIFTRIGHT = 60
    case TAB = 61
    case SPACE = 62
    case SYM = 63
    case EXPLORER = 64
    case ENVELOPE = 65
    case ENTER = 66
    case DEL = 67
    case GRAVE = 68
    case MINUS = 69
    case EQUALS = 70
    case LEFTBRACKET = 71
    case RIGHTBRACKET = 72
    case BACKSLASH = 73
    case SEMICOLON = 74
    case APOSTROPHE = 75
    case SLASH = 76
    case AT = 77
    case NUM = 78
    case HEADSETHOOK = 79
    case FOCUS = 80
    case PLUS = 81
    case MENU = 82
    case NOTIFICATION = 83
    case SEARCH = 84
    case MEDIAPLAYPAUSE = 85
    case MEDIASTOP = 86
    case MEDIANEXT = 87
    case MEDIAPREVIOUS = 88
    case MEDIAREWIND = 89
    case MEDIAFASTFORWARD = 90
    case MUTE = 91
    case PAGEUP = 92
    case PAGEDOWN = 93
    case PICTSYMBOLS = 94
    case SWITCHCHARSET = 95
    case BUTTONA = 96
    case BUTTONB = 97
    case BUTTONC = 98
    case BUTTONX = 99
    case BUTTONY = 100
    case BUTTONZ = 101
    case BUTTONL1 = 102
    case BUTTONR1 = 103
    case BUTTONL2 = 104
    case BUTTONR2 = 105
    case BUTTONTHUMBL = 106
    case BUTTONTHUMBR = 107
    case BUTTONSTART = 108
    case BUTTONSELECT = 109
    case BUTTONMODE = 110
    case ESCAPE = 111
    case FORWARDDEL = 112
    case CTRLLEFT = 113
    case CTRLRIGHT = 114
    case CAPSLOCK = 115
    case SCROLLLOCK = 116
    case METALEFT = 117
    case METARIGHT = 118
    case FUNCTION = 119
    case SYSRQ = 120
    case BREAK = 121
    case MOVEHOME = 122
    case MOVEEND = 123
    case INSERT = 124
    case FORWARD = 125
    case MEDIAPLAY = 126
    case MEDIAPAUSE = 127
    case MEDIACLOSE = 128
    case MEDIAEJECT = 129
    case MEDIARECORD = 130
    case F1 = 131
    case F2 = 132
    case F3 = 133
    case F4 = 134
    case F5 = 135
    case F6 = 136
    case F7 = 137
    case F8 = 138
    case F9 = 139
    case F10 = 140
    case F11 = 141
    case F12 = 142
    case NUMLOCK = 143
    case NUMPAD0 = 144
    case NUMPAD1 = 145
    case NUMPAD2 = 146
    case NUMPAD3 = 147
    case NUMPAD4 = 148
    case NUMPAD5 = 149
    case NUMPAD6 = 150
    case NUMPAD7 = 151
    case NUMPAD8 = 152
    case NUMPAD9 = 153
    case NUMPADDIVIDE = 154
    case NUMPADMULTIPLY = 155
    case NUMPADSUBTRACT = 156
    case NUMPADADD = 157
    case NUMPADDOT = 158
    case NUMPADCOMMA = 159
    case NUMPADENTER = 160
    case NUMPADEQUALS = 161
    case NUMPADLEFTPAREN = 162
    case NUMPADRIGHTPAREN = 163
    case VOLUMEMUTE = 164
    case INFO = 165
    case CHANNELUP = 166
    case CHANNELDOWN = 167
    case ZOOMIN = 168
    case ZOOMOUT = 169
    case TV = 170
    case WINDOW = 171
    case GUIDE = 172
    case DVR = 173
    case BOOKMARK = 174
    case CAPTIONS = 175
    case SETTINGS = 176
    case TVPOWER = 177
    case TVINPUT = 178
    case STBPOWER = 179
    case STBINPUT = 180
    case AVRPOWER = 181
    case AVRINPUT = 182
    case PROGRED = 183
    case PROGGREEN = 184
    case PROGYELLOW = 185
    case PROGBLUE = 186
    case APPSWITCH = 187
    case BUTTON1 = 188
    case BUTTON2 = 189
    case BUTTON3 = 190
    case BUTTON4 = 191
    case BUTTON5 = 192
    case BUTTON6 = 193
    case BUTTON7 = 194
    case BUTTON8 = 195
    case BUTTON9 = 196
    case BUTTON10 = 197
    case BUTTON11 = 198
    case BUTTON12 = 199
    case BUTTON13 = 200
    case BUTTON14 = 201
    case BUTTON15 = 202
    case BUTTON16 = 203
    case LANGUAGESWITCH = 204
    case MANNERMODE = 205
    case DMODE = 206
    case CONTACTS = 207
    case CALENDAR = 208
    case MUSIC = 209
    case CALCULATOR = 210
    case ZENKAKUHANKAKU = 211
    case EISU = 212
    case MUHENKAN = 213
    case HENKAN = 214
    case KATAKANAHIRAGANA = 215
    case YEN = 216
    case RO = 217
    case KANA = 218
    case ASSIST = 219
    case BRIGHTNESSDOWN = 220
    case BRIGHTNESSUP = 221
    case MEDIAAUDIOTRACK = 222
    case SLEEP = 223
    case WAKEUP = 224
    case PAIRING = 225
    case MEDIATOPMENU = 226
    case KEYCODE11 = 227
    case KEYCODE12 = 228
    case LASTCHANNEL = 229
    case TVDATASERVICE = 230
    case VOICEASSIST = 231
    case TVRADIOSERVICE = 232
    case TVTELETEXT = 233
    case TVNUMBERENTRY = 234
    case TVTERRESTRIALANALOG = 235
    case TVTERRESTRIALDIGITAL = 236
    case TVSATELLITE = 237
    case TVSATELLITEBS = 238
    case TVSATELLITECS = 239
    case TVSATELLITESERVICE = 240
    case TVNETWORK = 241
    case TVANTENNACABLE = 242
    case TVINPUTHDMI1 = 243
    case TVINPUTHDMI2 = 244
    case TVINPUTHDMI3 = 245
    case TVINPUTHDMI4 = 246
    case TVINPUTCOMPOSITE1 = 247
    case TVINPUTCOMPOSITE2 = 248
    case TVINPUTCOMPONENT1 = 249
    case TVINPUTCOMPONENT2 = 250
    case TVINPUTVGA1 = 251
    case TVAUDIODESCRIPTION = 252
    case TVAUDIODESCRIPTIONMIXUP = 253
    case TVAUDIODESCRIPTIONMIXDOWN = 254
    case TVZOOMMODE = 255
    case TVCONTENTSMENU = 256
    case TVMEDIACONTEXTMENU = 257
    case TVTIMERPROGRAMMING = 258
    case HELP = 259
    case NAVIGATEPREVIOUS = 260
    case NAVIGATENEXT = 261
    case NAVIGATEIN = 262
    case NAVIGATEOUT = 263
    case STEMPRIMARY = 264
    case STEM1 = 265
    case STEM2 = 266
    case STEM3 = 267
    case DPADUPLEFT = 268
    case DPADDOWNLEFT = 269
    case DPADUPRIGHT = 270
    case DPADDOWNRIGHT = 271
    case MEDIASKIPFORWARD = 272
    case MEDIASKIPBACKWARD = 273
    case MEDIASTEPFORWARD = 274
    case MEDIASTEPBACKWARD = 275
    case SOFTSLEEP = 276
    case CUT = 277
    case COPY = 278
    case PASTE = 279
    case SYSTEMNAVIGATIONUP = 280
    case SYSTEMNAVIGATIONDOWN = 281
    case SYSTEMNAVIGATIONLEFT = 282
    case SYSTEMNAVIGATIONRIGHT = 283
    case ALLAPPS = 284
    case REFRESH = 285
    case THUMBSUP = 286
    case THUMBSDOWN = 287
    case PROFILESWITCH = 288
    case VIDEOAPP1 = 289
    case VIDEOAPP2 = 290
    case VIDEOAPP3 = 291
    case VIDEOAPP4 = 292
    case VIDEOAPP5 = 293
    case VIDEOAPP6 = 294
    case VIDEOAPP7 = 295
    case VIDEOAPP8 = 296
    case FEATUREDAPP1 = 297
    case FEATUREDAPP2 = 298
    case FEATUREDAPP3 = 299
    case FEATUREDAPP4 = 300
    case DEMOAPP1 = 301
    case DEMOAPP2 = 302
    case DEMOAPP3 = 303
    case DEMOAPP4 = 304
}

let RemoteKeyCode_value: [String: Int] = [
    "KEYCODE_UNKNOWN": 0,
    "KEYCODE_SOFT_LEFT": 1,
    "KEYCODE_SOFT_RIGHT": 2,
    "KEYCODE_HOME": 3,
    "KEYCODE_BACK": 4,
    "KEYCODE_CALL": 5,
    "KEYCODE_ENDCALL": 6,
    "KEYCODE_0": 7,
    "KEYCODE_1": 8,
    "KEYCODE_2": 9,
    "KEYCODE_3": 10,
    "KEYCODE_4": 11,
    "KEYCODE_5": 12,
    "KEYCODE_6": 13,
    "KEYCODE_7": 14,
    "KEYCODE_8": 15,
    "KEYCODE_9": 16,
    "KEYCODE_STAR": 17,
    "KEYCODE_POUND": 18,
    "KEYCODE_DPAD_UP": 19,
    "KEYCODE_DPAD_DOWN": 20,
    "KEYCODE_DPAD_LEFT": 21,
    "KEYCODE_DPAD_RIGHT": 22,
    "KEYCODE_DPAD_CENTER": 23,
    "KEYCODE_VOLUME_UP": 24,
    "KEYCODE_VOLUME_DOWN": 25,
    "KEYCODE_POWER": 26,
    "KEYCODE_CAMERA": 27,
    "KEYCODE_CLEAR": 28,
    "KEYCODE_A": 29,
    "KEYCODE_B": 30,
    "KEYCODE_C": 31,
    "KEYCODE_D": 32,
    "KEYCODE_E": 33,
    "KEYCODE_F": 34,
    "KEYCODE_G": 35,
    "KEYCODE_H": 36,
    "KEYCODE_I": 37,
    "KEYCODE_J": 38,
    "KEYCODE_K": 39,
    "KEYCODE_L": 40,
    "KEYCODE_M": 41,
    "KEYCODE_N": 42,
    "KEYCODE_O": 43,
    "KEYCODE_P": 44,
    "KEYCODE_Q": 45,
    "KEYCODE_R": 46,
    "KEYCODE_S": 47,
    "KEYCODE_T": 48,
    "KEYCODE_U": 49,
    "KEYCODE_V": 50,
    "KEYCODE_W": 51,
    "KEYCODE_X": 52,
    "KEYCODE_Y": 53,
    "KEYCODE_Z": 54,
    "KEYCODE_COMMA": 55,
    "KEYCODE_PERIOD": 56,
    "KEYCODE_ALT_LEFT": 57,
    "KEYCODE_ALT_RIGHT": 58,
    "KEYCODE_SHIFT_LEFT": 59,
    "KEYCODE_SHIFT_RIGHT": 60,
    "KEYCODE_TAB": 61,
    "KEYCODE_SPACE": 62,
    "KEYCODE_SYM": 63,
    "KEYCODE_EXPLORER": 64,
    "KEYCODE_ENVELOPE": 65,
    "KEYCODE_ENTER": 66,
    "KEYCODE_DEL": 67,
    "KEYCODE_GRAVE": 68,
    "KEYCODE_MINUS": 69,
    "KEYCODE_EQUALS": 70,
    "KEYCODE_LEFT_BRACKET": 71,
    "KEYCODE_RIGHT_BRACKET": 72,
    "KEYCODE_BACKSLASH": 73,
    "KEYCODE_SEMICOLON": 74,
    "KEYCODE_APOSTROPHE": 75,
    "KEYCODE_SLASH": 76,
    "KEYCODE_AT": 77,
    "KEYCODE_NUM": 78,
    "KEYCODE_HEADSETHOOK": 79,
    "KEYCODE_FOCUS": 80,
    "KEYCODE_PLUS": 81,
    "KEYCODE_MENU": 82,
    "KEYCODE_NOTIFICATION": 83,
    "KEYCODE_SEARCH": 84,
    "KEYCODE_MEDIA_PLAY_PAUSE": 85,
    "KEYCODE_MEDIA_STOP": 86,
    "KEYCODE_MEDIA_NEXT": 87,
    "KEYCODE_MEDIA_PREVIOUS": 88,
    "KEYCODE_MEDIA_REWIND": 89,
    "KEYCODE_MEDIA_FAST_FORWARD": 90,
    "KEYCODE_MUTE": 91,
    "KEYCODE_PAGE_UP": 92,
    "KEYCODE_PAGE_DOWN": 93,
    "KEYCODE_PICTSYMBOLS": 94,
    "KEYCODE_SWITCH_CHARSET": 95,
    "KEYCODE_BUTTON_A": 96,
    "KEYCODE_BUTTON_B": 97,
    "KEYCODE_BUTTON_C": 98,
    "KEYCODE_BUTTON_X": 99,
    "KEYCODE_BUTTON_Y": 100,
    "KEYCODE_BUTTON_Z": 101,
    "KEYCODE_BUTTON_L1": 102,
    "KEYCODE_BUTTON_R1": 103,
    "KEYCODE_BUTTON_L2": 104,
    "KEYCODE_BUTTON_R2": 105,
    "KEYCODE_BUTTON_THUMBL": 106,
    "KEYCODE_BUTTON_THUMBR": 107,
    "KEYCODE_BUTTON_START": 108,
    "KEYCODE_BUTTON_SELECT": 109,
    "KEYCODE_BUTTON_MODE": 110,
    "KEYCODE_ESCAPE": 111,
    "KEYCODE_FORWARD_DEL": 112,
    "KEYCODE_CTRL_LEFT": 113,
    "KEYCODE_CTRL_RIGHT": 114,
    "KEYCODE_CAPS_LOCK": 115,
    "KEYCODE_SCROLL_LOCK": 116,
    "KEYCODE_META_LEFT": 117,
    "KEYCODE_META_RIGHT": 118,
    "KEYCODE_FUNCTION": 119,
    "KEYCODE_SYSRQ": 120,
    "KEYCODE_BREAK": 121,
    "KEYCODE_MOVE_HOME": 122,
    "KEYCODE_MOVE_END": 123,
    "KEYCODE_INSERT": 124,
    "KEYCODE_FORWARD": 125,
    "KEYCODE_MEDIA_PLAY": 126,
    "KEYCODE_MEDIA_PAUSE": 127,
    "KEYCODE_MEDIA_CLOSE": 128,
    "KEYCODE_MEDIA_EJECT": 129,
    "KEYCODE_MEDIA_RECORD": 130,
    "KEYCODE_F1": 131,
    "KEYCODE_F2": 132,
    "KEYCODE_F3": 133,
    "KEYCODE_F4": 134,
    "KEYCODE_F5": 135,
    "KEYCODE_F6": 136,
    "KEYCODE_F7": 137,
    "KEYCODE_F8": 138,
    "KEYCODE_F9": 139,
    "KEYCODE_F10": 140,
    "KEYCODE_F11": 141,
    "KEYCODE_F12": 142,
    "KEYCODE_NUM_LOCK": 143,
    "KEYCODE_NUMPAD_0": 144,
    "KEYCODE_NUMPAD_1": 145,
    "KEYCODE_NUMPAD_2": 146,
    "KEYCODE_NUMPAD_3": 147,
    "KEYCODE_NUMPAD_4": 148,
    "KEYCODE_NUMPAD_5": 149,
    "KEYCODE_NUMPAD_6": 150,
    "KEYCODE_NUMPAD_7": 151,
    "KEYCODE_NUMPAD_8": 152,
    "KEYCODE_NUMPAD_9": 153,
    "KEYCODE_NUMPAD_DIVIDE": 154,
    "KEYCODE_NUMPAD_MULTIPLY": 155,
    "KEYCODE_NUMPAD_SUBTRACT": 156,
    "KEYCODE_NUMPAD_ADD": 157,
    "KEYCODE_NUMPAD_DOT": 158,
    "KEYCODE_NUMPAD_COMMA": 159,
    "KEYCODE_NUMPAD_ENTER": 160,
    "KEYCODE_NUMPAD_EQUALS": 161,
    "KEYCODE_NUMPAD_LEFT_PAREN": 162,
    "KEYCODE_NUMPAD_RIGHT_PAREN": 163,
    "KEYCODE_VOLUME_MUTE": 164,
    "KEYCODE_INFO": 165,
    "KEYCODE_CHANNEL_UP": 166,
    "KEYCODE_CHANNEL_DOWN": 167,
    "KEYCODE_ZOOM_IN": 168,
    "KEYCODE_ZOOM_OUT": 169,
    "KEYCODE_TV": 170,
    "KEYCODE_WINDOW": 171,
    "KEYCODE_GUIDE": 172,
    "KEYCODE_DVR": 173,
    "KEYCODE_BOOKMARK": 174,
    "KEYCODE_CAPTIONS": 175,
    "KEYCODE_SETTINGS": 176,
    "KEYCODE_TV_POWER": 177,
    "KEYCODE_TV_INPUT": 178,
    "KEYCODE_STB_POWER": 179,
    "KEYCODE_STB_INPUT": 180,
    "KEYCODE_AVR_POWER": 181,
    "KEYCODE_AVR_INPUT": 182,
    "KEYCODE_PROG_RED": 183,
    "KEYCODE_PROG_GREEN": 184,
    "KEYCODE_PROG_YELLOW": 185,
    "KEYCODE_PROG_BLUE": 186,
    "KEYCODE_APP_SWITCH": 187,
    "KEYCODE_BUTTON_1": 188,
    "KEYCODE_BUTTON_2": 189,
    "KEYCODE_BUTTON_3": 190,
    "KEYCODE_BUTTON_4": 191,
    "KEYCODE_BUTTON_5": 192,
    "KEYCODE_BUTTON_6": 193,
    "KEYCODE_BUTTON_7": 194,
    "KEYCODE_BUTTON_8": 195,
    "KEYCODE_BUTTON_9": 196,
    "KEYCODE_BUTTON_10": 197,
    "KEYCODE_BUTTON_11": 198,
    "KEYCODE_BUTTON_12": 199,
    "KEYCODE_BUTTON_13": 200,
    "KEYCODE_BUTTON_14": 201,
    "KEYCODE_BUTTON_15": 202,
    "KEYCODE_BUTTON_16": 203,
    "KEYCODE_LANGUAGE_SWITCH": 204,
    "KEYCODE_MANNER_MODE": 205,
    "KEYCODE_3D_MODE": 206,
    "KEYCODE_CONTACTS": 207,
    "KEYCODE_CALENDAR": 208,
    "KEYCODE_MUSIC": 209,
    "KEYCODE_CALCULATOR": 210,
    "KEYCODE_ZENKAKU_HANKAKU": 211,
    "KEYCODE_EISU": 212,
    "KEYCODE_MUHENKAN": 213,
    "KEYCODE_HENKAN": 214,
    "KEYCODE_KATAKANA_HIRAGANA": 215,
    "KEYCODE_YEN": 216,
    "KEYCODE_RO": 217,
    "KEYCODE_KANA": 218,
    "KEYCODE_ASSIST": 219,
    "KEYCODE_BRIGHTNESS_DOWN": 220,
    "KEYCODE_BRIGHTNESS_UP": 221,
    "KEYCODE_MEDIA_AUDIO_TRACK": 222,
    "KEYCODE_SLEEP": 223,
    "KEYCODE_WAKEUP": 224,
    "KEYCODE_PAIRING": 225,
    "KEYCODE_MEDIA_TOP_MENU": 226,
    "KEYCODE_11": 227,
    "KEYCODE_12": 228,
    "KEYCODE_LAST_CHANNEL": 229,
    "KEYCODE_TV_DATA_SERVICE": 230,
    "KEYCODE_VOICE_ASSIST": 231,
    "KEYCODE_TV_RADIO_SERVICE": 232,
    "KEYCODE_TV_TELETEXT": 233,
    "KEYCODE_TV_NUMBER_ENTRY": 234,
    "KEYCODE_TV_TERRESTRIAL_ANALOG": 235,
    "KEYCODE_TV_TERRESTRIAL_DIGITAL": 236,
    "KEYCODE_TV_SATELLITE": 237,
    "KEYCODE_TV_SATELLITE_BS": 238,
    "KEYCODE_TV_SATELLITE_CS": 239,
    "KEYCODE_TV_SATELLITE_SERVICE": 240,
    "KEYCODE_TV_NETWORK": 241,
    "KEYCODE_TV_ANTENNA_CABLE": 242,
    "KEYCODE_TV_INPUT_HDMI_1": 243,
    "KEYCODE_TV_INPUT_HDMI_2": 244,
    "KEYCODE_TV_INPUT_HDMI_3": 245,
    "KEYCODE_TV_INPUT_HDMI_4": 246,
    "KEYCODE_TV_INPUT_COMPOSITE_1": 247,
    "KEYCODE_TV_INPUT_COMPOSITE_2": 248,
    "KEYCODE_TV_INPUT_COMPONENT_1": 249,
    "KEYCODE_TV_INPUT_COMPONENT_2": 250,
    "KEYCODE_TV_INPUT_VGA_1": 251,
    "KEYCODE_TV_AUDIO_DESCRIPTION": 252,
    "KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP": 253,
    "KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN": 254,
    "KEYCODE_TV_ZOOM_MODE": 255,
    "KEYCODE_TV_CONTENTS_MENU": 256,
    "KEYCODE_TV_MEDIA_CONTEXT_MENU": 257,
    "KEYCODE_TV_TIMER_PROGRAMMING": 258,
    "KEYCODE_HELP": 259,
    "KEYCODE_NAVIGATE_PREVIOUS": 260,
    "KEYCODE_NAVIGATE_NEXT": 261,
    "KEYCODE_NAVIGATE_IN": 262,
    "KEYCODE_NAVIGATE_OUT": 263,
    "KEYCODE_STEM_PRIMARY": 264,
    "KEYCODE_STEM_1": 265,
    "KEYCODE_STEM_2": 266,
    "KEYCODE_STEM_3": 267,
    "KEYCODE_DPAD_UP_LEFT": 268,
    "KEYCODE_DPAD_DOWN_LEFT": 269,
    "KEYCODE_DPAD_UP_RIGHT": 270,
    "KEYCODE_DPAD_DOWN_RIGHT": 271,
    "KEYCODE_MEDIA_SKIP_FORWARD": 272,
    "KEYCODE_MEDIA_SKIP_BACKWARD": 273,
    "KEYCODE_MEDIA_STEP_FORWARD": 274,
    "KEYCODE_MEDIA_STEP_BACKWARD": 275,
    "KEYCODE_SOFT_SLEEP": 276,
    "KEYCODE_CUT": 277,
    "KEYCODE_COPY": 278,
    "KEYCODE_PASTE": 279,
    "KEYCODE_SYSTEM_NAVIGATION_UP": 280,
    "KEYCODE_SYSTEM_NAVIGATION_DOWN": 281,
    "KEYCODE_SYSTEM_NAVIGATION_LEFT": 282,
    "KEYCODE_SYSTEM_NAVIGATION_RIGHT": 283,
    "KEYCODE_ALL_APPS": 284,
    "KEYCODE_REFRESH": 285,
    "KEYCODE_THUMBS_UP": 286,
    "KEYCODE_THUMBS_DOWN": 287,
    "KEYCODE_PROFILE_SWITCH": 288,
    "KEYCODE_VIDEO_APP_1": 289,
    "KEYCODE_VIDEO_APP_2": 290,
    "KEYCODE_VIDEO_APP_3": 291,
    "KEYCODE_VIDEO_APP_4": 292,
    "KEYCODE_VIDEO_APP_5": 293,
    "KEYCODE_VIDEO_APP_6": 294,
    "KEYCODE_VIDEO_APP_7": 295,
    "KEYCODE_VIDEO_APP_8": 296,
    "KEYCODE_FEATURED_APP_1": 297,
    "KEYCODE_FEATURED_APP_2": 298,
    "KEYCODE_FEATURED_APP_3": 299,
    "KEYCODE_FEATURED_APP_4": 300,
    "KEYCODE_DEMO_APP_1": 301,
    "KEYCODE_DEMO_APP_2": 302,
    "KEYCODE_DEMO_APP_3": 303,
    "KEYCODE_DEMO_APP_4": 304
]

struct Config {
    var identity: SecIdentity
    var ip: String
    var pair: Bool
    var command: [RemoteKeyCode]
    var open: String
    var link: String
    var info: Bool
}

func parseCommandLineArguments() -> Config? {
    let certPath = getArgument(named: "cert") ?? "cert.pem"
    let keyPath = getArgument(named: "key") ?? "key.pem"
    guard let ip = getArgument(named: "ip"), !ip.isEmpty else {
        print("Please provide the IP of your Android TV device.")
        return nil
    }
    let pair = getArgument(named: "pair") == "true"
    let commandString = getArgument(named: "command") ?? ""
    let open = getArgument(named: "open") ?? ""
    let link = getArgument(named: "link") ?? ""
    let info = getArgument(named: "info") == "true"

    if !FileManager.default.fileExists(atPath: "certificate.crt") {
        if pair {
            let swiftCryptoKey = P256.Signing.PrivateKey()
            let key = Certificate.PrivateKey(swiftCryptoKey)
            
            let subjectName = try DistinguishedName {
                CommonName("Android TV Remote Controller")
            }
            let issuerName = subjectName
            
            let now = Date()
            
            let extensions = try Certificate.Extensions {
                Critical(
                    BasicConstraints.isCertificateAuthority(maxPathLength: nil)
                )
                Critical(
                    KeyUsage(keyCertSign: true)
                )
                SubjectAlternativeNames([.dnsName("localhost")])
            }


            let certificate = try Certificate(
                version: .v3,
                serialNumber: Certificate.SerialNumber(),
                publicKey: key.publicKey,
                notValidBefore: now,
                notValidAfter: now.addingTimeInterval(60 * 60 * 24 * 365),
                issuer: issuerName,
                subject: subjectName,
                signatureAlgorithm: .ecdsaWithSHA256,
                extensions: extensions,
                issuerPrivateKey: key)


            var serializer = DER.Serializer()
            try serializer.serialize(certificate)

            let derEncodedCertificate = serializer.serializedBytes
            let derEncodedPrivateKey = swiftCryptoKey.derRepresentation
            
            do {
                try derEncodedCertificate.write(to: "certificate.crt")
            } catch {
                print("Error writing certificate to file \(error)")
            }
            
            return nil
        } else {
            print("Certificate or key file not found.")
            return nil
        }
    }

    guard let identity = importPKCS12(pkcs12Path: "identity.p12") else { return nil }

    let commands = parseCommandString(commandString)

    return Config(identity: identity, ip: ip, pair: pair, command: commands, open: open, link: link, info: info)
}

func getArgument(named name: String) -> String? {
    let prefixedName = "--\(name)"
    guard let index = CommandLine.arguments.firstIndex(of: prefixedName), index + 1 < CommandLine.arguments.count else {
        return nil
    }
    return CommandLine.arguments[index + 1]
}

func parseCommandString(_ commandString: String) -> [RemoteKeyCode] {
    var result = [RemoteKeyCode]()
    let specialKeys: [String: RemoteKeyCode] = [
        "UP": .DPADUP,
        "DOWN": .DPADDOWN,
        "LEFT": .DPADLEFT,
        "RIGHT": .DPADRIGHT,
        "HOME": .HOME,
        "BACK": .BACK,
        "MUTE": .MUTE,
        "VOLP": .VOLUMEUP,
        "VOLM": .VOLUMEDOWN,
        "PWR": .POWER,
        "ENTER": .ENTER
    ]

    let commands = commandString.split(separator: ";")
    for command in commands {
        let trimmedCommand = command.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedCommand.hasPrefix("KEYCODE_") {
            // Directly specified KEYCODE_
            if let keyCode = RemoteKeyCode_value[trimmedCommand], let remoteKeyCode = RemoteKeyCode(rawValue: keyCode) {
                result.append(remoteKeyCode)
            }
        } else if let specialKey = specialKeys[trimmedCommand] {
            // Special keys
            result.append(specialKey)
        } else {
            // Individual characters
            for char in trimmedCommand {
                if char.isLetter {
                    // A-Z
                    if let keyCode = RemoteKeyCode_value["KEYCODE_\(char.uppercased())"], let remoteKeyCode = RemoteKeyCode(rawValue: keyCode) {
                        result.append(remoteKeyCode)
                    }
                } else if char.isNumber {
                    // 0-9
                    if let keyCode = RemoteKeyCode_value["KEYCODE_NUMPAD_\(char)"], let remoteKeyCode = RemoteKeyCode(rawValue: keyCode) {
                        result.append(remoteKeyCode)
                    }
                } else if char == " " {
                    result.append(.SPACE)
                }
            }
        }
    }
    return result
}
