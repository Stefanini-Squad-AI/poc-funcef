inherited frmCadImovelXBem: TfrmCadImovelXBem
  Left = 186
  Top = 233
  HelpContext = 540086
  Caption = 'Cadastro de Bens por Imóvel'
  ClientHeight = 362
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 329
    inherited Panel1: TPanel
      Width = 737
      inline molImovel1: TmolImovel
        Left = 8
        Top = 8
        Width = 561
        inherited edtImovel: TEdit
          Width = 497
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 504
          OnClick = molImovel1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 528
          Enabled = False
        end
      end
    end
    inherited pgc: TPageControl
      Width = 737
      Height = 269
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 729
        end
        inherited pnlControles: TPanel
          Width = 729
          Height = 90
          object Label3: TLabel
            Left = 16
            Top = 10
            Width = 113
            Height = 13
            Caption = 'Nº de Tombamento '
          end
          object Label48: TLabel
            Left = 176
            Top = 10
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label1: TLabel
            Left = 16
            Top = 50
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object Bevel1: TBevel
            Left = 304
            Top = 73
            Width = 401
            Height = 2
            Shape = bsTopLine
          end
          object DBedtPlaca: TDBRealEdit
            Left = 16
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            OnExit = DBedtPlacaExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
            DataField = 'Placa'
            DataSource = ds
          end
          object btnBuscaBem: TBitBtn
            Left = 136
            Top = 24
            Width = 23
            Height = 22
            TabOrder = 1
            OnClick = btnBuscaBemClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
              777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
              77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
              77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
              077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
              FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
              F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
              7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
              777777787FFF8777777777770000777777777777888877777777}
            NumGlyphs = 2
          end
          object DBedtDescricaoBem: TDBEdit
            Left = 176
            Top = 24
            Width = 529
            Height = 21
            DataField = 'Desc'
            DataSource = ds
            Enabled = False
            TabOrder = 2
          end
          object DBcboGrupo: TwwDBComboBox
            Left = 16
            Top = 64
            Width = 273
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = False
            DataField = 'IXBGRUPO'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Ar-Condicionado'#9'A'
              'Edificacão'#9'E'
              'Instalações Gerais'#9'I'
              'Instalações Elétricas'#9'L'
              'Máquinas e Equipamentos'#9'M'
              'Móveis e Utensílios'#9'O'
              'Terreno'#9'T'
              'Utilitários'#9'U'
              'Veículos'#9'V')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
        end
        inherited pnlGrd: TPanel
          Top = 121
          Width = 729
          Height = 138
          inherited DBgrd: TwwDBGrid
            Width = 689
            Selected.Strings = (
              'Placa'#9'14'#9'Nº Tombamento'
              'Desc'#9'47'#9'Descrição'
              'Grupo'#9'27'#9'Grupo')
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 329
    Width = 737
  end
  inherited ds: TwwDataSource
    Left = 408
    Top = 16
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 464
    Top = 16
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVELXBEM'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IXBGRUPO = :IXBGRUPO,'
      '  IXBPERCENT = :IXBPERCENT'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into IMOVELXBEM'
      '  (IDIMOVEL, IDBEM, IDPESSOA, IXBGRUPO, IXBPERCENT)'
      'values'
      '  (:IDIMOVEL, :IDBEM, :IDPESSOA, :IXBGRUPO, :IXBPERCENT)')
    DeleteSQL.Strings = (
      'delete from IMOVELXBEM'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 344
    Top = 16
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IDPESSOA,'
      '   IXB.IXBGRUPO, IXB.IXBPERCENT'
      'FROM'
      '   IMOVELXBEM IXB, BEM B'
      'WHERE'
      '   ( IXB.IDPESSOA =:PEMPRESAPROP )'
      '   AND ( IXB.IDIMOVEL =:PIDIMOVEL )'
      '   AND ( IXB.IDBEM = B.IDBEM )'
      ' ')
    Left = 376
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryPlaca: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Placa'
      DisplayFormat = '###########0'
      EditFormat = '###########0'
      Calculated = True
    end
    object qryDesc: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 47
      FieldKind = fkCalculated
      FieldName = 'Desc'
      Size = 200
      Calculated = True
    end
    object qryGrupo: TStringField
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'Grupo'
      Size = 25
      Calculated = True
    end
    object qryIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.IMOVELXBEM.IDBEM'
      Visible = False
    end
    object qryIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.IMOVELXBEM.IDIMOVEL'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.IMOVELXBEM.IDPESSOA'
      Visible = False
    end
    object qryIXBGRUPO: TStringField
      DisplayWidth = 1
      FieldName = 'IXBGRUPO'
      Origin = 'BASEDADOS.IMOVELXBEM.IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Origin = 'BASEDADOS.IMOVELXBEM.IXBPERCENT'
      Visible = False
    end
  end
  object qryBuscaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDPESSOA, PLACA, DESBEM'
      'FROM'
      '   BEM'
      'WHERE'
      '   ( PLACA =:PPLACA )'
      '')
    ValidateWithMask = True
    Left = 536
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryBuscaBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryBuscaBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryBuscaBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryBuscaBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
  end
  object qryPreencheBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDPESSOA, PLACA, DESBEM'
      'FROM'
      '   BEM'
      'WHERE'
      '   ( IDBEM =:PIDBEM )'
      '')
    ValidateWithMask = True
    Left = 536
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryPreencheBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryPreencheBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryPreencheBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryPreencheBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
  end
end
