inherited FrmPRelRubrica: TFrmPRelRubrica
  Left = 187
  Top = 72
  HelpContext = 180102
  Caption = 'Relatório de Rubricas'
  ClientHeight = 473
  ClientWidth = 413
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 413
    Height = 434
    object GrbPlano: TGroupBox [0]
      Left = 7
      Top = 267
      Width = 399
      Height = 92
      Caption = 'Plano...'
      TabOrder = 5
      object lblPlanoPrev: TLabel
        Left = 8
        Top = 16
        Width = 82
        Height = 13
        Caption = 'Previdenciário'
      end
      object lblPlanoContabil: TLabel
        Left = 8
        Top = 51
        Width = 47
        Height = 13
        Caption = 'Contábil'
      end
      object dblkPlano: TwwDBLookupCombo
        Left = 8
        Top = 29
        Width = 380
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = qryPlanoPrev
        LookupField = 'IDPLANOPREV'
        Enabled = False
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkPlanoChange
      end
      object dblkPlanoContabil: TwwDBLookupCombo
        Left = 8
        Top = 63
        Width = 380
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        Enabled = False
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited PnlPreviaouEfetivada: TPanel
      inherited PnlMesPagto: TPanel
        inherited CmbMes: TComboBox
          OnChange = CmbMesChange
        end
        inherited SpnedAno: TSpinEdit
          OnChange = SpnedAnoChange
        end
      end
      inherited PnlLoteouVersao: TPanel
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Options = [loColLines, loRowLines, loTitles]
          OnCloseUp = dblkLoteouVersaoCloseUp
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 170
      Width = 398
      Height = 48
      Caption = 'Rubricas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object dblkRubricas: TwwDBLookupCombo
        Left = 5
        Top = 17
        Width = 384
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'80'#9'Descrição'#9'F')
        LookupTable = qryRubFolha
        LookupField = 'IDRUBRICA'
        Options = [loTitles]
        Enabled = False
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GrbPatrocinadora: TGroupBox
      Left = 7
      Top = 219
      Width = 399
      Height = 47
      Caption = 'Patrocinadora'
      TabOrder = 4
      object dblkPatrocinadora: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 274
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        Enabled = False
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkPatrocinadoraChange
      end
      object ChkConsolidar: TCheckBox
        Left = 301
        Top = 18
        Width = 86
        Height = 17
        Caption = 'Consolidar'
        TabOrder = 1
      end
    end
    object RdoTipoOrdem: TRadioGroup
      Left = 7
      Top = 366
      Width = 399
      Height = 38
      Caption = 'Ordenação do Recebedor'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Matrícula'
        'Inscrição'
        'Recebedor')
      TabOrder = 6
    end
    object chkMostraEstornado: TCheckBox
      Left = 16
      Top = 408
      Width = 180
      Height = 17
      Caption = 'Mostra Pessoas Estornadas'
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 413
    inherited tb97Fundo: TToolbar97
      Left = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 72
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 355
    Top = 11
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 249
    Top = 85
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 144
    Top = 85
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREVCONTABIL'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 132
    Top = 338
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO'
      'WHERE (P.IDPESSOA = PATRO.IDPESSOA)'
      'ORDER BY P.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 132
    Top = 233
  end
  object qryRubFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PD.IDPROVENTO AS IDRUBRICA,'
      '  PD.IDPROVENTO||'#39' - '#39'||PD.DESCRICAO AS DESCRICAO'
      ''
      'FROM'
      '  HISTRUBSAL HRS,'
      '  PROVDESC PD'
      ''
      'WHERE'
      '  HRS.IDHSTFOLHABENEF = :IDHSTFOLHABENEF AND'
      '  PD.IDPROVENTO       = HRS.IDRUBRICA'
      ''
      'ORDER BY'
      '  DESCRICAO'
      ' '
      ''
      '')
    ValidateWithMask = True
    Left = 132
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 135
    Top = 291
  end
end
