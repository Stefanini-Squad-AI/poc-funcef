inherited frmConsultMovim: TfrmConsultMovim
  Left = 11
  Top = 118
  Caption = 'Consulta a Movimentação de Bens'
  ClientHeight = 397
  ClientWidth = 761
  KeyPreview = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 761
    Height = 358
    object pnlDados: TPanel
      Left = 5
      Top = 5
      Width = 751
      Height = 140
      Align = alTop
      TabOrder = 0
      object Label17: TLabel
        Left = 168
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label24: TLabel
        Left = 8
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label18: TLabel
        Left = 400
        Top = 48
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object Label19: TLabel
        Left = 640
        Top = 8
        Width = 105
        Height = 13
        Caption = 'Data de Aquisição'
      end
      object Label26: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 13
        Caption = 'Placa de Tombamento'
      end
      object Label1: TLabel
        Left = 8
        Top = 88
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label2: TLabel
        Left = 400
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 168
        Top = 24
        Width = 465
        Height = 21
        DataField = 'DESBEM'
        DataSource = dsBem
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 640
        Top = 24
        Width = 104
        Height = 21
        DataField = 'DTAINCLUSAO'
        DataSource = dsBem
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit4: TwwDBEdit
        Left = 8
        Top = 64
        Width = 383
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsBem
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit5: TwwDBEdit
        Left = 400
        Top = 64
        Width = 344
        Height = 21
        DataField = 'DESCGRUPO'
        DataSource = dsBem
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object ePlaca: TEdit
        Left = 8
        Top = 24
        Width = 129
        Height = 21
        TabOrder = 4
        OnEnter = ePlacaEnter
        OnExit = ePlacaExit
      end
      object spdPesquisa: TBitBtn
        Left = 136
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 5
        OnClick = spdPesquisaClick
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
      object wwDBEdit3: TwwDBEdit
        Left = 8
        Top = 104
        Width = 383
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsBem
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit20: TwwDBEdit
        Left = 400
        Top = 104
        Width = 344
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = dsBem
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlExecuta: TPanel
      Left = 5
      Top = 145
      Width = 162
      Height = 208
      Align = alClient
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 16
        Top = 24
        Width = 127
        Height = 16
        Caption = 'Movimentação até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.ExtrudeEffects.FarColor = clBlue
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object eDataMov: TCMDateTimePicker
        Left = 16
        Top = 48
        Width = 121
        Height = 24
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object bitbExecuta: TBitBtn
        Left = 24
        Top = 136
        Width = 97
        Height = 33
        Caption = 'Processa'
        TabOrder = 1
        OnClick = bitbExecutaClick
        Kind = bkRetry
      end
    end
    object pnlValores: TPanel
      Left = 167
      Top = 145
      Width = 589
      Height = 208
      Align = alRight
      TabOrder = 2
      object dbgHistorico: TwwDBGrid
        Left = 1
        Top = 1
        Width = 587
        Height = 206
        Selected.Strings = (
          'DATAMOVIMENTACAO'#9'18'#9'Data'
          'DESCTIPOMOVIMENTACAO'#9'47'#9'Movimentação'#9'F'
          'VALOFI'#9'14'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsHistorico
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 761
    inherited tb97Fundo: TToolbar97
      Left = 550
      DockPos = 550
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 451
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDPESSOA,B.IDBEM,B.DESBEM, B.DTAINCLUSAO, B.PLACA, B.DA' +
        'TAINICIODEP,'
      '       G.NOME AS DESCGRUPO, C.DESCCONJUNTO, SC.NOMESUBCONTA,'
      '       L.NOME AS DESCLOCALIZACAO, P.NOME AS NOMERESPONSAVEL'
      
        'FROM BEM B, GRUPO G, CONJUNTO C, SUBCONTA SC, LOCALIZACAO L, PES' +
        'SOA P'
      'WHERE (B.IDPESSOA      = :PIDPESSOA)'
      '  AND (B.IDBEM         = :PIDBEM)'
      '  AND (B.IDGRUPO       = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO    = C.IDCONJUNTO)'
      '  AND (B.CODSUBCONTA   = SC.CODSUBCONTA(+))'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL = P.IDPESSOA(+))'
      '')
    ValidateWithMask = True
    Left = 24
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
    object qryBemDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qryBemNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
  end
  object dsBem: TwwDataSource
    DataSet = qryBem
    Left = 72
    Top = 224
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,PLACA '
      'FROM BEM '
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 125
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryPlacaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryPlacaPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HM.DATAMOVIMENTACAO,'
      '       TM.DESCTIPOMOVIMENTACAO,'
      '       HM.VALOFI'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       TIPOMOVIMENTACAO TM'
      'WHERE (HM.IDBEM              = :PIDBEM)'
      '  AND (HM.IDPESSOA           = :PIDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO  <= :PDATAMOV)'
      '  AND (TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO)'
      'ORDER BY HM.DATAMOVIMENTACAO, HM.IDMOVIMENTACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryHistoricoDATAMOVIMENTACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
    object qryHistoricoDESCTIPOMOVIMENTACAO: TStringField
      DisplayLabel = 'Movimentação'
      DisplayWidth = 47
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Origin = 'BASEDADOS.TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryHistoricoVALOFI: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALOFI'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.VALOFI'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsHistorico: TwwDataSource
    DataSet = qryHistorico
    Left = 256
    Top = 296
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.BAIXATOTAL'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Bens Baixados (S/N)'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '1'
      '20'
      '60'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 64
    Top = 320
  end
end
