inherited frmCadBancoPortadorCS: TfrmCadBancoPortadorCS
  Left = 284
  Top = 259
  Width = 617
  Height = 532
  HelpContext = 180022
  BorderStyle = bsSizeable
  Caption = 'Banco x Contas/Caixas x Forma de Pagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 609
    Height = 419
    inherited pnlControles: TPanel
      Width = 607
      Height = 417
      object lblSituacao: TLabel
        Left = 310
        Top = 8
        Width = 117
        Height = 13
        Caption = 'Situação Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipoFolha: TLabel
        Left = 6
        Top = 8
        Width = 93
        Height = 13
        Caption = 'Tipo Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBanco: TLabel
        Left = 6
        Top = 56
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPortadorForma: TLabel
        Left = 310
        Top = 104
        Width = 216
        Height = 13
        Caption = 'Contas/Caixas x Forma de Pagamento'
      end
      object lblTipoConta: TLabel
        Left = 310
        Top = 56
        Width = 63
        Height = 13
        Caption = 'Tipo Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 104
        Width = 245
        Height = 13
        Caption = 'Favorecido (em branco se o próprio banco)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbcboxSituacao: TwwDBComboBox
        Left = 310
        Top = 22
        Width = 191
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'SITUACAO'
        DataSource = ds
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        Items.Strings = (
          'PARTICIPANTE'#9'1'
          'PENSIONISTA'#9'2'
          'CONSIGNATÁRIO/FAVORECIDO'#9'3'
          'PROVISÓRIO'#9'4'
          'PADRÃO'#9'D')
        ParentFont = False
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnExit = ControlExit
      end
      object dbcboxTipoFolha: TwwDBComboBox
        Left = 6
        Top = 22
        Width = 191
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'TIPOFOLHA'
        DataSource = ds
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        Items.Strings = (
          'NORMAL'#9'0'
          'PAGAMENTO PENDENTE'#9'1'
          'EXTRA'#9'2'
          'ABONO'#9'3'
          'ADIANTAMENTO DE ABONO'#9'4'
          'PADRÃO'#9'D'
          'RESERVA'#9'R')
        ParentFont = False
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnExit = ControlExit
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 6
        Top = 70
        Width = 290
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCO'#9'60'#9'Banco'
          'NUMBANCO'#9'10'#9'Nº')
        DataField = 'IDBANCO'
        DataSource = ds
        LookupTable = qryBanco
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = ControlExit
      end
      object dblcPortador: TwwDBLookupCombo
        Left = 310
        Top = 118
        Width = 290
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Portador Forma'#9'F')
        DataField = 'CODPORTFORMA'
        DataSource = ds
        LookupTable = qryPortadorForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbcboxTipoConta: TwwDBComboBox
        Left = 310
        Top = 70
        Width = 191
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'TIPOCONTA'
        DataSource = ds
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        Items.Strings = (
          'CONTA CORRENTE'#9'1'
          'CONTA SALÁRIO'#9'2'
          'POUPANÇA'#9'3'
          'OP/RECIBO'#9'4'
          'PADRÃO'#9'D')
        ParentFont = False
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
        OnExit = ControlExit
      end
      object gboxArqElet: TGroupBox
        Left = 7
        Top = 150
        Width = 592
        Height = 258
        Caption = 'Arquivo Eletrônico'
        TabOrder = 5
        object Bevel3: TBevel
          Left = 8
          Top = 177
          Width = 575
          Height = 72
        end
        object Bevel2: TBevel
          Left = 8
          Top = 97
          Width = 575
          Height = 72
        end
        object Bevel1: TBevel
          Left = 8
          Top = 25
          Width = 177
          Height = 66
        end
        object Label4: TLabel
          Left = 112
          Top = 48
          Width = 53
          Height = 13
          Caption = 'Tamanho'
        end
        object Label5: TLabel
          Left = 35
          Top = 48
          Width = 40
          Height = 13
          Caption = 'Coluna'
        end
        object Label6: TLabel
          Left = 201
          Top = 48
          Width = 156
          Height = 13
          Caption = 'Prefixo do nome do arquivo'
        end
        object Label1: TLabel
          Left = 29
          Top = 22
          Width = 120
          Height = 13
          Caption = 'Campo Valor a Pagar'
        end
        object lblDiasArquivo: TLabel
          Left = 28
          Top = 105
          Width = 156
          Height = 30
          AutoSize = False
          Caption = 'Dias de antecipação para Data Prevista do Arquivo'
          WordWrap = True
        end
        object Label3: TLabel
          Left = 28
          Top = 186
          Width = 156
          Height = 30
          AutoSize = False
          Caption = 'Dias de antecipação para Data Programada'
          WordWrap = True
        end
        object Label7: TLabel
          Left = 268
          Top = 186
          Width = 175
          Height = 30
          AutoSize = False
          Caption = 'Dias de antecipação para Data Programada Alternativa'
          WordWrap = True
        end
        object Label8: TLabel
          Left = 268
          Top = 105
          Width = 205
          Height = 30
          AutoSize = False
          Caption = 'Dias de antecipação para Data Prevista do Arquivo Alternativa '
          WordWrap = True
        end
        object dbspinCol: TwwDBSpinEdit
          Left = 22
          Top = 64
          Width = 66
          Height = 21
          Increment = 1
          DataField = 'COLVALOR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object dbspinDias: TwwDBSpinEdit
          Left = 28
          Top = 138
          Width = 71
          Height = 21
          Increment = 1
          DataField = 'DFLOATPAGTO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object dbspinTam: TwwDBSpinEdit
          Left = 105
          Top = 64
          Width = 66
          Height = 21
          Increment = 1
          DataField = 'TAMVALOR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object dbePrefixo: TwwDBEdit
          Left = 201
          Top = 64
          Width = 216
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PREFIXOARQ'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbspinProgramada: TwwDBSpinEdit
          Left = 28
          Top = 219
          Width = 71
          Height = 21
          Increment = 1
          DataField = 'DFLOATPROG'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
        end
        object dbspinAlternativa: TwwDBSpinEdit
          Left = 268
          Top = 219
          Width = 71
          Height = 21
          Increment = 1
          DataField = 'DFLOATPROGALTER'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 268
          Top = 138
          Width = 71
          Height = 21
          Increment = 1
          DataField = 'DFLOATPAGTOALTER'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          UnboundDataType = wwDefault
        end
      end
      object dblcFavorecido: TwwDBLookupCombo
        Left = 6
        Top = 118
        Width = 290
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Favorecido')
        DataField = 'IDFAVORECIDO'
        DataSource = ds
        LookupTable = qryFavorecido
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = ControlExit
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 607
      Height = 417
      Selected.Strings = (
        'NUMBANCO'#9'7'#9'Nº~Banco'
        'NOME'#9'22'#9'Banco'
        'NOMEFOLHA'#9'12'#9'Tipo Folha'
        'NOMESITUACAO'#9'12'#9'Situação'
        'NOMECONTA'#9'14'#9'Tipo Conta'
        'DESCRICAO'#9'22'#9'Contas/Caixas x~Forma de Pagamento'
        'DFLOATPAGTOALTER'#9'10'#9'DFLOATPAGTOALTER')
      MemoAttributes = []
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
      ParentFont = False
      TitleAlignment = taCenter
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 609
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 466
    Width = 609
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 257
    Top = 2
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 341
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BANCOPORTFORMA'
      'set'
      '  IDBANCO = :IDBANCO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  DFLOATPAGTO = :DFLOATPAGTO,'
      '  DFLOATPAGTOALTER = :DFLOATPAGTOALTER,'
      '  COLVALOR = :COLVALOR,'
      '  TAMVALOR = :TAMVALOR,'
      '  PREFIXOARQ = :PREFIXOARQ,'
      '  TIPOFOLHA = :TIPOFOLHA,'
      '  SITUACAO = :SITUACAO,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  IDMODULO = :IDMODULO,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  DFLOATPROG = :DFLOATPROG,'
      '  DFLOATPROGALTER = :DFLOATPROGALTER'
      'where'
      '  IDBANCOPORTFORMA = :OLD_IDBANCOPORTFORMA')
    InsertSQL.Strings = (
      'insert into BANCOPORTFORMA'
      '  (IDBANCOPORTFORMA, IDBANCO, CODPORTFORMA,'
      '   DFLOATPAGTO, DFLOATPAGTOALTER, COLVALOR, TAMVALOR,'
      '   PREFIXOARQ, TIPOFOLHA, SITUACAO, TIPOCONTA, IDMODULO, '
      'IDFUNDACAO, IDFAVORECIDO, DFLOATPROG, DFLOATPROGALTER)'
      'values'
      '  (:IDBANCOPORTFORMA, :IDBANCO, :CODPORTFORMA,'
      '   :DFLOATPAGTO, :DFLOATPAGTOALTER, :COLVALOR,'
      
        '   :TAMVALOR, :PREFIXOARQ, :TIPOFOLHA, :SITUACAO, :TIPOCONTA, 18' +
        ', '
      '   :IDFUNDACAO, :IDFAVORECIDO, :DFLOATPROG, :DFLOATPROGALTER)'
      ' ')
    DeleteSQL.Strings = (
      'delete from BANCOPORTFORMA'
      'where'
      '  IDBANCOPORTFORMA = :OLD_IDBANCOPORTFORMA')
    Left = 397
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Left = 313
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 285
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 425
    Top = 2
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT BP.IDBANCOPORTFORMA,'
      '       BP.IDBANCO,'
      '       BP.IDFAVORECIDO,'
      '       BP.CODPORTFORMA,'
      '       BP.DFLOATPAGTO,'
      '       BP.DFLOATPAGTOALTER,'
      '       BP.COLVALOR,'
      '       BP.TAMVALOR,'
      '       BP.PREFIXOARQ,'
      '       BP.TIPOFOLHA,'
      '       DECODE(BP.TIPOFOLHA,'#39'D'#39','#39'PADRÃO'#39','
      '                           '#39'0'#39','#39'NORMAL'#39','
      '                           '#39'1'#39','#39'PAGAMENTO PENDENTE'#39','
      '                           '#39'2'#39','#39'EXTRA'#39','
      '                           '#39'3'#39','#39'ABONO'#39','
      
        '                           '#39'4'#39','#39'ADIANTAMENTO DE ABONO'#39') AS NOMEF' +
        'OLHA,'
      '       BP.SITUACAO,'
      '       DECODE(BP.SITUACAO,'#39'D'#39','#39'PADRÃO'#39','
      '                          '#39'1'#39','#39'PARTICIPANTE'#39','
      '                          '#39'2'#39','#39'PENSIONISTA'#39','
      '                          '#39'3'#39','#39'CONSIGNATÁRIO/FAVORECIDO'#39','
      '                          '#39'4'#39','#39'PROVISÓRIO'#39') AS NOMESITUACAO,'
      '       BP.TIPOCONTA,'
      '       DECODE(BP.TIPOCONTA,'#39'D'#39','#39'PADRÃO'#39','
      '                           '#39'1'#39','#39'CONTA CORRENTE'#39','
      '                           '#39'2'#39','#39'CONTA SALÁRIO'#39','
      '                           '#39'3'#39','#39'POUPANÇA'#39') AS NOMECONTA,'
      '       B.NUMBANCO,'
      '       NVL(PB.NOME,'#39'PADRÃO'#39') AS NOME,'
      '       PF.DESCRICAO,'
      '       BP.IDMODULO,'
      '       BP.IDFUNDACAO,'
      '       BP.DFLOATPROG,'
      '       BP.DFLOATPROGALTER'
      'FROM BANCOPORTFORMA BP, BANCO B, PESSOA PB, PORTADORFORMA PF'
      'WHERE BP.IDBANCO = B.IDPESSOA(+)'
      'AND BP.IDMODULO = 18'
      'AND B.IDPESSOA = PB.IDPESSOA(+)'
      'AND PF.CODPORTFORMA = BP.CODPORTFORMA'
      'ORDER BY B.NUMBANCO, NOMEFOLHA, NOMECONTA, NOMESITUACAO')
    Left = 369
    Top = 2
    object qryNUMBANCO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nº~Banco'
      DisplayWidth = 7
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryNOME: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 22
      FieldName = 'NOME'
      Size = 60
    end
    object qryNOMEFOLHA: TStringField
      DisplayLabel = 'Tipo Folha'
      DisplayWidth = 12
      FieldName = 'NOMEFOLHA'
      Size = 21
    end
    object qryNOMESITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 12
      FieldName = 'NOMESITUACAO'
      Size = 24
    end
    object qryNOMECONTA: TStringField
      DisplayLabel = 'Tipo Conta'
      DisplayWidth = 14
      FieldName = 'NOMECONTA'
      Size = 14
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Contas/Caixas x~Forma de Pagamento'
      DisplayWidth = 22
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryIDFUNDACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDACAO'
      Visible = False
    end
    object qryIDBANCOPORTFORMA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'IDBANCOPORTFORMA'
      Visible = False
    end
    object qryIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
      Visible = False
    end
    object qryCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDFLOATPAGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'DFLOATPAGTO'
      Visible = False
    end
    object qryCOLVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'COLVALOR'
      Visible = False
    end
    object qryTAMVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'TAMVALOR'
      Visible = False
    end
    object qryPREFIXOARQ: TStringField
      DisplayWidth = 10
      FieldName = 'PREFIXOARQ'
      Visible = False
      Size = 10
    end
    object qryTIPOFOLHA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOFOLHA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySITUACAO: TStringField
      DisplayWidth = 1
      FieldName = 'SITUACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTIPOCONTA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Visible = False
    end
    object qryDFLOATPROG: TFloatField
      FieldName = 'DFLOATPROG'
      Visible = False
    end
    object qryDFLOATPROGALTER: TFloatField
      FieldName = 'DFLOATPROGALTER'
      Visible = False
    end
    object qryDFLOATPAGTOALTER: TFloatField
      FieldName = 'DFLOATPAGTOALTER'
    end
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDPESSOA, G.BANCO, G.NUMBANCO'
      
        'FROM (SELECT -1 AS IDPESSOA, '#39'PADRÃO'#39' AS BANCO, '#39'   '#39' AS NUMBANC' +
        'O'
      '      FROM DUAL'
      '      WHERE 1=1'
      '      UNION'
      '      SELECT B.IDPESSOA, P.NOME AS BANCO, B.NUMBANCO'
      '      FROM BANCO B, PESSOA P'
      '      WHERE B.IDPESSOA = P.IDPESSOA) G'
      'ORDER BY G.NUMBANCO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 2
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 481
    Top = 2
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 509
    Top = 2
  end
  object qryFavorecido: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDPESSOA, P.NOME'
      'FROM FORNSERV F, PESSOA P'
      'WHERE F.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 537
    Top = 2
  end
end
