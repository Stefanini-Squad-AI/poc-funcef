inherited frmAnalProp: TfrmAnalProp
  Left = 39
  Top = 100
  Caption = 'Analise da Proposta '
  ClientHeight = 407
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 707
    Height = 368
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 697
      Height = 52
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Nº da Proposta'
        FocusControl = edNumCont
      end
      object Label2: TLabel
        Left = 176
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Nome Proposta'
        FocusControl = edNomeCont
      end
      object edNumCont: TDBEdit
        Left = 8
        Top = 24
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
        Left = 176
        Top = 24
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
    end
    object Panel2: TPanel
      Left = 5
      Top = 57
      Width = 697
      Height = 48
      Align = alTop
      Enabled = False
      TabOrder = 1
      object Label24: TLabel
        Left = 64
        Top = 4
        Width = 76
        Height = 13
        Caption = 'Avaliação  + '
      end
      object lbTxCorret: TDBText
        Left = 144
        Top = 4
        Width = 33
        Height = 17
        Alignment = taRightJustify
        DataField = 'CONTAXAADMIN'
        DataSource = ds
      end
      object Label25: TLabel
        Left = 176
        Top = 4
        Width = 22
        Height = 13
        Caption = ' %  '
      end
      object Label26: TLabel
        Left = 259
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Aluguel /'
      end
      object lbPercAlug: TDBText
        Left = 323
        Top = 4
        Width = 41
        Height = 17
        Alignment = taRightJustify
        DataField = 'CONPERCENTMULTA'
        DataSource = ds
      end
      object Label27: TLabel
        Left = 374
        Top = 4
        Width = 26
        Height = 13
        Caption = ' %   '
      end
      object Label28: TLabel
        Left = 462
        Top = 4
        Width = 84
        Height = 13
        Caption = 'Valor Presente'
      end
      object edValorAvali: TRealEdit
        Left = 64
        Top = 20
        Width = 145
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edValorAlug: TRealEdit
        Left = 259
        Top = 20
        Width = 150
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edValPresAnal: TRealEdit
        Left = 462
        Top = 20
        Width = 155
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object grd: TwwDBGrid
      Left = 5
      Top = 105
      Width = 697
      Height = 231
      Selected.Strings = (
        'MES'#9'10'#9'Nº de Meses'
        'VLREVOLUCAOVENDA'#9'10'#9'Evolução Aplicação'
        'VLRENDIMENTO'#9'10'#9'Rendimentos'
        'VLRALUGUEL'#9'10'#9'Aluguel'
        'VLRRENDALUG'#9'10'#9'Aluguel Aplicado'
        'MESREF'#9'7'#9'Mês Ref.')
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsGrid
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
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
    object Panel3: TPanel
      Left = 5
      Top = 336
      Width = 697
      Height = 27
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 3
      object Label9: TLabel
        Left = 8
        Top = 8
        Width = 54
        Height = 13
        Caption = 'TOTAIS :'
      end
      object Label10: TLabel
        Left = 448
        Top = 6
        Width = 25
        Height = 13
        Caption = 'R = '
      end
      object edTotRend: TRealEdit
        Left = 104
        Top = 6
        Width = 105
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clWhite
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotDif: TRealEdit
        Left = 475
        Top = 6
        Width = 105
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clWhite
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotAlug: TRealEdit
        Left = 291
        Top = 6
        Width = 105
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clWhite
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 459
      DockPos = 459
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object btnBuscar: TBitBtn
        Left = 0
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65515
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
    ExibePergunta = True
    Left = 637
    Top = 16
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 611
    Top = 24
  end
  object qryGrid: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'       '#39' AS MESREF,'
      '   (0) AS VLREVOLUCAOVENDA,'
      '   (0) AS VLRENDIMENTO,'
      '   (0) AS VLRALUGUEL,'
      '   (0) AS VLRRENDALUG,'
      '   (0) AS MES'
      'FROM'
      '     CONTRATOIMOVEL'
      'WHERE'
      '     (1=2)'
      ''
      '')
    UpdateObject = updGrid
    ValidateWithMask = True
    Left = 544
    Top = 120
    object qryGridMES: TFloatField
      DisplayLabel = 'Nº de Meses'
      DisplayWidth = 10
      FieldName = 'MES'
    end
    object qryGridVLREVOLUCAOVENDA: TFloatField
      DisplayLabel = 'Evolução Aplicação'
      DisplayWidth = 10
      FieldName = 'VLREVOLUCAOVENDA'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRENDIMENTO: TFloatField
      DisplayLabel = 'Rendimentos'
      DisplayWidth = 10
      FieldName = 'VLRENDIMENTO'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRALUGUEL: TFloatField
      DisplayLabel = 'Aluguel'
      DisplayWidth = 10
      FieldName = 'VLRALUGUEL'
      DisplayFormat = '#,##0.00'
    end
    object qryGridVLRRENDALUG: TFloatField
      DisplayLabel = 'Aluguel Aplicado'
      DisplayWidth = 10
      FieldName = 'VLRRENDALUG'
      DisplayFormat = '#,##0.00'
    end
    object qryGridMESREF: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 7
      FieldName = 'MESREF'
      Size = 7
    end
  end
  object dsGrid: TwwDataSource
    AutoEdit = False
    DataSet = qryGrid
    Left = 635
    Top = 120
  end
  object updGrid: TUpdateSQL
    Left = 592
    Top = 120
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
      '     CI.CONDIASTOLERANCIA'
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
    Left = 517
    Top = 20
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
  end
end
