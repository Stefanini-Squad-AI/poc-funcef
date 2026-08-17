inherited frmExecRecebimento: TfrmExecRecebimento
  Left = 459
  Top = 154
  HelpContext = 150016
  Caption = 'Recebimento'
  ClientHeight = 534
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 501
    inherited pgcControle: TPageControl
      Width = 632
      Height = 468
      inherited TabSheet1: TTabSheet
        Caption = 'Recebimento [Seleção]'
        object Label1: TLabel
          Left = 16
          Top = 90
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label3: TLabel
          Left = 320
          Top = 90
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label2: TLabel
          Left = 291
          Top = 443
          Width = 194
          Height = 13
          Caption = 'como recebimentos "inesperados"'
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        inline molMutuario: TmolMutuario
          Left = 8
          Top = 8
          Width = 609
          inherited btnBuscaPart: TBitBtn
            Left = 552
            OnClick = molMutuariobtnBuscaPartClick
          end
          inherited btnLimpaPart: TBitBtn
            Left = 576
            OnClick = molMutuariobtnLimpaPartClick
          end
          inherited edtNome: TEdit
            Width = 353
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 48
          Width = 609
          TabOrder = 1
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 289
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 320
          Top = 104
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molListaPatro: TmolListaPatro
          Left = 7
          Top = 128
          Width = 299
          Height = 121
          TabOrder = 4
          inherited Label6: TLabel
            Top = 0
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Top = 14
            Height = 107
          end
          inherited btnInvertePatro: TBitBtn
            Left = 251
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 271
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        object grpRecebimento: TGroupBox
          Left = 320
          Top = 130
          Width = 289
          Height = 119
          Caption = ' Receber '
          TabOrder = 5
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 16
            Width = 193
            Height = 17
            Caption = 'Folha da(s) Patrocinadora(s)'
            TabOrder = 0
          end
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 36
            Width = 193
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 1
          end
          object chkCaP: TCheckBox
            Left = 16
            Top = 57
            Width = 177
            Height = 17
            Caption = 'Financeiro (a Pagar)'
            TabOrder = 2
          end
          object chkCaR: TCheckBox
            Left = 16
            Top = 78
            Width = 177
            Height = 17
            Caption = 'Financeiro (a Receber)'
            TabOrder = 3
            OnClick = chkCaRClick
          end
        end
        object chkDiverg: TCheckBox
          Left = 16
          Top = 415
          Width = 249
          Height = 17
          Caption = 'NÃO receber itens divergentes (Folha)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 10
          Visible = False
        end
        object chkCritica: TCheckBox
          Left = 16
          Top = 435
          Width = 249
          Height = 17
          Caption = 'Receber somente registros de crítica'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 11
          Visible = False
        end
        object chkInesperado: TCheckBox
          Left = 272
          Top = 423
          Width = 281
          Height = 17
          Caption = 'NÃO considerar itens previamente recebidos'
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 12
          Visible = False
        end
        object grpDataEfetiva: TGroupBox
          Left = 16
          Top = 359
          Width = 289
          Height = 55
          Caption = ' Data de Baixa/Recebimento entre: '
          TabOrder = 9
          object Label4: TLabel
            Left = 140
            Top = 22
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataEfetivaIni: TwwDBDateTimePicker
            Left = 20
            Top = 20
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
            OnChange = edtDataEfetivaIniChange
          end
          object edtDataEfetivaFim: TwwDBDateTimePicker
            Left = 156
            Top = 20
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
            OnChange = edtDataEfetivaFimChange
          end
        end
        object Panel2: TPanel
          Left = 320
          Top = 299
          Width = 289
          Height = 57
          TabOrder = 8
          object Label15: TLabel
            Left = 40
            Top = 8
            Width = 165
            Height = 13
            Caption = 'Débitos / Créditos (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 192
            Top = 22
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2500
            MinValue = 1850
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 40
            Top = 22
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
        end
        object Panel5: TPanel
          Left = 16
          Top = 315
          Width = 289
          Height = 40
          TabOrder = 7
          object Label7: TLabel
            Left = 24
            Top = 13
            Width = 111
            Height = 13
            Caption = 'Cód. Documento:   '
          end
          object edtCodDocumento: TEdit
            Left = 128
            Top = 9
            Width = 121
            Height = 21
            Color = 12648447
            TabOrder = 0
            OnExit = edtCodDocumentoExit
            OnKeyPress = edtCodDocumentoKeyPress
          end
        end
        object rgProcessamento: TRadioGroup
          Left = 320
          Top = 364
          Width = 289
          Height = 48
          Caption = 'Processamento'
          ItemIndex = 1
          Items.Strings = (
            'Clássico'
            'Reestruturado')
          TabOrder = 13
        end
        object gbFormaRecDif: TGroupBox
          Left = 15
          Top = 248
          Width = 595
          Height = 49
          Caption = ' Forma de Recebimento Diferenciada '
          TabOrder = 6
          object btnAtribuiParametro: TSpeedButton
            Left = 531
            Top = 17
            Width = 23
            Height = 22
            Hint = 'Seleciona tipo de recebimento padrão'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAtribuiParametroClick
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 16
            Top = 18
            Width = 513
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
            LookupField = 'CODPORTFORMA'
            Enabled = False
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object btnLimpaFormaRecebimento: TBitBtn
            Left = 560
            Top = 17
            Width = 24
            Height = 21
            Hint = 'Limpa a seleção de Forma de Recebimento'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnLimpaFormaRecebimentoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Recebimento [Resultado]'
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 593
          Height = 191
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object memErro: TMemo
          Left = 17
          Top = 266
          Width = 593
          Height = 87
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object Panel4: TPanel
          Left = 16
          Top = 232
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    inherited Panel1: TPanel
      Width = 632
      inherited fcLabel1: TfcLabel
        Width = 233
        Caption = 'Recebimento [Seleção]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 501
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 460
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      inherited ToolbarSep973: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1027
    Top = 65499
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA,'
      ''
      '   HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.IDITEMCENTRALIZA,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       HME.IDHISTMOVEMPTMO       =:PIDHISTMOVEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      ''
      '   AND HME.HMEANOCOBRANCA        =:PHMEANOCOBRANCA'
      '   AND HME.HMEMESCOBRANCA        =:PHMEMESCOBRANCA'
      ''
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND HME.HMETIPOMOV            NOT IN (5, 8)'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryHistMovHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TMP.IDTMPDESC,'
      ''
      '   TMP.MESCOBRANCA, TMP.MESREFERENCIA,'
      '   TMP.FLGDESCFOLHA,'
      '   TMP.SITENVIO,'
      '   TMP.IDDESCONTO,'
      '   TMP.ORDEM, TMP.IDHISTMOVEMPTMO,'
      ''
      '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR,'
      '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO,'
      '   TMP.DATARECEBIMENTO,'
      ''
      '   TMP.FLGTIPODESC,'
      '   TMP.FLGATRASODEVOL,'
      ''
      '   TMP.IDPROVENTO, TMP.CODPROVDESC,'
      ''
      '   TMP.MATRICULA, TMP.INSCRICAONUMERO,'
      '   TMP.IDTITULAR, TMP.IDPESSOA,'
      ''
      '   TMP.IDPESSJUR, TMP.IDPLANOPREV,'
      '   TMP.IDLOTE,'
      '   TMP.LOTEPREVIA,'
      ''
      '   TMP.NUMPRIORIDADE,'
      '   TMP.DESCRICAO,'
      ''
      '   TMP.DATAREFERENCIA, TMP.REFERENCIA,'
      '   TMP.DATACOBRANCA,'
      '   TMP.FLGDESCONTO,'
      ''
      '   TMP.RECPAG,'
      '   TMP.IDMODULO,'
      '   TMP.SISTORIGEM,'
      '   TMP.IDMOTIVO,'
      '   TMP.IDEMPRESAPROP,'
      '   TMP.IDEMPRESA,'
      '   TMP.IDFUNDACAO,'
      ''
      '   TMP.SEQPROPOSTA,'
      '   TMP.NODOCUMENTO, TMP.COMPLDOCUMENTO,'
      '   TMP.PARCELA, TMP.NUMPARCELAS,'
      ''
      '   CON.FLGSITUACAO,'
      '   CON.IDTIPOCONTREMPTMO'
      ''
      ''
      'FROM'
      '   TMPDESC         TMP,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE'
      ''
      ''
      'WHERE'
      '       TMP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      '   AND TMP.IDMODULO           IN (15, 32, 18)'
      ''
      '   AND (TMP.SITENVIO          IN ('#39'1'#39', '#39'2'#39', '#39'X'#39'))'
      ''
      
        '   AND ( (:PCRITICA           IS NULL) OR ( (:PCRITICA IS NOT NU' +
        'LL) AND (TMP.SITENVIO =:PCRITICA) ) )'
      ''
      '   AND TMP.FLGTIPODESC        = '#39'E'#39
      '   AND TMP.MESCOBRANCA        =:PMESCOBRANCA'
      '   AND TMP.IDPESSJUR          =:PIDPESSJUR'
      ''
      '   AND ( (:PFLGDESCFOLHA      IS NULL)'
      '         OR (:PFLGDESCFOLHA   = 1 AND TMP.FLGDESCFOLHA = '#39'P'#39')'
      '         OR (:PFLGDESCFOLHA   = 2 AND TMP.FLGDESCFOLHA = '#39'B'#39')'
      '       )'
      ''
      
        '   AND ( (:PSITENVIO          IS NULL) OR ((:PSITENVIO = 2) AND ' +
        '(TMP.VALOR = TMP.VALORRECEBIDO)) )'
      ''
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TCE.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (CON.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      ''
      
        '   AND ( (:PIDPESSOA          IS NULL) OR (TMP.IDPESSOA  =:PIDPE' +
        'SSOA) )'
      
        '   AND ( (:PIDDESCONTO        IS NULL) OR ((TMP.IDDESCONTO =:PID' +
        'DESCONTO) AND (CON.IDCONTRATOEMPTMO =:PIDDESCONTO)) )'
      ''
      
        '   AND (:PHMEDATAEFETIVAINI   IS NULL OR TMP.DATARECEBIMENTO  >=' +
        'to_date(:PHMEDATAEFETIVAINI,'#39'dd/,mm/yyyy'#39'))'
      
        '   AND (:PHMEDATAEFETIVAFIM   IS NULL OR TMP.DATARECEBIMENTO  <=' +
        'to_date(:PHMEDATAEFETIVAFIM,'#39'dd/,mm/yyyy'#39'))'
      ''
      '   AND TMP.VALORRECEBIDO      IS NOT NULL'
      ''
      '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      ''
      'ORDER BY'
      '   TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCRITICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
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
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end>
  end
  object qryContratosGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOEMPTMO,'
      ''
      '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO,'
      '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO,'
      ''
      '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA,'
      '   C.IDPESSOA, C.IDBENEF,'
      ''
      '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG,'
      '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG,'
      '   C.IDCBANCARIA,'
      ''
      '   C.DATAASSINATURA, C.DATASITUACAO,'
      '   C.DATACREDITO, C.DATAPRIMPARC,'
      '   C.DATACANC,'
      ''
      '   C.MOECODIGO, M.MOESIGLA,'
      ''
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      ''
      '   ULT.HMENUMPARCELAS,'
      '   ULT.HMEPARCELA,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC,'
      ''
      '   I.DATAINSC,'
      '   ULT.DATAULTATUALIZA'
      ''
      'FROM'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO  C,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      ''
      '   ('
      '    SELECT'
      '      IDCONTRATOEMPTMO,'
      '      HMEPARCELA,'
      '      HMENUMPARCELAS,'
      '      MAX(HMEDATAATUALIZA) AS DATAULTATUALIZA'
      '    FROM'
      '      HISTMOVEMPTMO'
      '    WHERE'
      '      (HMEDATAATUALIZA < TO_DATE('#39'01/11/2001'#39','#39'dd/mm/yyyy'#39') )'
      '   GROUP BY'
      '      IDCONTRATOEMPTMO,'
      '      HMEPARCELA,'
      '      HMENUMPARCELAS'
      '   ) ULT'
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( C.IDPATRO            IN ( 1 ) )'
      '   AND ( C.IDPLANOPREV        IN ( 1 ) )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDCONTRATOEMPTMO   = ULT.IDCONTRATOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )')
    ValidateWithMask = True
    Left = 212
    Top = 228
    object qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosGeracaoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosGeracaoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosGeracaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosGeracaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosGeracaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosGeracaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosGeracaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosGeracaoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosGeracaoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosGeracaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosGeracaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosGeracaoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosGeracaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosGeracaoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosGeracaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosGeracaoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryContratosGeracaoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryContratosGeracaoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object qryContratosGeracaoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryContratosGeracaoIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object qryContratosGeracaoIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object qryContratosGeracaoIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object qryContratosGeracaoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryContratosGeracaoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryContratosGeracaoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
    object qryContratosGeracaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratosGeracaoDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryBuscaParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDITEMEMPTMO,'
      '   HME.HMEPARCELA,'
      '   HME.HMENUMPARCELAS,'
      '   HME.HMESALDODEV,'
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO'
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(H.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      ('
      '      SELECT'
      '         MAX(HMEPARCELA) AS HMEPARCELA'
      '      FROM'
      '         HISTMOVEMPTMO'
      '      WHERE'
      '         IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      ) P'
      '   WHERE'
      '          H.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '      AND H.HMETIPOMOV        = 1'
      '      AND ( H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1 )'
      '      AND ( H.FLGESTORNADO    = 0 OR H.FLGESTORNADO IS NULL )'
      '      AND H.HMEPARCELA        = P.HMEPARCELA'
      '   ) PAR'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO    = PAR.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 212
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
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaParcelaIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryBuscaParcelaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryBuscaParcelaHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryBuscaParcelaHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryBuscaParcelaHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryBuscaParcelaHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
  end
  object qryBuscaItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO'
      'FROM'
      '   ITEMXTIPOCONTR'
      'WHERE'
      '       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      
        '   AND ( IDPROVENTON      =:PIDRUBRICA OR IDPROVENTOA =:PIDRUBRI' +
        'CA OR IDPROVENTOD =:PIDRUBRICA )'
      '   AND ITCEVENTO         IN (1, 4)'
      '   AND ( FLGCENTRALIZA   = 1 OR FLGDESTACADO = 1 )'
      'ORDER BY'
      '   IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 232
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end>
    object qryBuscaItemIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDITEMEMPTMO'
    end
  end
  object qryUpdateHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO       =:PFLGBAIXADO,'
      '   HME.HMEFORMACOBRANCA =:PHMEFORMACOBRANCA,'
      '   HME.HMETIPOFOLHA     =:PHMETIPOFOLHA,'
      '   HME.FLGRECEBIMENTO   =:PFLGRECEBIMENTO,'
      '   HME.HMEDATAEFETIVA   =:PHMEDATAEFETIVA,'
      '   HME.HMEVLREFETIVO    =:PHMEVLREFETIVO,'
      '   HME.FLGDIVERGPEND    =:PFLGDIVERGPEND,'
      '   HME.FLGTIPODIVERG    =:PFLGTIPODIVERG,'
      '   HME.FLGDIVERGTRAT    =:PFLGDIVERGTRAT,'
      '   HME.HMEDATARECEB     =:PHMEDATARECEB'
      'WHERE'
      '       HME.IDHISTMOVEMPTMO    =:PIDHISTMOVEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMETIPOFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGRECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGTRAT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryBaixaItensDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO             = NULL,'
      '   HME.FLGENVIO               = NULL,'
      '   HME.FLGDIVERGPEND          =:PFLGDIVERGPEND,'
      '   HME.FLGTIPODIVERG          =:PFLGTIPODIVERG,'
      '   HME.HMEVLREFETIVO          = HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAEFETIVA         =:PHMEDATAEFETIVA,'
      '   HME.HMETIPOFOLHA           = NULL,'
      '   HME.HMEFORMACOBRANCA       = '#39'C'#39','
      '   HME.HMEDATARECEB           =:PHMEDATARECEB'
      'WHERE'
      '       ( HME.CODDOCUMENTO     =:PCODDOCUMENTO )'
      ''
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMETIPOMOV       <> 5 )'
      ''
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      ''
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR ( HME.FLGQUITADO      ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR ( HME.FLGABONADO      ' +
        '  = 0 ) )'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object qryItensABaixar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO,'
      '   HME.IDITEMEMPTMO,'
      '   HME.CODDOCUMENTO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON'
      ''
      'WHERE'
      '       HME.CODDOCUMENTO          =:PCODDOCUMENTO'
      ''
      '   AND ('
      '         ('
      '         :PJABAIXADO IS NOT NULL'
      '         )'
      '       OR'
      '         ('
      '             HME.FLGBAIXADO       = 0'
      '         AND HME.HMEVLREFETIVO    IS NULL'
      '         AND HME.HMEDATAEFETIVA   IS NULL'
      '         )'
      '       )'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   ABS(ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2)) DESC')
    ValidateWithMask = True
    Left = 152
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PJABAIXADO'
        ParamType = ptInput
      end>
    object qryItensABaixarIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensABaixarIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensABaixarIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensABaixarCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensABaixarHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensABaixarHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensABaixarHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryItensABaixarHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryItensABaixarHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensABaixarHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryItensABaixarHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryItensABaixarHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensABaixarHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryItensABaixarIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryItensABaixarHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryItensABaixarHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryItensABaixarHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryItensABaixarHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryItensABaixarIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensABaixarHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensABaixarHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryItensABaixarHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryItensABaixarHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryItensABaixarHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryItensABaixarHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensABaixarHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryItensABaixarHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensABaixarHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensABaixarHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryItensABaixarFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryItensABaixarFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryItensABaixarFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryItensABaixarFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryItensABaixarFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryItensABaixarFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryItensABaixarIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryHistMovQuitado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG,'
      '   HME.HMEFORMACOBRANCA,'
      '   HME.HMETIPOFOLHA,'
      '   HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.IDITEMCENTRALIZA,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       ( HME.IDHISTMOVEMPTMO     =:PIDHISTMOVEMPTMO )'
      '   AND ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      ''
      '   AND ( HME.HMEANOCOBRANCA      =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA      =:PHMEMESCOBRANCA )'
      ''
      '   AND ( HME.FLGQUITADO          = 1 )'
      ''
      
        '   AND ( ( HME.HMECENTRALIZA     = 1 ) OR ( HME.HMEDESTACADO = 1' +
        ' ) )'
      '   AND ( HME.HMETIPOMOV          <> 5 )'
      ''
      
        '   AND ( ( HME.FLGESTORNADO      IS NULL ) OR ( HME.FLGESTORNADO' +
        ' = 0 ) )'
      
        '   AND ( ( HME.FLGABONADO        IS NULL ) OR ( HME.FLGABONADO =' +
        ' 0 ) )')
    ValidateWithMask = True
    Left = 56
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHistMovQuitadoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovQuitadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovQuitadoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovQuitadoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovQuitadoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovQuitadoHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovQuitadoHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovQuitadoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovQuitadoHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovQuitadoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovQuitadoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovQuitadoHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovQuitadoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovQuitadoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovQuitadoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovQuitadoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovQuitadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovQuitadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovQuitadoHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovQuitadoHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovQuitadoIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovQuitadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovQuitadoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovQuitadoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovQuitadoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovQuitadoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovQuitadoFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovQuitadoFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovQuitadoFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovQuitadoFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovQuitadoFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovQuitadoFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryHistMovQuitadoHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
  end
  object qryBaixaItensZero: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO             = 0,'
      '   HME.FLGENVIO               = NULL,'
      '   HME.FLGDIVERGPEND          =:PFLGDIVERGPEND,'
      '   HME.FLGTIPODIVERG          =:PFLGTIPODIVERG'
      'WHERE'
      '       ( HME.CODDOCUMENTO     =:PCODDOCUMENTO )'
      ''
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMETIPOMOV       <> 5 )'
      ''
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      ''
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR ( HME.FLGQUITADO      ' +
        '  = 0 ) )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR ( HME.FLGABONADO      ' +
        '  = 0 ) )'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object qryEstornoProvisaoItensDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   HME.IDCONTRATOEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.CODDOCUMENTO     =:PCODDOCUMENTO )'
      
        '   AND ( (HME.HMECENTRALIZA   = 1)     OR ( HME.HMEDESTACADO    ' +
        '  = 1 ) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR ( HME.FLGESTORNADO    ' +
        '  = 0 ) )'
      '')
    ValidateWithMask = True
    Left = 544
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryEstornoProvisaoItensDocIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
  end
  object qryItensCaPCaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.CODDOCUMENTO,'
      
        '   ROUND( SUM( DECODE( HME.HMERECPAG, '#39'P'#39', ABS( NVL( HME.HMEVLRP' +
        'REVISTO, 0 ) ),'
      
        '               DECODE( HME.HMETIPOMOV, 0,  ABS( NVL( HME.HMEVLRP' +
        'REVISTO, 0 ) ),'
      
        '                                                NVL( HME.HMEVLRP' +
        'REVISTO, 0 ) ) ) ), 2) AS VLR_PREVISTO_DOC,'
      '   HME.HMEDATAVENCTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   DOCUMENTO       DOC,'
      ''
      '   ('
      '   SELECT'
      '      DCO.CODDOCUMENTO,'
      '      MAX(DATABAIXA) AS DATABAIXA'
      '   FROM'
      '      RECBTOPAGTO  RCP,'
      '      DOCUMENTO    DCO'
      '   WHERE'
      '          DCO.RECPAG             =:PHMERECPAG'
      '      AND DCO.IDMODULO           in (15, 18)'
      
        '      AND ( (:PCODDOCUMENTO      IS NULL) OR (DCO.CODDOCUMENTO =' +
        ':PCODDOCUMENTO) )'
      
        '      AND ( (RCP.DATABAIXA      >=:PHMEDATAEFETIVAINI) OR (:PHME' +
        'DATAEFETIVAINI IS NULL AND DCO.DATAVENCTO >=:PDATAVENCTOINI) )'
      
        '      AND ( (RCP.DATABAIXA      <=:PHMEDATAEFETIVAFIM) OR (:PHME' +
        'DATAEFETIVAFIM IS NULL AND DCO.DATAVENCTO <=:PDATAVENCTOFIM) )'
      '      AND DCO.CODDOCUMENTO       = RCP.CODDOCUMENTO'
      '   GROUP BY'
      '      DCO.CODDOCUMENTO'
      '   ) REC,'
      ''
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      ''
      
        '   AND (:PIDPATRO                IS NULL OR CON.IDPATRO =:PIDPAT' +
        'RO)'
      ''
      '   AND DOC.RECPAG                =:PHMERECPAG'
      '   AND LTRIM(RTRIM(DOC.STATUS))  = '#39'2'#39
      ''
      
        '   AND ( (:PCODDOCUMENTO         IS NULL) OR (DOC.CODDOCUMENTO =' +
        ':PCODDOCUMENTO) )'
      ''
      '   AND HME.HMEANOCOBRANCA        =:PHMEANOCOBRANCA'
      '   AND HME.HMEMESCOBRANCA        =:PHMEMESCOBRANCA'
      ''
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMETIPOMOV            NOT IN (5, 8)'
      ''
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      ''
      
        '   AND ( (HME.HMECENTRALIZA      = 1)     OR ( HME.HMEDESTACADO ' +
        '     = 1 ) )'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      
        '   AND ( (:PIDTIPOEMPTMO         IS NULL) OR (TCE.IDTIPOEMPTMO  ' +
        '     =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO    IS NULL) OR (CON.IDTIPOCONTREMP' +
        'TMO  =:PIDTIPOCONTREMPTMO) )'
      ''
      
        '   AND ( (:PIDBENEF              IS NULL) OR (CON.IDBENEF       ' +
        '     =:PIDBENEF) )'
      
        '   AND ( (:PIDCONTRATOEMPTMO     IS NULL) OR (CON.IDCONTRATOEMPT' +
        'MO   =:PIDCONTRATOEMPTMO) )'
      ''
      
        '   AND ( (REC.DATABAIXA         >=:PHMEDATAEFETIVAINI) OR ( (REC' +
        '.DATABAIXA IS NULL OR :PHMEDATAEFETIVAINI IS NULL) AND HME.HMEDA' +
        'TAVENCTO >=:PDATAVENCTOINI) )'
      
        '   AND ( (REC.DATABAIXA         <=:PHMEDATAEFETIVAFIM) OR ( (REC' +
        '.DATABAIXA IS NULL OR :PHMEDATAEFETIVAFIM IS NULL) AND HME.HMEDA' +
        'TAVENCTO <=:PDATAVENCTOFIM) )'
      ''
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND HME.CODDOCUMENTO          = DOC.CODDOCUMENTO'
      '   AND DOC.CODDOCUMENTO          = REC.CODDOCUMENTO(+)'
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      'GROUP BY'
      '   HME.CODDOCUMENTO, HME.HMEDATAVENCTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCTOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
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
        Name = 'PIDBENEF'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCTOFIM'
        ParamType = ptInput
      end>
    object qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField
      FieldName = 'VLR_PREVISTO_DOC'
    end
    object qryItensCaPCaRHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensCaPCaRCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qryHistMovAgrupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG, HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA,'
      ''
      '   HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.IDITEMCENTRALIZA,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       ( HME.IDTMPDESC           =:PIDTMPDESC )'
      '   AND ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      ''
      '   AND ( HME.HMEANOCOBRANCA      =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA      =:PHMEMESCOBRANCA )'
      ''
      
        '   AND ( ( HME.HMECENTRALIZA     = 1 ) OR ( HME.HMEDESTACADO = 1' +
        ' ) )'
      '   AND ( HME.HMETIPOMOV          <> 5 )'
      ''
      
        '   AND ( ( HME.FLGESTORNADO      IS NULL ) OR ( HME.FLGESTORNADO' +
        ' = 0 ) )'
      
        '   AND ( ( HME.FLGQUITADO        IS NULL ) OR ( HME.FLGQUITADO =' +
        ' 0 ) )'
      
        '   AND ( ( HME.FLGABONADO        IS NULL ) OR ( HME.FLGABONADO =' +
        ' 0 ) )')
    ValidateWithMask = True
    Left = 48
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHistMovAgrupadoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovAgrupadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovAgrupadoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovAgrupadoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovAgrupadoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovAgrupadoHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovAgrupadoHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovAgrupadoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovAgrupadoHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovAgrupadoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovAgrupadoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovAgrupadoHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovAgrupadoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovAgrupadoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovAgrupadoHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovAgrupadoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovAgrupadoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovAgrupadoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovAgrupadoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovAgrupadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovAgrupadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovAgrupadoHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovAgrupadoHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovAgrupadoIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovAgrupadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovAgrupadoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovAgrupadoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovAgrupadoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovAgrupadoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovAgrupadoFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovAgrupadoFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovAgrupadoFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovAgrupadoFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovAgrupadoFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovAgrupadoFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryHistMovAgrupadoHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
  end
  object qryHistMovQuitadoAgrupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      ''
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,'
      ''
      '   HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMERECPAG,'
      '   HME.HMEFORMACOBRANCA,'
      '   HME.HMETIPOFOLHA,'
      '   HME.HMESEQCOBRANCA,'
      ''
      '   HME.IDRUBRICA, HME.HMEPRIORIDADE,'
      ''
      
        '   HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDR' +
        'EGRA,'
      ''
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.IDITEMCENTRALIZA,'
      ''
      
        '   ROUND(NVL(HME.HMEVLRPREVISTO, 0), 2) AS HMEVLRPREVISTO, HME.H' +
        'MEVLREFETIVO,'
      '   HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEDATAEFETIVA,'
      ''
      '   HME.FLGBAIXADO,'
      '   HME.FLGDIVERGPEND,'
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGESTORNADO,'
      '   HME.FLGQUITADO,'
      '   HME.FLGABONADO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       ( HME.IDTMPDESC           =:PIDTMPDESC )'
      '   AND ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      ''
      '   AND ( HME.HMEANOCOBRANCA      =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA      =:PHMEMESCOBRANCA )'
      ''
      '   AND ( HME.FLGQUITADO          = 1 )'
      ''
      
        '   AND ( ( HME.HMECENTRALIZA     = 1 ) OR ( HME.HMEDESTACADO = 1' +
        ' ) )'
      '   AND ( HME.HMETIPOMOV          <> 5 )'
      ''
      
        '   AND ( ( HME.FLGESTORNADO      IS NULL ) OR ( HME.FLGESTORNADO' +
        ' = 0 ) )'
      
        '   AND ( ( HME.FLGABONADO        IS NULL ) OR ( HME.FLGABONADO =' +
        ' 0 ) )')
    ValidateWithMask = True
    Left = 56
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHistMovQuitadoAgrupadoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovQuitadoAgrupadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovQuitadoAgrupadoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovQuitadoAgrupadoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovQuitadoAgrupadoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovQuitadoAgrupadoHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovQuitadoAgrupadoHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovQuitadoAgrupadoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovQuitadoAgrupadoHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovQuitadoAgrupadoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoAgrupadoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoAgrupadoHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovQuitadoAgrupadoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovQuitadoAgrupadoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovQuitadoAgrupadoHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovQuitadoAgrupadoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovQuitadoAgrupadoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovQuitadoAgrupadoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovQuitadoAgrupadoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovQuitadoAgrupadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovQuitadoAgrupadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovQuitadoAgrupadoHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovQuitadoAgrupadoHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovQuitadoAgrupadoIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovQuitadoAgrupadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovQuitadoAgrupadoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryHistMovQuitadoAgrupadoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovQuitadoAgrupadoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovQuitadoAgrupadoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryHistMovQuitadoAgrupadoFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovQuitadoAgrupadoFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovQuitadoAgrupadoFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovQuitadoAgrupadoFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovQuitadoAgrupadoFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovQuitadoAgrupadoFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
  end
  object qryTotalizaHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO   HME'
      'WHERE'
      '       HME.IDTMPDESC           =:PIDTMPDESC'
      '   AND HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO'
      ''
      '   AND HME.HMEANOCOBRANCA      =:PHMEANOCOBRANCA'
      '   AND HME.HMEMESCOBRANCA      =:PHMEMESCOBRANCA'
      ''
      '   AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND HME.HMETIPOMOV          NOT IN (5, 8)'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0')
    ValidateWithMask = True
    Left = 432
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryTotalizaHistHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryBaixaTodosItensTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGBAIXADO                = NULL,'
      '   HME.FLGENVIO                  = NULL,'
      '   HME.FLGDIVERGPEND             =:PFLGDIVERGPEND,'
      '   HME.FLGTIPODIVERG             =:PFLGTIPODIVERG,'
      '   HME.HMEVLREFETIVO             = HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAEFETIVA            =:PHMEDATAEFETIVA,'
      '   HME.HMEDATARECEB              =:PHMEDATARECEB'
      'WHERE'
      '       HME.IDTMPDESC             =:PIDTMPDESC'
      '   AND HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      ''
      '   AND HME.HMEMESCOBRANCA        =:PHMEMESCOBRANCA'
      '   AND HME.HMEANOCOBRANCA        =:PHMEANOCOBRANCA'
      ''
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMETIPOMOV            <> 5'
      ''
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      ''
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO      ' +
        '= 1) )'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0')
    ValidateWithMask = True
    Left = 500
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object qryEventoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.HMETIPOMOV,'
      '   HME.HMEORIGEM'
      'FROM'
      '   HISTMOVEMPTMO   HME'
      'WHERE'
      '       HME.CODDOCUMENTO         =:PCODDOCUMENTO'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0')
    ValidateWithMask = True
    Left = 432
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryEventoDocIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryEventoDocHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryEventoDocHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
  end
  object qryItemProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXP.IDITEMEMPTMO,'
      '   IXP.IDTIPOCONTREMPTMO,'
      '   IXP.IDPROCESSO, IXP.FLGTIPOITEM'
      ''
      'FROM'
      '   ITEMXPROCESSOEP IXP,'
      '   ITEMEMPTMO      ITE,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP      = :PIDEMPRESAPROP'
      ''
      '   AND IXP.IDTIPOCONTREMPTMO  = :PIDTIPOCONTREMPTMO'
      '   AND IXP.IDITEMEMPTMO       = :PIDITEMEMPTMO'
      ''
      '   AND IXP.IDPROCESSO         = 999'
      '   AND IXP.FLGTIPOITEM        IN (4, 5)'
      ''
      '   AND IXP.IDITEMEMPTMO       = ITE.IDITEMEMPTMO'
      '   AND IXP.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 152
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryItemProcessoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItemProcessoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryItemProcessoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object qryItemProcessoFLGTIPOITEM: TFloatField
      FieldName = 'FLGTIPOITEM'
    end
  end
  object QryValorAcertoConcessao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(HMEVLRPREVISTO) HMEVLRPREVISTO'
      '  FROM HISTMOVEMPTMO'
      ' WHERE IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '   AND HMECENTRALIZA = 1'
      '   AND HMETIPOMOV = 0'
      '   AND HMEORIGEM IN (0,13)'
      '   AND NVL(FLGESTORNADO, 0) = 0')
    ValidateWithMask = True
    Left = 560
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
    object QryValorAcertoConcessaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object QryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRATOEMPTMO'
      'FROM   '
      '       CONTRATOEMPTMO'
      'WHERE  IDCONTRQUITACAO    = :PIDCONTRATOEMPTMO   ')
    ValidateWithMask = True
    Left = 552
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object QryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
  end
  object QryDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     '
      '(SELECT '
      '   HME.HMEDATAPREVISTA '
      'FROM '
      ''
      '    HISTMOVEMPTMO HME'
      'WHERE '
      '      HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO    '
      ' AND   HMECENTRALIZA       = 1 '
      ' AND   HMETIPOMOV          = 0'
      ' AND   HMEORIGEM           = 0'
      ' AND   NVL(FLGESTORNADO,0) = 0 )  AS DATAPREV,'
      ' '
      '(SELECT '
      '   HME.HMEDATAPREVISTA '
      'FROM '
      ''
      '    HISTMOVEMPTMO HME'
      'WHERE '
      '      HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO    '
      ' AND   HMECENTRALIZA       = 1 '
      ' AND   HMETIPOMOV          = 0'
      ' AND   HMEORIGEM           = 13'
      ' AND   NVL(FLGESTORNADO,0) = 0  ) AS DATACONC '
      'FROM DUAL     ')
    ValidateWithMask = True
    Left = 440
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object QryDatasDATAPREV: TDateTimeField
      FieldName = 'DATAPREV'
    end
    object QryDatasDATACONC: TDateTimeField
      FieldName = 'DATACONC'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 320
    Top = 268
  end
  object qryUpdateContratos: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'update'
      'HISTMOVEMPTMO'
      'set'
      '          HMEDATAEFETIVA  =  NULL,'
      '          HMEVLREFETIVO   =  NULL,'
      '          FLGBAIXADO      = 0'
      '                   '
      'where idcontratoemptmo = :idcontratoemptmo '
      'and HMEDATAPREVISTA = :HMEDATAPREVISTA '
      'AND HMEORIGEM = 0     '
      'AND HMETIPOMOV = 3')
    ValidateWithMask = True
    Left = 516
    Top = 127
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HMEDATAPREVISTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateContratosFinal: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'update'
      'CONTRATOEMPTMO'
      'set'
      '          IDCONTRQUITACAO =  NULL                   '
      'where idcontratoemptmo = :idcontratoemptmo ')
    ValidateWithMask = True
    Left = 420
    Top = 127
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object SP_PROC: TStoredProc
    DatabaseName = 'BASEDADOS'
    StoredProcName = 'CM.SP_RECEBIMENTO_AUTOMATICO'
    Left = 376
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PNUMCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PTIPOCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGFOLHAPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGFOLHABENEF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGFINANAPAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGFINANARECEBER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPORTADORFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATABAIXARECINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATABAIXARECFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMSGERRO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PERRO'
        ParamType = ptOutput
      end>
  end
  object qryResultado: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT LINHARESULTADO FROM CM.RESULT_RECEBIMENTOAUTO WHERE TIPOR' +
        'ESULTADO = 1')
    ValidateWithMask = True
    Left = 420
    Top = 263
  end
end
