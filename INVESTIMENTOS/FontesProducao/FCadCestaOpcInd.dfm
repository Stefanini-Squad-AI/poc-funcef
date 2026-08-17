inherited frmCadCestaOpcInd: TfrmCadCestaOpcInd
  Left = 243
  Top = 120
  HelpContext = 790314
  ClientHeight = 445
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 704
    Height = 359
    inherited Bevel1: TBevel
      Width = 702
    end
    inherited pnlMestre: TPanel
      Width = 702
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Label1: TLabel
        Left = 161
        Top = 8
        Width = 95
        Height = 13
        Caption = 'Opção de Índice'
      end
      object Label2: TLabel
        Left = 17
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Vigência'
      end
      object dblOpcao: TwwDBLookupCombo
        Left = 160
        Top = 24
        Width = 441
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F'
          'DATAORDEM'#9'15'#9'Data da Operação'#9'F')
        LookupTable = qryOrdemOpcInd
        LookupField = 'IDCESTAOPCIND'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblOpcaoCloseUp
        OnExit = dblOpcaoExit
      end
      object dDbDataVigencia: TCMDateTimePicker
        Left = 17
        Top = 24
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clWhite
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
        TabOrder = 0
        OnExit = dDbDataVigenciaExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 101
      Width = 702
      Height = 257
      Tabs.Strings = (
        'Cesta')
      inherited pgctrlDetalhe: TPageControl
        Top = 57
        Width = 604
        Height = 196
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 596
            Height = 168
            Selected.Strings = ()
            Color = clWhite
            DataSource = ds
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 596
            Height = 168
            object lblCarteira: TLabel
              Left = 16
              Top = 18
              Width = 45
              Height = 13
              Caption = 'Carteira'
            end
            object lblCustodiante: TLabel
              Left = 16
              Top = 65
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label3: TLabel
              Left = 16
              Top = 109
              Width = 30
              Height = 13
              Caption = 'Ação'
            end
            object Label6: TLabel
              Left = 352
              Top = 18
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object lblCotacao: TLabel
              Left = 352
              Top = 65
              Width = 96
              Height = 13
              Caption = 'Cotação Unitária'
            end
            object Label8: TLabel
              Left = 352
              Top = 109
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblkCustodianteCesta: TwwDBLookupCombo
              Left = 16
              Top = 80
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Custodiante'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = ds
              LookupTable = qryCustodianteCesta
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblkCustodianteCestaExit
            end
            object dblkAcao: TwwDBLookupCombo
              Left = 16
              Top = 125
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = ds
              LookupTable = qryAcaoCesta
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblkAcaoExit
            end
            object dbreQtdCesta: TDBRealEdit
              Left = 352
              Top = 33
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 3
              WordWrap = False
              OnExit = dbreQtdCestaExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QUANTIDADE'
              DataSource = ds
            end
            object dbreCotacao: TDBRealEdit
              Left = 352
              Top = 80
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000')
              TabOrder = 4
              WordWrap = False
              OnExit = dbreCotacaoExit
              IntDigits = 19
              DecDigits = 6
              NumberFormat = fNumber
              Signal = False
              DataField = 'COTACAO'
              DataSource = ds
            end
            object dbreVlrCesta: TDBRealEdit
              Left = 352
              Top = 125
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = ds
            end
            object dblkCarteiraCesta: TwwDBLookupCombo
              Left = 16
              Top = 33
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CARTEIRA'#9'40'#9'Carteira'#9'F')
              DataField = 'IDCARTEIRAINVEST'
              DataSource = ds
              LookupTable = qryCarteiraCesta
              LookupField = 'IDCARTEIRAINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblkCarteiraCestaExit
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 694
        Height = 33
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Top = 1
          end
          inherited sbtnAltDet: TToolbarButton97
            Top = 1
            Width = 24
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 49
            Top = 1
          end
          inherited sbtnConsDet: TToolbarButton97
            Left = 74
            Top = 1
          end
        end
        object Toolbar974: TToolbar97
          Left = 103
          Top = 0
          Caption = 'Toolbar974'
          DockMode = dmCannotFloat
          DockPos = 103
          TabOrder = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 600
            Height = 27
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            object lblValTotCesta: TfcLabel
              Left = 469
              Top = 1
              Width = 116
              Height = 25
              Align = alRight
              Caption = '                      0,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taRightJustify
              TextOptions.Style = fclsLowered
              TextOptions.VAlignment = vaVCenter
            end
            object fcLabel2: TfcLabel
              Left = 392
              Top = 1
              Width = 77
              Height = 25
              Align = alRight
              AutoSize = False
              Caption = ' Valor Atual  :    '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.VAlignment = vaVCenter
            end
            object lblValMinCesta: TfcLabel
              Left = 61
              Top = 1
              Width = 116
              Height = 25
              Align = alLeft
              Caption = '                      0,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Style = fclsLowered
              TextOptions.VAlignment = vaVCenter
              Visible = False
            end
            object fcLabel1: TfcLabel
              Left = 1
              Top = 1
              Width = 60
              Height = 25
              Align = alLeft
              AutoSize = False
              Caption = '  Mínimo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.VAlignment = vaVCenter
              TextOptions.WordWrap = True
              Visible = False
            end
            object fcLabel3: TfcLabel
              Left = 177
              Top = 1
              Width = 93
              Height = 25
              Align = alLeft
              AutoSize = False
              Caption = '          Máximo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.VAlignment = vaVCenter
              Visible = False
            end
            object lblValMaxCesta: TfcLabel
              Left = 270
              Top = 1
              Width = 116
              Height = 25
              Align = alLeft
              Caption = '                      0,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Style = fclsLowered
              TextOptions.VAlignment = vaVCenter
              Visible = False
            end
            object pnlEspacador: TPanel
              Left = 585
              Top = 1
              Width = 14
              Height = 25
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock974: TDock97
        Left = 608
        Top = 57
        Height = 196
      end
    end
    inherited pnlTitulo: TPanel
      Width = 702
      inherited lbNomItem: TfcLabel
        Width = 258
        Caption = 'Cesta de Opção de Índice'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 704
    object lblStatus: TfcLabel [0]
      Left = 634
      Top = 11
      Width = 64
      Height = 22
      Caption = 'Boleta '
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taRightJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnPosicao: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Posição'
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
        OnClick = sbtnPosicaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 704
    inherited tb97Fundo: TToolbar97
      Left = 532
      DockPos = 969
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 363
      DockPos = 800
    end
    inline fraCestaOpcInd: TfraMensagem
      Left = 3
      Width = 364
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 364
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Width = 167
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 165
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 96
    Top = 51
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    Left = 405
    Top = 56
  end
  inherited ds: TwwDataSource
    Left = 407
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CESTAOPCIND'
      'set'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  COTACAO = :COTACAO,'
      '  VALOR = :VALOR,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    InsertSQL.Strings = (
      'insert into CESTAOPCIND'
      
        '  (IDCESTAOPCIND, DATAVIGENCIA, IDINVESTIMENTO, QUANTIDADE, COTA' +
        'CAO, VALOR, '
      '   IDCUSTODIANTE, IDCARTEIRAINVEST)'
      'values'
      
        '  (:IDCESTAOPCIND, :DATAVIGENCIA, :IDINVESTIMENTO, :QUANTIDADE, ' +
        ':COTACAO, '
      '   :VALOR, :IDCUSTODIANTE, :IDCARTEIRAINVEST)')
    DeleteSQL.Strings = (
      'delete from CESTAOPCIND'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    Left = 363
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'ORDEMOPCIND.DATAORDEM'
      'OPCOES.DTAVENCTO'
      'ORDEMOPCIND.PREMIO'
      'ORDEMOPCIND.IDBOLETA'
      'ORDEMOPCIND.IDLOTE'
      'ORDEMOPCIND.STATUS')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Opção de Indice'
      'Data da Ordem'
      'Data do Vencto'
      'Prêmio'
      'Boleta'
      'Lote'
      'Status')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDEMOPCIND'
      'INVESTIMENTO'
      'OPCOES'
      
        '(SELECT DISTINCT IDCESTAOPCIND, DATAVIGENCIA, IDBOLETA FROM CEST' +
        'AOPCIND C1 WHERE ((C1.IDCESTAOPCIND || C1.DATAVIGENCIA) IN (SELE' +
        'CT C2.IDCESTAOPCIND || MAX(C2.DATAVIGENCIA) FROM CESTAOPCIND C2,' +
        ' PARAMINVEST P1 WHERE C2.DATAVIGENCIA <= P1.DATAULTFECH GROUP BY' +
        ' C2.IDCESTAOPCIND))) CO'
      'PARAMINVEST')
    CamposChave.Strings = (
      'ORDEMOPCIND.IDCESTAOPCIND'
      'INVESTIMENTO.DESCINVESTIMENTO')
    Filtro.Strings = (
      'ORDEMOPCIND.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'ORDEMOPCIND.IDTIPOOPERACAO = -86'
      'ORDEMOPCIND.STATUS         = '#39'F'#39
      'ORDEMOPCIND.IDCESTAOPCIND IS NOT NULL'
      'ORDEMOPCIND.DATAORDEM < PARAMINVEST.DATAULTFECH'
      'OPCOES.DTAVENCTO >= PARAMINVEST.DATAULTFECH'
      'ORDEMOPCIND.IDCESTAOPCIND  = CO.IDCESTAOPCIND'
      'OPCOES.IDINVESTIMENTO      = ORDEMOPCIND.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '13'
      '13'
      '15'
      '12'
      '5'
      '1')
    UsaDistinct = True
    Left = 83
    Top = 51
  end
  inherited ImlPadrao: TImageList
    Left = 73
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 54
    Top = 51
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT C.IDCESTAOPCIND, C.DATAVIGENCIA, C.IDINVESTIMENTO, I.DESC' +
        'INVESTIMENTO,'
      '       C.QUANTIDADE, C.COTACAO, C.VALOR, CA.DESCCARTINVEST,'
      
        '       C.IDCUSTODIANTE, C.IDCARTEIRAINVEST, C.IDCARTEIRAGERENC, ' +
        'O.IDORDEMOPCIND, O.IDLOTE,'
      '       C.IDBOLETA'
      'FROM   CESTAOPCIND C,'
      
        '      (SELECT IDORDEMOPCIND, IDLOTE, DATAORDEM, DATAVIGENCIA, ID' +
        'CESTAOPCIND'
      '       FROM   ORDEMOPCIND'
      '       WHERE  IDCESTAOPCIND  = :IDCESTAOPCIND  AND'
      '              DATAORDEM      = (SELECT MAX(DATAORDEM)'
      '   '#9'         '#9'        FROM   ORDEMOPCIND'
      #9'  '#9'                WHERE  IDCESTAOPCIND  = :IDCESTAOPCIND  AND'
      
        '  '#9'    '#9#9'               DATAORDEM     <= TO_DATE(:DATAVIGENCIA,'#39 +
        'DD/MM/YYYY'#39'))) O,'
      '       INVESTIMENTO I, CARTEIRAINVEST CA'
      'WHERE  C.IDCESTAOPCIND  = :IDCESTAOPCIND    AND'
      '       C.DATAVIGENCIA   = (SELECT MAX(DATAVIGENCIA)'
      #9#9#9'   FROM CESTAOPCIND'
      #9#9#9'   WHERE'
      #9#9#9'       (IDCESTAOPCIND  = :IDCESTAOPCIND) AND'
      
        #9#9#9'       (DATAVIGENCIA  <= TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39'))' +
        ') AND'
      '       C.IDINVESTIMENTO    = I.IDINVESTIMENTO           AND'
      '       O.IDCESTAOPCIND     = C.IDCESTAOPCIND            AND'
      '       CA.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST         AND'
      '       C.QUANTIDADE        > 0 '
      'ORDER BY I.DESCINVESTIMENTO'
      ''
      ''
      ''
      ' ')
    UpdateObject = upd
    Left = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 32
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 22
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###'
    end
    object qryCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 17
      FieldName = 'COTACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryIDORDEMOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDEMOPCIND'
      Visible = False
    end
    object qryIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object qryDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object qryIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Visible = False
      Size = 30
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 24
    Top = 52
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM   CESTAOPCIND'
      'WHERE'
      '       IDCESTAOPCIND  = :IDCESTAOPCIND '
      ''
      ' '
      ' '
      ' ')
    Left = 325
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end>
    object qryDetalheIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
      Origin = 'CESTAOPCIND.IDCESTAOPCIND'
    end
    object qryDetalheDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
      Origin = 'CESTAOPCIND.DATAVIGENCIA'
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'CESTAOPCIND.IDINVESTIMENTO'
    end
    object qryDetalheQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'CESTAOPCIND.QUANTIDADE'
    end
    object qryDetalheCOTACAO: TFloatField
      FieldName = 'COTACAO'
      Origin = 'CESTAOPCIND.COTACAO'
    end
    object qryDetalheVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'CESTAOPCIND.VALOR'
    end
    object qryDetalheIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CESTAOPCIND.IDCUSTODIANTE'
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CESTAOPCIND.IDCARTEIRAINVEST'
    end
    object qryDetalheIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'CESTAOPCIND.IDCARTEIRAGERENC'
    end
    object qryDetalheTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'CESTAOPCIND.TRGDTINCLUSAO'
    end
    object qryDetalheTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'CESTAOPCIND.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update CESTAOPCIND'
      'set'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  COTACAO = :COTACAO,'
      '  VALOR = :VALOR,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND')
    InsertSQL.Strings = (
      'insert into CESTAOPCIND'
      '  (IDCESTAOPCIND, DATAVIGENCIA, IDINVESTIMENTO, QUANTIDADE, '
      'COTACAO, VALOR, '
      '   IDCUSTODIANTE, IDCARTEIRAINVEST, IDCARTEIRAGERENC)'
      'values'
      '  (:IDCESTAOPCIND, :DATAVIGENCIA, :IDINVESTIMENTO, :QUANTIDADE, '
      ':COTACAO, '
      '   :VALOR, :IDCUSTODIANTE, :IDCARTEIRAINVEST, :IDCARTEIRAGERENC)')
    DeleteSQL.Strings = (
      'delete from CESTAOPCIND'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND')
    Left = 361
    Top = 56
  end
  object qryCarteiraCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.DESCCARTINVEST AS CARTEIRA,'
      
        '      (CI.IDCARTEIRAINVEST || CG.IDCARTEIRAGERENC) AS IDCARTEIRA' +
        ','
      '       CI.IDCARTEIRAINVEST,'
      '       CG.IDCARTEIRAGERENC'
      'FROM  CARTEIRAINVEST CI, CARTEIRAGERENC CG, PARAMINVEST PI'
      'WHERE (CI.IDCARTEIRAINVEST = CG.IDCARTEIRAGERENC(+)) AND'
      '      (CI.IDCARTEIRAINVEST <> CG.IDCARTEIRAGERENC(+)) AND'
      '      (CI.FLGCARTLASTRO = '#39'S'#39') AND'
      '      (CG.IDCARTEIRAGERENC IS NULL) AND'
      '      (PI.FLGCARTGERENC = '#39'N'#39')'
      'UNION'
      'SELECT CG.DESCCARTGERENC AS CARTEIRA,'
      
        '      (CI.IDCARTEIRAINVEST || CG.IDCARTEIRAGERENC) AS IDCARTEIRA' +
        ','
      '       CI.IDCARTEIRAINVEST,'
      '       CG.IDCARTEIRAGERENC'
      'FROM  CARTEIRAINVEST CI, CARTEIRAGERENC CG, PARAMINVEST PI'
      'WHERE (CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST) AND'
      '      (CI.FLGCARTLASTRO = '#39'S'#39') AND'
      '      (PI.FLGCARTGERENC = '#39'S'#39')'
      ''
      'ORDER BY CARTEIRA'
      '')
    ValidateWithMask = True
    Left = 119
    Top = 297
    object qryCarteiraCestaCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryCarteiraCestaIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 80
    end
    object qryCarteiraCestaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraCestaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object qryCustodianteCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CT.SGLCUSTODIANTE, H1.IDCUSTODIANTE'
      'FROM'
      
        '   HISTCUSTODIA H1, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIA' +
        'NTE CT'
      'WHERE'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (H1.IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST)) OR'
      '     (:IDCARTEIRAINVEST IS NULL))    AND'
      
        '   (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)                      ' +
        '                     AND'
      
        '   (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)                  ' +
        '                     AND'
      
        '   (H1.IDCUSTODIANTE = CT.IDCUSTODIANTE)                        ' +
        '                     AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL))' +
        ' AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      '                (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                ((H2.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR'
      
        '                 ((H2.DATAMOVCUSTOD = TO_DATE(:DATAMOV, '#39'DD/MM/Y' +
        'YYY'#39')) AND (H2.IDCUSTODIA < 9999999))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE = H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      '                (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      #9'          (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '                (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD) AND'
      
        '                ((H3.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR (H3.IDCUSTODIA < 9999999)))) AND'
      '   (H1.SALDOLIBERADO > 0)'
      'ORDER BY CT.SGLCUSTODIANTE'
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryCustodianteCestaSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryAcaoCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IV.DESCINVESTIMENTO, CT.SGLCUSTODIANTE, H1.SALDOLIBERADO, H1.' +
        'SALDOBLOQUEADO,'
      
        '   H1.IDCARTEIRAINVEST, H1.IDCUSTODIANTE, H1.IDINVESTIMENTO, H1.' +
        'IDLOTE,'
      '   IV.IDEMISSOR'
      'FROM'
      
        '   HISTCUSTODIA H1, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIA' +
        'NTE CT'
      'WHERE'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (H1.IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST)) OR'
      '     (:IDCARTEIRAINVEST IS NULL))    AND'
      
        '   (((:IDCUSTODIANTE IS NOT NULL)   AND (H1.IDCUSTODIANTE = :IDC' +
        'USTODIANTE))       OR'
      '     (:IDCUSTODIANTE IS NULL))      AND'
      
        '   (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)                      ' +
        '                     AND'
      
        '   (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)                  ' +
        '                     AND'
      
        '   (H1.IDCUSTODIANTE = CT.IDCUSTODIANTE)                        ' +
        '                     AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL))' +
        ' AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      '                (H2.IDCUSTODIANTE = H1.IDCUSTODIANTE) AND'
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                ((H2.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR'
      
        '                 ((H2.DATAMOVCUSTOD = TO_DATE(:DATAMOV, '#39'DD/MM/Y' +
        'YYY'#39')) AND (H2.IDCUSTODIA < 9999999))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      '                (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      #9'          (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '                (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD) AND'
      
        '                ((H3.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR (H3.IDCUSTODIA < 9999999)))) AND'
      '   (H1.SALDOLIBERADO > 0)'
      'ORDER BY'
      '   IV.DESCINVESTIMENTO, DATAMOVCUSTOD DESC, IDCUSTODIA DESC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryAcaoCestaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAcaoCestaSGLCUSTODIANTE: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object qryAcaoCestaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
      Visible = False
    end
    object qryAcaoCestaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Visible = False
    end
    object qryAcaoCestaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryAcaoCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryAcaoCestaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAcaoCestaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryAcaoCestaIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
  end
  object QryDelCestaDia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CESTAOPCIND WHERE'
      '            IDCESTAOPCIND = :IDCESTAOPCIND AND'
      '            DATAVIGENCIA  = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 119
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
  end
  object qryOrdemOpcInd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OD.DATAORDEM, IV.DESCINVESTIMENTO, OD.IDCESTAOPCIND,'
      '   OD.IDINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDLOTE, OD.IDBOLETA'
      'FROM ORDEMOPCIND OD, INVESTIMENTO IV, OPCOES OP,'
      '     (SELECT DISTINCT IDCESTAOPCIND, DATAVIGENCIA, IDBOLETA'
      '      FROM  CESTAOPCIND C1'
      '      WHERE ((C1.IDCESTAOPCIND || C1.DATAVIGENCIA) IN'
      
        '                 (SELECT C2.IDCESTAOPCIND || MAX(C2.DATAVIGENCIA' +
        ')'
      '                  FROM CESTAOPCIND C2'
      
        '                  WHERE DATAVIGENCIA <= TO_DATE(:DATAFECHTO,'#39'DD/' +
        'MM/YYYY'#39')'
      '                  GROUP BY IDCESTAOPCIND))) CO'
      'WHERE OD.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OD.IDTIPOOPERACAO = -86'
      '  AND OD.STATUS         = '#39'F'#39
      '  AND OD.IDCESTAOPCIND IS NOT NULL'
      '  AND OD.DATAORDEM      < TO_DATE(:DATAFECHTO,'#39'DD/MM/YYYY'#39')'
      '  AND OP.DTAVENCTO     >= TO_DATE(:DATAFECHTO,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDCESTAOPCIND = CO.IDCESTAOPCIND'
      '  AND OP.IDINVESTIMENTO = OD.IDINVESTIMENTO'
      'ORDER BY IV.DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 243
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end>
    object qryOrdemOpcIndDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdemOpcIndDATAORDEM: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 15
      FieldName = 'DATAORDEM'
    end
    object qryOrdemOpcIndIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDCESTAOPCIND'
      Visible = False
    end
    object qryOrdemOpcIndIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDINVESTIMENTO'
      Visible = False
    end
    object qryOrdemOpcIndIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOrdemOpcIndIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryOrdemOpcIndIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
  object QryMaxMinCesta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  ORDEMOPCIND'
      'WHERE IDBOLETA = :IDBOLETA'
      '  AND IDLOTE =:IDLOTE')
    ValidateWithMask = True
    Left = 207
    Top = 243
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end>
  end
  object qryVerificaVigencias: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DATAVIGENCIA'
      'FROM CESTAOPCIND'
      'WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND DATAVIGENCIA > TO_DATE(:DATAVIGENCIA, '#39'DD/MM/YYYY'#39')'
      '  AND IDBOLETA IS NOT NULL ')
    ValidateWithMask = True
    Left = 392
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryVerificaVigenciasDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
  end
end
