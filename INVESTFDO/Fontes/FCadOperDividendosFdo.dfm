inherited frmCadOperDividendosFdo: TfrmCadOperDividendosFdo
  Left = 45
  Top = 138
  Caption = 'Operação'
  ClientHeight = 536
  ClientWidth = 869
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 869
    Height = 450
    inherited Bevel1: TBevel
      Top = 1
      Width = 867
    end
    inherited pnlMestre: TPanel
      Width = 867
      Height = 57
      BevelOuter = bvRaised
      object Investimento: TLabel
        Left = 13
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object lblTipoOper: TLabel
        Left = 253
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object lblPlanPatro: TLabel
        Left = 517
        Top = 8
        Width = 77
        Height = 13
        Caption = 'Plano / Patro'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 13
        Top = 24
        Width = 236
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
        OnExit = dblInvestExit
      end
      object dblTipoOper: TwwDBLookupCombo
        Left = 253
        Top = 24
        Width = 260
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'40'#9'Descrição'#9'F')
        LookupTable = qryTipoOper
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblTipoOperCloseUp
        OnExit = dblTipoOperExit
      end
      object dblkPlanPatro: TwwDBLookupCombo
        Left = 517
        Top = 24
        Width = 260
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
        LookupTable = DMRelOperRecebtoFdo.qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkPlanPatroCloseUp
        OnExit = dblkPlanPatroExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 101
      Width = 867
      Height = 348
      Tabs.Strings = (
        'Lançamentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 769
        Height = 289
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 761
            Height = 261
            BevelInner = bvRaised
            BevelOuter = bvLowered
            object lblDtaOper: TLabel
              Left = 15
              Top = 11
              Width = 105
              Height = 13
              Caption = 'Data da Operação'
            end
            object Label8: TLabel
              Left = 382
              Top = 12
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
            end
            object Label9: TLabel
              Left = 15
              Top = 60
              Width = 97
              Height = 13
              Caption = 'PU do Dividendo'
            end
            object Label10: TLabel
              Left = 15
              Top = 104
              Width = 64
              Height = 13
              Caption = 'Valor Bruto'
            end
            object Label11: TLabel
              Left = 199
              Top = 104
              Width = 81
              Height = 13
              Caption = 'Valor do IRRF'
            end
            object Label12: TLabel
              Left = 382
              Top = 104
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label1: TLabel
              Left = 199
              Top = 59
              Width = 118
              Height = 13
              Caption = 'Quantidade Usufruto'
            end
            object Label2: TLabel
              Left = 382
              Top = 59
              Width = 100
              Height = 13
              Caption = 'Valor do Usufruto'
            end
            object lblDtaLiq: TLabel
              Left = 199
              Top = 11
              Width = 112
              Height = 13
              Caption = 'Data da Liquidação'
            end
            object dbdDta: TCMDateTimePicker
              Left = 15
              Top = 29
              Width = 130
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
            object dbQtdCotas: TRealEdit
              Left = 382
              Top = 30
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = dbQtdCotasExit
              IntDigits = 15
              DecDigits = 9
              NumberFormat = fNumber
              Signal = True
            end
            object DbPuDividendo: TDBRealEdit
              Left = 15
              Top = 78
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 3
              WordWrap = False
              OnExit = DbPuDividendoExit
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = dsDet
            end
            object DbValorBruto: TDBRealEdit
              Left = 15
              Top = 122
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              OnExit = DbValorBrutoExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsDet
            end
            object DbValorIRRF: TDBRealEdit
              Left = 199
              Top = 122
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = dsDet
            end
            object DbValorLiquido: TDBRealEdit
              Left = 382
              Top = 122
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = dsDet
            end
            object dbrQtdUsufruto: TDBRealEdit
              Left = 199
              Top = 78
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 4
              WordWrap = False
              OnExit = dbrQtdUsufrutoExit
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDUSUFRUTO'
              DataSource = dsDet
            end
            object edtValorUsufruto: TRealEdit
              Left = 382
              Top = 78
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbDtaLiq: TCMDateTimePicker
              Left = 199
              Top = 29
              Width = 130
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALIQUIDACAO'
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
              TabOrder = 1
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 761
            Height = 261
            Selected.Strings = (
              'DATAOPERACAO'#9'12'#9'Data Operação'#9'F'
              'DATALIQUIDACAO'#9'14'#9'Data Liquidação'#9'F'
              'DESCTIPOOPERACAO'#9'40'#9'Operação'#9'F'
              'QTDOPERACAO'#9'21'#9'Quantidade de Cotas'#9'F'
              'VLRCOTA'#9'16'#9'PU do Dividendo'#9'F'
              'VLROPERACAO'#9'18'#9'Valor Bruto'#9'F'
              'VLRIR'#9'16'#9'IRRF'#9'F'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'#9'F'
              'QTDUSUFRUTO'#9'16'#9'Quantidade Usufruto'#9'F'
              'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patro'#9'F')
            TitleAlignment = taCenter
            TitleFont.Color = 4194432
            OnDblClick = nil
          end
        end
      end
      inherited Dock973: TDock97
        Width = 859
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 773
        Height = 289
      end
    end
    inherited pnlTitulo: TPanel
      Top = 3
      Width = 867
      inherited lbNomItem: TfcLabel
        Width = 145
        Caption = 'Recebimentos'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 869
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        AllowAllUp = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        AllowAllUp = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        AllowAllUp = False
      end
      inherited sbtnApagar: TToolbarButton97
        AllowAllUp = False
        Visible = False
      end
      object sbtnImprimir: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        GroupIndex = 1
        Caption = '&Imprimir'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimirClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 869
    inherited TB97oKCancelar: TToolbar97
      Visible = False
    end
  end
  inherited dsDet: TwwDataSource
    Left = 189
    Top = 256
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLRCOTA'
      'OPERACAOFUNDO.VLROPERACAO'
      'OPERACAOFUNDO.VLRIR'
      'OPERACAOFUNDO.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Fundo de Investimentos'
      'Data Operação'
      'Quantidade de Cotas'
      'PU do Dividendo'
      'Valor Bruto'
      'Valor do IRRF'
      'Valor Líquido')
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
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDFUNDOINVEST'
      'OPERACAOFUNDO.IDTIPOOPERACAO'
      'OPERACAOFUNDO.IDOPERACAOFUNDO')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST=OPERACAOFUNDO.IDFUNDOINVEST'
      'TIPOOPERACAO.NATUREZAOPERACAO = '#39'R'#39
      'TIPOOPERACAO.IDTIPOINVEST = 7'
      'OPERACAOFUNDO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,###0.00000000'
      '###,###,###0.0000000000'
      '###,###,###,###0.00'
      '###,###,###,###0.00'
      '###,###,###,###0.00')
    Larguras.Strings = (
      '40'
      '10'
      '23'
      '18'
      '18'
      '18'
      '18')
    Left = 320
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 520
    Top = 3
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  OP.IDOPERACAOFUNDO, OP.IDCARTEIRAINVEST,  OP.IDPEDIDOFUNDO, OP' +
        '.IDTIPOINVEST,'
      
        '  OP.IDTIPOOPERACAO,  OP.IDFUNDOINVEST,     OP.DATAOPERACAO,  OP' +
        '.DATALIQUIDACAO,'
      
        '  OP.QTDOPERACAO,     OP.VLROPERACAO,       OP.VLRCOTA,       OP' +
        '.VLRIR,'
      
        '  OP.VLRIOF,          OP.VLRRENDIMENTO,     OP.VLROPERACAO AS VL' +
        'RLIQUIDO,'
      
        '  OP.STACONFIRMA,     OP.IDOPERACAOORIGEM,  OP.IDPLANPREVCTBPATR' +
        ','
      '  OP.DATACOTIZACAO,   OP.VLRDESCONTO,       OP.QTDUSUFRUTO,'
      '  TP.DESCTIPOOPERACAO,'
      '  FD.DESCFUNDOINVEST, PL.PLANPRVCONTABPATRO'
      'FROM'
      '   OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FD,'
      '   (SELECT'
      '       PA.IDPLANPREVCTBPATR,'
      '       (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM'
      '       PESSOA PE,'
      '       PLANPREVCONTABPATRO PA,'
      '       PLANPREVCONTABIL PL'
      '    WHERE'
      '       (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '       (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL'
      'WHERE'
      
        '   ((:DTOPERINI IS NULL) OR (OP.DATAOPERACAO BETWEEN TO_DATE(:DT' +
        'OPERINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                             TO_DATE(:DTOPERFIN,' +
        #39'DD/MM/YYYY'#39'))) AND'
      
        '   ((:IDFUNDOINVEST IS NULL) OR (OP.IDFUNDOINVEST = :IDFUNDOINVE' +
        'ST)) AND'
      
        '   ((:IDTIPOOPERACAO IS NULL) OR (OP.IDTIPOOPERACAO = :IDTIPOOPE' +
        'RACAO)) AND'
      
        '   ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR)) AND'
      '   (TP.NATUREZAOPERACAO = '#39'R'#39') AND'
      '   (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDFUNDOINVEST = FD.IDFUNDOINVEST) AND'
      '   (OP.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      'ORDER BY OP.DATAOPERACAO DESC, OP.IDPLANPREVCTBPATR DESC'
      ' '
      ' '
      ' ')
    Left = 149
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'DTOPERINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTOPERINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTOPERFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryDetalheDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
    end
    object qryDetalheDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Data Liquidação'
      DisplayWidth = 14
      FieldName = 'DATALIQUIDACAO'
    end
    object qryDetalheDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDetalheQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 21
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryDetalheVLRCOTA: TFloatField
      DisplayLabel = 'PU do Dividendo'
      DisplayWidth = 16
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheVLRIR: TFloatField
      DisplayLabel = 'IRRF'
      DisplayWidth = 16
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheQTDUSUFRUTO: TFloatField
      DisplayLabel = 'Quantidade Usufruto'
      DisplayWidth = 16
      FieldName = 'QTDUSUFRUTO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryDetalhePLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryDetalheIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetalheIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object qryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDetalheSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetalheDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object qryDetalheVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Visible = False
    end
    object qryDetalheDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Visible = False
      Size = 60
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
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
      '  QTDUSUFRUTO = :QTDUSUFRUTO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDOPERACAOORIGEM, '
      '   IDPLANPREVCTBPATR, DATACOTIZACAO, VLRDESCONTO, QTDUSUFRUTO)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :DATACOTIZACAO, '
      ':VLRDESCONTO, :QTDUSUFRUTO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 257
    Top = 256
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 433
    Top = 55
  end
  object dsInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryInvest
    Left = 387
    Top = 56
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
      '  '#39'NULL'#39' AS DATAREFERENCIA'
      ''
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TPF'
      ''
      'WHERE'
      ''
      '  FUN.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST AND'
      
        '  (((:IDTIPOINVEST <> 0) AND (TPF.IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '    (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 343
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
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
  end
  object QryOperFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOFUNDO'
      'WHERE'
      '     IDOPERACAOFUNDO=:IDOPERACAOFUNDO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 503
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      ''
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = :TIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 502
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryBuscaTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object QryBuscaTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
    end
    object QryBuscaTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object QryBuscaTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryBuscaTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
  end
  object QryUpdParaminvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST  '
      'SET DATAULTFECHFDO=:DATAULTFECHFDO')
    ValidateWithMask = True
    Left = 647
    Top = 272
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHFDO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField19: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField21: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object StringField4: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object FloatField26: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object FloatField27: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object FloatField32: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object QryUpdTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TIPOFUNDOINVEST SET DATAULTFECH=:DATAULTFECH WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  '
      ' ')
    ValidateWithMask = True
    Left = 647
    Top = 319
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECH'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 503
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST = 7) AND'
      '   (NATUREZAOPERACAO = '#39'R'#39')'
      'ORDER BY'
      '  DESCTIPOOPERACAO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 527
    Top = 56
    object qryTipoOperDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryTipoOperCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
    object qryTipoOperNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object qryTipoOperFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
    object qryTipoOperFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperTIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperSTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
