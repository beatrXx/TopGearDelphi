object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 274
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 6
    Width = 489
    Height = 195
    Color = clLime
    ParentBackground = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 88
    Top = 8
    Width = 321
    Height = 193
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object lblNivel: TLabel
      Left = 104
      Top = 48
      Width = 95
      Height = 33
      Caption = 'N'#237'vel 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 424
    Top = 136
  end
  object Tcreate: TTimer
    OnTimer = TcreateTimer
    Left = 424
    Top = 72
  end
  object TAumenta: TTimer
    Left = 424
    Top = 200
  end
  object TVencedor: TTimer
    OnTimer = TVencedorTimer
    Left = 424
    Top = 22
  end
  object Tnivel: TTimer
    OnTimer = TnivelTimer
    Left = 336
    Top = 224
  end
end
