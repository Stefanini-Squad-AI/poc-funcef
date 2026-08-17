inherited frmCadTransfCarteira: TfrmCadTransfCarteira
  Left = 2
  Top = 162
  HelpContext = 790303
  Caption = 'Transferência de Carteira'
  ClientHeight = 400
  ClientWidth = 782
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 782
    Height = 314
    object pnlGrid: TPanel
      Left = 1
      Top = 64
      Width = 780
      Height = 249
      Align = alClient
      TabOrder = 0
      object Panel4: TPanel
        Left = 493
        Top = 1
        Width = 286
        Height = 247
        Align = alRight
        TabOrder = 0
        object pnlSeta: TPanel
          Left = 1
          Top = 1
          Width = 32
          Height = 245
          Align = alLeft
          TabOrder = 0
          object BtnRemover: TSpeedButton
            Left = 3
            Top = 110
            Width = 27
            Height = 27
            Enabled = False
            Flat = True
            Glyph.Data = {
              66010000424D66010000000000007600000028000000200000000F0000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000088
              8888888888FFFFF8888888800666660088888888F777778FF888880666666666
              08888887788888778F888066666F6666678888788888F88878F88066666FF666
              6788878888878F8887F80E66666FFF6666788788888778F887880E6FFFFFFFF6
              66787F88FFF7778F88780E6FFFFFFFFF66787F8777777778F8780E6FFFFFFFF6
              66787F877777777788780E66666FFF6666787F8777777778887880E6666FF666
              678878F888877788887880E6666F6666678887F8888778888788887EE66666EE
              7888878F88878888878888877EEEEE7788888878FF88888F7888888887777788
              8888888778FFFF778888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnRemoverClick
          end
        end
        object pnlTransferir: TPanel
          Left = 34
          Top = 1
          Width = 251
          Height = 245
          Align = alRight
          TabOrder = 1
          object Label7: TLabel
            Left = 9
            Top = 176
            Width = 66
            Height = 13
            Caption = 'Quantidade'
            Enabled = False
          end
          object Label4: TLabel
            Left = 9
            Top = 50
            Width = 45
            Height = 13
            Caption = 'Carteira'
            Enabled = False
          end
          object lblMotBloq: TLabel
            Left = 9
            Top = 94
            Width = 110
            Height = 13
            Caption = 'Motivo de Bloqueio'
            Enabled = False
          end
          object LblTipoConta: TLabel
            Left = 9
            Top = 137
            Width = 63
            Height = 13
            Caption = 'Tipo Conta'
            Enabled = False
          end
          object pnlTransfDest: TPanel
            Left = 1
            Top = 1
            Width = 249
            Height = 38
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Transferir para'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object EdQuantidade: TRealEdit
            Left = 9
            Top = 194
            Width = 137
            Height = 23
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 15
            DecDigits = 0
            NumberFormat = fNumber
            Signal = True
          end
          object dblCarteiraTransf: TwwDBLookupCombo
            Left = 9
            Top = 68
            Width = 234
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCARTINVEST'#9'40'#9'Descrição'#9'F')
            LookupTable = QryCarteiraTransf
            LookupField = 'IDCARTEIRAINVEST'
            Options = [loColLines, loRowLines, loTitles]
            Enabled = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblCarteiraTransfExit
          end
          object dblMotBlq: TwwDBLookupCombo
            Left = 9
            Top = 112
            Width = 234
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCMOTBLOQ'#9'23'#9'Descrição'#9'F'
              'SIGLAMOTBLOQ'#9'5'#9'Sigla'#9'F')
            LookupTable = QryMotBlq
            LookupField = 'IDMOTIVOBLOQUEIO'
            Options = [loColLines, loRowLines, loTitles]
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblTipoConta: TwwDBLookupCombo
            Left = 9
            Top = 153
            Width = 234
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'15'#9'Descrição'#9'F')
            LookupTable = qryTipoConta
            LookupField = 'IDTIPOCONTA'
            Options = [loColLines, loRowLines, loTitles]
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 492
        Height = 247
        Align = alClient
        TabOrder = 1
        object GrdCustodia: TDBGrid
          Left = 1
          Top = 38
          Width = 490
          Height = 208
          Align = alClient
          DataSource = dsCustodia
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'PLANPRVCONTABPATRO'
              Title.Caption = 'Plano / Patrocinadora'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 285
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGLCUSTODIANTE'
              Title.Caption = 'Custodiante'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Title.Caption = 'Saldo Custódia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLAMOTBLOQ'
              Title.Caption = 'Mortivo de Bloqueio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDOCC'
              Title.Caption = 'Saldo CC na Carteira'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDOCCI'
              Title.Caption = 'Saldo CCI na Carteira'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 140
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 490
          Height = 37
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Saldos Origem'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 780
      Height = 63
      Align = alTop
      TabOrder = 1
      object Label6: TLabel
        Left = 15
        Top = 9
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label2: TLabel
        Left = 106
        Top = 9
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label1: TLabel
        Left = 426
        Top = 9
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object edData: TCMDateTimePicker
        Left = 15
        Top = 25
        Width = 90
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
        TabOrder = 0
        OnEnter = edDataEnter
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 106
        Top = 25
        Width = 319
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Descrição')
        LookupTable = QryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblCarteiraCloseUp
        OnEnter = dblCarteiraEnter
        OnExit = dblCarteiraExit
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 426
        Top = 25
        Width = 343
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Descrição')
        LookupTable = QryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestimentoCloseUp
        OnEnter = dblInvestimentoEnter
        OnExit = dblInvestimentoExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 782
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 60
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 120
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 782
    inherited tb97Fundo: TToolbar97
      Left = 610
      DockPos = 634
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
      DockPos = 465
    end
    inline fraProg: TfraMensagem
      Width = 441
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 441
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 304
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 302
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 305
          Width = 135
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 133
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 312
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 59
    Top = 190
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  DATAMOVCUSTOD = :DATAMOVCUSTOD,'
      '  QTDEMOVCUSTOD = :QTDEMOVCUSTOD,'
      '  SALDOLIBERADO = :SALDOLIBERADO,'
      '  SALDOBLOQUEADO = :SALDOBLOQUEADO,'
      '  FLGCALCSALDO = :FLGCALCSALDO,'
      '  IDLOTE = :IDLOTE,'
      '  TIPOCUSTODIA = :TIPOCUSTODIA,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO'
      'where'
      '  IDCUSTODIA = :OLD_IDCUSTODIA')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCUSTODIA, IDOPERACAOINVEST, IDCARTEIRAINVEST, IDINVESTIMENT' +
        'O, '
      'IDCUSTODIANTE, '
      '   DATAMOVCUSTOD, QTDEMOVCUSTOD, SALDOLIBERADO, '
      'SALDOBLOQUEADO, FLGCALCSALDO, '
      '   IDLOTE, TIPOCUSTODIA, IDMOTIVOBLOQUEIO)'
      'values'
      '  (:IDCUSTODIA, :IDOPERACAOINVEST, :IDCARTEIRAINVEST, '
      ':IDINVESTIMENTO, '
      '   :IDCUSTODIANTE, :DATAMOVCUSTOD, :QTDEMOVCUSTOD, '
      ':SALDOLIBERADO, :SALDOBLOQUEADO, '
      '   :FLGCALCSALDO, :IDLOTE, :TIPOCUSTODIA, :IDMOTIVOBLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCUSTODIA = :OLD_IDCUSTODIA')
    Left = 99
    Top = 190
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPERCUSTODIA.DATAMOVCUSTOD'
      'OPERCUSTODIA.IDBOLETA'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERCUSTODIA.QUANTIDADE'
      'CARTEIRAINVEST.DESCCARTINVEST')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Data'
      'Boleta'
      'Investimento'
      'Quantidade'
      'Carteira de Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERCUSTODIA'
      'INVESTIMENTO'
      'CARTEIRAINVEST')
    CamposChave.Strings = (
      'OPERCUSTODIA.IDOPERCUSTODIA'
      'OPERCUSTODIA.IDCUSTODIAORIG'
      'OPERCUSTODIA.IDCUSTODIADEST'
      'OPERCUSTODIA.IDHISTCARTINVORIG'
      'OPERCUSTODIA.IDHISTCARTINVDEST'
      'OPERCUSTODIA.DATAMOVCUSTOD'
      'OPERCUSTODIA.IDINVESTIMENTO'
      'OPERCUSTODIA.IDCUSTODIANTEORIG'
      'OPERCUSTODIA.IDMOTIVOBLOQORIG'
      'OPERCUSTODIA.IDCARTEIRAORIG'
      'OPERCUSTODIA.IDCUSTODIANTEDEST'
      'OPERCUSTODIA.IDCARTEIRADEST'
      'OPERCUSTODIA.QUANTIDADE'
      'OPERCUSTODIA.IDBOLETA'
      'OPERCUSTODIA.IDPLANPREVCTBPATR')
    Filtro.Strings = (
      'OPERCUSTODIA.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERCUSTODIA.IDCARTEIRAORIG <> OPERCUSTODIA.IDCARTEIRADEST'
      'OPERCUSTODIA.IDCARTEIRAORIG = CARTEIRAINVEST.IDCARTEIRAINVEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '15'
      '25'
      '15'
      '45')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 353
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 414
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   H1.IDCUSTODIA,'
      '   H1.IDOPERACAOINVEST,'
      '   H1.IDCARTEIRAINVEST,'
      '   H1.IDINVESTIMENTO,'
      '   H1.IDCUSTODIANTE,'
      '   H1.DATAMOVCUSTOD,'
      '   H1.QTDEMOVCUSTOD,'
      '   H1.SALDOLIBERADO,'
      '   H1.SALDOBLOQUEADO,'
      '   H1.FLGCALCSALDO,'
      '   H1.IDLOTE,'
      '   H1.TIPOCUSTODIA,'
      '   H1.IDMOTIVOBLOQUEIO'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      '     (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (IDCUSTODIANTE =:IDCUSTODIANTE) AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE' +
        ' IS NULL)) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE' +
        ') AND'
      
        '        '#9'          (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) A' +
        'ND'
      
        '                        ((H2.DATAMOVCUSTOD  <  :DATAMOV) OR     ' +
        '    '
      '                        ((H2.DATAMOVCUSTOD  =  :DATAMOV))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O) AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE)' +
        ' AND'
      #9'         (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                         (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD)' +
        ' AND '
      '                         ((H3.DATAMOVCUSTOD < :DATAMOV))))')
    Left = 18
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
    object qryIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object qryDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object qryQTDEMOVCUSTOD: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object qrySALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object qrySALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object qryFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object qryTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object qryIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST,IDMERCADO'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   IDTIPOINVEST IN (2,4)'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 381
    Top = 65
    object QryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryCarteiraIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDINVESTIMENTO, DESCINVESTIMENTO,IDEMISSOR'
      ''
      'FROM CM.INVESTIMENTO'
      ''
      'WHERE IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 725
    Top = 65
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
    end
  end
  object QryCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       PP.PLANPRVCONTABPATRO, C.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ,' +
        ' MB.DESCMOTBLOQ,  '
      '       0 AS SALDO, 0 AS SALDOCC, 0 AS SALDOCCI,'
      
        '       HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO, HC.IDCUSTODIANTE,' +
        ' HC.IDLOTE, HC.IDMOTIVOBLOQUEIO, HC.IDPLANPREVCTBPATR'
      ''
      
        'FROM HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, VWPLANPR' +
        'EVCTBPATR PP'
      ''
      'WHERE HC.IDINVESTIMENTO   = :IDINVESTIMENTO'
      '  AND HC.IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      '  AND HC.IDCUSTODIANTE    = C.IDCUSTODIANTE(+)'
      '  AND HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)'
      
        '  AND (((HC.IDLOTE IS NOT NULL) AND (HC.IDLOTE = :IDLOTE)) OR ((' +
        'HC.IDLOTE IS NULL) AND (:IDLOTE IS NULL)))'
      '  AND HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      'ORDER BY C.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ')
    UpdateObject = updCustodia
    ValidateWithMask = True
    Left = 18
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end>
    object QryCustodiaSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodiaSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = ',###'
    end
    object QryCustodiaSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QryCustodiaSALDOCC: TFloatField
      FieldName = 'SALDOCC'
      DisplayFormat = ',###'
    end
    object QryCustodiaSALDOCCI: TFloatField
      FieldName = 'SALDOCCI'
      DisplayFormat = ',###'
    end
    object QryCustodiaIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object QryCustodiaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryCustodiaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryCustodiaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryCustodiaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryCustodiaDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object QryCustodiaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryCustodiaPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object dsCustodia: TwwDataSource
    DataSet = QryCustodia
    Left = 58
    Top = 238
  end
  object updCustodia: TUpdateSQL
    ModifySQL.Strings = (
      'update Custodiante'
      'set'
      '  SALDOBLOQUEADO = :SALDOBLOQUEADO,'
      '  SALDOLIBERADO = :SALDOLIBERADO'
      'where'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE')
    InsertSQL.Strings = (
      'insert into Custodiante'
      '  (SALDOBLOQUEADO, SALDOLIBERADO)'
      'values'
      '  (:SALDOBLOQUEADO, :SALDOLIBERADO)')
    DeleteSQL.Strings = (
      'delete from Custodiante'
      'where'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE')
    Left = 98
    Top = 237
  end
  object QryInsHistCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCUSTODIA'
      '       (IDCUSTODIA, IDOPERACAOINVEST, IDCARTEIRAINVEST,'
      '        IDINVESTIMENTO, IDCUSTODIANTE, DATAMOVCUSTOD,'
      '        QTDEMOVCUSTOD, SALDOLIBERADO, SALDOBLOQUEADO,'
      '        FLGCALCSALDO, IDLOTE, TIPOCUSTODIA, IDMOTIVOBLOQUEIO)'
      'VALUES'
      '       (:IDCUSTODIA, :IDOPERACAOINVEST, :IDCARTEIRAINVEST,'
      '        :IDINVESTIMENTO, :IDCUSTODIANTE, :DATAMOVCUSTOD,'
      '        :QTDEMOVCUSTOD, :SALDOLIBERADO, :SALDOBLOQUEADO,'
      
        '        :FLGCALCSALDO, :IDLOTE, :TIPOCUSTODIA, :IDMOTIVOBLOQUEIO' +
        ')')
    ValidateWithMask = True
    Left = 400
    Top = 191
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEMOVCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOLIBERADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOBLOQUEADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCALCSALDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end>
  end
  object QryAltCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCUSTODIA'
      '   SET'
      '   TIPOCUSTODIA =:TIPOCUSTODIA'
      'WHERE'
      '   IDCUSTODIA   =:IDCUSTODIA   '
      '')
    ValidateWithMask = True
    Left = 400
    Top = 246
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object QryCarteiraTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST, IDMERCADO'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   IDTIPOINVEST IN (2,4)'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 723
    Top = 207
    object QryCarteiraTransfDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraTransfIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryCarteiraTransfIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Visible = False
    end
  end
  object qryDelHistCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCUSTODIA'
      'WHERE'
      '   IDOPERCUSTODIA= :IDOPERCUSTODIA')
    ValidateWithMask = True
    Left = 50
    Top = 310
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object qryDelOperCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERCUSTODIA'
      'WHERE'
      '   IDOPERCUSTODIA = :IDOPERCUSTODIA    ')
    ValidateWithMask = True
    Left = 50
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object qryDelHistCartInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV = :IDHISTCARTINV')
    ValidateWithMask = True
    Left = 50
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end>
  end
  object QryMotBlq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM MOTIVOBLOQUEIO'
      ''
      'WHERE IDMOTIVOBLOQUEIO <> -1'
      ''
      'ORDER BY SIGLAMOTBLOQ')
    ValidateWithMask = True
    Left = 724
    Top = 251
    object QryMotBlqDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 23
      FieldName = 'DESCMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object QryMotBlqSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 5
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Size = 3
    end
    object QryMotBlqIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object qryUpdOperCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  OPERCUSTODIA  SET'
      '        IDCUSTODIADEST    = NULL, IDCUSTODIAORIG     = NULL,'
      '        IDHISTCARTINVDEST = NULL, IDHISTCARTINVORIG  = NULL'
      'WHERE   IDOPERCUSTODIA=:IDOPERCUSTODIA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 402
    Top = 302
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 319
    Top = 184
  end
  object qryBuscaPlnCodigo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLNCODIGO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV = :IDHISTCARTINV '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 178
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end>
    object qryBuscaPlnCodigoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTCARTINV.PLNCODIGO'
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '   IDTIPOOPERACAO,DESCTIPOOPERACAO'
      'FROM '
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOOPERACAO = :IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 175
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
  end
  object qryTipoConta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  0 AS IDTIPOCONTA, '#39'Antigo                   '#39' AS DESCRIC' +
        'AO FROM DUAL'
      'UNION'
      
        'SELECT  1 AS IDTIPOCONTA, '#39'Novo                     '#39' AS DESCRIC' +
        'AO FROM DUAL'
      ' ')
    ValidateWithMask = True
    Left = 724
    Top = 292
    object qryTipoContaDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 23
    end
    object qryTipoContaIDTIPOCONTA: TFloatField
      FieldName = 'IDTIPOCONTA'
      Visible = False
    end
  end
end
