inherited frmPreparaEnvia: TfrmPreparaEnvia
  Left = 295
  Top = 119
  HelpContext = 160044
  Caption = 'Envio de Contribuições'
  ClientHeight = 473
  ClientWidth = 799
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 799
    Height = 434
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 125
      Width = 797
      Height = 308
      ActivePage = tbsBasico
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsBasico: TTabSheet
        Caption = 'Opções Básicas'
        object pnlTabSheet1: TPanel
          Left = 0
          Top = 0
          Width = 789
          Height = 280
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label7: TLabel
            Left = 6
            Top = 107
            Width = 107
            Height = 13
            Caption = 'Planos Previdenciários'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbPatro: TLabel
            Left = 6
            Top = 5
            Width = 71
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbParticipante: TLabel
            Left = 408
            Top = 4
            Width = 111
            Height = 13
            Caption = 'Enviar Cobranças de ...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chklstPlano: TCheckListBox
            Left = 6
            Top = 120
            Width = 397
            Height = 116
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object chklstPatro: TCheckListBox
            Left = 6
            Top = 19
            Width = 397
            Height = 81
            OnClickCheck = chklstPatroClickCheck
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object chklstSituacao: TCheckListBox
            Left = 406
            Top = 19
            Width = 301
            Height = 217
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'Ativos'
              'Mantidos'
              'Mantidos Parciais'
              'Manutenção de Saldo de Conta'
              'Patrocinadora')
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object tbsOpcoesAvanc: TTabSheet
        Caption = '... Outras Opções'
        object pnlTabSheet2: TPanel
          Left = 0
          Top = 0
          Width = 789
          Height = 280
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object grpdatasvencimento: TGroupBox
            Left = 344
            Top = 178
            Width = 225
            Height = 58
            Caption = ' Processar cobranças com vencimento  '
            TabOrder = 4
            Visible = False
            object Label2: TLabel
              Left = 9
              Top = 21
              Width = 25
              Height = 13
              Caption = 'Entre'
            end
            object Label3: TLabel
              Left = 99
              Top = 21
              Width = 6
              Height = 13
              Caption = 'e'
            end
            object spedDiaIni: TSpinEdit
              Left = 39
              Top = 21
              Width = 58
              Height = 22
              MaxValue = 31
              MinValue = 1
              TabOrder = 0
              Value = 1
            end
            object spedDiaFim: TSpinEdit
              Left = 109
              Top = 21
              Width = 58
              Height = 22
              MaxValue = 31
              MinValue = 1
              TabOrder = 1
              Value = 31
            end
          end
          object rgrpContribuicoes: TRadioGroup
            Left = 6
            Top = 92
            Width = 327
            Height = 58
            Caption = ' Contribuições '
            ItemIndex = 0
            Items.Strings = (
              'Enviar todas as contribuições'
              'Enviar apenas as calculadas por evento ou novas inscrições')
            TabOrder = 1
            TabStop = True
            OnClick = rgrpContribuicoesClick
          end
          object GroupBox1: TGroupBox
            Left = 344
            Top = 116
            Width = 225
            Height = 58
            Caption = ' Especificar Data de Vencimento '
            TabOrder = 5
            object Label4: TLabel
              Left = 10
              Top = 41
              Width = 171
              Height = 13
              Caption = '[Válido p/ Preparo de Cob.Bancária]'
            end
            object dtVencBoleta: TCMDateTimePicker
              Left = 11
              Top = 16
              Width = 121
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
            end
          end
          object rgrpDataVencimento: TRadioGroup
            Left = 6
            Top = 178
            Width = 327
            Height = 58
            Caption = ' Vencimento da Contribuição '
            ItemIndex = 1
            Items.Strings = (
              'Processar contribuições de todos os vencimentos'
              'Filtrar por data de vencimento')
            TabOrder = 3
            TabStop = True
            OnClick = rgrpDataVencimentoClick
          end
          object rgrpTipoOperacao: TRadioGroup
            Left = 6
            Top = 8
            Width = 327
            Height = 81
            Caption = ' Tipo de Operação '
            ItemIndex = 0
            Items.Strings = (
              'Fazer Preparo e Envio'
              'Fazer apenas ENVIO (NÃO fazer Preparo)'
              'Fazer apenas PREPARO (NÃO fazer Envio)')
            TabOrder = 0
            TabStop = True
            OnClick = rgrpTipoOperacaoClick
          end
          object GroupBox2: TGroupBox
            Left = 344
            Top = 8
            Width = 361
            Height = 105
            Caption = 'Filtrar Contribuições ...'
            TabOrder = 6
            object chklstContrib: TCheckListBox
              Left = 8
              Top = 15
              Width = 345
              Height = 82
              Columns = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Sebif'
              Font.Style = []
              ItemHeight = 14
              ParentFont = False
              TabOrder = 0
            end
          end
          object chkPlanoDesativado: TCheckBox
            Left = 14
            Top = 152
            Width = 315
            Height = 17
            Caption = 'NÂO gerar contribuições para planos DESATIVADOS'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object pnlTabSheet4: TPanel
          Left = 0
          Top = 0
          Width = 789
          Height = 280
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object bbtnSalvar: TBitBtn
            Left = 615
            Top = 5
            Width = 95
            Height = 35
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 609
            Height = 278
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 797
      Height = 124
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblValores: TfcLabel
        Left = 8
        Top = 15
        Width = 209
        Height = 19
        Caption = 'Informações para cobrança'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 42
        Width = 275
        Height = 72
        Caption = 'Mês e Ano de Cobrança (Competência)'
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 42
          Width = 236
          Height = 13
          Caption = 'Preparar/Enviar                      contribuições s/ 13º'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 102
          Top = 41
          Width = 61
          Height = 13
          Caption = 'SOMENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object cmbMesCob: TComboBox
          Left = 6
          Top = 16
          Width = 187
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro')
        end
        object spedAnoCob: TSpinEdit
          Left = 198
          Top = 16
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
        object chkApenas13: TCheckBox
          Left = 6
          Top = 42
          Width = 19
          Height = 17
          TabOrder = 2
        end
      end
      object rgrpTipoCobranca: TRadioGroup
        Left = 383
        Top = 40
        Width = 142
        Height = 76
        Caption = 'Tipo de Cobrança'
        ItemIndex = 0
        Items.Strings = (
          'Desconto em Folha'
          'Cobrança Bancária'
          'Cob. Incentivados'
          'Todos')
        TabOrder = 1
        TabStop = True
      end
      object bbtnEnviar: TBitBtn
        Left = 676
        Top = 35
        Width = 107
        Height = 38
        Caption = '&Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnEnviarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
        Margin = 12
        Spacing = 8
      end
      object lsLotesEnviados: TListBox
        Left = 696
        Top = -11
        Width = 41
        Height = 25
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
      object bbtnDesfazer: TBitBtn
        Left = 676
        Top = 76
        Width = 107
        Height = 38
        Caption = '&Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = bbtnDesfazerClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
          0000333333338330000033333338803000003333338800300000333338809030
          0000333388099030000033388079703000003388099990300000388097979030
          0000330999999030000033307979703000003333099990300000333330979030
          0000333333099030000033333330703000003333333300300000333333333030
          00003333333333300000}
        Margin = 12
        Spacing = 8
      end
      object GroupBox3: TGroupBox
        Left = 285
        Top = 40
        Width = 94
        Height = 76
        TabOrder = 5
        object CbEnvio: TCheckBox
          Left = 6
          Top = 11
          Width = 82
          Height = 17
          Caption = 'Envio'
          TabOrder = 0
          OnClick = CbEnvioClick
        end
        object CbPga: TCheckBox
          Left = 6
          Top = 32
          Width = 82
          Height = 17
          Caption = 'PGA'
          TabOrder = 1
          OnClick = CbPgaClick
        end
        object CbBpd: TCheckBox
          Left = 6
          Top = 52
          Width = 82
          Height = 17
          Caption = 'BPD'
          TabOrder = 2
          OnClick = CbBpdClick
        end
      end
      object grpMeses: TGroupBox
        Left = 528
        Top = 40
        Width = 146
        Height = 75
        Caption = 'Cobrança a Enviar'
        TabOrder = 6
        object chkApenasMes: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Apenas do Mês'
          TabOrder = 0
        end
        object chkApenasAtrasadas: TCheckBox
          Left = 8
          Top = 36
          Width = 129
          Height = 17
          Caption = 'Apenas Atrasadas'
          TabOrder = 1
        end
        object chkApenasDevolucoes: TCheckBox
          Left = 8
          Top = 56
          Width = 136
          Height = 17
          Caption = 'Apenas Devoluções'
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 799
    inherited tb97Fundo: TToolbar97
      Left = 556
      DockPos = 556
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 387
      DockPos = 387
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.IDCONTRIBUICAO, CPP.ORDEMCALCULO,C.NOME,'
      '       CPP.IDREGRACALCULO , CPP.IDREGRAPRIMPAGTO,'
      '       CPP.IDREGRAULTPAGTO, CPP.FLGPAGADOR, CPP.IDCONTRIBPAI, '
      
        '       CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR ' +
        'AS FLGPAGADORASSOC1,'
      
        '       CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR' +
        ' AS FLGPAGADORASSOC3,'
      
        '       C.FLGOBRIGATORIA, CPP.FLGINTERNO, CPP.FLGCOBRADECTERC, CP' +
        'P.FLGPARCELAMENTO'
      
        'FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV ' +
        'CASSOC2,'
      '       CONTPREV CASSOC3'
      'WHERE  C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND'
      '        CPP.FLGINTERNO = :psSitFundacao AND'
      '       CPP.IDPLANOPREV = :piIdPlanoPrev AND'
      '       CPP.IDPLANOPREV  = CASSOC1.IDPLANOPREV(+) AND'
      '       CPP.IDCONTRIBPAI = CASSOC1.IDCONTRIBUICAO(+) AND'
      '       CPP.IDPLANOPREV  = CASSOC2.IDPLANOPREV(+) AND'
      '       CPP.IDCONTRIBPAI2 = CASSOC2.IDCONTRIBUICAO(+) AND'
      '       CPP.IDPLANOPREV  = CASSOC3.IDPLANOPREV(+) AND'
      '       CPP.IDCONTRIBPAI3 = CASSOC3.IDCONTRIBUICAO(+)'
      'ORDER  BY CPP.ORDEMCALCULO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'psSitFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV , NOME'
      'FROM PLANPREV')
    ValidateWithMask = True
    Left = 48
    Top = 320
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 176
  end
  object qryLotesAEnviar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 240
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 616
    Top = 176
  end
  object dsContribACalcular: TwwDataSource
    Left = 560
    Top = 272
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 208
    Top = 176
  end
  object dsPreparosAnt: TwwDataSource
    DataSet = qryPreparosAntOld
    Left = 400
    Top = 208
  end
  object qryEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 96
    Top = 376
  end
  object qryPreparosAntOld: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = updPreparos
    ControlType.Strings = (
      'FLGIDATMP;CheckBox;1;0'
      'FLGENVIAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 648
    Top = 288
    object qryPreparosAntOldIDLOTE: TFloatField
      DisplayLabel = 'Número ~do Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
    end
    object qryPreparosAntOldDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryPreparosAntOldDATAPREPARO: TDateTimeField
      DisplayLabel = 'Data do ~Preparo'
      DisplayWidth = 10
      FieldName = 'DATAPREPARO'
    end
    object qryPreparosAntOldFLGENVIAR: TFloatField
      DisplayLabel = 'Enviar ~para CCP'
      DisplayWidth = 10
      FieldName = 'FLGENVIAR'
    end
    object qryPreparosAntOldFLGIDATMP: TFloatField
      DisplayLabel = 'Enviado ~para CCP'
      DisplayWidth = 10
      FieldName = 'FLGIDATMP'
    end
    object qryPreparosAntOldDATAIDATMP: TDateTimeField
      DisplayLabel = 'Data do ~Envio'
      DisplayWidth = 10
      FieldName = 'DATAIDATMP'
    end
    object qryPreparosAntOldNUMREG: TFloatField
      DisplayLabel = 'Número de ~Registros'
      DisplayWidth = 18
      FieldName = 'NUMREG'
    end
    object qryPreparosAntOldVLRTOTAL: TFloatField
      DisplayLabel = 'Valor ~Total'
      DisplayWidth = 25
      FieldName = 'VLRTOTAL'
      currency = True
    end
    object qryPreparosAntOldMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      Visible = False
      Size = 7
    end
    object qryPreparosAntOldIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPreparosAntOldCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryPreparosAntOldFLGVOLTATMP: TFloatField
      FieldName = 'FLGVOLTATMP'
      Visible = False
    end
    object qryPreparosAntOldFLGIDAINTERFACE: TFloatField
      FieldName = 'FLGIDAINTERFACE'
      Visible = False
    end
    object qryPreparosAntOldFLGVOLTAINTERFACE: TFloatField
      FieldName = 'FLGVOLTAINTERFACE'
      Visible = False
    end
    object qryPreparosAntOldFLGEMITIUCC: TFloatField
      FieldName = 'FLGEMITIUCC'
      Visible = False
    end
    object qryPreparosAntOldDATAVOLTATMP: TDateTimeField
      FieldName = 'DATAVOLTATMP'
      Visible = False
    end
    object qryPreparosAntOldDATAIDAINTERFACE: TDateTimeField
      FieldName = 'DATAIDAINTERFACE'
      Visible = False
    end
    object qryPreparosAntOldDATAVOLTAINTERFA: TDateTimeField
      FieldName = 'DATAVOLTAINTERFA'
      Visible = False
    end
    object qryPreparosAntOldDATAEMITIUCC: TDateTimeField
      FieldName = 'DATAEMITIUCC'
      Visible = False
    end
    object qryPreparosAntOldTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      Size = 1
    end
    object qryPreparosAntOldFLGPREPARADO: TFloatField
      FieldName = 'FLGPREPARADO'
      Visible = False
    end
    object qryPreparosAntOldFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      Visible = False
      Size = 1
    end
    object qryPreparosAntOldPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Visible = False
      Size = 60
    end
  end
  object updPreparos: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  FLGIDATMP = :FLGIDATMP,'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGVOLTATMP = :FLGVOLTATMP,'
      '  FLGIDAINTERFACE = :FLGIDAINTERFACE,'
      '  FLGVOLTAINTERFACE = :FLGVOLTAINTERFACE,'
      '  FLGEMITIUCC = :FLGEMITIUCC,'
      '  DATAIDATMP = :DATAIDATMP,'
      '  DATAVOLTATMP = :DATAVOLTATMP,'
      '  DATAIDAINTERFACE = :DATAIDAINTERFACE,'
      '  DATAVOLTAINTERFA = :DATAVOLTAINTERFA,'
      '  DATAEMITIUCC = :DATAEMITIUCC,'
      '  NUMREG = :NUMREG,'
      '  VLRTOTAL = :VLRTOTAL,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  TIPO = :TIPO,'
      '  FLGPREPARADO = :FLGPREPARADO,'
      '  DATAPREPARO = :DATAPREPARO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGENVIAR = :FLGENVIAR'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into CM.CTRLINTERFACE'
      '  (IDLOTE, FLGIDATMP, IDPESSOA, FLGVOLTATMP, FLGIDAINTERFACE, '
      
        '   FLGVOLTAINTERFACE, FLGEMITIUCC, DATAIDATMP, DATAVOLTATMP, DAT' +
        'AIDAINTERFACE, '
      
        '   DATAVOLTAINTERFA, DATAEMITIUCC, NUMREG, VLRTOTAL, MESREFERENC' +
        'IA, TIPO, '
      
        '   FLGPREPARADO, DATAPREPARO, DESCRICAO, FLGATRASODEVOL, FLGENVI' +
        'AR)'
      'values'
      
        '  (:IDLOTE, :FLGIDATMP, :IDPESSOA, :FLGVOLTATMP, :FLGIDAINTERFAC' +
        'E, '
      
        '   :FLGVOLTAINTERFACE, :FLGEMITIUCC, :DATAIDATMP, :DATAVOLTATMP,' +
        ' :DATAIDAINTERFACE, '
      
        '   :DATAVOLTAINTERFA, :DATAEMITIUCC, :NUMREG, :VLRTOTAL, :MESREF' +
        'ERENCIA, '
      
        '   :TIPO, :FLGPREPARADO, :DATAPREPARO, :DESCRICAO, :FLGATRASODEV' +
        'OL, :FLGENVIAR)')
    DeleteSQL.Strings = (
      'delete from CM.CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 632
    Top = 224
  end
  object qryTotalPatro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 376
  end
  object qryEnvioAtr: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 80
    Top = 224
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2,'
      
        '       LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN, LC.HITCODHIST, L' +
        'C.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO,'
      
        '       LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.PLANO, LC.LACTIPO,' +
        ' LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5,'
      
        '       LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, LC.LACTIPCONVGER,' +
        ' LC.LACVALGERENCIAL,'
      
        '       LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC.LACTIPCONVGEREN2' +
        ', LC.LACVALGEREN2, LC.LACATOUTMOEDA,'
      
        '       LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDELEMDEMONSTRAT, LC.' +
        'CODCENTROCUSTO,'
      
        '       U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLNDATDIA, -1.00 AS ' +
        'IDPESSJUR, -1.00 AS IDPLANOPREV'
      'FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTCUST CC, PLANILHA PL'
      'WHERE (LC.PLNCODIGO =  :plncodigo) AND'
      '      (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      '      (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AND'
      '      (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '      (LC.IDPESSOA          = U.IDPESSOA(+)) AND'
      '      (LC.UNIDNEGOC         = U.UNIDNEGOC(+))'
      ' '
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 568
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 504
    Top = 224
  end
  object qryPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME AS PATROCINADORA, PL.NOME AS PLANO,'
      '       PLP.IDPESSJUR, PLP.IDPLANOPREV, '
      
        '       CL.IDCALENDARIO,CL.FLGINTERNO,CL.ANOMESREF,CL.DATACOBNORM' +
        'AL,CL.DATACOBATRASO,'
      
        '       CL.DATACOBDEVOLUCAO,CL.DATAPAGBENEF,CL.DATAPAGABONO,CL.DA' +
        'TAPAGANTBENEF,'
      '       CL.DATAPAGANTABONO,PL.FLGNGRAVACONTZERO'
      'FROM   PLANPREVPATRO PLP, PLANPREV PL, PESSOA P, CALENDDATAS CL'
      'WHERE  PLP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    PLP.IDPESSJUR   = P.IDPESSOA'
      'AND    PLP.IDCALENDARIO = CL.IDCALENDARIO'
      'AND    PLP.IDPESSJUR   IN (:STRIDPESSJUR)'
      'AND    PLP.IDPLANOPREV IN (:STRIDPLANOPREV)'
      'AND    CL.FLGINTERNO IN (:STRSITUACAO)  '
      'AND    CL.ANOMESREF = :MESCOBRANCA'
      'ORDER BY PLP.IDPESSJUR, PLP.IDPLANOPREV, CL.FLGINTERNO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'STRIDPESSJUR'
        ParamType = ptUnknown
        Value = '111'
      end
      item
        DataType = ftString
        Name = 'STRIDPLANOPREV'
        ParamType = ptUnknown
        Value = '14'
      end
      item
        DataType = ftString
        Name = 'STRSITUACAO'
        ParamType = ptUnknown
        Value = 'AT'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
        Value = '1999/08'
      end>
  end
  object qryFiltroContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, NOME'
      'FROM CONTRIBUICAO '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 456
    Top = 176
  end
  object qryMantidos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 128
    Top = 176
  end
  object qryDesfazDocumentos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS CODDOCUMENTO, '#39'0000/00'#39'  AS MESREFERENCIA FROM DUAL')
    UpdateObject = updDesfazDocumentos
    ValidateWithMask = True
    Left = 328
    Top = 280
  end
  object updDesfazDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  MOECODIGO = :MOECODIGO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (CODDOCUMENTO, MOECODIGO)'
      'values'
      '  (:CODDOCUMENTO, :MOECODIGO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 328
    Top = 224
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  RECPAG = :RECPAG,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      ' IDPESSJURCEDIDO = :IDPESSJURCEDIDO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      
        '   CODTIPRECDES, VALOR, RECPAG, IDPLANPREVCONTAB, IDPESSJURCEDID' +
        'O)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      
        '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :RECPAG, :IDPLANPREV' +
        'CONTAB, :IDPESSJURCEDIDO)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 48
    Top = 184
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.CODDOCUMENTO,D.PLANO,D.PLACONTA,L.PLNCODIGO ,L.NUMLANCT' +
        'O,'
      '       R.UNIDNEGOC,R.CODCENTRORESPON,R.CODTIPRECDES,R.VALOR,'
      
        '       -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV, -1.00 AS IDCONT' +
        'RIBUICAO,'
      
        '       -1.00 AS FLGDEVOLUCAO, '#39'R'#39' AS RECPAG, -1.00 AS IDPLANPREV' +
        'CONTAB,'
      '       -1.00 AS IDPESSJURCEDIDO'
      'FROM   DOCUMENTO D , LANCTODOCUM L, RATEIODOCUM R'
      'WHERE  D.CODDOCUMENTO = :CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = L.CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = R.CODDOCUMENTO'
      'ORDER BY D.PLANO,D.PLACONTA'
      ''
      ' ')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 48
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'coddocumento'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryDocumentosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDocumentosIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryDocumentosFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDocumentosRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDocumentosIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryDocumentosIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
    end
  end
  object cdsDocRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocRec'
    Left = 389
    Top = 9
  end
  object cdsDocPag: TCMClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    Left = 477
    Top = 1
  end
  object dspDocRec: TDataSetProvider
    Constraints = True
    Left = 221
    Top = 17
  end
  object qryDocPag: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 295
    Top = 15
  end
  object sqlLancFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  CODLANCFINANC,  '
      '  STATUSCONCILIA,'
      '  VALORLANCFINAN, '
      '  VALOROUTRAMOEDA, '
      '  NUMCHQBORDERO, '
      '  DATALANCFINAN,'
      '  ENTRADASAIDA, '
      '  HISTORICO'
      'FROM'
      '  MOVIMFINANC'
      'WHERE'
      ''
      '1=2'
      'ORDER BY'
      '  DATALANCFINAN, '
      '  NUMCHQBORDERO'
      ''
      '')
    ClientDataSet = cdsLancFinanc
    Left = 583
    Top = 65525
  end
  object cdsLancFinanc: TCMClientDataSet
    Tag = 2
    Aggregates = <>
    Params = <>
    Left = 661
    Top = 5
  end
  object qryPlanoxDocum: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'0'#39' AS SELECAO,'
      '       '#39' '#39' AS MATRICULA,'
      '       '#39' '#39' AS NOME,'
      '       '#39' '#39' AS IDCONTRATOEMPTMO,'
      '       '#39' '#39' AS DATACREDITO,'
      '       '#39' '#39' AS VLRCONTRATO,'
      '       '#39' '#39' AS VLRESPERADO FROM DUAL')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 724
    Top = 6
  end
  object SQLDocPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  '#39'N'#39' AS BAIXAPARCIAL,'
      '  0 AS VALORPAGO,'
      '  0 as VALORPAGOOOTRMOE,'
      '  (0)AS SALDO,'
      '  (0) AS SALDO1,'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODSUBCONTA,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.DEBCRE,'
      '  L.VALOROUTRAMOEDA,'
      '  0 AS IMPRET,'
      '  0 AS IMP,'
      '  0 AS DIF,'
      '  '#39'                    '#39' AS PLANOPREV '
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L'
      'WHERE'
      '  1 = 2'
      ''
      ''
      ' ')
    ClientDataSet = cdsDocPag
    Left = 351
    Top = 9
  end
  object SQLDocRec: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  '#39'N'#39' AS BAIXAPARCIAL,'
      '  0 AS VALORPAGO,'
      '  0 as VALORPAGOOOTRMOE,'
      '  (0)AS SALDO,'
      '  (0) AS SALDO1,'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODSUBCONTA,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.DEBCRE,'
      '  L.VALOROUTRAMOEDA,'
      '  0 AS IMPRET,'
      '  0 AS IMP,'
      '  0 AS DIF,'
      '  '#39'                   '#39' AS PLANOPREV'
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L'
      'WHERE'
      '  1 = 2'
      ''
      '')
    ClientDataSet = cdsDocRec
    Left = 423
    Top = 9
  end
  object qrySalContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PAR.INSCRICAONUMERO, PAR.SALPARTICIPACAO,  PAR.SALMANTIDO' +
        ','
      
        '       PAR.IDPESSJUR, PAR.IDPLANOPREV, PAR.IDPESSOA,  PAR.SEQPRO' +
        'POSTA'
      '  FROM PARTPREVPLAN  PAR, SITPART ST'
      ' WHERE PAR.IDSITPART    = ST.IDSITPART'
      '   AND PAR.IDPESSJUR = :IDPESSJUR '
      '   AND PAR.IDPLANOPREV = :IDPLANOPREV '
      '   AND PAR.IDPESSOA = :IDPESSOA'
      '   AND PAR.SEQPROPOSTA = :SEQPROPOSTA '
      '  AND ST.FLGINTERNO = :FLGINTERNO ')
    ValidateWithMask = True
    Left = 648
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO'
        ParamType = ptInput
      end>
  end
end
