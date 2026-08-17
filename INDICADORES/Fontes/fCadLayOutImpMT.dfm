inherited FrmCadLayOutImpMT: TFrmCadLayOutImpMT
  Left = 233
  Top = 54
  HelpContext = 4390031
  Caption = 'Cadastro de Layout para importação de planilhas'
  ClientHeight = 433
  ClientWidth = 509
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 509
    Height = 347
    inherited pnlMestre: TPanel
      Width = 507
      Height = 156
      object LblColContrato: TLabel
        Left = 202
        Top = 79
        Width = 62
        Height = 26
        Caption = 'Coluna do Contrato'
        Visible = False
        WordWrap = True
      end
      object GroupBox4: TGroupBox
        Left = 9
        Top = 6
        Width = 449
        Height = 65
        Caption = 'Layout de Importação'
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 17
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object dbedtDescricao: TwwDBEdit
          Left = 8
          Top = 33
          Width = 433
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object dbrgPosicao: TDBRadioGroup
        Left = 9
        Top = 75
        Width = 177
        Height = 35
        Caption = 'Indicador posicionado por: '
        Columns = 2
        DataField = 'FLGPOSICAO'
        DataSource = ds
        Items.Strings = (
          'Coluna'
          'Linha')
        TabOrder = 1
        Values.Strings = (
          'C'
          'L')
        OnChange = dbrgPosicaoChange
      end
      object dbcbColunaContrato: TwwDBComboBox
        Left = 202
        Top = 107
        Width = 70
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'POSCONTRATO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'A'#9'1'
          'B'#9'2'
          'C'#9'3'
          'D'#9'4'
          'E'#9'5'
          'F'#9'6'
          'G'#9'7'
          'H'#9'8'
          'I'#9'9'
          'J'#9'10'
          'K'#9'11'
          'L'#9'12'
          'M'#9'13'
          'N'#9'14'
          'O'#9'15'
          'P'#9'16'
          'Q'#9'17'
          'R'#9'18'
          'S'#9'19'
          'T'#9'20'
          'U'#9'21'
          'V'#9'22'
          'X'#9'23'
          'W'#9'24'
          'Y'#9'25'
          'Z'#9'26')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
        Visible = False
        OnChange = dbcbColunaContratoChange
      end
      object dbrgTipoIndicador: TDBRadioGroup
        Left = 9
        Top = 114
        Width = 177
        Height = 35
        Caption = 'Indicador informado por: '
        Columns = 2
        DataField = 'FLGTIPOINDICADOR'
        DataSource = ds
        Items.Strings = (
          'Descrição'
          'Código')
        TabOrder = 2
        Values.Strings = (
          'D'
          'C')
        Visible = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 157
      Width = 507
      Height = 189
      Tabs.Strings = (
        'Indicadores')
      inherited pgctrlDetalhe: TPageControl
        Width = 409
        Height = 130
        inherited tbsDet: TTabSheet
          Caption = 'Indicadores'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 401
            Height = 102
            Selected.Strings = (
              'DESCRICAO'#9'42'#9'Descrição'
              'DSC_COLUNA'#9'6'#9'Coluna')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 401
            Height = 102
            object Label2: TLabel
              Left = 14
              Top = 47
              Width = 40
              Height = 13
              Caption = 'Coluna'
            end
            inline molIndicador1: TmolIndicador
              Left = 5
              Top = 2
            end
            object dbcbPosIndicador: TwwDBComboBox
              Left = 13
              Top = 61
              Width = 70
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'POSINDICADOR'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'A'#9'1'
                'B'#9'2'
                'C'#9'3'
                'D'#9'4'
                'E'#9'5'
                'F'#9'6'
                'G'#9'7'
                'H'#9'8'
                'I'#9'9'
                'J'#9'10'
                'K'#9'11'
                'L'#9'12'
                'M'#9'13'
                'N'#9'14'
                'O'#9'15'
                'P'#9'16'
                'Q'#9'17'
                'R'#9'18'
                'S'#9'19'
                'T'#9'20'
                'U'#9'21'
                'V'#9'22'
                'X'#9'23'
                'W'#9'24'
                'Y'#9'25'
                'Z'#9'26')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 499
      end
      inherited Dock974: TDock97
        Left = 413
        Height = 130
      end
    end
    object GrpDados: TGroupBox
      Left = 202
      Top = 80
      Width = 175
      Height = 74
      Caption = 'Colunas de Dados'
      TabOrder = 2
      Visible = False
      object Label8: TLabel
        Left = 15
        Top = 15
        Width = 54
        Height = 13
        Caption = 'Indicador'
      end
      object Label9: TLabel
        Left = 93
        Top = 15
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object dbcbColIndicador: TwwDBComboBox
        Left = 14
        Top = 29
        Width = 70
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'POSINDICADOR'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'A'#9'1'
          'B'#9'2'
          'C'#9'3'
          'D'#9'4'
          'E'#9'5'
          'F'#9'6'
          'G'#9'7'
          'H'#9'8'
          'I'#9'9'
          'J'#9'10'
          'K'#9'11'
          'L'#9'12'
          'M'#9'13'
          'N'#9'14'
          'O'#9'15'
          'P'#9'16'
          'Q'#9'17'
          'R'#9'18'
          'S'#9'19'
          'T'#9'20'
          'U'#9'21'
          'V'#9'22'
          'X'#9'23'
          'W'#9'24'
          'Y'#9'25'
          'Z'#9'26')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dbcbColValor: TwwDBComboBox
        Left = 92
        Top = 29
        Width = 70
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'POSVALOR'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'A'#9'1'
          'B'#9'2'
          'C'#9'3'
          'D'#9'4'
          'E'#9'5'
          'F'#9'6'
          'G'#9'7'
          'H'#9'8'
          'I'#9'9'
          'J'#9'10'
          'K'#9'11'
          'L'#9'12'
          'M'#9'13'
          'N'#9'14'
          'O'#9'15'
          'P'#9'16'
          'Q'#9'17'
          'R'#9'18'
          'S'#9'19'
          'T'#9'20'
          'U'#9'21'
          'V'#9'22'
          'X'#9'23'
          'W'#9'24'
          'Y'#9'25'
          'Z'#9'26')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 509
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 509
    inherited tb97Fundo: TToolbar97
      Left = 337
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 168
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 82
    Top = 406
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 407
    Top = 56
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 406
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 452
    Top = 56
  end
  inherited Cds: TCMClientDataSet
    Left = 374
    Top = 56
    object CdsIDLAYOUTIMP: TFloatField
      FieldName = 'IDLAYOUTIMP'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsPOSINDICADOR: TFloatField
      FieldName = 'POSINDICADOR'
    end
    object CdsPOSVALOR: TFloatField
      FieldName = 'POSVALOR'
    end
    object CdsFLGPOSICAO: TStringField
      FieldName = 'FLGPOSICAO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPOINDICADOR: TStringField
      FieldName = 'FLGTIPOINDICADOR'
      FixedChar = True
      Size = 1
    end
    object CdsPOSCONTRATO: TFloatField
      FieldName = 'POSCONTRATO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'INDLAYOUTIMP')
    CamposChave.Strings = (
      'IDLAYOUTIMP'
      'DESCRICAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 264
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnFind = CmeDetalheFind
    Left = 286
    Top = 303
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 232
    Top = 303
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '/*'
      'SELECT IDLAYOUTIMP, DESCRICAO,'
      '       POSINDICADOR, POSVALOR, POSCONTRATO,'
      '       FLGPOSICAO, FLGTIPOINDICADOR'
      '  FROM INDLAYOUTIMP'
      ' WHERE 1=2'
      '*/'
      ''
      '/*'
      'SELECT IL.IDLAYOUTIMP,'
      '       IL.IDINDICADOR,'
      '       IL.POSINDICADOR,'
      '       ID.DESCRICAO'
      '  FROM INDLAYOUTXIND IL,'
      '       INDINDICADOR ID'
      ' WHERE 1=2'
      '   AND IL.IDINDICADOR = ID.IDINDICADOR'
      '*/'
      ''
      'SELECT IL.IDLAYOUTIMP,  IL.IDINDICADOR,'
      '       IL.POSINDICADOR, ID.DESCRICAO,'
      '       DECODE(IL.POSINDICADOR,1,'#39'A'#39','
      '                              2,'#39'B'#39','
      '                              NULL) AS DSC_COLUNA'
      '  FROM INDLAYOUTXIND IL,INDINDICADOR ID'
      ' WHERE IL.IDINDICADOR = ID.IDINDICADOR(+)'
      '   AND 1=2'
      ''
      '')
    Left = 344
    Top = 7
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUTIMP'
        DataType = ftFloat
      end
      item
        Name = 'IDINDICADOR'
        DataType = ftFloat
      end
      item
        Name = 'POSINDICADOR'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DSC_COLUNA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 189
    Top = 303
    object cdsDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 42
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsDetDSC_COLUNA: TStringField
      DisplayLabel = 'Coluna'
      DisplayWidth = 6
      FieldName = 'DSC_COLUNA'
      Size = 1
    end
    object cdsDetPOSINDICADOR: TFloatField
      DisplayLabel = 'Coluna'
      DisplayWidth = 7
      FieldName = 'POSINDICADOR'
      Visible = False
    end
    object cdsDetIDINDICADOR: TFloatField
      DisplayLabel = 'Indicador'
      DisplayWidth = 37
      FieldName = 'IDINDICADOR'
      Visible = False
    end
    object cdsDetIDLAYOUTIMP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLAYOUTIMP'
      Visible = False
    end
  end
end
