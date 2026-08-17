inherited FrmGeraParcelaCont: TFrmGeraParcelaCont
  Left = 2
  Top = 67
  Caption = 'Geração de Parcelas do Contrato'
  ClientHeight = 424
  ClientWidth = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 385
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Nº do Contrato'
      FocusControl = edNumCont
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 85
      Height = 13
      Caption = 'Nome Contrato'
      FocusControl = edNomeCont
    end
    object Label3: TLabel
      Left = 16
      Top = 112
      Width = 61
      Height = 13
      Caption = 'Comprador'
      FocusControl = edNomeCont
    end
    object edNumCont: TDBEdit
      Left = 16
      Top = 32
      Width = 161
      Height = 21
      Color = clGray
      DataField = 'CONNUMERO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edNomeCont: TDBEdit
      Left = 16
      Top = 80
      Width = 729
      Height = 21
      Color = clGray
      DataField = 'CONNOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edComprador: TDBEdit
      Left = 16
      Top = 128
      Width = 729
      Height = 21
      Color = clGray
      DataField = 'RAZAOSOCIAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 5
      Top = 160
      Width = 758
      Height = 220
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Demonstração'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object grd: TwwDBGrid
        Left = 0
        Top = 28
        Width = 758
        Height = 192
        Selected.Strings = (
          'NUMPARCELA'#9'3'#9'Nº da ~Parcela'
          'VLRSALDODEVEDOR'#9'10'#9'Saldo~Devedor'
          'VLRJUROS'#9'10'#9'Juros'
          'VLRAMORTIZACAO'#9'10'#9'Amortização'
          'VLRPRESTACAO'#9'10'#9'Prestação'
          'DATAVENCIMENTO'#9'10'#9'Vencimento'
          'VLRPRESTATUALIZADA'#9'10'#9'Prestação~Atualizada'
          'VLRRESIDUO'#9'10'#9'Resíduo'
          'VLRRESIDUOATUALI'#9'10'#9'Resíduo~Atualizado'
          'FATOR'#9'10'#9'Fator')
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsParc
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 438
      DockPos = 438
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep971: TToolbarSep97 [2]
        Left = 244
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 164
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
      end
      object btnBuscar: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Buscar'
        TabOrder = 2
        OnClick = btnBuscarClick
        Glyph.Data = {
          16010000424D1601000000000000760000002800000010000000140000000100
          040000000000A000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888880088888888888880910888888888888089108888888888880890000088
          88888880800FFF088888888800FFFFF0888888880FFFFFFF0888870008888888
          0088800B0F8F8F8F0B088007B0F8F8F0B70880B07B0F8F0B7B0880F0B7B777B7
          B7B080BF0B7B7B7B7B7080FBF0000000000880BFBFBFBFBFB08880FBFBFBFBFB
          F08880BFB0000000078887000788888888888888888888888888}
      end
      object btnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gerar'
        Enabled = False
        TabOrder = 3
        OnClick = btnGerarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 11
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta'
      'Data de Aniverssário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'V'#39)
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 493
    Top = 16
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.CONDATAASSINATURA,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.CONPERCENTMORA,'
      '     CI.CONPERMORA,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.CONPERREAJUSTE,'
      '     CI.CONPERCENTMULTA,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEMORA,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     CI.CONDIASTOLERANCIA,'
      '     CI.IDLOCATARIO,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '     PESSOA P,'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '       (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '   AND (CI.IDLOCATARIO = P.IDPESSOA)')
    Params.Data = {
      01000100104944434F4E545241544F494D4F56454C0006080000000000000000
      000100}
    ValidateWithMask = True
    Left = 272
    Top = 8
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAASSINATURA'
    end
    object qryCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Size = 1
    end
    object qryCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERCENTMORA'
    end
    object qryCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERMORA'
      Size = 1
    end
    object qryCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
    end
    object qryCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONPERREAJUSTE'
    end
    object qryCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERCENTMULTA'
    end
    object qryCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
    end
    object qryCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
    end
    object qryVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
    end
    object qryVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
    end
    object qryCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
    end
    object qryCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = '"CM.CONTRATOIMOVEL".CONDIASTOLERANCIA'
    end
    object qryIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'CONTRATOIMOVEL.IDLOCATARIO'
    end
    object qryRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 307
    Top = 8
  end
  object qryDet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CXI.IDIMOVEL,'
      '    CXI.IDCONTRATOIMOVEL'
      'FROM'
      '    CONTRATOXIMOVEL CXI'
      'WHERE'
      '      (CXI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '')
    Params.Data = {
      01000100104944434F4E545241544F494D4F56454C0006080000000000000000
      000100}
    ValidateWithMask = True
    Left = 359
    Top = 8
    object qryDetIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
    end
    object qryDetIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.INDCORRECAO,'
      '     CPI.VLRFINANC,'
      '     CPI.FLGSINAL,'
      '     CPI.DATAINI,'
      '     CPI.PRAZO,'
      '     CPI.PERIODO,'
      '     CPI.TAXAJUROS,'
      '     CPI.PERIODOTAXA,'
      '     CPI.SISTCORRECAO,'
      '     CPI.NUMPARCELAS,'
      '     CPI.ATRASOINDCORREC,'
      '     CPI.ATRASOMULTA,'
      '     CPI.ATRASOTXJUROS,'
      '     M.FLGPERCVALOR'
      'FROM'
      '     CONDPAGIMOVEL CPI,'
      '     MOEDA M'
      'WHERE'
      '      (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '  AND (M.MOECODIGO(+) = CPI.INDCORRECAO)'
      ''
      ''
      '')
    Params.Data = {
      01000100104944434F4E545241544F494D4F56454C0006080000000000000000
      000100}
    ControlType.Strings = (
      'FLGSINAL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 207
    Top = 8
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
    end
    object qryCondPagVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
    end
    object qryCondPagFLGSINAL: TStringField
      FieldName = 'FLGSINAL'
      Size = 1
    end
    object qryCondPagDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object qryCondPagPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      FieldName = 'PERIODO'
    end
    object qryCondPagTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
    end
    object qryCondPagPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Size = 1
    end
    object qryCondPagSISTCORRECAO: TStringField
      FieldName = 'SISTCORRECAO'
      Size = 1
    end
    object qryCondPagNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagATRASOINDCORREC: TFloatField
      FieldName = 'ATRASOINDCORREC'
    end
    object qryCondPagATRASOMULTA: TFloatField
      FieldName = 'ATRASOMULTA'
    end
    object qryCondPagATRASOTXJUROS: TFloatField
      FieldName = 'ATRASOTXJUROS'
    end
    object qryCondPagFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Size = 1
    end
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDPARCFINANCIMOV,'
      '     CODDOCUMENTO,'
      '     IDCONDPAGIMOVEL,'
      '     VLRSALDODEVEDOR,'
      '     VLRJUROS,'
      '     VLRAMORTIZACAO,'
      '     VLRPRESTACAO,'
      '     DATAVENCIMENTO,'
      '     NUMPARCELA,'
      '     VLRPRESTATUALIZADA,'
      '     VLRRESIDUO,'
      '     VLRRESIDUOATUALI,'
      '     VLRCORRIGIDOATRASO,'
      '     VLRMULTAATRASO,'
      '     VLRMORAATRASO,'
      '     (0) AS FATOR'
      'FROM'
      '     PARCFINANCIMOV'
      'WHERE'
      '    (IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL )'
      'ORDER BY NUMPARCELA')
    Params.Data = {
      010001000F4944434F4E44504147494D4F56454C000608000000000000000000
      0100}
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 408
    Top = 32
    object qryParcNUMPARCELA: TFloatField
      DisplayLabel = 'Nº da ~Parcela'
      DisplayWidth = 3
      FieldName = 'NUMPARCELA'
      Origin = 'PARCFINANCIMOV.NUMPARCELA'
    end
    object qryParcVLRSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo~Devedor'
      DisplayWidth = 10
      FieldName = 'VLRSALDODEVEDOR'
      Origin = 'PARCFINANCIMOV.VLRSALDODEVEDOR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Origin = 'PARCFINANCIMOV.VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRAMORTIZACAO: TFloatField
      DisplayLabel = 'Amortização'
      DisplayWidth = 10
      FieldName = 'VLRAMORTIZACAO'
      Origin = 'PARCFINANCIMOV.VLRAMORTIZACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      Origin = 'PARCFINANCIMOV.VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
      Origin = 'PARCFINANCIMOV.DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryParcVLRPRESTATUALIZADA: TFloatField
      DisplayLabel = 'Prestação~Atualizada'
      DisplayWidth = 10
      FieldName = 'VLRPRESTATUALIZADA'
      Origin = 'PARCFINANCIMOV.VLRPRESTATUALIZADA'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUO: TFloatField
      DisplayLabel = 'Resíduo'
      DisplayWidth = 10
      FieldName = 'VLRRESIDUO'
      Origin = 'PARCFINANCIMOV.VLRRESIDUO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Resíduo~Atualizado'
      DisplayWidth = 10
      FieldName = 'VLRRESIDUOATUALI'
      Origin = 'PARCFINANCIMOV.VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
    end
    object qryParcFATOR: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 10
      FieldName = 'FATOR'
      DisplayFormat = '#,#####0.00000'
    end
    object qryParcVLRCORRIGIDOATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRIGIDOATRASO'
      Origin = 'PARCFINANCIMOV.VLRCORRIGIDOATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRMULTAATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTAATRASO'
      Origin = 'PARCFINANCIMOV.VLRMULTAATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRMORAATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMORAATRASO'
      Origin = 'PARCFINANCIMOV.VLRMORAATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
      Origin = 'PARCFINANCIMOV.IDPARCFINANCIMOV'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'PARCFINANCIMOV.CODDOCUMENTO'
      Visible = False
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'PARCFINANCIMOV.IDCONDPAGIMOVEL'
      Visible = False
    end
  end
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  IDPARCFINANCIMOV = :IDPARCFINANCIMOV,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  VLRSALDODEVEDOR = :VLRSALDODEVEDOR,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRAMORTIZACAO = :VLRAMORTIZACAO,'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  NUMPARCELA = :NUMPARCELA,'
      '  VLRPRESTATUALIZADA = :VLRPRESTATUALIZADA,'
      '  VLRRESIDUO = :VLRRESIDUO,'
      '  VLRRESIDUOATUALI = :VLRRESIDUOATUALI,'
      '  VLRCORRIGIDOATRASO = :VLRCORRIGIDOATRASO,'
      '  VLRMULTAATRASO = :VLRMULTAATRASO,'
      '  VLRMORAATRASO = :VLRMORAATRASO'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      
        '  (IDPARCFINANCIMOV, CODDOCUMENTO, IDCONDPAGIMOVEL, VLRSALDODEVE' +
        'DOR, VLRJUROS, '
      
        '   VLRAMORTIZACAO, VLRPRESTACAO, DATAVENCIMENTO, NUMPARCELA, VLR' +
        'PRESTATUALIZADA, '
      
        '   VLRRESIDUO, VLRRESIDUOATUALI, VLRCORRIGIDOATRASO, VLRMULTAATR' +
        'ASO, VLRMORAATRASO)'
      'values'
      
        '  (:IDPARCFINANCIMOV, :CODDOCUMENTO, :IDCONDPAGIMOVEL, :VLRSALDO' +
        'DEVEDOR, '
      
        '   :VLRJUROS, :VLRAMORTIZACAO, :VLRPRESTACAO, :DATAVENCIMENTO, :' +
        'NUMPARCELA, '
      
        '   :VLRPRESTATUALIZADA, :VLRRESIDUO, :VLRRESIDUOATUALI, :VLRCORR' +
        'IGIDOATRASO, '
      '   :VLRMULTAATRASO, :VLRMORAATRASO)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 408
    Top = 16
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 408
    Top = 8
  end
end
