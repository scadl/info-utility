object FrameIn: TFrameIn
  Tag = 5
  Left = 0
  Top = 0
  Width = 284
  Height = 87
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  TabStop = True
  object sLabelFX1: TsLabelFX
    Left = 8
    Top = 0
    Width = 100
    Height = 34
    Caption = 'sLabelFX1'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind.KindType = ktCustom
    Kind.Color = clTeal
    Shadow.Mode = smCustom
    Shadow.Color = clMoneyGreen
    Shadow.BlurCount = 5
  end
  object sProgressBar1: TsProgressBar
    Left = 8
    Top = 35
    Width = 263
    Height = 17
    Hint = 
      #1043#1088#1072#1092#1080#1095#1077#1089#1082#1086#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1089#1074#1086#1073#1086#1076#1085#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1085#1072' '#1085#1086#1089#1080#1090#1077#1083#1077', '#1074' '#1079#1072#1074#1080#1089#1080 +
      #1084#1086#1089#1090#1080' '#1086#1090' '#1077#1075#1086' '#1086#1073#1098#1105#1084#1072'.'
    ParentShowHint = False
    Smooth = True
    ShowHint = True
    TabOrder = 0
    SkinData.SkinSection = 'GAUGE'
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 58
    Width = 263
    Height = 19
    Hint = 
      #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1101#1090#1086#1075#1086' '#1074#1099#1087#1072#1076#1072#1102#1097#1077#1075#1086' '#1089#1087#1080#1089#1082#1072' '#1085#1086#1089#1080#1090#1077#1083#1100', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1090#1086 +
      #1088#1086#1084' '#1074#1072#1089' '#1080#1085#1090#1077#1088#1080#1089#1091#1077#1090'.'
    Color = clGreen
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = DriveComboBox1Change
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'BARPANEL'
    Left = 248
  end
  object MiTeC_Disk1: TMiTeC_Disk
    Left = 184
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 216
  end
  object pass1timer: TTimer
    Interval = 50
    OnTimer = pass1timerTimer
    Left = 280
    Top = 65
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
