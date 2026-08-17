inherited FrmGeraSCIAuto: TFrmGeraSCIAuto
  Left = 23
  Top = 80
  Caption = 'Gerar S.C.I. Automaticamente'
  ClientHeight = 420
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 381
    object pln: TPanel
      Left = 5
      Top = 5
      Width = 724
      Height = 100
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 16
        Top = 8
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object dblcCentRespon: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTRORESPON'#9'10'#9'Código')
        LookupTable = qryCRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        LookupTable = qryAtiv
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object GpDotOrc: TGroupBox
        Left = 344
        Top = 16
        Width = 205
        Height = 71
        Caption = ' Reserva  Orçamentário '
        TabOrder = 2
        object btnOrcamento: TSpeedButton
          Left = 168
          Top = 32
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
            87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
            FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
            0E070F757770000000E070FFF707777777007700007777777777}
          OnClick = btnOrcamentoClick
        end
        object ReResOrc: TRealEdit
          Left = 16
          Top = 32
          Width = 152
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '         0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
      object btnGerar: TBitBtn
        Left = 584
        Top = 48
        Width = 121
        Height = 41
        Caption = '&Gerar S.C.I.'
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
    object plnSCI: TPanel
      Left = 5
      Top = 105
      Width = 724
      Height = 271
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 97
        Width = 724
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object plnReq: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'plnReq'
        TabOrder = 0
        object plnlbReq: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 93
          Align = alLeft
          BevelInner = bvLowered
          Caption = 'plnlbReq'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object fcLabel1: TfcLabel
            Left = 2
            Top = 2
            Width = 29
            Height = 89
            Align = alClient
            Caption = 'S.C.I.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Rotation = 90
            TextOptions.VAlignment = vaTop
          end
        end
        object GrdReq: TwwDBGrid
          Left = 33
          Top = 0
          Width = 687
          Height = 93
          Selected.Strings = (
            'NUMREQUISICAO'#9'10'#9'Nº Requisição'#9'No'
            'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I. ~(prévio)'#9'No'
            'DATAEMISSAO'#9'10'#9'Data~Emissão'#9'No'
            'DATAENTREGA'#9'10'#9'Data~Necessidade'#9'No'
            'DESCALMOX'#9'40'#9'Almoxarifado'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsSCI
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object plnItem: TPanel
        Left = 0
        Top = 105
        Width = 724
        Height = 166
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'plnItem'
        TabOrder = 1
        object plnLbItem: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 162
          Align = alLeft
          BevelInner = bvLowered
          Caption = 'plnLbItem'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object fcLabel2: TfcLabel
            Left = 2
            Top = 2
            Width = 29
            Height = 158
            Align = alClient
            Caption = 'Itens'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Rotation = 90
            TextOptions.VAlignment = vaTop
          end
        end
        object GrdItem: TwwDBGrid
          Left = 33
          Top = 0
          Width = 687
          Height = 162
          Hint = 'Duplo clique para Visualizar os Atendimentos'
          Selected.Strings = (
            'CODARTIGO'#9'14'#9'Código'#9'No'
            'DESCRICAO'#9'50'#9'Descrição'#9'No'
            'CODMEDIDA'#9'4'#9'Unidade'#9'No'
            'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItem
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 734
    object LbPreview: TLabel [0]
      Left = 8
      Top = 2
      Width = 98
      Height = 13
      Caption = 'Gerando Preview'
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 486
      DockPos = 486
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
      object BtnPreview: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Preview'
        TabOrder = 2
        OnClick = BtnPreviewClick
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
    end
    object pBar: TProgressBar
      Left = 8
      Top = 16
      Width = 449
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object qryAtiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  UnidNegoc,Nome  From UnidNegocio')
    ValidateWithMask = True
    Left = 614
    Top = 117
    object qryAtivUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
    end
    object qryAtivNOME: TStringField
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
  end
  object qrySCI: TwwQuery
    CachedUpdates = True
    AfterScroll = qrySCIAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       NUMREQUISICAO,'
      '       NUMSOLCOMPRA,'
      '       IDPESSOA,'
      '       IDEMPRESA,'
      '       CODCENTROCUSTO,'
      '       DATAEMISSAO,'
      '       DATAENTREGA,       '
      '       CUSTOESTOQUE,'
      '       IMPRESSO,'
      '       CODCENTRORESPON,'
      '       UNIDNEGOC,'
      '       CODALMOXARIFADO,'
      '       FLGPREPRONTA,'
      '       IDRESERVAORCAMEN,'
      '       IDPROCESSO,'
      '       SOLICIATENDIDA,'
      '       SOLICIACEITA,'
      '       ('#39'                         '#39') AS DESCALMOX'
      'FROM'
      '       SOLICOMP'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA )')
    UpdateObject = updSCI
    ValidateWithMask = True
    Left = 543
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySCINUMREQUISICAO: TFloatField
      FieldName = 'NUMREQUISICAO'
    end
    object qrySCINUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qrySCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qrySCICODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qrySCIDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qrySCIDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qrySCICUSTOESTOQUE: TStringField
      FieldName = 'CUSTOESTOQUE'
      Size = 1
    end
    object qrySCIIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object qrySCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qrySCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qrySCICODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qrySCIFLGPREPRONTA: TStringField
      FieldName = 'FLGPREPRONTA'
      Size = 1
    end
    object qrySCIIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object qrySCIIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object qrySCIDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Size = 25
    end
    object qrySCISOLICIATENDIDA: TStringField
      FieldName = 'SOLICIATENDIDA'
      Size = 1
    end
    object qrySCISOLICIACEITA: TStringField
      FieldName = 'SOLICIACEITA'
      Size = 1
    end
  end
  object qryItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '     IDITEMSOLI,'
      '     NUMSOLCOMPRA,'
      '     CODARTIGO,'
      '     CODMEDIDA,'
      '     QTDEPEDIDA,'
      '     QTDEPENDENTE,'
      '     QTDEPEDIDA AS SALDOACOMPRAR,'
      
        '     ('#39'                                                         ' +
        '   '#39') AS DESCRICAO'
      'FROM'
      '    ITEMSOLI'
      'WHERE'
      '    (NUMSOLCOMPRA =  :NUMSOLCOMPRA)')
    UpdateObject = updItem
    ValidateWithMask = True
    Left = 495
    Top = 140
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMSOLCOMPRA'
        ParamType = ptUnknown
      end>
    object qryItemIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
    end
    object qryItemNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryItemCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryItemCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryItemQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,####0.0000'
    end
    object qryItemQTDEPENDENTE: TFloatField
      FieldName = 'QTDEPENDENTE'
    end
    object qryItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemSALDOACOMPRAR: TFloatField
      FieldName = 'SALDOACOMPRAR'
    end
  end
  object dsSCI: TwwDataSource
    DataSet = qrySCI
    Left = 543
    Top = 126
  end
  object dsItem: TwwDataSource
    AutoEdit = False
    DataSet = qryItem
    Left = 495
    Top = 126
  end
  object updItem: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      
        '  (NUMSOLCOMPRA, CODARTIGO, CODMEDIDA, QTDEPEDIDA, QTDEPENDENTE,' +
        ' DESCRICAO)'
      'values'
      
        '  (:NUMSOLCOMPRA, :CODARTIGO, :CODMEDIDA, :QTDEPEDIDA, :QTDEPEND' +
        'ENTE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    Left = 495
    Top = 112
  end
  object updSCI: TUpdateSQL
    ModifySQL.Strings = (
      'update SOLICOMP'
      'set'
      '  NUMREQUISICAO = :NUMREQUISICAO,'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAENTREGA = :DATAENTREGA,'
      '  CUSTOESTOQUE = :CUSTOESTOQUE,'
      '  IMPRESSO = :IMPRESSO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  FLGPREPRONTA = :FLGPREPRONTA,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  DESCALMOX = :DESCALMOX'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    InsertSQL.Strings = (
      'insert into SOLICOMP'
      
        '  (NUMREQUISICAO, NUMSOLCOMPRA, IDPESSOA, IDEMPRESA, CODCENTROCU' +
        'STO, DATAEMISSAO, '
      
        '   DATAENTREGA, CUSTOESTOQUE, IMPRESSO, CODCENTRORESPON, UNIDNEG' +
        'OC, CODALMOXARIFADO, '
      '   FLGPREPRONTA, IDRESERVAORCAMEN, IDPROCESSO, DESCALMOX)'
      'values'
      
        '  (:NUMREQUISICAO, :NUMSOLCOMPRA, :IDPESSOA, :IDEMPRESA, :CODCEN' +
        'TROCUSTO, '
      
        '   :DATAEMISSAO, :DATAENTREGA, :CUSTOESTOQUE, :IMPRESSO, :CODCEN' +
        'TRORESPON, '
      
        '   :UNIDNEGOC, :CODALMOXARIFADO, :FLGPREPRONTA, :IDRESERVAORCAME' +
        'N, :IDPROCESSO, '
      '   :DESCALMOX)')
    DeleteSQL.Strings = (
      'delete from SOLICOMP'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    Left = 543
    Top = 112
  end
  object qryReqMat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      RQ.NUMREQUISICAO,'
      '      RQ.DATAEMISSAO,'
      '      RQ.DATANECESSIDADE,'
      '      RQ.IDEMPRESA,'
      '      RQ.CODCENTROCUSTO,'
      '      RQ.CODALMOXAORIGEM,'
      '      IT.CODARTIGO,'
      '      IT.QTDEPEDIDA,'
      '      IT.CODMEDIDA,'
      
        '      (PR.DESCPROD || '#39' '#39' || AR.CODTAMANHO || '#39' '#39' || AR.CODCOR) ' +
        'AS DESCRICAO,'
      '      PR.CODGRUPOPROD,'
      '      AL.DESCALMOX'
      'FROM'
      '     REQMAT RQ,'
      '     ITEMPEDI IT,'
      '     RADINSTPROCESSO RP,'
      '     ARTIGO AR,'
      '     PRODUTO PR,'
      '     ALMOX AL'
      'WHERE'
      '       (IT.QTDEPENDENTE > 0)'
      '   AND (IT.FLGSCI = '#39'N'#39')'
      '   AND (RQ.IDPESSOA = :IDPESSOA)'
      '   AND ((RP.FLGOK = '#39'S'#39') OR (RQ.IDPROCESSO IS NULL))'
      '   AND (AR.CODPRODUTO = PR.CODPRODUTO)'
      '   AND (AR.CODARTIGO  = IT.CODARTIGO)'
      '   AND (RQ.IDPROCESSO = RP.IDPROCESSO(+))'
      '   AND (RQ.NUMREQUISICAO = IT.NUMREQUISICAO)'
      '   AND (RQ.CODALMOXAORIGEM = AL.CODALMOXARIFADO)'
      'ORDER BY RQ.NUMREQUISICAO, PR.CODGRUPOPROD'
      '')
    ValidateWithMask = True
    Left = 423
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryReqMatNUMREQUISICAO: TFloatField
      FieldName = 'NUMREQUISICAO'
    end
    object qryReqMatDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryReqMatDATANECESSIDADE: TDateTimeField
      FieldName = 'DATANECESSIDADE'
    end
    object qryReqMatIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryReqMatCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryReqMatCODALMOXAORIGEM: TFloatField
      FieldName = 'CODALMOXAORIGEM'
    end
    object qryReqMatCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryReqMatQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
    end
    object qryReqMatCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryReqMatDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryReqMatCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Size = 10
    end
    object qryReqMatDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Size = 40
    end
  end
  object qryGravaDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '     IDITEMSOLI,'
      '     NUMSOLCOMPRA,'
      '     CODARTIGO,'
      '     CODMEDIDA,'
      '     QTDEPEDIDA,'
      '     QTDEPENDENTE,'
      '     SALDOACOMPRAR,'
      
        '     ('#39'                                                         ' +
        '   '#39') AS DESCRICAO'
      ''
      'FROM'
      '    ITEMSOLI'
      'WHERE'
      '    (1=2)')
    UpdateObject = updGravaDet
    ValidateWithMask = True
    Left = 607
    Top = 244
    object qryGravaDetIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
    end
    object qryGravaDetNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryGravaDetCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryGravaDetCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryGravaDetQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
    end
    object qryGravaDetQTDEPENDENTE: TFloatField
      FieldName = 'QTDEPENDENTE'
    end
    object qryGravaDetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryGravaDetSALDOACOMPRAR: TFloatField
      FieldName = 'SALDOACOMPRAR'
    end
  end
  object updGravaDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  IDITEMSOLI = :IDITEMSOLI,'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  SALDOACOMPRAR = :SALDOACOMPRAR'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      '  (IDITEMSOLI, NUMSOLCOMPRA, CODARTIGO, CODMEDIDA, QTDEPEDIDA, '
      'QTDEPENDENTE, '
      '   SALDOACOMPRAR)'
      'values'
      
        '  (:IDITEMSOLI, :NUMSOLCOMPRA, :CODARTIGO, :CODMEDIDA, :QTDEPEDI' +
        'DA, '
      ':QTDEPENDENTE, '
      '   :SALDOACOMPRAR)')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 607
    Top = 230
  end
  object qryGrava: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    AfterScroll = qrySCIAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       NUMREQUISICAO,'
      '       NUMSOLCOMPRA,'
      '       IDPESSOA,'
      '       IDEMPRESA,'
      '       CODCENTROCUSTO,'
      '       DATAEMISSAO,'
      '       DATAENTREGA,       '
      '       CUSTOESTOQUE,'
      '       IMPRESSO,'
      '       CODCENTRORESPON,'
      '       UNIDNEGOC,'
      '       CODALMOXARIFADO,'
      '       FLGPREPRONTA,'
      '       IDRESERVAORCAMEN,'
      '       IDPROCESSO,'
      '       SOLICIATENDIDA,'
      '       SOLICIACEITA,'
      '       ('#39'                         '#39') AS DESCALMOX'
      'FROM'
      '       SOLICOMP'
      'WHERE'
      '     (1=2 )')
    UpdateObject = updGrava
    ValidateWithMask = True
    Left = 671
    Top = 244
    object qryGravaNUMREQUISICAO: TFloatField
      FieldName = 'NUMREQUISICAO'
    end
    object qryGravaNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
    end
    object qryGravaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryGravaIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryGravaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryGravaDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryGravaDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qryGravaCUSTOESTOQUE: TStringField
      FieldName = 'CUSTOESTOQUE'
      Size = 1
    end
    object qryGravaIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object qryGravaCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryGravaUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryGravaCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qryGravaFLGPREPRONTA: TStringField
      FieldName = 'FLGPREPRONTA'
      Size = 1
    end
    object qryGravaIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object qryGravaIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object qryGravaDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Size = 25
    end
    object qryGravaSOLICIATENDIDA: TStringField
      FieldName = 'SOLICIATENDIDA'
      Size = 1
    end
    object qryGravaSOLICIACEITA: TStringField
      FieldName = 'SOLICIACEITA'
      Size = 1
    end
  end
  object updGrava: TUpdateSQL
    ModifySQL.Strings = (
      'update SOLICOMP'
      'set'
      '  NUMREQUISICAO = :NUMREQUISICAO,'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAENTREGA = :DATAENTREGA,'
      '  CUSTOESTOQUE = :CUSTOESTOQUE,'
      '  IMPRESSO = :IMPRESSO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  FLGPREPRONTA = :FLGPREPRONTA,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  SOLICIATENDIDA = :SOLICIATENDIDA,'
      '  SOLICIACEITA = :SOLICIACEITA'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    InsertSQL.Strings = (
      'insert into SOLICOMP'
      '  (NUMREQUISICAO, NUMSOLCOMPRA, IDPESSOA, IDEMPRESA, '
      'CODCENTROCUSTO, DATAEMISSAO, '
      '   DATAENTREGA, CUSTOESTOQUE, IMPRESSO, CODCENTRORESPON, '
      'UNIDNEGOC, CODALMOXARIFADO, '
      '   FLGPREPRONTA, IDRESERVAORCAMEN, IDPROCESSO, SOLICIATENDIDA, '
      'SOLICIACEITA)'
      'values'
      '  (:NUMREQUISICAO, :NUMSOLCOMPRA, :IDPESSOA, :IDEMPRESA, '
      ':CODCENTROCUSTO, '
      '   :DATAEMISSAO, :DATAENTREGA, :CUSTOESTOQUE, :IMPRESSO, '
      ':CODCENTRORESPON, '
      '   :UNIDNEGOC, :CODALMOXARIFADO, :FLGPREPRONTA, '
      ':IDRESERVAORCAMEN, :IDPROCESSO, '
      '   :SOLICIATENDIDA, :SOLICIACEITA)')
    DeleteSQL.Strings = (
      'delete from SOLICOMP'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    Left = 671
    Top = 230
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'RADINSTPROCESSO')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'RESERVAORCAMEN.FLGRESCOMP = '#39'R'#39
      'RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO'
      
        '((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK IS NUL' +
        'L))')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 541
    Top = 12
  end
  object qryCRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     U.CODCENTRORESPON,'
      '     U.NOME'
      'FROM'
      ' ('
      '  (SELECT'
      '        CR.CODCENTRORESPON,'
      '        CR.NOME'
      '   FROM'
      '        CENTRESPON CR,'
      '        PESSOAXCRESP PR'
      '   WHERE'
      '         (CR.CODCENTRORESPON = PR.CODCENTRORESPON)'
      '     AND (CR.IDPESSOA = PR.IDPESSOA)'
      '     AND (CR.IDPESSOA = :pIDPESS)'
      '     AND (CR.ATIVO    = '#39'S'#39')'
      '     AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '     AND (PR.IDPESSOAACESSO = :IDUSUARIO))'
      '  UNION ALL'
      '    (SELECT'
      '          CR.CODCENTRORESPON,'
      '          CR.NOME'
      '     FROM'
      '          CENTRESPON CR'
      '     WHERE'
      '           (CR.IDPESSOA = :pIDPESS)'
      '       AND (CR.ATIVO    = '#39'S'#39')'
      '       AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '       AND (NOT EXISTS (SELECT 1'
      '                        FROM PESSOAXCRESP PR'
      '                        WHERE (PR.IDPESSOA = :pIDPESS)'
      '                          AND (PR.IDPESSOAACESSO = :IDUSUARIO)))'
      '     )'
      '  ) U'
      'ORDER BY U.NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 614
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
end
