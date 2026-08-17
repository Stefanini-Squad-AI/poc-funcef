inherited frmCadUnidadeAutonoma: TfrmCadUnidadeAutonoma
  Left = 13
  Top = 134
  HelpContext = 640074
  Caption = 'Unidades Autônomas'
  ClientHeight = 377
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 309
    TabOrder = 1
    object pgctrlDetalhe: TPageControl
      Left = 1
      Top = 1
      Width = 750
      Height = 307
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Dados Gerais'
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label2: TLabel
          Left = 168
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label4: TLabel
          Left = 616
          Top = 50
          Width = 38
          Height = 13
          Caption = 'Rateio'
          Enabled = False
          Visible = False
        end
        object Label5: TLabel
          Left = 16
          Top = 50
          Width = 38
          Height = 13
          Caption = 'Imóvel'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 96
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label6: TLabel
          Left = 16
          Top = 202
          Width = 84
          Height = 13
          Caption = 'Administradora'
        end
        object Label7: TLabel
          Left = 16
          Top = 106
          Width = 99
          Height = 13
          Caption = 'Marca / Franquia'
        end
        object Label3: TLabel
          Left = 16
          Top = 146
          Width = 54
          Height = 13
          Caption = 'Atividade'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 192
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Bevel3: TBevel
          Left = 455
          Top = 120
          Width = 3
          Height = 61
          Shape = bsLeftLine
        end
        object Label9: TLabel
          Left = 472
          Top = 106
          Width = 60
          Height = 13
          Caption = 'Área Total'
        end
        object Label10: TLabel
          Left = 472
          Top = 146
          Width = 110
          Height = 13
          Caption = 'Área Bruta Locável'
        end
        object DBedtNome: TDBEdit
          Left = 168
          Top = 24
          Width = 553
          Height = 21
          DataField = 'UNANOME'
          DataSource = ds
          TabOrder = 1
        end
        object DBedtMatricula: TDBEdit
          Left = 16
          Top = 24
          Width = 137
          Height = 21
          DataField = 'UNAMATRICULA'
          DataSource = ds
          TabOrder = 0
        end
        object DBedtRateio: TDBEdit
          Left = 616
          Top = 64
          Width = 105
          Height = 21
          DataField = 'UNAPERCENTRATEIO'
          DataSource = ds
          Enabled = False
          TabOrder = 4
          Visible = False
        end
        object DBedtImovel: TDBEdit
          Left = 16
          Top = 64
          Width = 561
          Height = 21
          DataField = 'IMOVEL_EXTENSO'
          DataSource = ds
          Enabled = False
          TabOrder = 2
        end
        object btnBuscaImovel: TBitBtn
          Left = 576
          Top = 63
          Width = 23
          Height = 22
          Hint = 'Busca um Imóvel'
          TabOrder = 3
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
        object DBcboMarca: TwwDBLookupCombo
          Left = 16
          Top = 120
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MRCNOME'#9'40'#9'Marca')
          DataField = 'IDMARCA'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookMarca
          LookupField = 'IDMARCA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboAtividade: TwwDBLookupCombo
          Left = 16
          Top = 160
          Width = 425
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ATVDESCRICAO'#9'45'#9'Atividade')
          DataField = 'IDATIVIDADE'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookAtividade
          LookupField = 'IDATIVIDADE'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object DBedtAdministradora: TDBEdit
          Left = 16
          Top = 216
          Width = 537
          Height = 21
          DataField = 'NF_ADMIN'
          DataSource = ds
          Enabled = False
          TabOrder = 10
        end
        object btnBuscaAdmin: TBitBtn
          Left = 553
          Top = 216
          Width = 23
          Height = 22
          Hint = 'Busca uma Administradora'
          TabOrder = 11
          OnClick = btnBuscaAdminClick
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
        object btnLimpaAdmin: TBitBtn
          Left = 576
          Top = 216
          Width = 23
          Height = 22
          Hint = 'Limpa a Administradora indicada'
          TabOrder = 12
          OnClick = btnLimpaAdminClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object DBrdgTipoUnidade: TDBRadioGroup
          Left = 608
          Top = 113
          Width = 113
          Height = 69
          DataField = 'FLGTIPOUNIDADE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Loja Âncora'
            'Loja Satélite'
            'Quiosque')
          ParentFont = False
          TabOrder = 9
          TabStop = True
          Values.Strings = (
            'A'
            'S'
            'Q')
        end
        object DBedtAreaTotal: TDBEdit
          Left = 472
          Top = 120
          Width = 121
          Height = 21
          DataField = 'UNAAREA'
          DataSource = ds
          TabOrder = 7
          OnExit = DBedtAreaTotalExit
        end
        object DBedtAreaGerencial: TDBEdit
          Left = 472
          Top = 160
          Width = 121
          Height = 21
          DataField = 'UNAAREAGERENCIAL'
          DataSource = ds
          TabOrder = 8
        end
      end
      object tbsDet: TTabSheet
        Caption = 'Dados Complementares'
        object DBgrdOutroDadoXImovel: TwwDBGrid2
          Left = 0
          Top = 0
          Width = 740
          Height = 277
          Selected.Strings = (
            'ODODESCRICAO'#9'40'#9'Tipo de Dado Complementar'
            'ODUVALOR'#9'47'#9'"Valor"')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsOutroDadoXUnidAut
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsIndicadores: TTabSheet
        Caption = 'Indicadores'
        object DBgrdIndicador: TwwDBGrid2
          Left = 16
          Top = 48
          Width = 705
          Height = 193
          Selected.Strings = (
            'DATAAPURADO'#9'18'#9'Data'
            'INMDESCRICAO'#9'44'#9'Descrição'
            'VLRAPURADO'#9'13'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsIndicador
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object btnPorData: TfcShapeBtn
          Left = 152
          Top = 8
          Width = 217
          Height = 29
          Caption = 'Ordenar por Data de medição'
          Color = clBtnFace
          DitherColor = clWhite
          Down = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888FFFFFF88888F8881111118888808888777777F88887FF8811888188887
            0788877FF878888777F888118888888000888877FF88888777FF888118888870
            007888877FF88877777F888811888800000888F877FF88777778818881188888
            088887FFF77F88887F8881111118888808888777777888887F88888888888888
            088888FFF8FFF8887F88844484448888088887778777F8887F88874888478888
            0888877FFF7788887F8888444448888808888877777F88887F88887484788888
            08888877F77888887F888884448888880888888777F888887F88888747888888
            08888887778888887F8888884888888808888888788888887888}
          GroupIndex = 1
          Margin = 12
          NumGlyphs = 2
          ParentClipping = True
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          Spacing = 6
          TabOrder = 1
          TextOptions.Alignment = taLeftJustify
          TextOptions.LineSpacing = 2
          TextOptions.OutlineColor = clNone
          TextOptions.VAlignment = vaVCenter
          TextOptions.WordWrap = True
          OnClick = btnPorDataClick
        end
        object btnPorTipo: TfcShapeBtn
          Left = 368
          Top = 8
          Width = 217
          Height = 29
          Caption = 'Ordenar por Tipo de Indicador'
          Color = clBtnFace
          DitherColor = clWhite
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888FFF8FFF8888F88844484448888088887778777F8887FF8874888478887
            0788877FFF77888777F888444448888000888877777F888777FF887484788870
            00788877F7788877777F8884448888000008888777F888777778888747888888
            08888887778888887F8888884888888808888888788888887F88888888888888
            088888FFFFFF88887F8881111118888808888777777F88887F88811888188888
            0888877FF87888887F8888118888888808888877FF8888887F88888118888888
            088888877FF888887F88888811888888088888F877FF88887F88818881188888
            088887FFF77F88887F8881111118888808888777777888887888}
          GroupIndex = 1
          Margin = 12
          NumGlyphs = 2
          ParentClipping = True
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          Spacing = 6
          TabOrder = 2
          TextOptions.Alignment = taLeftJustify
          TextOptions.LineSpacing = 2
          TextOptions.OutlineColor = clNone
          TextOptions.VAlignment = vaVCenter
          TextOptions.WordWrap = True
          OnClick = btnPorTipoClick
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 344
    Width = 752
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update UNIDAUT'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDMARCA = :IDMARCA,'
      '  IDADMINIMOVEL = :IDADMINIMOVEL,'
      '  IDATIVIDADE = :IDATIVIDADE,'
      '  UNANOME = :UNANOME,'
      '  UNAMATRICULA = :UNAMATRICULA,'
      '  UNAPERCENTRATEIO = :UNAPERCENTRATEIO,'
      '  FLGTIPOUNIDADE = :FLGTIPOUNIDADE,'
      '  UNAAREA = :UNAAREA,'
      '  UNAAREAGERENCIAL = :UNAAREAGERENCIAL'
      'where'
      '  IDUNIDAUT = :OLD_IDUNIDAUT')
    InsertSQL.Strings = (
      'insert into UNIDAUT'
      
        '  (IDUNIDAUT, IDIMOVEL, IDMARCA, IDADMINIMOVEL, IDATIVIDADE, UNA' +
        'NOME, UNAMATRICULA, '
      '   UNAPERCENTRATEIO, FLGTIPOUNIDADE, UNAAREA, UNAAREAGERENCIAL)'
      'values'
      
        '  (:IDUNIDAUT, :IDIMOVEL, :IDMARCA, :IDADMINIMOVEL, :IDATIVIDADE' +
        ', :UNANOME, '
      
        '   :UNAMATRICULA, :UNAPERCENTRATEIO, :FLGTIPOUNIDADE, :UNAAREA, ' +
        ':UNAAREAGERENCIAL)')
    DeleteSQL.Strings = (
      'delete from UNIDAUT'
      'where'
      '  IDUNIDAUT = :OLD_IDUNIDAUT')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Unidade Autônoma')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDAUT U'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'U.IDUNIDAUT')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'U.IDIMOVEL = I.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '25'
      '25')
    Left = 416
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 342
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   U.IDUNIDAUT,'
      ''
      '   U.IDIMOVEL,'
      '   U.IDMARCA, U.IDADMINIMOVEL, U.IDATIVIDADE,'
      ''
      '   U.UNANOME, U.UNAMATRICULA,'
      '   U.UNAPERCENTRATEIO, U.FLGTIPOUNIDADE,'
      '   U.UNAAREA, U.UNAAREAGERENCIAL,'
      ''
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      '   PA.NOME AS NF_ADMIN, PA.RAZAOSOCIAL AS RS_ADMIN'
      ''
      'FROM'
      '   PESSOA PA, ADMINIMOVEL A,'
      '   UNIDAUT U, IMOVEL I, IMOVEL IM'
      ''
      'WHERE'
      '   ( U.IDUNIDAUT =:PIDUNIDAUT )'
      '   AND ( U.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( U.IDADMINIMOVEL = A.IDADMINIMOVEL(+) )'
      '   AND ( A.IDADMINIMOVEL = PA.IDPESSOA(+) )')
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end>
    object qryIDUNIDAUT: TFloatField
      FieldName = 'IDUNIDAUT'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object qryIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object qryUNANOME: TStringField
      FieldName = 'UNANOME'
      Size = 60
    end
    object qryUNAMATRICULA: TStringField
      FieldName = 'UNAMATRICULA'
    end
    object qryUNAPERCENTRATEIO: TFloatField
      FieldName = 'UNAPERCENTRATEIO'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.0000'
    end
    object qryFLGTIPOUNIDADE: TStringField
      DefaultExpression = 'S'
      FieldName = 'FLGTIPOUNIDADE'
      Size = 1
    end
    object qryIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryUNAAREA: TFloatField
      FieldName = 'UNAAREA'
      DisplayFormat = '###,###,##0.00 m2'
      EditFormat = '###,###,##0.00'
    end
    object qryUNAAREAGERENCIAL: TFloatField
      FieldName = 'UNAAREAGERENCIAL'
      DisplayFormat = '###,###,##0.00 m2'
      EditFormat = '###,###,##0.00'
    end
    object qryNF_ADMIN: TStringField
      FieldName = 'NF_ADMIN'
      Size = 60
    end
    object qryRS_ADMIN: TStringField
      FieldName = 'RS_ADMIN'
      Size = 60
    end
  end
  object dsIndicador: TwwDataSource
    DataSet = dtmLookImobiliario.qryLookIndicadorPorData
    Left = 656
  end
  object dsOutroDadoXUnidAut: TwwDataSource
    DataSet = qryOutroDadoXUnidAut
    Left = 536
    Top = 12
  end
  object qryOutroDadoXUnidAut: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OXU.IDUNIDAUT, OXU.IDOUTRODADO, OXU.ODUVALOR,'
      '   O.ODODESCRICAO'
      ''
      'FROM'
      '   OUTRODADOXUNIDAUT OXU, OUTRODADO O'
      ''
      'WHERE'
      '   ( OXU.IDUNIDAUT =:PIDUNIDAUT )'
      '   AND ( OXU.IDOUTRODADO = O.IDOUTRODADO )'
      ''
      'ORDER BY'
      '   O.ODODESCRICAO')
    ValidateWithMask = True
    Left = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end>
    object qryOutroDadoXUnidAutODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
    object qryOutroDadoXUnidAutODUVALOR: TStringField
      DisplayLabel = '"Valor"'
      DisplayWidth = 47
      FieldName = 'ODUVALOR'
      Origin = 'OUTRODADOXUNIDAUT.ODUVALOR'
      Size = 60
    end
    object qryOutroDadoXUnidAutIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADOXUNIDAUT.IDOUTRODADO'
      Visible = False
    end
    object qryOutroDadoXUnidAutIDUNIDAUT: TFloatField
      FieldName = 'IDUNIDAUT'
      Origin = 'OUTRODADOXUNIDAUT.IDUNIDAUT'
      Visible = False
    end
  end
end
