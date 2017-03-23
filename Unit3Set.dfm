object Form1Set: TForm1Set
  Left = 517
  Top = 209
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  ClientHeight = 461
  ClientWidth = 684
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object TntSpeedButton1: TTntSpeedButton
    Left = 16
    Top = 376
    Width = 649
    Height = 57
    Caption = #1582#1585#1608#1580' '#1608' '#1578#1575#1740#1740#1583
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Layout = blGlyphRight
    ParentFont = False
    Transparent = False
    OnClick = TntSpeedButton1Click
  end
  object TntLabel1: TTntLabel
    Left = 350
    Top = 264
    Width = 137
    Height = 13
    Caption = #1575#1606#1578#1582#1575#1576' '#1662#1608#1587#1578#1607' '#1608' '#1578#1605' '#1662#1740#1588' '#1601#1585#1590':'
  end
  object btn1: TTntButton
    Left = 176
    Top = 32
    Width = 313
    Height = 55
    Caption = #1601#1608#1606#1578' '#1605#1578#1606' '#1593#1585#1576#1740
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TTntButton
    Left = 176
    Top = 96
    Width = 313
    Height = 55
    Caption = #1601#1608#1606#1578' '#1605#1578#1606' '#1601#1575#1585#1587#1740' '
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TTntButton
    Left = 176
    Top = 160
    Width = 313
    Height = 55
    Caption = #1601#1608#1606#1578' '#1588#1605#1575#1585#1607
    TabOrder = 2
    OnClick = btn3Click
  end
  object TntComboBox1: TTntComboBox
    Left = 176
    Top = 280
    Width = 313
    Height = 21
    Cursor = crHandPoint
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = cl3DLight
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 3
    OnChange = TntComboBox1Change
    Items.Strings = (
      #1605#1588#1705#1740' '#1576#1575' '#1578#1607' '#1585#1606#1711' '#1582#1575#1705#1587#1578#1585#1740
      #1605#1588#1705#1740' '#1576#1575' '#1578#1607' '#1585#1606#1711' '#1570#1576#1740
      #1570#1604#1601#1575' '#1578#1575#1585#1740#1705
      #1585#1608#1588#1606' '#1582#1575#1705#1587#1578#1585#1740
      #1587#1576#1586' '#1605#1578#1585#1740#1575#1604)
  end
  object dlgFont1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 584
    Top = 40
  end
  object dlgFont2: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 584
    Top = 104
  end
  object dlgFont3: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 584
    Top = 176
  end
end
