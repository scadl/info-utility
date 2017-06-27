object Frame12: TFrame12
  Tag = 5
  Left = 0
  Top = 0
  Width = 284
  Height = 88
  TabOrder = 0
  TabStop = True
  object sLabel1: TsLabel
    Left = 20
    Top = 10
    Width = 98
    Height = 13
    Caption = #1055#1088#1086#1079#1088#1072#1095#1085#1086#1089#1090#1100' '#1086#1082#1085#1072
  end
  object sCheckBox1: TsCheckBox
    Left = 21
    Top = 56
    Width = 176
    Height = 20
    Caption = #1059#1076#1077#1088#1078#1080#1074#1072#1090#1100' '#1087#1086#1074#1077#1088#1093' '#1074#1089#1077#1093' '#1086#1082#1086#1085
    Checked = True
    ParentShowHint = False
    ShowHint = False
    State = cbChecked
    TabOrder = 0
    OnClick = sCheckBox1Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sTrackBar1: TsTrackBar
    Left = 12
    Top = 25
    Width = 259
    Height = 34
    Hint = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1088#1086#1079#1088#1072#1095#1085#1086#1089#1090#1080' '#1086#1082#1085#1072
    Max = 255
    ParentShowHint = False
    Position = 200
    ShowHint = True
    TabOrder = 1
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = sTrackBar1Change
    AnimatEvents = [aeMouseEnter, aeMouseLeave, aeMouseDown, aeGlobalDef]
    SkinData.SkinSection = 'TRACKBAR'
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'BARPANEL'
    Left = 65521
    Top = 65531
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 10
    Top = 65526
  end
  object pass1timer: TTimer
    Interval = 50
    OnTimer = pass1timerTimer
    Left = 265
    Top = 65531
  end
  object sHintManager1: TsHintManager
    HintKind.Style = hsComics
    HintKind.Radius = 21
    HintKind.BevelWidth = 2
    HintKind.ExOffset = 0
    HintKind.GradientData = '7256171;10842177;97;0;0;10842177;10842177;0;0;0'
    HintKind.GradientPercent = 86
    HintKind.Bevel = 1
    HintKind.Color = 11992314
    HintKind.ColorBorderTop = 16384
    HintKind.ColorBorderBottom = clGreen
    HintKind.Transparency = 13
    HintKind.ShadowBlur = 5
    HintKind.ShadowEnabled = True
    HintKind.ShadowOffset = 6
    HintKind.ShadowTransparency = 54
    HintKind.MarginH = 9
    HintKind.MarginV = 1
    HintKind.MaxWidth = 213
    HintKind.Font.Charset = DEFAULT_CHARSET
    HintKind.Font.Color = clWhite
    HintKind.Font.Height = -11
    HintKind.Font.Name = 'Tahoma'
    HintKind.Font.Style = [fsBold]
    PauseHide = 3000
    Predefinitions = shCustom
    SkinSection = 'HINT'
    Left = 75
    Top = 65531
  end
end
