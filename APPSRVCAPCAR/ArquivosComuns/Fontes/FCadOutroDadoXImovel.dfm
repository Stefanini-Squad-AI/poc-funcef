inherited frmCadOutroDadoXImovel: TfrmCadOutroDadoXImovel
  Top = 132
  Caption = 'Cadastro de Dados Complementares de Imóveis'
  ClientHeight = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 329
    inherited Panel1: TPanel
      object Label2: TLabel
        Left = 16
        Top = 10
        Width = 38
        Height = 13
        Caption = 'Imóvel'
      end
      object btnBuscaImovel: TBitBtn
        Left = 624
        Top = 23
        Width = 23
        Height = 22
        Hint = 'Busca um Imóvel'
        TabOrder = 1
        OnClick = btnBuscaImovelClick
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
      object edtNomeExtenso: TEdit
        Left = 16
        Top = 24
        Width = 609
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    inherited pgc: TPageControl
      Height = 267
      inherited tbs: TTabSheet
        Caption = 'Dados Complementares de Imóveis'
        inherited pnlControles: TPanel
          Height = 62
          object Bevel1: TBevel
            Left = 16
            Top = 56
            Width = 625
            Height = 2
            Shape = bsTopLine
          end
          object Label3: TLabel
            Left = 16
            Top = 10
            Width = 161
            Height = 13
            Caption = 'Tipo de Dado Complementar'
          end
          object Label4: TLabel
            Left = 288
            Top = 10
            Width = 197
            Height = 13
            Caption = '"Valor" para o Imóvel Selecionado'
          end
          object DBcboOutroDado: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 257
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'ODODESCRICAO'#9'40'#9'ODODESCRICAO'#9'No')
            DataField = 'IDOUTRODADO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookOutroDadoXTipoImo
            LookupField = 'IDOUTRODADO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
            OnCloseUp = DBcboOutroDadoCloseUp
          end
          object DBedtValor: TDBEdit
            Left = 288
            Top = 24
            Width = 353
            Height = 21
            DataField = 'ODIVALOR'
            DataSource = ds
            TabOrder = 1
            OnChange = DBedtValorChange
          end
        end
        inherited pnlGrd: TPanel
          Top = 93
          Height = 164
          inherited DBgrd: TwwDBGrid
            Top = 8
            Height = 129
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 329
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OUTRODADOXIMOVEL'
      'set'
      '  ODIVALOR = :ODIVALOR'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    InsertSQL.Strings = (
      'insert into OUTRODADOXIMOVEL'
      '  (IDIMOVEL, IDOUTRODADO, ODIVALOR)'
      'values'
      '  (:IDIMOVEL, :IDOUTRODADO, :ODIVALOR)')
    DeleteSQL.Strings = (
      'delete from OUTRODADOXIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    Left = 528
    Top = 21
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   OX.IDIMOVEL, OX.IDOUTRODADO, OX.ODIVALOR,'
      '   O.ODODESCRICAO'
      ''
      'FROM'
      '   OUTRODADOXIMOVEL OX, OUTRODADO O'
      ''
      'WHERE'
      '   ( OX.IDIMOVEL =:PIDIMOVEL )'
      '   AND ( OX.IDOUTRODADO = O.IDOUTRODADO )'
      ''
      'ORDER BY'
      '   O.ODODESCRICAO')
    Left = 560
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 30
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
    object qryODIVALOR: TStringField
      DisplayLabel = ' '
      DisplayWidth = 43
      FieldName = 'ODIVALOR'
      Origin = 'OUTRODADOXIMOVEL.ODIVALOR'
      Size = 60
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'OUTRODADOXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADOXIMOVEL.IDOUTRODADO'
      Visible = False
    end
  end
  inherited ds: TwwDataSource
    Left = 592
    Top = 21
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 485
    Top = 21
  end
end
