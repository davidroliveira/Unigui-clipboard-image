object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 852
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object HtmlMemo: TUniHTMLMemo
    Left = 0
    Top = 33
    Width = 852
    Height = 266
    Hint = ''
    Align = alClient
    Color = clWindow
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 48
    ExplicitWidth = 337
    ExplicitHeight = 153
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 33
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    object UniButton1: TUniButton
      Left = 40
      Top = 2
      Width = 121
      Height = 25
      Hint = ''
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 167
      Top = 2
      Width = 130
      Height = 25
      Hint = ''
      Caption = 'Carregar'
      TabOrder = 2
      OnClick = UniButton2Click
    end
  end
end
