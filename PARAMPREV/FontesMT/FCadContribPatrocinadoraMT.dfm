inherited FrmCadContribPatrocinadoraMT: TFrmCadContribPatrocinadoraMT
  Left = 381
  Top = 318
  Caption = 'Cadastro de Contribuições da Patrocinadora'
  ClientHeight = 488
  ClientWidth = 711
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 711
    Height = 402
    inherited pnlMestre: TPanel
      Width = 709
      Height = 92
      object Label4: TLabel
        Left = 5
        Top = 6
        Width = 99
        Height = 16
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 46
        Width = 146
        Height = 16
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedPatrocinadora: TwwDBEdit
        Left = 5
        Top = 22
        Width = 700
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'PATROCINADORA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedPlano: TwwDBEdit
        Left = 5
        Top = 62
        Width = 700
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 93
      Width = 709
      Height = 308
      inherited pgctrlDetalhe: TPageControl
        Width = 611
        Height = 249
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 603
            Height = 221
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 603
            Height = 221
            object GroupBox2: TGroupBox
              Left = 1
              Top = -1
              Width = 319
              Height = 103
              TabOrder = 0
              object Label6: TLabel
                Left = 6
                Top = 9
                Width = 72
                Height = 13
                Caption = 'Contribuição'
              end
              object dblkpcmbContribuicao: TwwDBLookupCombo
                Left = 6
                Top = 24
                Width = 289
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Contribuição'
                  'QTDEPARCELAS'#9'10'#9'Nº de Parcelas')
                DataField = 'IDCONTRIBUICAO'
                DataSource = dsDet
                LookupTable = cdsContribuicao
                LookupField = 'IDCONTRIBUICAO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbContribuicaoCloseUp
                OnExit = dblkpcmbContribuicaoExit
              end
              object chkCobrarContrib: TDBCheckBox
                Left = 8
                Top = 51
                Width = 145
                Height = 17
                Caption = 'Cobrar Contribuição'
                DataField = 'FLGCOBRA'
                DataSource = dsDet
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = chkCobrarContribClick
              end
            end
            object GroupBox1: TGroupBox
              Left = 330
              Top = -1
              Width = 268
              Height = 103
              TabOrder = 1
              object Label7: TLabel
                Left = 8
                Top = 9
                Width = 83
                Height = 13
                Caption = 'Data de Início'
              end
              object lblQtdeParcelas: TLabel
                Left = 8
                Top = 51
                Width = 85
                Height = 13
                Caption = 'Qtde. Parcelas'
              end
              object Label8: TLabel
                Left = 119
                Top = 51
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object Label9: TLabel
                Left = 119
                Top = 9
                Width = 78
                Height = 13
                Caption = 'Periodicidade'
              end
              object dtedInicio: TCMDateTimePicker
                Left = 8
                Top = 24
                Width = 104
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
                UnboundDataType = wwDTEdtDate
                OnExit = dtedInicioExit
              end
              object dtedFinal: TCMDateTimePicker
                Left = 119
                Top = 63
                Width = 104
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFINAL'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
              end
              object dblkpcmbPeriodicidade: TwwDBLookupCombo
                Left = 119
                Top = 24
                Width = 142
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Periodicidade')
                DataField = 'IDTPPERIODICIDADE'
                DataSource = dsDet
                LookupTable = cdsPeriodicidade
                LookupField = 'IDTPPERIODICIDADE'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbPeriodicidadeCloseUp
              end
              object edQtdeParcelas: TwwDBEdit
                Left = 8
                Top = 64
                Width = 97
                Height = 21
                DataField = 'QTDEPARCELAS'
                DataSource = dsDet
                TabOrder = 3
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = edQtdeParcelasExit
              end
            end
            object grpRecebimento: TGroupBox
              Left = 1
              Top = 107
              Width = 322
              Height = 109
              Caption = 'Opções de Cobrança'
              TabOrder = 2
              object Label5: TLabel
                Left = 9
                Top = 18
                Width = 111
                Height = 13
                Caption = 'Forma de Cobrança'
              end
              object Label1: TLabel
                Left = 9
                Top = 60
                Width = 108
                Height = 13
                Caption = 'Dia de Vencimento'
              end
              object dblkpcmbPortForma: TwwDBLookupCombo
                Left = 9
                Top = 33
                Width = 217
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Forma de Recebimento')
                DataField = 'CODPORTFORMA'
                DataSource = dsDet
                LookupTable = cdsPortForma
                LookupField = 'CODPORTFORMA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object cmbDiaVencimento: TwwDBComboBox
                Left = 8
                Top = 74
                Width = 85
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = False
                AllowClearKey = False
                DataField = 'DIAVENCIMENTO'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  ''
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10'
                  '11'
                  '12'
                  '13'
                  '14'
                  '15'
                  '16'
                  '15'
                  '18'
                  '19'
                  '20'
                  '21'
                  '22'
                  '23'
                  '24'
                  '25'
                  '26'
                  '27'
                  '28'
                  '29'
                  '30'
                  '31')
                ItemIndex = 0
                Sorted = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object grpOpcao: TGroupBox
              Left = 330
              Top = 107
              Width = 268
              Height = 109
              Caption = 'Opções de Contribuição'
              TabOrder = 3
              object lblOp3: TLabel
                Left = 13
                Top = 78
                Width = 49
                Height = 13
                Caption = 'Opção 3'
              end
              object lblOp2: TLabel
                Left = 13
                Top = 52
                Width = 49
                Height = 13
                Caption = 'Opção 2'
              end
              object lblOp1: TLabel
                Left = 13
                Top = 26
                Width = 49
                Height = 13
                Caption = 'Opção 1'
              end
              object edOp1: TwwDBEdit
                Left = 69
                Top = 21
                Width = 107
                Height = 21
                DataField = 'VALORBASE1'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edOp2: TwwDBEdit
                Left = 69
                Top = 47
                Width = 107
                Height = 21
                DataField = 'VALORBASE2'
                DataSource = dsDet
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edOp3: TwwDBEdit
                Left = 69
                Top = 72
                Width = 107
                Height = 21
                DataField = 'VALORBASE3'
                DataSource = dsDet
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 701
      end
      inherited Dock974: TDock97
        Left = 615
        Height = 249
      end
    end
  end
  inherited Dock972: TDock97
    Width = 711
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 711
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 258
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 232
  end
  inherited Cds: TCMClientDataSet
    Left = 164
    Top = 63
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PATRO'
      'PLANPREV'
      'PLANPREVPATRO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'PESSOA.IDPESSOA'
      'PLANPREV.IDPLANOPREV')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = PATRO.IDPESSOA'
      'PLANPREVPATRO.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREVPATRO.IDPESSJUR = PATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 320
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 232
    Top = 94
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 198
    Top = 95
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsDetAfterScroll
    Left = 164
    Top = 95
  end
  object cdsContribuicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsContribuicaoAfterScroll
    Left = 164
    Top = 127
  end
  object cdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 127
  end
  object cdsPeriodicidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 127
  end
  object qryGridContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.NOME,  CPP.IDPESSOA ,'
      '       CPP.IDPLANOPREV    ,    CPP.IDCONTRIBUICAO,'
      '       CPP.IDEMPRESAPROP13,    CPP.IDPLANPREVCONTAB ,'
      '       CPP.CODCCUSTODEVOL ,    CPP.IDEMPRESAPROP    ,'
      '       CPP.PLACONTADEVOL  ,    CPP.RECPAG            ,'
      '       CPP.UNIDNEGOC      ,    CPP.IDTPPERIODICIDADE ,'
      '       CPP.CODTIPRECDES   ,    CPP.CODTIPDOC13       ,'
      '       CPP.TIPCODIGO      ,    '
      '       CPP.CODCENTRORESPON,    CPP.CODTIPRECDES13    ,'
      '       CPP.RECPAG13       ,    CPP.IDEMPRESA         ,'
      '       CPP.CODCENTROCUSTOD13 ,  CPP.PLANO            ,'
      '       CPP.CODCENTROCUSTOC13 , CPP.CODSUBCONTA       ,'
      '       CPP.PLACONTAD13       , CPP.PLACONTAC         ,'
      '       CPP.PLACONTAC13       , CPP.CODPORTFORMA      ,'
      '       CPP.PLACONTAD         , CPP.CODCENTROCUSTOC   ,'
      '       CPP.CODCENTROCUSTOD   , CPP.DIAVENCIMENTO     ,'
      '       CPP.VALORBASE1        , CPP.VALORBASE2        ,'
      '       CPP.VALORBASE3        , CPP.DATAINICIO        ,'
      '       CPP.IDEMPRESA13       , CPP.DATAFINAL         ,'
      '       CPP.FLGCOBRA          , CPP.QTDEPARCELAS      ,'
      '       CPP.ULTMESPREPARO     , CPP.PLANO13           ,'
      '       CPP.TIPCODIGO13       , CPP.CODPORTFORMA13    ,'
      '       CPP.UNIDNEGOC13          ,'
      '       CPP.CODSUBCONTA13     , CPP.CODCENTRORESPON13 ,'
      '       CPP.CODTIPDOC         , TP.NOME  PERIODPADRAO ,'
      '       TP.QTDEMESES, CP.FLGPAGADOR  ,'
      
        '       CP.NUMOPCOES, CP.FLGACEITAOPCAO, TP2.NOME AS PERIODICIDAD' +
        'E'
      'FROM   CONTRIBPREVPATRO CPP,CONTPREV CP, CONTRIBUICAO C,'
      '       TPPERIODICIDADE TP, TPPERIODICIDADE TP2'
      'WHERE  CPP.IDPLANOPREV   = :iIdPlanoPrev AND'
      '       CPP.IDPESSOA      = :iIdPessoa AND'
      '       CP.IDPLANOPREV    = CPP.IDPLANOPREV AND'
      '       CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND'
      '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND'
      '       CPP.IDTPPERIODICIDADE = TP2.IDTPPERIODICIDADE(+) AND'
      '       C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)'
      ''
      ' '
      ' ')
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;Yes;No')
    ValidateWithMask = True
    Left = 402
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessoa'
        ParamType = ptUnknown
      end>
  end
end
