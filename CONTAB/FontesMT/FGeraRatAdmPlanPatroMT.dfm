inherited frmGeraRatAdmPlanPatroMT: TfrmGeraRatAdmPlanPatroMT
  Left = 142
  Top = 113
  Caption = 
    'Geração dos Lançamentos de Rateio Administrativo por Plano e Pat' +
    'rocinadora'
  ClientHeight = 326
  ClientWidth = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 556
    Height = 287
    object Label4: TLabel
      Left = 104
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 320
      Top = 24
      Width = 101
      Height = 13
      Caption = 'Tipo de operação'
    end
    object lblRateio: TLabel
      Left = 24
      Top = 66
      Width = 513
      Height = 13
      AutoSize = False
      Caption = 'Gerando Plano / Patrocinadora: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblConta: TLabel
      Left = 24
      Top = 82
      Width = 513
      Height = 13
      AutoSize = False
      Caption = 'Gerando Conta : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 24
      Top = 131
      Width = 513
      Height = 9
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 24
      Top = 141
      Width = 65
      Height = 13
      Caption = 'Mensagens'
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 40
      Width = 209
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PEREXERCI'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCI'
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkExercicioCloseUp
    end
    object pgbStatus: TProgressBar
      Left = 24
      Top = 107
      Width = 513
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 3
    end
    object memLog: TRichEdit
      Left = 24
      Top = 158
      Width = 513
      Height = 113
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object dblkTipoOper: TwwDBLookupCombo
      Left = 320
      Top = 40
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
      LookupTable = cdsTipoOper
      LookupField = 'TIPCODIGO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 287
    Width = 556
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 507
    Top = 203
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 201
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 206
  end
  object cdsTipoOper: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 294
    Top = 206
  end
end
