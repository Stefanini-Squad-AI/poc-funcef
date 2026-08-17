inherited frmPedeDadosDependencia: TfrmPedeDadosDependencia
  Left = 166
  Top = 183
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Dados do Dependente em Relação ao Titular'
  ClientHeight = 255
  ClientWidth = 525
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 525
    Height = 216
    object pnlTitular: TPanel
      Left = 5
      Top = 5
      Width = 515
      Height = 95
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 14
        Top = 10
        Width = 45
        Height = 16
        Caption = 'Titular'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPart: TLabel
        Left = 14
        Top = 29
        Width = 38
        Height = 16
        Caption = 'lblPart'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 14
        Top = 49
        Width = 86
        Height = 16
        Caption = 'Dependente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDepen: TLabel
        Left = 14
        Top = 68
        Width = 55
        Height = 16
        Caption = 'lblDepen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 389
        Top = 10
        Width = 64
        Height = 16
        Caption = 'Matrícula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 389
        Top = 29
        Width = 68
        Height = 16
        Caption = 'lblMatricula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object grpDependente: TGroupBox
      Left = 5
      Top = 100
      Width = 515
      Height = 111
      Align = alClient
      TabOrder = 1
      object lblDependente: TLabel
        Left = 8
        Top = 16
        Width = 123
        Height = 13
        Caption = 'Tipo de Dependência'
      end
      object Label30: TLabel
        Left = 222
        Top = 16
        Width = 79
        Height = 13
        Caption = 'N° Sequência'
      end
      object dblkcmbDependente: TwwDBLookupCombo
        Left = 8
        Top = 31
        Width = 193
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'15'#9'Descrição')
        LookupTable = qryDepen
        LookupField = 'IDDEPENDENCIA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edseq: TEdit
        Left = 220
        Top = 31
        Width = 121
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
        Text = 'edseq'
      end
      object chkContaIR: TCheckBox
        Left = 10
        Top = 65
        Width = 223
        Height = 17
        Caption = 'Conta para Imposto de Renda'
        TabOrder = 2
        Visible = False
      end
      object chkContaSalF: TCheckBox
        Left = 10
        Top = 85
        Width = 225
        Height = 17
        Caption = 'Conta para Salário Família'
        TabOrder = 3
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 216
    Width = 525
    inherited tb97Fundo: TToolbar97
      Left = 351
      DockPos = 351
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      DockPos = 183
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 475
    Top = 155
  end
  object qryDepen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE (IDDEPENDENCIA <> '#39'PRP'#39')'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 407
    Top = 158
  end
end
