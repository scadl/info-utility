object Frame1: TFrame1
  Tag = 5
  Left = 0
  Top = 0
  Width = 284
  Height = 299
  TabOrder = 0
  TabStop = True
  object sRichEdit1: TRichEdit
    Left = 10
    Top = 10
    Width = 261
    Height = 281
    Color = 13038073
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe Script'
    Font.Style = []
    Lines.Strings = (
      'sRichEdit1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyUp = sRichEdit1KeyUp
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'BARPANEL'
  end
  object pass1timer: TTimer
    Interval = 50
    OnTimer = pass1timerTimer
    Left = 255
  end
end
