inherited frmCadBancoPortador: TfrmCadBancoPortador
  Left = 142
  Top = 263
  HelpContext = 150077
  Caption = 'Banco x Conta de Caixa x Forma de Pagamento'
  ClientHeight = 287
  ClientWidth = 636
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 636
    Height = 219
    inherited dbGrd: TwwDBGrid [0]
      Width = 634
      Height = 217
      Selected.Strings = (
        'NUMBANCO'#9'9'#9'Nº Banco'
        'NOME'#9'24'#9'Banco'
        'DESCRICAO'#9'45'#9'Conta de Caixa X Forma de Pagamento'
        'DFLOATPAGTO'#9'5'#9'Dias')
    end
    inherited pnlControles: TPanel [1]
      Width = 634
      Height = 217
      object lblBanco: TLabel
        Left = 80
        Top = 10
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
        Left = 80
        Top = 50
        Width = 222
        Height = 13
        Caption = 'Conta de Caixa X Forma de Pagamento'
      end
      inline molFornecedor: TmolFornecedor
        Left = 72
        Top = 88
        Width = 481
        TabOrder = 2
        inherited Label5: TLabel
          Width = 64
          Caption = 'Favorecido'
        end
        inherited btnBuscaForn: TBitBtn
          Left = 424
          TabOrder = 1
          OnClick = molFornecedorbtnBuscaFornClick
        end
        inherited btnLimpaForn: TBitBtn
          Left = 448
          TabOrder = 2
        end
        inherited edtNomeFantasia: TEdit
          Left = -2
          Width = 0
          TabOrder = 3
          Visible = False
        end
        inherited edtRazaoSocial: TEdit
          Left = 8
          Width = 417
          TabOrder = 0
        end
      end
      object DBcboBanco: TwwDBLookupCombo
        Left = 80
        Top = 24
        Width = 465
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome'#9'F'
          'NUMBANCO'#9'10'#9'Número'#9'F')
        DataField = 'IDBANCO'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookBanco
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = DBcboBancoCloseUp
      end
      object DBcboPortadorForma: TwwDBLookupCombo
        Left = 80
        Top = 64
        Width = 465
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
        LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object gboxArqElet: TGroupBox
        Left = 16
        Top = 224
        Width = 601
        Height = 113
        Caption = ' Arquivo Eletrônico '
        Color = clBtnShadow
        ParentColor = False
        TabOrder = 4
        object Bevel1: TBevel
          Left = 16
          Top = 24
          Width = 177
          Height = 73
        end
        object Label4: TLabel
          Left = 112
          Top = 50
          Width = 53
          Height = 13
          Caption = 'Tamanho'
        end
        object Label5: TLabel
          Left = 32
          Top = 50
          Width = 40
          Height = 13
          Caption = 'Coluna'
        end
        object Label6: TLabel
          Left = 209
          Top = 50
          Width = 156
          Height = 13
          Caption = 'Prefixo do nome do arquivo'
        end
        object Label1: TLabel
          Left = 40
          Top = 29
          Width = 120
          Height = 13
          Caption = 'Campo Valor a Pagar'
        end
        object lblDiasArquivo: TLabel
          Left = 218
          Top = 13
          Width = 156
          Height = 30
          AutoSize = False
          Caption = 'Dias de antecipação para Data Prevista do Arquivo'
          Color = clBtnShadow
          ParentColor = False
          Visible = False
          WordWrap = True
        end
        object dbspinCol: TwwDBSpinEdit
          Left = 32
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
        object dbspinTam: TwwDBSpinEdit
          Left = 112
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
          Left = 209
          Top = 64
          Width = 206
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
      end
      object Panel1: TPanel
        Left = 80
        Top = 136
        Width = 465
        Height = 65
        TabOrder = 3
        object Label3: TLabel
          Left = 56
          Top = 28
          Width = 271
          Height = 13
          Caption = 'Dias de antecipação da Data de Vencimento:   '
        end
        object DBspnFloat: TwwDBSpinEdit
          Left = 328
          Top = 24
          Width = 65
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
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 636
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Width = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 280
      end
      inherited btnRefresh: TToolbarButton97
        Left = 286
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 311
        Width = 25
      end
    end
  end
  inherited Dock971: TDock97
    Top = 254
    Width = 636
    inherited tb97Fundo: TToolbar97
      Left = 464
      DockPos = 517
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 292
      DockPos = 345
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 408
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BANCOPORTFORMA'
      'set'
      '  IDBANCO = :IDBANCO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  DFLOATPAGTO = :DFLOATPAGTO,'
      '  COLVALOR = :COLVALOR,'
      '  TAMVALOR = :TAMVALOR,'
      '  PREFIXOARQ = :PREFIXOARQ,'
      '  IDMODULO = :IDMODULO,'
      '  IDFAVORECIDO = :IDFAVORECIDO'
      'where'
      '  IDBANCOPORTFORMA = :OLD_IDBANCOPORTFORMA'
      ' ')
    InsertSQL.Strings = (
      'insert into BANCOPORTFORMA'
      '  (IDBANCOPORTFORMA, IDBANCO, CODPORTFORMA, DFLOATPAGTO,'
      'COLVALOR, TAMVALOR,'
      '   PREFIXOARQ, IDMODULO, IDFAVORECIDO)'
      'values'
      '  (:IDBANCOPORTFORMA, :IDBANCO, :CODPORTFORMA, :DFLOATPAGTO,'
      ':COLVALOR,'
      '   :TAMVALOR, :PREFIXOARQ, :IDMODULO, :IDFAVORECIDO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from BANCOPORTFORMA'
      'where'
      '  IDBANCOPORTFORMA = :OLD_IDBANCOPORTFORMA')
    Left = 344
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 664
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 977
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 456
    Top = 0
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '   BPF.IDBANCOPORTFORMA,'
      '   BPF.IDBANCO,'
      '   BPF.CODPORTFORMA,'
      '   BPF.DFLOATPAGTO,'
      '   BPF.COLVALOR,'
      '   BPF.TAMVALOR,'
      '   BPF.PREFIXOARQ,'
      '   BPF.IDMODULO,'
      '   BPF.IDFAVORECIDO,'
      ''
      '   BAN.NUMBANCO,'
      '   PBA.NOME,'
      '   PFO.DESCRICAO'
      ''
      'FROM'
      '   PESSOA         PBA,'
      '   PORTADORFORMA  PFO,'
      '   BANCOPORTFORMA BPF,'
      '   BANCO          BAN'
      ''
      'WHERE'
      '       BPF.IDMODULO     = 15'
      '   AND BPF.IDBANCO      = BAN.IDPESSOA(+)'
      '   AND BAN.IDPESSOA     = PBA.IDPESSOA(+)'
      '   AND PFO.CODPORTFORMA = BPF.CODPORTFORMA'
      ''
      'ORDER BY'
      '   BAN.NUMBANCO, PFO.DESCRICAO'
      ' ')
    Left = 376
    Top = 0
    object qryNUMBANCO: TStringField
      DisplayLabel = 'Nº Banco'
      DisplayWidth = 9
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryNOME: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 24
      FieldName = 'NOME'
      Size = 60
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Conta de Caixa X Forma de Pagamento'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDFLOATPAGTO: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 5
      FieldName = 'DFLOATPAGTO'
    end
    object qryIDBANCOPORTFORMA: TFloatField
      DisplayWidth = 10
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
    object qryIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
    end
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   BAN.IDPESSOA, BAN.NUMBANCO,'
      '   PBA.NOME'
      'FROM'
      '   PESSOA PBA,'
      '   BANCO  BAN'
      'WHERE'
      '   BAN.IDPESSOA = PBA.IDPESSOA'
      'ORDER BY'
      '   BAN.NUMBANCO')
    ValidateWithMask = True
    Left = 264
    Top = 56
    object qryBancoNUMBANCO: TStringField
      DisplayLabel = 'Nº'
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Size = 10
    end
    object qryBancoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BANCO.IDPESSOA'
      Visible = False
    end
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODPORTFORMA, DESCRICAO'
      'FROM'
      '   PORTADORFORMA'
      'WHERE'
      '       IDPESSOA =:PIDPESSOA'
      '   AND RECPAG   = '#39'P'#39
      '   AND NVL(FLGATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   BPF.IDBANCOPORTFORMA,'
      '   BPF.IDBANCO,'
      '   BPF.CODPORTFORMA'
      ''
      'FROM'
      '   BANCOPORTFORMA BPF'
      ''
      'WHERE'
      '       BPF.IDMODULO     = 15'
      '   AND BPF.IDBANCO      =:PIDBANCO'
      '   AND BPF.CODPORTFORMA =:PCODPORTFORMA')
    ValidateWithMask = True
    Left = 560
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object qryVerificaOcorrenciaIDBANCOPORTFORMA: TFloatField
      FieldName = 'IDBANCOPORTFORMA'
      Origin = 'BASEDADOS.BANCOPORTFORMA.IDBANCOPORTFORMA'
    end
    object qryVerificaOcorrenciaIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.IDBANCO'
    end
    object qryVerificaOcorrenciaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.BANCOPORTFORMA.CODPORTFORMA'
    end
  end
  object qryVerificaFloat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   BPF.DFLOATPAGTO'
      ''
      'FROM'
      '   BANCOPORTFORMA BPF'
      ''
      'WHERE'
      '   BPF.CODPORTFORMA =:PCODPORTFORMA')
    ValidateWithMask = True
    Left = 576
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object qryVerificaFloatDFLOATPAGTO: TFloatField
      FieldName = 'DFLOATPAGTO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.DFLOATPAGTO'
    end
  end
  object qryFornecedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     NOME'
      ''
      'FROM'
      '   PESSOA'
      ''
      'WHERE'
      '   IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 576
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryFornecedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
end
