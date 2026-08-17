inherited frmCadCotasIntegrDirCred: TfrmCadCotasIntegrDirCred
  Left = 242
  Top = 113
  HelpContext = 790236
  Caption = 'Operação'
  ClientHeight = 443
  ClientWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 357
    inherited Bevel1: TBevel
      Width = 782
    end
    inherited pnlMestre: TPanel
      Width = 782
      Height = 50
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Investimento: TLabel
        Left = 221
        Top = 5
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object Tipocota: TLabel
        Left = 579
        Top = 5
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
      end
      object TipoFundo: TLabel
        Left = 8
        Top = 5
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 221
        Top = 20
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
        OnEnter = dblInvestEnter
        OnExit = dblInvestExit
      end
      object dblTipoCota: TwwDBLookupCombo
        Left = 579
        Top = 20
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoCotaCloseUp
        OnEnter = dblTipoCotaEnter
        OnExit = dblTipoCotaExit
      end
      object dblTipoFundo: TwwDBLookupCombo
        Left = 8
        Top = 20
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'40'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoFundoCloseUp
        OnEnter = dblTipoFundoEnter
        OnExit = dblTipoFundoExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 95
      Width = 782
      Height = 261
      Tabs.Strings = (
        'Cotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 684
        Height = 202
        inherited tbsDet: TTabSheet
          Caption = 'Operação'
          inherited dbgrdDet: TwwDBGrid
            Width = 676
            Height = 174
            Selected.Strings = (
              'DATAOPERACAO'#9'10'#9'Data da~Operação'
              'DATACOTIZACAO'#9'10'#9'Data da~Subscrição'
              'QTDOPERACAO'#9'20'#9'Quantidade de Cotas'
              'VLRCOTA'#9'16'#9'Valor da Cota~Integralizada'
              'VLRPAGO'#9'16'#9'Valor Pago'
              'VLRDESCONTO'#9'12'#9'Desconto'
              'VLRTAXAS'#9'12'#9'Taxa de~Ingresso'
              'VLROPERACAO'#9'16'#9'Valor Líquido'
              'DESCTIPOOPERACAO'#9'60'#9'Tipo Operação'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 676
            Height = 174
            object pgcOperacao: TPageControl
              Left = 0
              Top = 0
              Width = 676
              Height = 174
              ActivePage = tbsOper
              Align = alClient
              TabOrder = 0
              object tbsOper: TTabSheet
                Caption = 'Operação'
                object Label9: TLabel
                  Left = 8
                  Top = 5
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object Label2: TLabel
                  Left = 392
                  Top = 5
                  Width = 87
                  Height = 13
                  Caption = 'Data Operação'
                end
                object Label3: TLabel
                  Left = 525
                  Top = 5
                  Width = 113
                  Height = 13
                  Caption = 'Data da Susbcrição'
                end
                object Label1: TLabel
                  Left = 7
                  Top = 53
                  Width = 120
                  Height = 13
                  Caption = 'Quantidade de Cotas'
                end
                object Label4: TLabel
                  Left = 176
                  Top = 53
                  Width = 155
                  Height = 13
                  Caption = 'Valor da Cota Integralizada'
                end
                object Label5: TLabel
                  Left = 8
                  Top = 98
                  Width = 63
                  Height = 13
                  Caption = 'Valor Pago'
                end
                object Label6: TLabel
                  Left = 157
                  Top = 98
                  Width = 55
                  Height = 13
                  Caption = 'Desconto'
                end
                object Label7: TLabel
                  Left = 307
                  Top = 98
                  Width = 77
                  Height = 13
                  Caption = 'Valor Líquido'
                end
                object dbdDta: TCMDateTimePicker
                  Left = 392
                  Top = 20
                  Width = 98
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAOPERACAO'
                  DataSource = dsDet
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
                  TabOrder = 0
                  OnExit = dbdDtaExit
                end
                object dblDataIntegraliza: TwwDBLookupCombo
                  Left = 525
                  Top = 20
                  Width = 111
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DATAAPLICACAO'#9'10'#9'Data'#9'F'
                    'QTDHISTCOTAINTEGR'#9'18'#9'Quamtidade de Cotas'#9'F')
                  DataField = 'ID'
                  DataSource = dsDet
                  LookupTable = QryCotasIntegraliza
                  LookupField = 'ID'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                  OnCloseUp = dblDataIntegralizaCloseUp
                  OnExit = dblDataIntegralizaExit
                end
                object DBEQtdCota: TDBRealEdit
                  Left = 7
                  Top = 68
                  Width = 137
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 2
                  WordWrap = False
                  OnExit = DBEQtdCotaExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QTDOPERACAO'
                  DataSource = dsDet
                end
                object DBEVlrCota: TDBRealEdit
                  Left = 176
                  Top = 68
                  Width = 154
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 3
                  WordWrap = False
                  OnExit = DBEQtdCotaExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                  DataSource = dsDet
                end
                object DBEVlrPago: TDBRealEdit
                  Left = 8
                  Top = 113
                  Width = 135
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 4
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRPAGO'
                  DataSource = dsDet
                end
                object DBEVlrDesconto: TDBRealEdit
                  Left = 157
                  Top = 113
                  Width = 135
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 5
                  WordWrap = False
                  OnExit = DBEVlrDescontoExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRDESCONTO'
                  DataSource = dsDet
                end
                object DBEVlrLiquido: TDBRealEdit
                  Left = 307
                  Top = 113
                  Width = 155
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 6
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLROPERACAO'
                  DataSource = dsDet
                end
                object dblkTipoOperacao: TwwDBLookupCombo
                  Left = 8
                  Top = 21
                  Width = 361
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCTIPOOPERACAO'#9'50'#9'Descrição'#9'F')
                  LookupTable = qryTipoOperacao
                  LookupField = 'DESCTIPOOPERACAO'
                  Options = [loRowLines, loTitles]
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnCloseUp = dblkTipoOperacaoCloseUp
                  OnExit = dblkTipoOperacaoExit
                end
              end
              object tbsTaxa: TTabSheet
                Caption = 'Taxa'
                ImageIndex = 1
                object Label10: TLabel
                  Left = 8
                  Top = 5
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object Label8: TLabel
                  Left = 8
                  Top = 50
                  Width = 99
                  Height = 13
                  Caption = 'Taxa de Ingresso'
                end
                object dbeTipoOperTx: TDBEdit
                  Left = 8
                  Top = 21
                  Width = 561
                  Height = 21
                  Color = clBtnFace
                  DataField = 'DESCTIPOOPERACAO'
                  DataSource = dsTipoOperTx
                  Enabled = False
                  TabOrder = 0
                end
                object DBEVlrTaxa: TDBRealEdit
                  Left = 8
                  Top = 65
                  Width = 135
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
                  DataField = 'VLRTAXAS'
                  DataSource = dsDet
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 774
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Hint = 'Consulta'
            Visible = False
          end
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
        end
      end
      inherited Dock974: TDock97
        Left = 688
        Height = 202
      end
    end
    inherited pnlTitulo: TPanel
      Width = 782
      inherited lbNomItem: TfcLabel
        Width = 236
        Caption = 'Integralização de Cotas'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
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
    Top = 404
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 612
      DockPos = 900
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 443
      DockPos = 700
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 456
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    Left = 219
    Top = 135
  end
  inherited ds: TwwDataSource
    Left = 482
  end
  inherited upd: TUpdateSQL
    Left = 506
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLRCOTA'
      'OPERACAOFUNDO.VLROPERACAO'
      'TIPOCOTA.DESCTIPOCOTA'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'N'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Operação'
      'Quantidade'
      'Valor da Cota'
      'Valor da Operação'
      'Tipo de Cota'
      'Tipo de Fundo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST'
      'TIPOCOTA'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOCOTA.IDTIPOCOTA'
      'TIPOCOTA.DESCTIPOCOTA'
      'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO  IN (-100,-105)'
      'TIPOFUNDOINVEST.IDTIPOINVEST  = OPERACAOFUNDO.IDTIPOINVEST'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVES' +
        'T'
      'FUNDOINVEST.IDFUNDOINVEST     = OPERACAOFUNDO.IDFUNDOINVEST'
      'TIPOCOTA.IDTIPOCOTA           = OPERACAOFUNDO.IDTIPOCOTA')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###0.000000000'
      '###,###,###0.000000000'
      '###,###,###0.00'
      ''
      '')
    Larguras.Strings = (
      '50'
      '10'
      '22'
      '18'
      '18'
      '20'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 419
  end
  inherited ImlPadrao: TImageList
    Left = 377
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 324
  end
  inherited qry: TwwQuery
    Left = 521
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 316
    Top = 143
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT OP.IDOPERACAOFUNDO,   OP.IDCARTEIRAINVEST,  OP.IDPEDIDOFU' +
        'NDO,     OP.IDTIPOINVEST,'
      
        '       OP.IDTIPOOPERACAO,    OP.IDFUNDOINVEST,     OP.DATAOPERAC' +
        'AO,      OP.DATALIQUIDACAO,'
      
        '       OP.QTDOPERACAO,       OP.VLROPERACAO,       OP.VLRCOTA, O' +
        'P.VLRIR, OP.VLRIOF, OP.VLRRENDIMENTO,'
      
        '       OP.STACONFIRMA,       OP.IDOPERACAOORIGEM,  OP.IDPLANPREV' +
        'CTBPATR, OP.DATACOTIZACAO,'
      
        '       OP.VLRDESCONTO,       OP.VLRDESCONTO+OP.VLROPERACAO AS VL' +
        'RPAGO,   OP.IDTIPOCOTA,'
      
        '       OP.IDCOTAINTEGRALIZA, OP.PLANO,             OP.PLNCODIGO,' +
        '         OP.CODDOCUMENTO,'
      '       OP.IDOPERACAOORIGEM  AS ID,'
      '       TC.DESCTIPOCOTA,'
      '       TX.VLRTAXAS,'
      '       TI.DESCTIPOOPERACAO'
      'FROM  OPERACAOFUNDO OP,'
      '     (SELECT VLRTAXAS, IDOPERACAOORIGEM  FROM OPERACAOFUNDO'
      '      WHERE (IDTIPOINVEST       = :IDTIPOINVEST)'
      '      AND   (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      '      AND   (IDFUNDOINVEST      = :IDFUNDOINVEST)'
      '      AND   (IDTIPOOPERACAO     = -174)'
      
        '      AND ((:IDTIPOCOTA IS NULL) OR (IDTIPOCOTA = :IDTIPOCOTA)))' +
        ' TX,'
      '      TIPOCOTA TC, FUNDOINVEST FI, TIPOOPERACAO TI'
      'WHERE'
      '       (OP.IDTIPOINVEST       = :IDTIPOINVEST)'
      '  AND  (OP.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      '  AND  (OP.IDFUNDOINVEST      = :IDFUNDOINVEST)'
      '  AND  (OP.IDTIPOOPERACAO IN (-100,-105, -1005))'
      '  AND   ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA))'
      
        '  AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST =' +
        ' :IDTIPOFUNDOINVEST))'
      '  AND  (FI.IDFUNDOINVEST      = OP.IDFUNDOINVEST)'
      '  AND  (TC.IDTIPOCOTA         = OP.IDTIPOCOTA)'
      '  AND  (TX.IDOPERACAOORIGEM(+)= OP.IDOPERACAOFUNDO)'
      '  AND (TI.IDTIPOOPERACAO = OP.IDTIPOOPERACAO)'
      '  AND (TI.IDTIPOINVEST = OP.IDTIPOINVEST)'
      'ORDER BY OP.DATAOPERACAO DESC, TC.DESCTIPOCOTA, OP.DATACOTIZACAO'
      ' '
      ' ')
    Left = 170
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
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
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
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
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object qryDetalheDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da~Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryDetalheDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Data da~Subscrição'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object qryDetalheQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 20
      FieldName = 'QTDOPERACAO'
    end
    object qryDetalheVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota~Integralizada'
      DisplayWidth = 16
      FieldName = 'VLRCOTA'
    end
    object qryDetalheVLRPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 16
      FieldName = 'VLRPAGO'
    end
    object qryDetalheVLRDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      DisplayWidth = 12
      FieldName = 'VLRDESCONTO'
    end
    object qryDetalheVLRTAXAS: TFloatField
      DisplayLabel = 'Taxa de~Ingresso'
      DisplayWidth = 12
      FieldName = 'VLRTAXAS'
    end
    object qryDetalheVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
    end
    object qryDetalheDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDetalheIDCOTAINTEGRALIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOTAINTEGRALIZA'
      Visible = False
    end
    object qryDetalheID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
    end
    object qryDetalheDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
    object qryDetalheIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetalheIDPEDIDOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object qryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheDATALIQUIDACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALIQUIDACAO'
      Visible = False
    end
    object qryDetalheVLRIR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIR'
      Visible = False
    end
    object qryDetalheVLRIOF: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIOF'
      Visible = False
    end
    object qryDetalheVLRRENDIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object qryDetalheSTACONFIRMA: TStringField
      DisplayWidth = 1
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDOPERACAOORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetalheIDTIPOCOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOCOTA'
      Visible = False
    end
    object qryDetalhePLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLANO'
      Visible = False
    end
    object qryDetalhePLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLNCODIGO'
      Visible = False
    end
    object qryDetalheCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.CODDOCUMENTO'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  VLRTAXAS = :VLRTAXAS'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        ' (IDOPERACAOFUNDO,  IDCARTEIRAINVEST,  IDPEDIDOFUNDO, IDTIPOINVE' +
        'ST,'
      
        '  IDTIPOOPERACAO,   IDFUNDOINVEST,     DATAOPERACAO,  DATALIQUID' +
        'ACAO,'
      
        '  QTDOPERACAO,      VLROPERACAO,       VLRCOTA,       VLRIR,    ' +
        'VLRIOF,'
      
        '  VLRRENDIMENTO,    STACONFIRMA,       IDOPERACAOORIGEM,        ' +
        'IDPLANPREVCTBPATR,'
      
        '  DATACOTIZACAO,    VLRDESCONTO,       IDTIPOCOTA,    PLANO,    ' +
        'PLNCODIGO,'
      '  CODDOCUMENTO,     VLRTAXAS)'
      'values'
      
        '(:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, :IDTIPOINV' +
        'EST,'
      
        ' :IDTIPOOPERACAO,  :IDFUNDOINVEST,    :DATAOPERACAO,  :DATALIQUI' +
        'DACAO,'
      
        ' :QTDOPERACAO,     :VLROPERACAO,      :VLRCOTA,       :VLRIR,   ' +
        ':VLRIOF,'
      
        ' :VLRRENDIMENTO,   :STACONFIRMA,      :IDOPERACAOORIGEM,        ' +
        ':IDPLANPREVCTBPATR,'
      
        ' :DATACOTIZACAO,   :VLRDESCONTO,      :IDTIPOCOTA,    :PLANO,   ' +
        ':PLNCODIGO,'
      ' :CODDOCUMENTO,    :VLRTAXAS)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 98
  end
  object qryInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  '#39'NULL'#39' AS DATAREFERENCIA, TIP.IDTIPOINVEST    , FUN.DTAINIPROC' +
        '        , TIP.DATAULTFECH'
      'FROM'
      '  HISTFUNDOINVEST FUN, TIPOFUNDOINVEST TIP'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT F.IDFUNDOINVEST || TO_CHAR(MAX(F.DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      'WHERE'
      '            T.IDTIPOINVEST      = :IDTIPOINVEST  AND'
      
        '           ((:DATAMOVFUNDO IS NULL) OR (F.DTAVIGENCIA < TO_DATE(' +
        ':DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+1)) AND'
      
        '           ((:IDTIPOFUNDOINVEST IS NULL) OR (F.IDTIPOFUNDOINVEST' +
        ' = :IDTIPOFUNDOINVEST)) AND'
      '            T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST'
      '       GROUP BY F.IDFUNDOINVEST)) AND'
      
        '   ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST = :ID' +
        'TIPOFUNDOINVEST)) AND'
      '  TIP.IDTIPOFUNDOINVEST = FUN.IDTIPOFUNDOINVEST'
      'ORDER BY FUN.DESCFUNDOINVEST '
      ' ')
    ValidateWithMask = True
    Left = 553
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object qryInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qryInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object qryInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object qryInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object qryInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object qryInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object qryInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object qryInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object qryInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object qryInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object qryInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object qryInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object qryInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qryInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object qryInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object qryInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryInvestDATAREFERENCIA: TStringField
      FieldName = 'DATAREFERENCIA'
      Visible = False
      Size = 4
    end
    object qryInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object qryInvestDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 553
    Top = 255
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      'WHERE IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST')
    ValidateWithMask = True
    Left = 641
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 553
    Top = 204
  end
  object qryTipoOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOOPERACAO'
      'WHERE IDTIPOINVEST   = :IDTIPOINVEST    AND '
      '      IDTIPOOPERACAO in (-100, -105, -1005)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryAux1: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 553
    Top = 316
  end
  object QryCotasIntegraliza: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDTIPOCOTA, H.IDFUNDOINVEST, H.IDTIPOINVEST, H.IDOPERAC' +
        'AOFUNDO, H.IDPLANPREVCTBPATR,'
      
        '       H.DATAHISTCOTAINTEG, H.QTDHISTCOTAINTEGR, H.DATAAPLICACAO' +
        ', H.IDOPERACAOFUNDO AS ID'
      'FROM HISTCOTAINTEGRALIZA H'
      'WHERE'
      '     H.IDHISTCOTAINTEGR IN (SELECT MAX(H1.IDHISTCOTAINTEGR)'
      '                            FROM   HISTCOTAINTEGRALIZA H1'
      '                            WHERE'
      
        '                                  (H1.IDTIPOINVEST      = :IDTIP' +
        'OINVEST)'
      
        '                            AND   (H1.IDPLANPREVCTBPATR = :IDPLA' +
        'NPREVCTBPATR)'
      
        '                            AND   (H1.IDFUNDOINVEST     = :IDFUN' +
        'DOINVEST)'
      
        '                            AND   (H1.DATAHISTCOTAINTEG = TO_DAT' +
        'E(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      
        '                            AND   (H1.IDTIPOCOTA        = :IDTIP' +
        'OCOTA)'
      
        '                            GROUP BY H1.IDTIPOINVEST, H1.IDPLANP' +
        'REVCTBPATR, H1.IDFUNDOINVEST, H1.DATAAPLICACAO)'
      'AND H.QTDHISTCOTAINTEGR > 0'
      'ORDER BY H.DATAAPLICACAO')
    ValidateWithMask = True
    Left = 641
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryCotasIntegralizaDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QryCotasIntegralizaQTDHISTCOTAINTEGR: TFloatField
      DisplayLabel = 'Quamtidade de Cotas'
      DisplayWidth = 18
      FieldName = 'QTDHISTCOTAINTEGR'
      DisplayFormat = '###,#0.000000000'
    end
    object QryCotasIntegralizaIDTIPOCOTA: TFloatField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object QryCotasIntegralizaIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryCotasIntegralizaIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryCotasIntegralizaIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryCotasIntegralizaIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryCotasIntegralizaDATAHISTCOTAINTEG: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAHISTCOTAINTEG'
      Visible = False
    end
    object QryCotasIntegralizaID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
  end
  object dsTipoOperacao: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoOperacao
    OnStateChange = dsDetStateChange
    Left = 227
    Top = 82
  end
  object QryTipoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST')
    ValidateWithMask = True
    Left = 553
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object QryVerIntegrCotas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDTIPOCOTA, H.IDFUNDOINVEST, H.IDTIPOINVEST, H.IDOPERAC' +
        'AOFUNDO, H.IDPLANPREVCTBPATR,'
      '       H.DATAHISTCOTAINTEG, H.QTDHISTCOTAINTEGR, H.DATAAPLICACAO'
      'FROM HISTCOTAINTEGRALIZA H'
      'WHERE'
      '     H.IDHISTCOTAINTEGR IN (SELECT MAX(IDHISTCOTAINTEGR)'
      '                            FROM   HISTCOTAINTEGRALIZA'
      '                            WHERE'
      
        '                                   (IDTIPOINVEST       = :IDTIPO' +
        'INVEST)'
      
        '                            AND    (IDPLANPREVCTBPATR  = :IDPLAN' +
        'PREVCTBPATR)'
      
        '                            AND    (IDFUNDOINVEST      = :IDFUND' +
        'OINVEST)'
      
        '                            AND    (DATAHISTCOTAINTEG >= TO_DATE' +
        '(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      
        '                            AND    (IDOPERACAOFUNDO    = :IDOPER' +
        'ACAOFUNDO)'
      
        '                            GROUP BY IDTIPOINVEST, IDPLANPREVCTB' +
        'PATR, IDFUNDOINVEST, IDOPERACAOFUNDO)')
    ValidateWithMask = True
    Left = 641
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryVerOperSubDia: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST'
      'FROM'
      '    OPERACAOFUNDO'
      'WHERE'
      '    IDTIPOINVEST      = :IDTIPOINVEST                        AND'
      '    IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR                   AND'
      '    IDFUNDOINVEST     = :IDFUNDOINVEST                       AND'
      '    DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')  AND'
      '    DATACOTIZACAO     = TO_DATE(:DATACOTIZACAO,'#39'DD/MM/YYYY'#39') AND'
      '    IDTIPOOPERACAO    = :IDTIPOOPERACAO                      AND'
      '    IDOPERACAOORIGEM  = :IDOPERACAOORIGEM')
    ValidateWithMask = True
    Left = 641
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptInput
      end>
  end
  object qryTipoOperTx: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOOPERACAO'
      'WHERE IDTIPOINVEST   = :IDTIPOINVEST    AND'
      '      IDTIPOOPERACAO = -174')
    ValidateWithMask = True
    Left = 172
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object dsTipoOperTx: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoOperTx
    OnStateChange = dsDetStateChange
    Left = 227
    Top = 34
  end
end
