inherited FrmGeraContrato: TFrmGeraContrato
  Left = 157
  Top = 146
  Caption = 'Geração de Contrato de Venda'
  ClientHeight = 299
  ClientWidth = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 260
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 87
      Height = 13
      Caption = 'Nº da Proposta'
      FocusControl = edNumCont
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 87
      Height = 13
      Caption = 'Nome Proposta'
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
      Width = 513
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
    object dblcLocatario: TwwDBLookupCombo
      Left = 16
      Top = 128
      Width = 513
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RAZAOSOCIAL'#9'60'#9'Nome')
      LookupTable = qryLocatario
      LookupField = 'IDLOCATARIO'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblcLocatarioCloseUp
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 160
      Width = 513
      Height = 81
      Caption = ' Atraso '
      TabOrder = 3
      object Label5: TLabel
        Left = 192
        Top = 28
        Width = 32
        Height = 13
        Caption = 'Multa'
        FocusControl = edNomeCont
      end
      object Label6: TLabel
        Left = 360
        Top = 28
        Width = 81
        Height = 13
        Caption = 'Taxa de Júros'
        FocusControl = edNomeCont
      end
      object Label4: TLabel
        Left = 16
        Top = 28
        Width = 109
        Height = 13
        Caption = 'Índice de Correção'
        FocusControl = edNomeCont
      end
      object EdMulta: TRealEdit
        Left = 192
        Top = 44
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTXJuros: TRealEdit
        Left = 360
        Top = 44
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dblcIndCorret: TCMDBLookupCombo
        Left = 16
        Top = 44
        Width = 161
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Descrição')
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 212
      DockPos = 212
      inherited sep1: TToolbarSep97
        Left = 244
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 80
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
      object btnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gerar'
        Enabled = False
        TabOrder = 2
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
      object btnBuscar: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Buscar'
        TabOrder = 3
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
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
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'P'#39)
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
      '     CI.IDLOCATARIO'
      'FROM'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      '')
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
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 307
    Top = 8
  end
  object qryGrava: TwwQuery
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
      '     CI.IDLOCATARIO'
      'FROM'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      '')
    Params.Data = {
      01000100104944434F4E545241544F494D4F56454C0006080000000000000000
      000100}
    UpdateObject = updGrava
    ValidateWithMask = True
    Left = 464
    Top = 72
    object qryGravaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryGravaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = 'CONTRATOIMOVEL.CONNUMERO'
    end
    object qryGravaCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = 'CONTRATOIMOVEL.CONNOME'
      Size = 60
    end
    object qryGravaCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = 'CONTRATOIMOVEL.CONDATAASSINATURA'
    end
    object qryGravaCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = 'CONTRATOIMOVEL.CONDATAINICIO'
    end
    object qryGravaFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = 'CONTRATOIMOVEL.FLGTIPOCONTRATO'
      Size = 1
    end
    object qryGravaCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Origin = 'CONTRATOIMOVEL.CONPERCENTMORA'
    end
    object qryGravaCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Origin = 'CONTRATOIMOVEL.CONPERMORA'
      Size = 1
    end
    object qryGravaCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = 'CONTRATOIMOVEL.CONTAXAADMIN'
    end
    object qryGravaCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = 'CONTRATOIMOVEL.CONVLRAJUSTADO'
    end
    object qryGravaCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONPERREAJUSTE'
    end
    object qryGravaCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Origin = 'CONTRATOIMOVEL.CONPERCENTMULTA'
    end
    object qryGravaCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = 'CONTRATOIMOVEL.CONVLRTOTAL'
    end
    object qryGravaCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = 'CONTRATOIMOVEL.CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryGravaVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = 'CONTRATOIMOVEL.VLRPROPOSTA'
    end
    object qryGravaVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = 'CONTRATOIMOVEL.VLRPRESENTE'
    end
    object qryGravaVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = 'CONTRATOIMOVEL.VLRCONTABIL'
    end
    object qryGravaCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = 'CONTRATOIMOVEL.CONINDICEMORA'
    end
    object qryGravaCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryGravaCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryGravaCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = 'CONTRATOIMOVEL.CONDIASTOLERANCIA'
    end
    object qryGravaIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'CONTRATOIMOVEL.IDLOCATARIO'
    end
  end
  object updGrava: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CONNUMERO = :CONNUMERO,'
      '  CONNOME = :CONNOME,'
      '  CONDATAASSINATURA = :CONDATAASSINATURA,'
      '  CONDATAINICIO = :CONDATAINICIO,'
      '  FLGTIPOCONTRATO = :FLGTIPOCONTRATO,'
      '  CONPERCENTMORA = :CONPERCENTMORA,'
      '  CONPERMORA = :CONPERMORA,'
      '  CONTAXAADMIN = :CONTAXAADMIN,'
      '  CONVLRAJUSTADO = :CONVLRAJUSTADO,'
      '  CONPERREAJUSTE = :CONPERREAJUSTE,'
      '  CONPERCENTMULTA = :CONPERCENTMULTA,'
      '  CONVLRTOTAL = :CONVLRTOTAL,'
      '  CONDESCRICAO = :CONDESCRICAO,'
      '  VLRPROPOSTA = :VLRPROPOSTA,'
      '  VLRPRESENTE = :VLRPRESENTE,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  CONINDICEMORA = :CONINDICEMORA,'
      '  CONINDICEREAJUSTE = :CONINDICEREAJUSTE,'
      '  CONDATAREAJUSTE = :CONDATAREAJUSTE,'
      '  CONDIASTOLERANCIA = :CONDIASTOLERANCIA,'
      '  IDLOCATARIO = :IDLOCATARIO'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOIMOVEL'
      '  (IDCONTRATOIMOVEL, CONNUMERO, CONNOME, CONDATAASSINATURA, '
      'CONDATAINICIO, '
      '   FLGTIPOCONTRATO, CONPERCENTMORA, CONPERMORA, CONTAXAADMIN, '
      'CONVLRAJUSTADO, '
      '   CONPERREAJUSTE, CONPERCENTMULTA, CONVLRTOTAL, CONDESCRICAO, '
      'VLRPROPOSTA, '
      '   VLRPRESENTE, VLRCONTABIL, CONINDICEMORA, CONINDICEREAJUSTE, '
      'CONDATAREAJUSTE, '
      '   CONDIASTOLERANCIA, IDLOCATARIO)'
      'values'
      '  (:IDCONTRATOIMOVEL, :CONNUMERO, :CONNOME, :CONDATAASSINATURA, '
      ':CONDATAINICIO, '
      '   :FLGTIPOCONTRATO, :CONPERCENTMORA, :CONPERMORA, '
      ':CONTAXAADMIN, :CONVLRAJUSTADO, '
      '   :CONPERREAJUSTE, :CONPERCENTMULTA, :CONVLRTOTAL, '
      ':CONDESCRICAO, :VLRPROPOSTA, '
      
        '   :VLRPRESENTE, :VLRCONTABIL, :CONINDICEMORA, :CONINDICEREAJUST' +
        'E, '
      ':CONDATAREAJUSTE, '
      '   :CONDIASTOLERANCIA, :IDLOCATARIO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOIMOVEL'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 464
    Top = 56
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
      '     CPI.ATRASOTXJUROS     '
      'FROM'
      '     CONDPAGIMOVEL CPI'
      'WHERE'
      '     (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
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
  end
  object updDetGrava: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXIMOVEL'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOXIMOVEL'
      '  (IDIMOVEL, IDCONTRATOIMOVEL)'
      'values'
      '  (:IDIMOVEL, :IDCONTRATOIMOVEL)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 377
    Top = 80
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
  object updCondDetGrava: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  VLRFINANC = :VLRFINANC,'
      '  FLGSINAL = :FLGSINAL,'
      '  DATAINI = :DATAINI,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  SISTCORRECAO = :SISTCORRECAO,'
      '  NUMPARCELAS = :NUMPARCELAS'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, VLRFINANC, FL' +
        'GSINAL, '
      
        '   DATAINI, PRAZO, PERIODO, TAXAJUROS, PERIODOTAXA, SISTCORRECAO' +
        ', NUMPARCELAS)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :VLRFINANC' +
        ', :FLGSINAL, '
      
        '   :DATAINI, :PRAZO, :PERIODO, :TAXAJUROS, :PERIODOTAXA, :SISTCO' +
        'RRECAO, '
      '   :NUMPARCELAS)')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 233
    Top = 80
  end
  object qryCondPagGrava: TwwQuery
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
      '     CPI.ATRASOTXJUROS'
      'FROM'
      '     CONDPAGIMOVEL CPI'
      'WHERE'
      '     (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      '')
    Params.Data = {
      01000100104944434F4E545241544F494D4F56454C0006080000000000000000
      000100}
    UpdateObject = updCondDetGrava
    ControlType.Strings = (
      'FLGSINAL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 231
    Top = 64
    object qryCondPagGravaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCondPagGravaIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCondPagGravaINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
    end
    object qryCondPagGravaVLRFINANC: TFloatField
      FieldName = 'VLRFINANC'
    end
    object qryCondPagGravaFLGSINAL: TStringField
      FieldName = 'FLGSINAL'
      Size = 1
    end
    object qryCondPagGravaDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object qryCondPagGravaPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 1
    end
    object qryCondPagGravaPERIODO: TFloatField
      FieldName = 'PERIODO'
    end
    object qryCondPagGravaTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
    end
    object qryCondPagGravaPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Size = 1
    end
    object qryCondPagGravaSISTCORRECAO: TStringField
      FieldName = 'SISTCORRECAO'
      Size = 1
    end
    object qryCondPagGravaNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagGravaATRASOINDCORREC: TFloatField
      FieldName = 'ATRASOINDCORREC'
    end
    object qryCondPagGravaATRASOMULTA: TFloatField
      FieldName = 'ATRASOMULTA'
    end
    object qryCondPagGravaATRASOTXJUROS: TFloatField
      FieldName = 'ATRASOTXJUROS'
    end
  end
  object qryDetGrava: TwwQuery
    CachedUpdates = True
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
    UpdateObject = updDetGrava
    ValidateWithMask = True
    Left = 375
    Top = 64
    object qryDetGravaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
    end
    object qryDetGravaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
  end
  object qryLocatario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     L.IDLOCATARIO,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '    PESSOA P,'
      '    LOCATARIO L'
      'WHERE'
      '    (P.IDPESSOA = L.IDLOCATARIO)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 408
    Top = 8
    object qryLocatarioRAZAOSOCIAL: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryLocatarioIDLOCATARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCATARIO'
      Origin = 'LOCATARIO.IDLOCATARIO'
      Visible = False
    end
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOEDESC'
      'FROM'
      '    MOEDA'
      'WHERE'
      '    (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 141
    Top = 68
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
end
