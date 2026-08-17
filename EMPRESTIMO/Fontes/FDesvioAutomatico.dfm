inherited frmDesvioAutomatico: TfrmDesvioAutomatico
  Left = 73
  Top = 148
  Caption = 'Desvio Automatico de Cobranca de Itens Nao Recebidos'
  ClientHeight = 333
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 300
    inherited pgcControle: TPageControl
      Width = 710
      Height = 267
      inherited TabSheet1: TTabSheet
        object Label1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 681
          Height = 41
          TabOrder = 2
          inherited edtNome: TEdit
            Width = 433
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 632
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 656
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 345
          Height = 169
          TabOrder = 3
          inherited Label6: TLabel
            Width = 94
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 137
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 88
          Width = 345
          Height = 161
          TabOrder = 4
          inherited Label6: TLabel
            Width = 47
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 137
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object DBgrdHistMov: TwwDBGrid
          Left = 0
          Top = 25
          Width = 702
          Height = 232
          Selected.Strings = (
            'FLGESCOLHA'#9'3'#9'Sel.'#9'F'
            'EVENTO'#9'13'#9'Evento'#9'F'
            'ANOMES'#9'7'#9'Comp.'#9'F'
            'HMEPARCELA'#9'3'#9'Par'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'FORMACOBRANCA'#9'7'#9'Cobr.'#9'F'
            'IteDescricao'#9'24'#9'Item'#9'F'
            'HMEDATAVENCTO'#9'9'#9'Vencto.'#9'F'
            'HMEVLRPREVISTO'#9'10'#9'Valor Prev.'#9'F'
            'STATUS'#9'11'#9' '#9'F'
            'HMEVLREFETIVO'#9'9'#9'Valor Efet.'#9'F'
            'HMEDATAEFETIVA'#9'8'#9'Data Baixa'#9'F'
            'HMETXJUROS'#9'9'#9'Tx Juros'#9'F'
            'HMESALDODEV'#9'8'#9'Sld Dev'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
          object DBgrdHistMovIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object Panel4: TPanel
          Left = -1
          Top = 0
          Width = 704
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens a Desviar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnInverteSelecao: TBitBtn
            Left = 652
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
          end
          object btnMarcaTodos: TBitBtn
            Left = 677
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
        TabVisible = False
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 4
          Top = 26
          Width = 697
          Height = 229
          Selected.Strings = (
            'TRATAMENTO'#9'25'#9'Tratamento'#9'F'
            'ANOMES'#9'7'#9'Mês Cobrança'#9'F'
            'HMEPARCELA'#9'10'#9'Id. Parcela'#9'F'
            'DESCRICAO'#9'40'#9'Ítem'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object pnlInformaFinal: TPanel
          Left = 1
          Top = -1
          Width = 704
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Item Desviado / Executar Envio'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    inherited Panel1: TPanel
      Width = 710
      inherited fcLabel1: TfcLabel
        Width = 352
        Caption = 'Tratamento de Itens não recebidos'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 300
    Width = 710
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 643
    Top = 65523
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'0'#39' AS FLGESCOLHA,'
      '   HME.IDHISTMOVEMPTMO,'
      '   IRC.ITEDESCRICAO,'
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMES,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O  ,  HME.FLGBAIXADO,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '   ,  HME.PLNCODIGO,'
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAATUA' +
        'LIZA, HME.HMENUMPARCELAS,'
      
        '   HME.HMEDATAEFETIVA   , HME.HMEVLREFETIVO    , HME.HMERECPAG, ' +
        'HME.IDITEMCENTRALIZA,'
      
        '   HME.IDREGRA          , HME.HMEORIGEM        , HME.HMEPRIORIDA' +
        'DE,'
      '   DECODE(HME.HMETIPOMOV,0,'#39'Concessão'#39','
      '                         1,'#39'Parcela '#39','
      '                         2,'#39'Amortização'#39','
      '                         3,'#39'Quitação'#39','
      '                         4,'#39'Atualização Débito'#39') AS EVENTO,'
      '   HME.HMEFORMACOBRANCA,'
      '   HME.IDRUBRICA,'
      '   CNT.IDPATRO,'
      ''
      '   HME.CODDOCUMENTO,'
      ''
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO,'
      '   HME.HMEANOCOBRANCA,'
      '   HME.HMEMESCOBRANCA,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'F'#39','#39'Folha'#39', '#39'C'#39','#39'Financeiro'#39') AS' +
        ' FORMACOBRANCA,'
      '   HME.HMEDATAVENCTO, HME.FLGENVIO,'
      '   HME.FLGBAIXAMANUAL,'
      '   DECODE(HME.FLGBAIXAMANUAL, 1, '#39'Baixa Manual'#39', NULL) AS STATUS'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CNT,'
      '   ITEMXTIPOCONTR IRT,'
      '   ITEMEMPTMO     IRC'
      ''
      'WHERE'
      
        '       ((:PIDCONTRATOEMPTMO  IS NULL) OR ( HME.IDCONTRATOEMPTMO ' +
        ' =:PIDCONTRATOEMPTMO ))'
      
        '   AND ((:PIDTIPOCONTREMPTMO IS NULL) OR ( IRT.IDTIPOCONTREMPTMO' +
        ' =:PIDTIPOCONTREMPTMO ))'
      
        '   AND ((:PIDPATRO           IS NULL) OR ( CNT.IDPATRO          ' +
        ' =:PIDPATRO))'
      
        '   AND ((:PIDPLANOPREV       IS NULL) OR ( CNT.IDPLANOPREV      ' +
        ' =:PIDPLANOPREV))'
      '   AND ( HME.IDITEMEMPTMO      = IRT.IDITEMEMPTMO )'
      '   AND ( IRT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( HME.HMETIPOMOV        NOT IN (5,8) )'
      '   AND ( HME.FLGDIVERGPEND     = 1 )'
      '   AND ( HME.FLGTIPODIVERG     = 6 )'
      
        '   AND ( (HME.FLGESTORNADO     = 0) OR (HME.FLGESTORNADO IS NULL' +
        ') )'
      
        '   AND ( (HME.FLGABONADO       = 0) OR (HME.FLGABONADO IS NULL) ' +
        ')'
      
        '   AND ( (HME.FLGQUITADO       = 0) OR (HME.FLGQUITADO IS NULL) ' +
        ')'
      '   AND ( (HME.FLGBAIXADO       = 0) )'
      '   AND ( CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO )'
      ''
      'ORDER BY'
      '   HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryHistMovFLGESCOLHA: TStringField
      FieldName = 'FLGESCOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovANOMES: TStringField
      FieldName = 'ANOMES'
      Size = 44
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 18
    end
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovFORMACOBRANCA: TStringField
      FieldName = 'FORMACOBRANCA'
      Size = 10
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 12
    end
  end
  object dsDesvio: TDataSource
    Left = 456
    Top = 192
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 256
    Top = 116
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 256
    Top = 144
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   0                                          AS IDHISTMOVEMPTMO' +
        ','
      
        '   0                                          AS IDCONTRATOEMPTM' +
        'O,'
      '   '#39'0123456789012345678901234567890123456789'#39' AS TRATAMENTO,'
      '   0 AS HMEPARCELA,'
      '   '#39'Parcela'#39' as PARCELA,'
      '   '#39'0000/00'#39' AS ANOMES,'
      '   '#39'00/00/0000'#39' AS HMEDATAPREVISTA,'
      '   '#39'0123456789012345678901234567890123456789'#39' AS DESCRICAO,'
      '   '#39'00/00/0000'#39' AS HMEDATAVENCTO,'
      '   0 AS VALOR'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 256
    Top = 128
    object qryHistMovVirtualTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovVirtualPARCELA: TStringField
      FieldName = 'PARCELA'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualANOMES: TStringField
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TStringField
      FieldName = 'HMEDATAPREVISTA'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualHMEDATAVENCTO: TStringField
      FieldName = 'HMEDATAVENCTO'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
