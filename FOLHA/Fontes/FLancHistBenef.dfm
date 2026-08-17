inherited frmLancHistBenef: TfrmLancHistBenef
  Left = 408
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Manual de Lançamentos para Histórico de Benefícios'
  ClientHeight = 527
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 488
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 690
      Height = 486
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      OnExit = Panel1Exit
      object Label1: TLabel
        Left = 33
        Top = 96
        Width = 204
        Height = 13
        Caption = 'Selecionar Arquivo para Importação'
      end
      object SB1: TSpeedButton
        Left = 629
        Top = 110
        Width = 24
        Height = 22
        Cursor = crHandPoint
        Hint = 'Buscar Arquivo '
        Enabled = False
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB1Click
      end
      object Label2: TLabel
        Left = 315
        Top = 52
        Width = 39
        Height = 13
        Caption = 'Motivo'
      end
      object lblLote: TLabel
        Left = 315
        Top = 10
        Width = 26
        Height = 13
        Caption = 'Lote'
      end
      object edtArquivo: TEdit
        Left = 32
        Top = 112
        Width = 594
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = edtArquivoChange
        OnExit = edtArquivoExit
        OnKeyPress = edtArquivoKeyPress
      end
      object dblkcMotivo: TwwDBLookupCombo
        Left = 315
        Top = 67
        Width = 336
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'173'#9'Motivo'#9'F')
        LookupTable = qryMotivo
        LookupField = 'IDMOTIVO'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcMotivoChange
        OnCloseUp = dblkcMotivoCloseUp
        OnExit = dblkcMotivoExit
      end
      object dblkcLote: TwwDBLookupCombo
        Left = 315
        Top = 25
        Width = 93
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDLOTE'#9'10'#9'Lote Nº'
          'MESREFERENCIA'#9'7'#9'Mês'
          'DESCRICAO'#9'200'#9'Descrição')
        DataField = 'DESCRICAO'
        LookupTable = qryLote
        LookupField = 'IDLOTE'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcLoteChange
        OnCloseUp = dblkcLoteCloseUp
        OnExit = dblkcLoteExit
      end
      object PageControl: TPageControl
        Left = -1
        Top = 144
        Width = 690
        Height = 342
        ActivePage = TabSheet1
        TabOrder = 4
        object TabSheet1: TTabSheet
          Caption = 'Lançamentos'
          object GS: TwwDBGrid
            Left = 0
            Top = 0
            Width = 682
            Height = 314
            Selected.Strings = (
              'MATRICULA'#9'8'#9'Matricula'
              'MESCOMPREEM'#9'7'#9'Competência ~INSS'
              'MES'#9'10'#9'Mês de ~Pagamento'
              'MESREFERENCIA'#9'10'#9'Mês de ~Referência'
              'VALORPREV'#9'8'#9'Valor ~Previsto'
              'VLBENEFPGTO'#9'8'#9'Valor ~Efetivo'
              'DATAPAGAMENTO'#9'8'#9'Data ~Prevista'
              'DTEFETPGTO'#9'7'#9'Data ~Efetiva'
              'ESTADO'#9'7'#9'Estado'
              'DESCRICAO'#9'7'#9'Motivo'
              'NUMEROPROCESSO'#9'10'#9'Processo Nº'
              'NOME'#9'60'#9'Benefício'
              'DESCLOTE'#9'50'#9'Lote')
            MemoAttributes = [mSizeable]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsImporta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = GSCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Resultado'
          ImageIndex = 1
          object mmResultado: TMemo
            Left = 0
            Top = 0
            Width = 670
            Height = 314
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Log Erros'
          ImageIndex = 2
          object mmLogErro: TMemo
            Left = 0
            Top = 0
            Width = 670
            Height = 314
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object RGLancamento: TRadioGroup
        Left = 33
        Top = 6
        Width = 269
        Height = 82
        Caption = ' Lançar como: '
        Items.Strings = (
          'A Processar'
          'Processado')
        TabOrder = 0
        OnClick = RGLancamentoClick
        OnExit = RGLancamentoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 488
    Width = 692
    inherited tb97Fundo: TToolbar97
      Left = 590
      DockPos = 590
      inherited sep1: TToolbarSep97
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Width = 0
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 421
      DockPos = 421
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object bBtnDesfazer: TBitBtn
      Left = 1
      Top = 2
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Caption = '&Desfazer'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = bBtnDesfazerClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object prbReproc: TProgressBar
      Left = 84
      Top = 2
      Width = 336
      Height = 34
      Align = alClient
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 315
    Top = 219
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO,DESCRICAO'
      'FROM     MOTIVO'#9
      'WHERE'
      #9'IDMOTIVO  NOT IN (3007,3008)'
      'ORDER BY UPPER(DESCRICAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 379
    object qryMotivoDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 173
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryMotivoIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
  end
  object QryImporta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDTITULAR, H.IDPESSJUR, H.IDPLANOPREV, H.IDBENEFICIO, H' +
        '.IDMOTIVO, H.IDPESSOA,'
      
        '       H.NUMEROPROCESSO, H.MES, H.SEQBENEFICIO, H.SEQPROPOSTA, H' +
        '.IDLOTE, H.VLBENEFPGTO,'
      
        '       H.DATAPAGAMENTO, H.CODPORTFORMA, H.VALORPREV, H.FLGACERTO' +
        'DESFEITO, H.CODREFERENCIA,'
      
        '       H.FLGENVIADO, H.MESREFERENCIA, H.FLGCONCESSAO, H.FLGDEVOL' +
        'UCAO, H.FLGFORMAPAGTO, H.VALORTOTAL,'
      
        '       H.FONTEPAGADORA, H.VALORINTEGRAL, H.DTEFETPGTO, M.DESCRIC' +
        'AO, H.VALORCALCULADO, D.MATRICULA,'
      
        '       DECODE(FLGENVIADO,8,'#39'Fora convênio'#39',9,'#39'Retido'#39',1,'#39'Process' +
        'ado'#39','#39'A Processar'#39') ESTADO, B.NOME,'
      
        '       H.FLGMANUAL, H.IDPLANOORIGEM, H.VALOROP1, H.VALOROP2, H.V' +
        'ALOROP3, H.VALORPREVMIN, C.DESCRICAO AS DESCLOTE,'
      
        '       H.VALORSRB, H.PERCENTUAL, H.IDSEQINTERNOFB, H.TRGDTINCLUS' +
        'AO, H.TRGUSERINCLUSAO, H.MESCOMPREEM,                           ' +
        '                                                  '
      
        '       '#39'                                        '#39' AS NOMEUSU, H.' +
        'FLGTIPOREGISTRO,'
      
        '       DECODE(NVL(H.FLGMANUAL,0),                               ' +
        '                                     '
      
        '         0, '#39'Não manual'#39',                                       ' +
        '                                   '
      
        '         1, '#39'Inclusão Manual'#39',                                  ' +
        '                                   '
      '         2, '#39'Alteração Manual'#39','
      '         3, '#39'Importado'#39','
      
        '         '#39'Não identificado'#39') AS TIPOMANUAL,                     ' +
        '                                                                ' +
        '                                               '
      '       DECODE(NVL(H.FLGTIPOREGISTRO,0),'
      
        '         0, '#39'Normal'#39',                                           ' +
        '                                   '
      
        '         1, '#39'Abono'#39',                                            ' +
        '                                   '
      
        '         2, '#39'Antecipação de abono'#39',                             ' +
        '                                   '
      
        '         3, '#39'Revisão Normal'#39',                                   ' +
        '                                   '
      
        '         4, '#39'Abono revisão'#39',                                    ' +
        '                                   '
      
        '         5, '#39'Antecipação de abono revisão'#39',                     ' +
        '                                   '
      '         '#39'Não identificado'#39') AS TIPOREGISTRO,'
      
        '       DECODE(NVL(H.FLGALIMRESERVA,0), 0, '#39'Não'#39', '#39'Sim'#39') AS ALIMR' +
        'ESERVA                           '
      
        '       FROM   HSTBENEFBFCIARIO H, MOTIVO M, DEPENTIT D, BENEFICI' +
        'O B, CTRLINTERFACE C'
      
        '       WHERE ((:DATAPAGAMENTO IS NULL) OR (H.DATAPAGAMENTO   = :' +
        'DATAPAGAMENTO))'
      '       AND   ((:IDLOTE = -1) OR (H.IDLOTE          = :IDLOTE))'
      '       AND   (H.IDMOTIVO        = :IDMOTIVO)'
      '       AND   (H.FLGENVIADO      = :FLGENVIADO)'
      '       AND   (H.FLGMANUAL       = 3)'
      '       AND   (H.IDMOTIVO = M.IDMOTIVO)'
      '       AND   (H.IDPESSOA = D.IDPESSOA)'
      '       AND   (H.IDTITULAR = D.IDTITULAR)'
      '       AND   (H.IDBENEFICIO = B.IDBENEFICIO)'
      '       AND   (H.IDLOTE      = C.IDLOTE)'
      '       ORDER BY H.TRGDTINCLUSAO DESC, H.MESREFERENCIA DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 403
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAPAGAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAPAGAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGENVIADO'
        ParamType = ptUnknown
      end>
    object QryImportaMATRICULA: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object QryImportaMESCOMPREEM: TStringField
      DisplayLabel = 'Competência ~INSS'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object QryImportaMES: TStringField
      DisplayLabel = 'Mês de ~Pagamento'
      DisplayWidth = 10
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object QryImportaMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object QryImportaVALORPREV: TFloatField
      DisplayLabel = 'Valor ~Previsto'
      DisplayWidth = 10
      FieldName = 'VALORPREV'
    end
    object QryImportaVLBENEFPGTO: TFloatField
      DisplayLabel = 'Valor ~Efetivo'
      DisplayWidth = 10
      FieldName = 'VLBENEFPGTO'
    end
    object QryImportaDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
    end
    object QryImportaDTEFETPGTO: TDateTimeField
      DisplayLabel = 'Data ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DTEFETPGTO'
    end
    object QryImportaESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 10
      FieldName = 'ESTADO'
      Size = 13
    end
    object QryImportaDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryImportaNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Processo Nº'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object QryImportaNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object QryImportaDESCLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 50
      FieldName = 'DESCLOTE'
      Size = 200
    end
    object QryImportaTRGDTINCLUSAO: TDateTimeField
      DisplayLabel = 'Dt Inclusão'
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryImportaIDLOTE: TFloatField
      DisplayLabel = 'Lote Nº'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
    end
    object QryImportaFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
      Visible = False
    end
    object QryImportaFLGCONCESSAO: TFloatField
      DisplayLabel = 'Concessão'
      DisplayWidth = 10
      FieldName = 'FLGCONCESSAO'
      Visible = False
    end
    object QryImportaVALOROP1: TFloatField
      DisplayLabel = 'Valor~1ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP1'
      Visible = False
    end
    object QryImportaVALOROP2: TFloatField
      DisplayLabel = 'Valor~2ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP2'
      Visible = False
    end
    object QryImportaVALOROP3: TFloatField
      DisplayLabel = 'Valor~3ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP3'
      Visible = False
    end
    object QryImportaVALORPREVMIN: TFloatField
      DisplayLabel = 'Valor Mín.~Previsto'
      DisplayWidth = 10
      FieldName = 'VALORPREVMIN'
      Visible = False
    end
    object QryImportaVALORTOTAL: TFloatField
      DisplayLabel = 'Valor~Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object QryImportaPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object QryImportaTIPOREGISTRO: TStringField
      DisplayLabel = 'Tipo Registro'
      DisplayWidth = 19
      FieldName = 'TIPOREGISTRO'
      Visible = False
      Size = 28
    end
    object QryImportaTIPOMANUAL: TStringField
      DisplayLabel = 'Manual ?'
      DisplayWidth = 16
      FieldName = 'TIPOMANUAL'
      Visible = False
      Size = 16
    end
    object QryImportaNOMEUSU: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 25
      FieldName = 'NOMEUSU'
      Visible = False
      FixedChar = True
      Size = 40
    end
    object QryImportaALIMRESERVA: TStringField
      DisplayLabel = 'Baixou~Reserva ?'
      DisplayWidth = 10
      FieldName = 'ALIMRESERVA'
      Visible = False
      Size = 3
    end
    object QryImportaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object QryImportaIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object QryImportaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryImportaIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object QryImportaIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object QryImportaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object QryImportaSEQBENEFICIO: TFloatField
      FieldName = 'SEQBENEFICIO'
      Visible = False
    end
    object QryImportaSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object QryImportaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object QryImportaFLGACERTODESFEITO: TFloatField
      FieldName = 'FLGACERTODESFEITO'
      Visible = False
    end
    object QryImportaCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Visible = False
      Size = 30
    end
    object QryImportaFLGENVIADO: TFloatField
      FieldName = 'FLGENVIADO'
      Visible = False
    end
    object QryImportaFLGFORMAPAGTO: TStringField
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryImportaFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object QryImportaVALORINTEGRAL: TFloatField
      FieldName = 'VALORINTEGRAL'
      Visible = False
    end
    object QryImportaVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
    end
    object QryImportaFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Visible = False
    end
    object QryImportaIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object QryImportaVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
    end
    object QryImportaIDSEQINTERNOFB: TFloatField
      FieldName = 'IDSEQINTERNOFB'
      Visible = False
    end
    object QryImportaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryImportaFLGTIPOREGISTRO: TFloatField
      FieldName = 'FLGTIPOREGISTRO'
      Visible = False
    end
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO,DATAPAGAMENTO'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL)'
      'AND IDREFERENCIA IS NULL'
      'ORDER BY MESREFERENCIA DESC, IDLOTE DESC, DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 517
    Top = 370
    object qryLoteIDLOTE: TFloatField
      DisplayLabel = 'Lote Nº'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.CTRLINTERFACE.IDLOTE'
    end
    object qryLoteMESREFERENCIA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.CTRLINTERFACE.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryLoteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CTRLINTERFACE.DESCRICAO'
      Size = 200
    end
    object qryLoteDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'BASEDADOS.CTRLINTERFACE.DATAPAGAMENTO'
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel (.xlsx)|*.xlsx|Excel (.xls)|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 555
    Top = 262
  end
  object DsImporta: TwwDataSource
    AutoEdit = False
    DataSet = QryImporta
    Left = 95
    Top = 294
  end
  object QryExcel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                    '#39' AS NUMEROPROCESSO,  /*SOL 208956 *' +
        '/'
      '  '#39'        '#39' AS MATRICULA, '#39'        '#39' AS MESCOBRANCA,'
      
        '       '#39'        '#39' AS MESREFERENCIA, '#39'        '#39' AS MESCOMPETENCIA' +
        'INSS,'
      
        '       0 AS VALORPREVISTO, -1 AS IDBENEFICIO, -1 AS IDPLANOPREV,' +
        ' -1 AS IDPLANOORIGEM, '
      
        '       -1 FLGFONTEPAGADORA, -1 AS FLGTIPOREGISTRO, -1 AS FLGDEVO' +
        'LUCAO                 '
      'FROM HSTBENEFBFCIARIO'
      'WHERE 0 = 1')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 224
    Top = 345
    object strngfldQryExcelNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      FixedChar = True
    end
    object QryExcelMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 8
    end
    object QryExcelMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 8
    end
    object QryExcelMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 8
    end
    object QryExcelMESCOMPETENCIAINSS: TStringField
      FieldName = 'MESCOMPETENCIAINSS'
      FixedChar = True
      Size = 8
    end
    object QryExcelVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object QryExcelIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object QryExcelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryExcelIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object QryExcelFLGFONTEPAGADORA: TFloatField
      FieldName = 'FLGFONTEPAGADORA'
    end
    object QryExcelFLGTIPOREGISTRO: TFloatField
      FieldName = 'FLGTIPOREGISTRO'
    end
    object QryExcelFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
  end
  object UpdateSQL1: TUpdateSQL
    Left = 436
    Top = 201
  end
end
