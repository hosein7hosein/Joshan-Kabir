object FormGoto: TFormGoto
  Left = 570
  Top = 357
  BiDiMode = bdRightToLeft
  BorderStyle = bsDialog
  Caption = #1576#1585#1608' '#1576#1607' '#1576#1582#1588' '#1588#1605#1575#1585#1607'                                    '
  ClientHeight = 213
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Pitch = fpFixed
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 24
    Top = 24
    Width = 343
    Height = 57
    AutoSize = False
    Caption = 
      #1583#1593#1575#1740' '#1580#1608#1588#1606' '#1705#1576#1740#1585' 100 '#1576#1582#1588' '#1575#1587#1578'. '#1604#1591#1601#1575' '#1576#1740#1606' '#1740#1705' '#1578#1575' '#1589#1583' '#1593#1583#1583#1740' '#1585#1575' '#1575#1606#1578#1582#1575#1576' '#1705#1606#1740 +
      #1583':'
    Transparent = True
    WordWrap = True
  end
  object TntEdit1: TTntEdit
    Left = 120
    Top = 64
    Width = 145
    Height = 60
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '1'
    OnKeyPress = TntEdit1KeyPress
  end
  object btn1: TTntButton
    Left = 8
    Top = 144
    Width = 377
    Height = 65
    Caption = #1578#1575#1740#1740#1583
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn1Click
  end
end
