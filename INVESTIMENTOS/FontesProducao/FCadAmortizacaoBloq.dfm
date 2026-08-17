inherited FrmCadAmortizacaoBloq: TFrmCadAmortizacaoBloq
  Left = 215
  Top = 182
  HelpContext = 790215
  Caption = 'Amortização Bloqueada'
  ClientHeight = 474
  ClientWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 388
    inherited Bevel1: TBevel
      Width = 744
      Height = 1
    end
    inherited tbcDetalhe: TTabControlDetalhe [1]
      Top = 129
      Width = 744
      Height = 258
      Tabs.Strings = (
        '')
      TabStop = False
      inherited pgctrlDetalhe: TPageControl
        Width = 646
        Height = 199
        inherited tbsDet: TTabSheet
          Caption = ''
          inherited pnlControlesDet: TPanel [0]
            Width = 638
            Height = 171
            object Label1: TLabel
              Left = 31
              Top = 11
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
            end
            object Label3: TLabel
              Left = 33
              Top = 71
              Width = 88
              Height = 13
              Caption = 'Valor Recebido'
            end
            object Label2: TLabel
              Left = 283
              Top = 11
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object DBEQtdCota: TDBRealEdit
              Left = 30
              Top = 29
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDOPERACAO'
              DataSource = dsDet
            end
            object DBEVlrRecebido: TDBRealEdit
              Left = 30
              Top = 88
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsDet
            end
            object dbmObs: TDBMemo
              Left = 283
              Top = 29
              Width = 329
              Height = 135
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              MaxLength = 300
              TabOrder = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 638
            Height = 171
            Selected.Strings = (
              'QTDOPERACAO'#9'22'#9'Quantidade ~de Cotas'
              'VLROPERACAO'#9'24'#9'Valor ~Recebido'
              'OBSERVACAO'#9'52'#9'Observação')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow, mDisableDialog]
            ReadOnly = True
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            TitleLines = 2
            OnDblClick = nil
          end
        end
      end
      inherited Dock973: TDock97
        Width = 736
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnConsDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 650
        Height = 199
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Visible = False
            OnClick = bbtnCancelarDetClick
          end
        end
      end
    end
    inherited pnlMestre: TPanel [2]
      Top = 43
      Width = 744
      Height = 86
      object lblDataOper: TLabel
        Left = 436
        Top = 5
        Width = 105
        Height = 13
        Caption = 'Data da Operação'
      end
      object lblTipoFundo: TLabel
        Left = 11
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 10
        Top = 45
        Width = 134
        Height = 13
        Caption = 'Fundo de Investimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipocota: TLabel
        Left = 432
        Top = 47
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
      end
      object DtEdDataOperacao: TCMDateTimePicker
        Left = 434
        Top = 20
        Width = 136
        Height = 21
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
        ShowButton = True
        TabOrder = 1
        OnExit = DtEdDataOperacaoExit
      end
      object dblkTipoFundo: TwwDBLookupCombo
        Left = 11
        Top = 20
        Width = 270
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Tipo de Fundo'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkTipoFundoCloseUp
        OnEnter = dblkTipoFundoEnter
        OnExit = dblkTipoFundoExit
      end
      object DblkFundosInvest: TwwDBLookupCombo
        Left = 9
        Top = 61
        Width = 398
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = QryHistFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DblkFundosInvestCloseUp
        OnEnter = DblkFundosInvestEnter
        OnExit = DblkFundosInvestExit
      end
      object dblTipoCota: TwwDBLookupCombo
        Left = 434
        Top = 61
        Width = 160
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoCotaCloseUp
        OnEnter = dblTipoCotaEnter
        OnExit = dblTipoCotaExit
      end
    end
    inherited pnlTitulo: TPanel
      Width = 744
      inherited lbNomItem: TfcLabel
        Width = 435
        Caption = 'Recebimento de Amortizações Bloqueadas'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 746
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 435
    Width = 746
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 312
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 349
    Top = 214
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.DATALIQUIDACAO'
      'OPERACAOFUNDO.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Fundo de Investimento:'
      'Data da Operação:'
      'Data da Liquidação:'
      'Valor da Operação:')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST'
      'TIPOOPERACAO'
      'TIPOCOTA')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO'
      'FUNDOINVEST.IDTIPOFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.IDFUNDOINVEST'
      'OPERACAOFUNDO.IDTIPOOPERACAO'
      'TIPOCOTA.IDTIPOCOTA')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO = -171'
      'OPERACAOFUNDO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO'
      'OPERACAOFUNDO.IDFUNDOINVEST = FUNDOINVEST.IDFUNDOINVEST'
      'OPERACAOFUNDO.IDTIPOINVEST = TIPOOPERACAO.IDTIPOINVEST'
      'OPERACAOFUNDO.IDTIPOCOTA = TIPOCOTA.IDTIPOCOTA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '18'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 499
    Top = 19
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 216
    Top = 211
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '     OP.IDOPERACAOFUNDO       ,TF.DESCTIPOFUNDOINV  ,OP.IDFUNDOI' +
        'NVEST,'
      
        '     FI.DESCFUNDOINVEST       ,OP.DATAOPERACAO      ,OP.IDPLANPR' +
        'EVCTBPATR,'
      
        '     PATRO.PLANPRVCONTABPATRO ,FI.IDTIPOFUNDOINVEST ,OP.IDTIPOOP' +
        'ERACAO,'
      
        '     TPOP.DESCTIPOOPERACAO    ,OP.QTDOPERACAO       ,OP.VLROPERA' +
        'CAO,'
      
        '     OP.IDTIPOINVEST          ,OP.OBSERVACAO        ,OP.DATALIQU' +
        'IDACAO,'
      '     TC.IDTIPOCOTA            ,TC.DESCTIPOCOTA      ,OP.PLANO,'
      
        '     OP.CODDOCUMENTO          ,OP.PLNCODIGO         ,OP.IDCARTEI' +
        'RAINVEST'
      ''
      
        'FROM OPERACAOFUNDO OP, VWPLANPREVCTBPATR PATRO,TIPOOPERACAO TPOP' +
        ','
      '      (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST'
      '       FROM HISTFUNDOINVEST'
      '       WHERE IDFUNDOINVEST = :IDFUNDOINVEST AND'
      
        '             (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY,H' +
        'H24:MI:SS'#39')) IN'
      
        '                  (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY,HH24:MI:SS'#39')'
      '                   FROM HISTFUNDOINVEST'
      
        '                   WHERE (DTAVIGENCIA < TO_DATE(:DATAOPERACAO,'#39'D' +
        'D/MM/YYYY'#39')+1)'
      
        '                   GROUP BY IDFUNDOINVEST)) FI, TIPOFUNDOINVEST ' +
        'TF, TIPOCOTA TC'
      ''
      ''
      'WHERE OP.IDPLANPREVCTBPATR = PATRO.IDPLANPREVCTBPATR AND'
      '      OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '      OP.IDTIPOOPERACAO = TPOP.IDTIPOOPERACAO AND'
      '      TPOP.IDTIPOOPERACAO = -171 AND'
      '      TPOP.IDTIPOINVEST = :IDTIPOINVEST AND'
      '      OP.IDFUNDOINVEST = FI.IDFUNDOINVEST AND'
      '      OP.IDFUNDOINVEST = :IDFUNDOINVEST AND'
      '      FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST AND'
      '      OP.IDTIPOCOTA = TC.IDTIPOCOTA(+)  AND'
      '      OP.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      
        '      ((:IDOPERACAOFUNDO IS NULL) OR (IDOPERACAOFUNDO = :IDOPERA' +
        'CAOFUNDO)) AND'
      '      ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))'
      ''
      ''
      ''
      ''
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
    Left = 264
    Top = 213
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object qryDetalheQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade ~de Cotas'
      DisplayWidth = 22
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".QTDOPERACAO'
    end
    object qryDetalheVLROPERACAO: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 24
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".VLROPERACAO'
    end
    object qryDetalheOBSERVACAO: TMemoField
      DisplayLabel = 'Observação'
      DisplayWidth = 52
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryDetalheDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS."CM.TIPOCOTA".DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
    object qryDetalheDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 18
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".DATAOPERACAO'
      Visible = False
    end
    object qryDetalheDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo Fundo'
      DisplayWidth = 42
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS."CM.TIPOFUNDOINVEST".DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
    object qryDetalheDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS."CM.HISTFUNDOINVEST".DESCFUNDOINVEST'
      Visible = False
      Size = 60
    end
    object qryDetalheIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetalhePLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
      Size = 113
    end
    object qryDetalheIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS."CM.HISTFUNDOINVEST".IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDTIPOOPERACAO'
      Visible = False
    end
    object qryDetalheDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS."CM.TIPOOPERACAO".DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object qryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDTIPOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS."CM.TIPOCOTA".IDTIPOCOTA'
      Visible = False
    end
    object qryDetalhePLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".PLANO'
      Visible = False
    end
    object qryDetalheCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".CODDOCUMENTO'
      Visible = False
    end
    object qryDetalhePLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".PLNCODIGO'
      Visible = False
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetalheDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS."CM.OPERACAOFUNDO".DATALIQUIDACAO'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  PLANO = :PLANO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      '  (IDOPERACAOFUNDO,IDFUNDOINVEST, DATAOPERACAO,'
      'IDPLANPREVCTBPATR,'
      'IDTIPOOPERACAO, QTDOPERACAO,'
      '   VLROPERACAO, IDTIPOINVEST, OBSERVACAO, IDTIPOCOTA, PLANO,'
      'CODDOCUMENTO,'
      '   PLNCODIGO, IDCARTEIRAINVEST, DATALIQUIDACAO)'
      'values'
      '  (:IDOPERACAOFUNDO,:IDFUNDOINVEST, :DATAOPERACAO, '
      ':IDPLANPREVCTBPATR, '
      ':IDTIPOOPERACAO, '
      '   :QTDOPERACAO, :VLROPERACAO, :IDTIPOINVEST, :OBSERVACAO, '
      ':IDTIPOCOTA, '
      '   :PLANO, :CODDOCUMENTO, :PLNCODIGO, :IDCARTEIRAINVEST, '
      ':DATALIQUIDACAO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 307
    Top = 213
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOFUNDOINVEST,IDTIPOINVEST,DESCTIPOFUNDOINV, DATAULTF' +
        'ECH'
      ' FROM TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST')
    ValidateWithMask = True
    Left = 234
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS."CM.TIPOFUNDOINVEST".IDTIPOFUNDOINVEST'
    end
    object QryTipoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS."CM.TIPOFUNDOINVEST".IDTIPOINVEST'
    end
    object QryTipoFundoDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS."CM.TIPOFUNDOINVEST".DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS."CM.TIPOFUNDOINVEST".DATAULTFECH'
    end
  end
  object QryHistFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT'#9'FUN.IDFUNDOINVEST         , FUN.DESCFUNDOINVEST   , FUN.I' +
        'DGESTORCARTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        #9'FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO                , FUN.IDCA' +
        'RTEIRAINVEST   , FUN.IDTIPOFUNDOINVEST ,'
      
        #9'FUN.CNPJFUNDO                , FUN.STAEXCLUSIVO            , FU' +
        'N.PZOCARENCIA             , FUN.PZOANIVERSARIO    , '
      
        #9'FUN.PZOLIQAPLIC               , FUN.PZOLIQRESG                ,' +
        ' FUN.QTDDECQTD               , FUN.QTDDECVALOR       , '
      
        #9'FUN.STAFUNDO                   , FUN.PZOAMORTIZACAO    , FUN.PE' +
        'RCTXPERFORM       , FUN.PERCTXADM,         '
      
        #9'FUN.CODFUNCETIP              , FUN.STAPROVISIONAIR    , FUN.STA' +
        'PROVISIONAIOF   , FUN.CONTRCETIP  ,      '
      
        #9'FUN.DATAINICIOFUNDO     , FUN.PZOCOTAPLIC             , TFI.IDT' +
        'IPOINVEST               , FUN.DTAINIPROC    '
      '      '
      
        'FROM  (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_' +
        'CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39')  IN '
      
        '                 (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCI' +
        'A),'#39'DD/MM/YYYY, HH24:MI:SS'#39') '
      '                  FROM HISTFUNDOINVEST '
      
        '                  WHERE DTAVIGENCIA  <  TO_DATE(:DATAOPERACAO,'#39'D' +
        'D/MM/YYYY'#39') +1'
      
        '                  GROUP BY IDFUNDOINVEST)) ) FUN,  TIPOFUNDOINVE' +
        'ST TFI'
      ''
      'WHERE     FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST'
      '                   AND TFI.IDTIPOINVEST = :IDTIPOINVEST'
      
        '                   AND  FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVE' +
        'ST'
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 149
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryHistFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QryHistFundoInvestDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryHistFundoInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
    end
    object QryHistFundoInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object QryHistFundoInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object QryHistFundoInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryHistFundoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryHistFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
    object QryHistFundoInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Size = 25
    end
    object QryHistFundoInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryHistFundoInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
    end
    object QryHistFundoInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
    end
    object QryHistFundoInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
    end
    object QryHistFundoInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
    end
    object QryHistFundoInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
    end
    object QryHistFundoInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
    end
    object QryHistFundoInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryHistFundoInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
    end
    object QryHistFundoInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
    end
    object QryHistFundoInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
    end
    object QryHistFundoInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryHistFundoInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryHistFundoInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryHistFundoInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Size = 30
    end
    object QryHistFundoInvestDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
    end
    object QryHistFundoInvestPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
    end
    object QryHistFundoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryHistFundoInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '     DESCTIPOOPERACAO,'#9'IDTIPOINVEST,'#9#9'IDTIPOOPERACAO,'#9'        ID' +
        'MERCADO,'#9#9'CODTIPDOC,'#9#9'NATUREZAOPERACAO,'
      
        '     TIPOCUSTODIA,'#9'VENCIMENTO,'#9#9'FLGGERACONTAB,'#9'        FLGGERACA' +
        'PCAR,'#9'        RECPAG,'#9#9#9'TIPCREDOR,'#9#9'FLGGERACAF,'
      
        '     FLGTRANSF,'#9#9'FLGCORRET,'#9#9'FLGORDMOVINV,'#9#9'IDMOTIVOBLOQUEIO,'#9'FL' +
        'GOPDIREITO,'#9#9'FLGAGE,'#9#9#9'FLGDATAEX,'
      
        '     FLGDATACOM,       '#9'FLGINVORIGEM,'#9#9'FLGPERC,'#9#9'FLGPARIDADE,'#9#9'F' +
        'LGPRZBOLSA,'#9#9'FLGPRZEMP,'#9#9'FLGATADEC,'
      
        '     FLGFORMAPAGREC,'#9'FLGDIVACAO,'#9#9'FLGINIPAG,'#9#9'FLGJUROS,'#9#9'MOTBLOQ' +
        'CARTORIG,'#9'MOTBLOQCARTDEST,'#9'FLGOBRIGAOBS, '
      
        '     TIPSALDOCARTORIG,'#9'TIPSALDOCARTDEST,'#9'FLGTRATAIR,'#9#9'SIGLATIPOO' +
        'PER,'#9#9'FLGISENTOIR, '#9#9'FLGGRAVAIRLITIGIO,'#9'FLGOPGERENC,'
      
        '     TIPOMOVTO,'#9#9'STAATIVO,'#9#9'FLGRENTABILIDADE,'#9'FLGCONTAINVEST,'#9'  ' +
        '      FLGMOVCOTA,'#9#9'FLGCOTARECDES,'#9'        FLGDATAVENCIMENTO'
      ''
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = -171 AND IDTIPOINVEST = :IDTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 90
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object QryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object QryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object QryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
    object QryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryTipoOperacaoFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
    end
    object QryTipoOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
    end
    object QryTipoOperacaoFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
    end
    object QryTipoOperacaoMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
    end
    object QryTipoOperacaoFLGOBRIGAOBS: TStringField
      FieldName = 'FLGOBRIGAOBS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOBRIGAOBS'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Size = 4
    end
    object QryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Size = 3
    end
    object QryTipoOperacaoSTAATIVO: TStringField
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGRENTABILIDADE: TStringField
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
    object QryTipoOperacaoFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGCOTARECDES: TStringField
      FieldName = 'FLGCOTARECDES'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCOTARECDES'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGDATAVENCIMENTO: TStringField
      FieldName = 'FLGDATAVENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAVENCIMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCOTA,DESCTIPOCOTA'
      'FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 529
    Top = 149
    object QryTipoCotaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
    end
    object QryTipoCotaDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 417
    Top = 4
  end
end
