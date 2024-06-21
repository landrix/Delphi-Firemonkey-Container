object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TFireMonkeyContainer demo'
  ClientHeight = 340
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    680
    340)
  TextHeight = 13
  object Label1: TLabel
    Left = 465
    Top = 18
    Width = 203
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'TFireMonkeyContainer demo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 465
    Top = 48
    Width = 203
    Height = 73
    Anchors = [akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      'This is a VCL form holding VCL controls. On the left is a TFireM' +
      'onkeyContainer inside a TPanel (to show a border.)  It is holdin' +
      'g a FireMonkey form.'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 465
    Top = 129
    Width = 213
    Height = 39
    Caption = 
      'FireMonkeyContainers get drag/drop events (pass these on to your' +
      ' embedded form however you want.)'
    WordWrap = True
  end
  object btnOpenAnotherForm: TButton
    Left = 465
    Top = 302
    Width = 203
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Open another form'
    TabOrder = 0
    OnClick = btnOpenAnotherFormClick
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 18
    Width = 443
    Height = 309
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 3
        Width = 431
        Height = 275
        Margins.Left = 1
        Align = alClient
        BevelInner = bvLowered
        Caption = 'Panel1'
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 1
        Top = 3
        Width = 431
        Height = 275
        Margins.Left = 1
        Align = alClient
        BevelInner = bvLowered
        Caption = 'Panel1'
        TabOrder = 0
      end
    end
  end
  object btnDrag: TButton
    Left = 465
    Top = 171
    Width = 203
    Height = 30
    Anchors = [akTop, akRight]
    Caption = 'Drag me over a FMX form'
    DragMode = dmAutomatic
    TabOrder = 2
  end
end
