inherited FrmCadPremiGestEst: TFrmCadPremiGestEst
  Left = 173
  Top = 103
  Caption = 'Cadastro de Premissas de Gestão de Estoque'
  ClientHeight = 385
  ClientWidth = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 299
    object Label3: TLabel
      Left = 17
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object GrpArt: TGroupBox
      Left = 16
      Top = 59
      Width = 417
      Height = 73
      Caption = ' Artigo '
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 136
        Top = 21
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dblcItem: TwwDBLookupCombo
        Left = 18
        Top = 35
        Width = 103
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODARTIGO'#9'14'#9'Código'
          'DESCRICAO'#9'50'#9'Descrição')
        DataField = 'CODARTIGO'
        DataSource = ds
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcDesc: TwwDBLookupCombo
        Left = 136
        Top = 35
        Width = 262
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'
          'CODARTIGO'#9'14'#9'Código')
        DataField = 'CODARTIGO'
        DataSource = ds
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object edAlmox: TEdit
      Left = 16
      Top = 30
      Width = 417
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'edalmox'
    end
    object pln: TPanel
      Left = 16
      Top = 144
      Width = 417
      Height = 137
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label4: TLabel
        Left = 16
        Top = 50
        Width = 156
        Height = 13
        Caption = 'Intervalo de Ressuprimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 9
        Width = 182
        Height = 13
        Caption = 'Tempo de Ressuprimento Médio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 90
        Width = 116
        Height = 13
        Caption = 'Ponto de Reposição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 242
        Top = 50
        Width = 112
        Height = 13
        Caption = 'Quantidade Máxima'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 242
        Top = 9
        Width = 111
        Height = 13
        Caption = 'Quantidade Mínima'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 242
        Top = 90
        Width = 90
        Height = 13
        Caption = 'Consumo Médio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 142
        Top = 29
        Width = 26
        Height = 13
        Caption = 'Dias'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 142
        Top = 69
        Width = 26
        Height = 13
        Caption = 'Dias'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 366
        Top = 109
        Width = 26
        Height = 13
        Caption = 'Dias'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 142
        Top = 109
        Width = 32
        Height = 13
        Caption = 'Qtde.'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 366
        Top = 29
        Width = 32
        Height = 13
        Caption = 'Qtde.'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 366
        Top = 69
        Width = 32
        Height = 13
        Caption = 'Qtde.'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object edTmpRessupMed: TDBRealEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        MaxLength = 3
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'TEMRESUSADO'
        DataSource = ds
      end
      object edQtdeMin: TDBRealEdit
        Left = 242
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'ESTMINUSADO'
        DataSource = ds
      end
      object edPontoRepos: TDBRealEdit
        Left = 16
        Top = 104
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'PTORESUSADO'
        DataSource = ds
      end
      object edConsMed: TDBRealEdit
        Left = 242
        Top = 104
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONMEDUSADO'
        DataSource = ds
      end
      object edQtdeMax: TDBRealEdit
        Left = 242
        Top = 64
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'ESTMAXIMO'
        DataSource = ds
      end
      object edIntervalRessup: TDBRealEdit
        Left = 16
        Top = 64
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERIODOCOMPRA'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 451
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 281
      DockPos = 281
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 113
      DockPos = 113
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      S.CODARTIGO,'
      '      S.CODALMOXARIFADO,'
      '      S.PERIODOCOMPRA,'
      '      S.PTORESUSADO,'
      '      S.TEMRESUSADO,'
      '      S.CONMEDUSADO,'
      '      S.ESTMINUSADO,'
      '      S.ESTMAXIMO,'
      '      S.IDPESSOA'
      ''
      'FROM'
      '      SALDO S'
      'WHERE'
      '         ( RTRIM(S.CODARTIGO ) = :pCODART )'
      'AND (S.CODALMOXARIFADO = :pCODALMOX)'
      'AND (S.IDPESSOA = :pIDPESS)'
      ''
      ''
      '')
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qryPERIODOCOMPRA: TFloatField
      FieldName = 'PERIODOCOMPRA'
    end
    object qryPTORESUSADO: TFloatField
      FieldName = 'PTORESUSADO'
    end
    object qryTEMRESUSADO: TFloatField
      FieldName = 'TEMRESUSADO'
    end
    object qryCONMEDUSADO: TFloatField
      FieldName = 'CONMEDUSADO'
    end
    object qryESTMINUSADO: TFloatField
      FieldName = 'ESTMINUSADO'
    end
    object qryESTMAXIMO: TFloatField
      FieldName = 'ESTMAXIMO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDO'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  PERIODOCOMPRA = :PERIODOCOMPRA,'
      '  PTORESUSADO = :PTORESUSADO,'
      '  TEMRESUSADO = :TEMRESUSADO,'
      '  CONMEDUSADO = :CONMEDUSADO,'
      '  ESTMINUSADO = :ESTMINUSADO,'
      '  ESTMAXIMO = :ESTMAXIMO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    InsertSQL.Strings = (
      'insert into SALDO'
      '  (CODARTIGO, CODALMOXARIFADO, PERIODOCOMPRA, PTORESUSADO, '
      'TEMRESUSADO, '
      '   CONMEDUSADO, ESTMINUSADO, ESTMAXIMO, IDPESSOA)'
      'values'
      '  (:CODARTIGO, :CODALMOXARIFADO, :PERIODOCOMPRA, :PTORESUSADO, '
      ':TEMRESUSADO, '
      '   :CONMEDUSADO, :ESTMINUSADO, :ESTMAXIMO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from SALDO'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SALDO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'GRUPPROD.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Artigo'
      'Descrição do Artigo'
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'SALDO'
      'PRODUTO'
      'GRUPPROD')
    CamposChave.Strings = (
      'SALDO.CODARTIGO')
    Filtro.Strings = (
      'SUBSTR(SALDO.CODARTIGO,1,6) = PRODUTO.CODPRODUTO'
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '40'
      '10'
      '30')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryArtigo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO) AS ' +
        'DESCRICAO'
      'FROM   '
      '       ARTIGO A,'
      '       PRODUTO P'
      'Where  '
      '       ( A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 414
    Top = 131
  end
end
