inherited frmCadGrupoRateio: TfrmCadGrupoRateio
  Left = 59
  Top = 108
  Caption = 'Cadastro de Grupos para Rateio de Lançamentos'
  ClientHeight = 417
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 730
    Height = 349
    inherited pnlMestre: TPanel
      Width = 728
      Height = 64
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Nome do Grupo'
      end
      object Label21: TLabel
        Left = 440
        Top = 10
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 616
        Top = 10
        Width = 30
        Height = 13
        Caption = 'Total'
      end
      object lblQuantImoveis: TLabel
        Left = 617
        Top = 48
        Width = 87
        Height = 13
        Caption = '000 Imóvel(eis)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBedtNomeGrupo: TDBEdit
        Left = 16
        Top = 24
        Width = 409
        Height = 21
        DataField = 'GRRDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBedtCodigo: TDBEdit2
        Left = 440
        Top = 24
        Width = 161
        Height = 21
        DataField = 'IMOCODIGO'
        DataSource = ds
        TabOrder = 1
      end
      object edtTotalRateio: TEdit
        Left = 616
        Top = 24
        Width = 89
        Height = 21
        Enabled = False
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 65
      Width = 728
      Height = 283
      Tabs.Strings = (
        'Imóveis')
      inherited pgctrlDetalhe: TPageControl
        Width = 630
        Height = 226
        TabOrder = 2
        inherited tbsDet: TTabSheet
          Caption = 'Imóveis'
          inherited pnlControlesDet: TPanel
            Width = 622
            Height = 198
            object Label10: TLabel
              Left = 296
              Top = 68
              Width = 210
              Height = 13
              Caption = 'Percentual de Rateio para o Imóvel: '
            end
            object Label2: TLabel
              Left = 16
              Top = 10
              Width = 38
              Height = 13
              Caption = 'Imóvel'
            end
            object btnBuscaImovel: TBitBtn
              Left = 568
              Top = 24
              Width = 24
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
            object DBedtNomeImovel: TDBEdit
              Left = 16
              Top = 24
              Width = 553
              Height = 21
              DataField = 'NOME_EXTENSO'
              DataSource = dsDet
              Enabled = False
              TabOrder = 0
            end
            object DBedtPercentRateio: TDBEdit
              Left = 512
              Top = 64
              Width = 81
              Height = 21
              DataField = 'GXIPERCENTRATEIO'
              DataSource = dsDet
              TabOrder = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 622
            Height = 198
            Selected.Strings = (
              'IMOCODIGO'#9'16'#9'Código'
              'NOME_EXTENSO'#9'53'#9'Imóvel'
              'GXIPERCENTRATEIO'#9'10'#9'Rateio'
              'CODTIPIMOVEL'#9'12'#9'Tipo Imóvel')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          end
        end
      end
      inherited Dock973: TDock97
        Width = 720
      end
      inherited Dock974: TDock97
        Left = 634
        Height = 226
      end
    end
  end
  inherited Dock972: TDock97
    Width = 730
    inherited Toolbar971: TToolbar97
      inherited btnTrazer: TToolbarButton97
        Enabled = True
        Visible = True
      end
      object btnCalcular: TToolbarButton97
        Left = 522
        Top = 0
        Width = 85
        Height = 29
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Ca&lcular'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
        Opaque = False
        OnClick = btnCalcularClick
      end
      object ToolbarSep976: TToolbarSep97
        Left = 516
        Top = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 550
      DockPos = 550
      inherited sep1: TToolbarSep97
        Left = 166
      end
      inherited sep3: TToolbarSep97
        Left = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 373
      DockPos = 373
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDGRUPORATEIO, GRRDESCRICAO, IMOCODIGO'
      ''
      'FROM'
      '  GRUPORATEIO'
      ''
      'WHERE'
      '  ( IDGRUPORATEIO =:PIDGRUPORATEIO )')
    Left = 208
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end>
    object qryIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
      Origin = 'GRUPORATEIO.IDGRUPORATEIO'
    end
    object qryGRRDESCRICAO: TStringField
      FieldName = 'GRRDESCRICAO'
      Origin = 'GRUPORATEIO.GRRDESCRICAO'
      Size = 60
    end
    object qryIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDetImoveis
    Left = 552
    Top = 72
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 27
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
      'update GRUPORATEIO'
      'set'
      '  GRRDESCRICAO = :GRRDESCRICAO,'
      '  IMOCODIGO = :IMOCODIGO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO')
    InsertSQL.Strings = (
      'insert into GRUPORATEIO'
      '  (IDGRUPORATEIO, GRRDESCRICAO, IMOCODIGO)'
      'values'
      '  (:IDGRUPORATEIO, :GRRDESCRICAO, :IMOCODIGO)')
    DeleteSQL.Strings = (
      'delete from GRUPORATEIO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO')
    Left = 176
    Top = 52
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'G.GRRDESCRICAO'
      'G.IMOCODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Grupo'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPORATEIO G')
    CamposChave.Strings = (
      'G.IDGRUPORATEIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '15')
    RepeteConsulta = True
    ExibePergunta = False
    Left = 392
    Top = 52
  end
  inherited ds: TwwDataSource
    Left = 240
    Top = 52
  end
  inherited ImlPadrao: TImageList
    Left = 785
    Top = 65522
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 304
    Top = 63
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 304
    Top = 51
  end
  object updDetImoveis: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO)'
      'values'
      '  (:IDGRUPORATEIO, :IDIMOVEL, :GXIPERCENTRATEIO)')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 552
    Top = 60
  end
  object qryDetImoveis: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS NOME_EXTENSO,'
      ''
      '   I.IMOCODIGO,'
      ''
      '   I.IMOAREA,'
      ''
      '   GXI.IDGRUPORATEIO, GXI.IDIMOVEL,'
      '   GXI.GXIPERCENTRATEIO, I.CODTIPIMOVEL'
      ''
      'FROM'
      '   IMOVEL I, IMOVEL IM,'
      '   GRUPOXIMOVEL GXI'
      ''
      'WHERE'
      '   ( GXI.IDGRUPORATEIO =:PIDGRUPORATEIO )'
      '   AND ( GXI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      ''
      'ORDER BY'
      '   IM.IMONOME, I.IMONOME'
      ' ')
    UpdateObject = updDetImoveis
    ValidateWithMask = True
    Left = 552
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end>
    object qryDetImoveisIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 16
      FieldName = 'IMOCODIGO'
      Origin = '"CM.IMOVEL".IMOCODIGO'
      Size = 15
    end
    object qryDetImoveisNOME_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 53
      FieldName = 'NOME_EXTENSO'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 123
    end
    object qryDetImoveisGXIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 10
      FieldName = 'GXIPERCENTRATEIO'
      Origin = 'GRUPOXIMOVEL.GXIPERCENTRATEIO'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.####'
    end
    object qryDetImoveisCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 12
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryDetImoveisIDGRUPORATEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPORATEIO'
      Origin = 'GRUPOXIMOVEL.IDGRUPORATEIO'
      Visible = False
    end
    object qryDetImoveisIDIMOVEL: TFloatField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'GRUPOXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryDetImoveisIMOAREA: TFloatField
      FieldName = 'IMOAREA'
      Visible = False
    end
  end
  object qryInsGrupoRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPORATEIO'
      '   ( IDGRUPORATEIO, GRRDESCRICAO, IMOCODIGO )'
      'VALUES'
      '   ( :PIDGRUPORATEIO, :PGRRDESCRICAO, :PIMOCODIGO )')
    ValidateWithMask = True
    Left = 56
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRRDESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryInsGrupoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPOXIMOVEL'
      '   ( IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO )'
      'VALUES'
      '   ( :PIDGRUPORATEIO, :PIDIMOVEL, :PGXIPERCENTRATEIO )'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PGXIPERCENTRATEIO'
        ParamType = ptUnknown
      end>
  end
end
