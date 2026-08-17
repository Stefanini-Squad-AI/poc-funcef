inherited frmPRelExtPoup: TfrmPRelExtPoup
  Left = 157
  Top = 159
  HelpContext = 160062
  Caption = 'Extrato de Poupança'
  ClientHeight = 436
  ClientWidth = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 607
    Height = 397
    object pgctrlExtReserva: TPageControl
      Left = 1
      Top = 1
      Width = 605
      Height = 395
      ActivePage = tbsParamGeral
      Align = alClient
      TabOrder = 0
      object tbsParamGeral: TTabSheet
        Caption = 'Parâmetros Gerais'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 597
          Height = 95
          Align = alTop
          Caption = ' Gerar Extrato para Reservas referentes aos meses entre  ... '
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 22
            Width = 102
            Height = 13
            Caption = 'Mês  / Ano Inicial'
          end
          object Label2: TLabel
            Left = 195
            Top = 22
            Width = 91
            Height = 13
            Caption = 'Mês / Ano Final'
          end
          object lblInicio: TLabel
            Left = 390
            Top = 21
            Width = 42
            Height = 13
            Caption = 'Início :'
          end
          object lblTermino: TLabel
            Left = 390
            Top = 45
            Width = 58
            Height = 13
            Caption = 'Término : '
          end
          object dbseano: TwwDBSpinEdit
            Left = 122
            Top = 38
            Width = 63
            Height = 21
            Increment = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object cbmes: TComboBox
            Left = 6
            Top = 38
            Width = 115
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            Text = ' '
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
          object cbmes1: TComboBox
            Left = 195
            Top = 38
            Width = 115
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Text = ' '
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
          object dbseano1: TwwDBSpinEdit
            Left = 310
            Top = 38
            Width = 63
            Height = 21
            Increment = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object chkInclui13: TCheckBox
            Left = 9
            Top = 69
            Width = 133
            Height = 17
            Caption = 'Incluir 13o. do Ano'
            TabOrder = 4
          end
          object edAno13: TwwDBSpinEdit
            Left = 143
            Top = 65
            Width = 63
            Height = 21
            Increment = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            UnboundDataType = wwDefault
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 95
          Width = 305
          Height = 151
          Caption = ' Planos Previdenciários '
          TabOrder = 1
          object dbgrdPlanos: TwwDBGrid
            Left = 5
            Top = 15
            Width = 295
            Height = 128
            Selected.Strings = (
              'FLGCONSIDERA'#9'5'#9'Gerar'
              'NOME'#9'50'#9'Plano')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = dsPlanos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 255
          Width = 597
          Height = 112
          Align = alBottom
          Caption = 'Mensagens'
          TabOrder = 2
          object RichEdit1: TRichEdit
            Left = 2
            Top = 15
            Width = 593
            Height = 95
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 307
          Top = 95
          Width = 282
          Height = 151
          Caption = ' Situações '
          TabOrder = 3
          object DbGrdSituacoes: TwwDBGrid
            Left = 4
            Top = 15
            Width = 273
            Height = 128
            Selected.Strings = (
              'FLGCONSIDERA'#9'5'#9'Gerar'
              'DESCRICAO'#9'50'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = DsSituacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = '&Lay Out do Arquivo'
        ImageIndex = 2
        object lblConsulta: TLabel
          Left = 6
          Top = 108
          Width = 164
          Height = 13
          Caption = 'Indique a Consulta Desejada'
        end
        object sbtnConsulta: TSpeedButton
          Left = 370
          Top = 126
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbtnConsultaClick
        end
        object rgrpLayOut: TRadioGroup
          Left = 3
          Top = 170
          Width = 355
          Height = 77
          ItemIndex = 1
          Items.Strings = (
            'Lay-Out Tipo 1'
            'Lay_Out Tipo 2')
          TabOrder = 0
          TabStop = True
        end
        object rgrpOrigem: TRadioGroup
          Left = 3
          Top = 12
          Width = 355
          Height = 77
          Caption = ' Origem dos Dados '
          ItemIndex = 0
          Items.Strings = (
            'Consulta a Indicar'
            'Lay-Out Pré-Existente')
          TabOrder = 1
          OnClick = rgrpOrigemClick
        end
        object edConsulta: TEdit
          Left = 6
          Top = 126
          Width = 355
          Height = 21
          TabOrder = 2
        end
      end
      object tbsParamTXT: TTabSheet
        Caption = 'Parâmetros de Configuração do Arquivo'
        object Label3: TLabel
          Left = 23
          Top = 16
          Width = 114
          Height = 13
          Caption = 'Linha de Cabeçalho'
        end
        object Label4: TLabel
          Left = 23
          Top = 72
          Width = 96
          Height = 13
          Caption = 'Data de Emissão'
        end
        object edCabecalho: TEdit
          Left = 23
          Top = 32
          Width = 377
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '+ DJDE JDE=JOBA4,JDL=XXXXX,END;'
        end
        object dtEmissao: TCMDateTimePicker
          Left = 23
          Top = 88
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 1
        end
        object GroupBox4: TGroupBox
          Left = 23
          Top = 120
          Width = 513
          Height = 193
          Caption = 'Linhas para Observação ( máximo de 96 caracteres por linha )'
          TabOrder = 2
          object Label6: TLabel
            Left = 8
            Top = 20
            Width = 51
            Height = 13
            Caption = 'Linha 1 :'
          end
          object Label7: TLabel
            Left = 8
            Top = 60
            Width = 51
            Height = 13
            Caption = 'Linha 2 :'
          end
          object Label5: TLabel
            Left = 8
            Top = 100
            Width = 51
            Height = 13
            Caption = 'Linha 3 :'
          end
          object Label8: TLabel
            Left = 8
            Top = 140
            Width = 51
            Height = 13
            Caption = 'Linha 4 :'
          end
          object edObs1: TEdit
            Left = 8
            Top = 36
            Width = 497
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 96
            ParentFont = False
            TabOrder = 0
            Text = 
              'Em caso de divergências nas informações apresentadas, entrar em ' +
              'contato com nossa Central de Aten-'
          end
          object edObs2: TEdit
            Left = 8
            Top = 76
            Width = 497
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 96
            ParentFont = False
            TabOrder = 1
            Text = 'dimento - 0800-7096362.'
          end
          object edObs3: TEdit
            Left = 8
            Top = 116
            Width = 497
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 96
            ParentFont = False
            TabOrder = 2
          end
          object edObs4: TEdit
            Left = 8
            Top = 156
            Width = 497
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 96
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object tsSegundaVia: TTabSheet
        Caption = 'Segunda Via'
        ImageIndex = 3
        object GroupBox5: TGroupBox
          Left = 20
          Top = 21
          Width = 513
          Height = 188
          Caption = 'Selecione o Participante'
          TabOrder = 0
          object Label9: TLabel
            Left = 24
            Top = 24
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label10: TLabel
            Left = 24
            Top = 72
            Width = 53
            Height = 13
            Caption = 'Inscrição'
          end
          object Label11: TLabel
            Left = 24
            Top = 120
            Width = 69
            Height = 13
            Caption = 'Participante'
          end
          object edMatricula: TEdit
            Left = 24
            Top = 40
            Width = 153
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object edInscr: TEdit
            Left = 24
            Top = 88
            Width = 153
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object bbtnProcurar: TBitBtn
            Left = 225
            Top = 36
            Width = 88
            Height = 33
            Hint = 'Procurar Participante Titular'
            Caption = '&Procurar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = bbtnProcurarClick
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
          end
          object edParticipante: TEdit
            Left = 24
            Top = 136
            Width = 305
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 607
    inherited tb97Fundo: TToolbar97
      Left = 403
      DockPos = 475
      inherited sep1: TToolbarSep97
        Left = 97
      end
      inherited sep3: TToolbarSep97
        Left = 197
      end
      inherited bbtnSair: TBitBtn
        Width = 97
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 100
        Width = 97
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
      DockPos = 174
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 197
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
        Width = 97
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object bbtnCompara: TBitBtn
        Left = 200
        Top = 0
        Width = 97
        Height = 33
        Hint = 'Compara Saldo Atual com Histórico'
        Cancel = True
        Caption = 'C&omparar'
        ModalResult = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnComparaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000003
          33333333777777733333333330CCC03333333333F7777733F3333330330C0330
          33333337337773373333333333303333333333F33337333333F3303333333333
          3033373333333333373333333333333333333F3333333333333F033333333333
          3303733333333333337333333333333333333F3333333333333F033333333333
          3303733333333333FF7333333333333000333FFFFF33333777FF000003333307
          B70377777F333377777F09990333330BBB0377777F333377777F099903333307
          B70377777F3333777773099903333330003377777F3333377733000003333330
          3333777773F3F3F7333333333030303333333333373737333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 857
    Top = 15
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHistReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HSM.IDPESSOA,'
      '       RXP.INDICEREAJUSTE,'
      '       SUM(SALDOCOTAS)      AS COTAS,'
      '       SUM(SALDOREAL)       AS RESERVAPOUP,'
      
        '       TO_CHAR(HSM.DATAALIMENTACAO,'#39'DD/MM/YY'#39') AS DATAALIMENTACA' +
        'O'
      'FROM   HISTMOVRESERVA HSM, PESSOAFISICA PF, RESERVAXPLANO RXP'
      'WHERE  HSM.IDPESSJUR    = :IDPESSJUR'
      'AND    HSM.IDPLANOPREV  = :IDPLANOPREV'
      'AND    HSM.IDPESSOA     = :IDPESSOA'
      'AND    HSM.SEQPROPOSTA  = :SEQPROPOSTA'
      'AND    MESREFERENCIA    = :MESREFERENCIA'
      'AND   (PF.IDPESSOA       = HSM.IDPESSOA)'
      'AND   (RXP.IDPLANOPREV = HSM.IDPLANOPREV)'
      'AND   (RXP.IDTIPORESERVA = HSM.IDTIPORESERVA)'
      'GROUP BY HSM.IDPESSOA, RXP.INDICEREAJUSTE,  HSM.DATAALIMENTACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 306
    Top = 390
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'TXT'
    FileName = 'ExtPoup.TXT'
    Filter = 'Arquivo Texto (*.TXT)|*.TXT'
    Left = 489
    Top = 52
  end
  object qryDadosParticip1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME AS NOMEFUNC,   P.IDPESSOA,          ENDP.LOGRADOUR' +
        'O,'
      '       ENDP.NUMERO,          ENDP.COMPLEMENTO,    ENDP.BAIRRO,'
      
        '       ENDP.CEP,             CID.NOME AS CIDADE,  EST.CODESTADO ' +
        'AS UF,'
      
        '       EL.MATRICULA,         TO_CHAR(EL.DATAADMISSAO,'#39'DD/MM/YY'#39')' +
        ' DATAADMISSAO,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       TO_CHAR(PF.DATANASC,'#39'DD/MM/YY'#39') DATANASC,'
      '       PP.INSCRICAONUMERO,'
      '       TO_CHAR(PP.INSCRICAODATA,'#39'DD/MM/YY'#39') INSCRICAODATA,'
      '       PP.INSCRICAOTIPO,'
      '       LOT.NOME AS LOTACAO'
      'FROM   PESSOA P,'
      '       ELEGPATRO EL,'
      '       PESSOAFISICA PF,'
      '       PESSOA LOT,'
      '        PARTPREVPLAN PP,'
      '        ENDPESS ENDP,'
      '        ESTADO EST,'
      '        CIDADES CID'
      ''
      'WHERE  (P.IDPESSOA         = :IDPESSOA)'
      'AND    (PF.IDPESSOA        = P.IDPESSOA)'
      'AND    (ENDP.IDENDERECO    = P.IDENDRESIDENCIAL)'
      'AND    (ENDP.IDPESSOA      = PF.IDPESSOA)'
      'AND    (CID.IDCIDADES      = ENDP.IDCIDADES)'
      'AND    (EST.IDESTADO       = CID.IDESTADO)'
      'AND    (EL.IDPESSOA        = P.IDPESSOA)'
      'AND    (LOT.IDPESSOA       = EL.IDESTAB)'
      'AND    (PP.IDPESSOA        = PF.IDPESSOA)'
      'AND    (PP.IDPESSJUR       = EL.IDPESSJUR)'
      '')
    ValidateWithMask = True
    Left = 489
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '3010'
      end>
  end
  object qryExtratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.SEQPROPOSTA, HSM.IDPESSOA,'
      '  MAX(HSM.MESREFERENCIA) AS MAIORMES,'
      '  MIN(HSM.MESREFERENCIA) AS MENORMES'
      'FROM'
      '  RESERVAXPLANO R, HISTMOVRESERVA HSM'
      'WHERE'
      
        '  (HSM.MESREFERENCIA >= :MESREFATU AND HSM.MESREFERENCIA <= :MES' +
        'REFFUT)'
      '  AND   (HSM.IDPLANOPREV   = R.IDPLANOPREV)'
      '  AND   (HSM.IDTIPORESERVA = R.IDTIPORESERVA)'
      '  AND   (R.FLGCOLETIVA     = 0)'
      '  AND   (R.FLGCONTROLE     = 0)'
      'GROUP BY'
      '  HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.SEQPROPOSTA, HSM.IDPESSOA'
      'ORDER BY'
      '  HSM.IDPESSOA '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 390
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFATU'
        ParamType = ptUnknown
        Value = '1999/10'
      end
      item
        DataType = ftString
        Name = 'MESREFFUT'
        ParamType = ptUnknown
        Value = '1999/12'
      end>
  end
  object qryCotMoed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COT.COTVALOR'
      'FROM   COTACAOMOEDA COT'
      'WHERE  (COT.COTMESREF = :MESREFCOT)'
      'AND    (MOECODIGO = :INDIC)'
      'AND    (COTDATA = :DTCOT)')
    ValidateWithMask = True
    Left = 23
    Top = 390
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFCOT'
        ParamType = ptUnknown
        Value = '111999'
      end
      item
        DataType = ftString
        Name = 'INDIC'
        ParamType = ptUnknown
        Value = '82'
      end
      item
        DataType = ftString
        Name = 'DTCOT'
        ParamType = ptUnknown
        Value = '24/11/1999'
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (COUNT(DISTINCT HSM.IDPESSOA)) AS TOT'
      'FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM'
      
        'WHERE (HSM.MESREFERENCIA >= :MESREFATU AND HSM.MESREFERENCIA <= ' +
        ':MESREFFUT)'
      'AND   (HSM.IDPLANOPREV   = R.IDPLANOPREV)'
      'AND   (HSM.IDTIPORESERVA = R.IDTIPORESERVA)'
      'AND   (R.FLGCOLETIVA     = 0)'
      'AND   (R.FLGCONTROLE     = 0)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 165
    Top = 390
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFATU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFFUT'
        ParamType = ptUnknown
      end>
  end
  object qryPlanos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS FLGCONSIDERA, PL.NOME, PL.IDPLANOPREV'
      'FROM    PLANPREV PL'
      
        'WHERE   PL.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVP' +
        'ATRO PLP, PATRO P'
      '                           WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                           AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER BY PL.NOME'
      ' ')
    UpdateObject = updPlanos
    ControlType.Strings = (
      'FLGCONSIDERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 489
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object updPlanos: TUpdateSQL
    Left = 489
    Top = 143
  end
  object dsPlanos: TwwDataSource
    DataSet = qryPlanos
    Left = 488
    Top = 179
  end
  object qryHistMovParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HSM.IDPESSJUR,'
      '       HSM.IDPLANOPREV,'
      '       HSM.IDPESSOA,'
      '       HSM.SEQPROPOSTA,'
      '       PAT.NOME AS PATROCINADORA,'
      '       P.NOME   AS PARTICIPANTE,'
      '       EL.MATRICULA,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       PL.NOME AS TIPOPLANO,'
      '       P.IDENDCORRESP,'
      '       R.CODHIERARQUIA,'
      '       R.NOME,'
      '       R.INDICEREAJUSTE,'
      '       COT.COTVALOR VALORINDICE,'
      '       R.FLGTITULARCOLET,'
      '       HSM.MESREFERENCIA,'
      '       R.IDTIPORESERVA,'
      
        '       SUBSTR(HSM.MESREFERENCIA,6,2)||'#39'/'#39'||SUBSTR(HSM.MESREFEREN' +
        'CIA,1,4) AS MESANO,'
      
        '       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRREAL, -HSM.VLRREAL))' +
        ' AS VALORREAL,'
      
        '       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS' +
        ')) AS VALORCOTAS'
      'FROM   PESSOA PAT, PESSOA P, PLANPREV PL, ELEGPATRO EL,'
      '       RESERVAXPLANO R, HISTMOVRESERVA HSM, COTACAOMOEDA COT'
      'WHERE (HSM.MESREFERENCIA >= :MESREFATU'
      'AND    HSM.MESREFERENCIA <= :MESREFULT )'
      'AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)'
      
        'AND   (TO_CHAR(COT.COTDATA,'#39'YYYY/MM'#39') = TO_CHAR(HSM.DATAALIMENTA' +
        'CAO,'#39'YYYY/MM'#39')   )'
      'AND   (PL.IDPLANOPREV  = HSM.IDPLANOPREV )'
      'AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)'
      'AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)'
      'AND   (R.FLGCOLETIVA     = 0)'
      'AND   (R.FLGCONTROLE     = 0)'
      'AND   (R.FLGTRANSFERENCIA = 0)'
      'AND   (PAT.IDPESSOA      = HSM.IDPESSJUR)'
      'AND   (EL.IDPESSJUR      = HSM.IDPESSJUR)'
      'AND   (EL.IDPESSOA       = HSM.IDPESSOA)'
      'AND   (P.IDPESSOA        = HSM.IDPESSOA)'
      
        'GROUP BY HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.IDPESSOA,       HSM' +
        '.SEQPROPOSTA,'
      '       PAT.NOME,'
      '       P.NOME,             EL.MATRICULA,    P.NUMDOCUMENTO,'
      '       P.IDENDCORRESP,'
      '       PL.NOME,            R.CODHIERARQUIA, R.NOME,'
      '       R.INDICEREAJUSTE,   COT.COTVALOR, R.FLGTITULARCOLET,'
      '       HSM.MESREFERENCIA, R.IDTIPORESERVA'
      
        'ORDER BY EL.MATRICULA, R.FLGTITULARCOLET DESC, HSM.MESREFERENCIA' +
        ' ASC, R.NOME DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 70
    Top = 334
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFATU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFULT'
        ParamType = ptUnknown
      end>
  end
  object qryContaTransferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'ROUND(SUM(RP.VALORRESERVA * COT.COTVALOR),2) VALORREAL,'
      #9'ROUND(SUM(RP.VALORRESERVA),2) VALORRESERVA, '
      #9'RE.FLGTITULARCOLET, COT.MOECODIGO AS INDICEREAJUSTE'
      'FROM RESERVAPART RP, RESERVAXPLANO RE, COTACAOMOEDA COT'
      'WHERE RP.IDPESSOA         = :IDPESSOA'
      'AND   RP.IDPLANOPREV      = :IDPLANOPREV'
      'AND   RP.IDTIPORESERVA    = RE.IDTIPORESERVA'
      'AND   RP.IDPLANOPREV      = RE.IDPLANOPREV'
      'AND   RE.FLGTRANSFERENCIA = 1'
      'AND   COT.MOECODIGO       = RE.INDICEREAJUSTE'
      'AND   COT.COTMESREF       = :COTMESREF'
      'AND   RP.VALORRESERVA     > 0  '
      'GROUP BY RE.FLGTITULARCOLET, COT.MOECODIGO'
      'ORDER BY RE.FLGTITULARCOLET DESC'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 117
    Top = 391
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COTMESREF'
        ParamType = ptUnknown
      end>
  end
  object qryEndPess: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.LOGRADOURO, E.NUMERO,  E.COMPLEMENTO, E.BAIRRO,'
      '        C.NOME AS CIDADE, ES.CODESTADO, E.CEP'
      'FROM   ENDPESS E, CIDADES C, ESTADO ES'
      'WHERE  E.IDENDERECO = :IDENDERECO'
      'AND    C.IDCIDADES(+) = E.IDCIDADES'
      'AND    C.IDESTADO = ES.IDESTADO(+)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 259
    Top = 391
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end>
  end
  object qryDadosParticip2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME AS NOMEFUNC,   P.IDPESSOA,          ENDP.LOGRADOUR' +
        'O,'
      '       ENDP.NUMERO,          ENDP.COMPLEMENTO,    ENDP.BAIRRO,'
      
        '       ENDP.CEP,             CID.NOME AS CIDADE,  EST.CODESTADO ' +
        'AS UF,'
      
        '       EL.MATRICULA,         TO_CHAR(EL.DATAADMISSAO,'#39'DD/MM/YY'#39')' +
        '  DATAADMISSAO,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       TO_CHAR(PF.DATANASC,'#39'DD/MM/YY'#39')  DATANASC,'
      '       PP.INSCRICAONUMERO,'
      '       TO_CHAR(PP.INSCRICAODATA,'#39'DD/MM/YY'#39')  INSCRICAODATA,'
      '       PP.INSCRICAOTIPO,'
      '       LOT.NOME AS LOTACAO'
      'FROM'
      '        PESSOA P,'
      '        ELEGPATRO EL,'
      #9'PESSOAFISICA PF,'
      #9'PESSOA LOT,'
      '        PARTPREVPLAN PP,'
      '        ENDPESS ENDP,'
      '        ESTADO EST,'
      '        CIDADES CID'
      ''
      'WHERE  (P.IDPESSOA         = :IDPESSOA)'
      'AND    (PF.IDPESSOA        = P.IDPESSOA)'
      'AND    (ENDP.IDENDERECO    = P.IDENDRESIDENCIAL)'
      'AND    (ENDP.IDPESSOA      = PF.IDPESSOA)'
      'AND    (CID.IDCIDADES      = ENDP.IDCIDADES)'
      'AND    (EST.IDESTADO       = CID.IDESTADO)'
      'AND    (EL.IDPESSOA        = P.IDPESSOA)'
      'AND    (LOT.IDPESSOA       = EL.IDESTAB)'
      'AND    (PP.IDPESSOA        = PF.IDPESSOA)'
      'AND    (PP.IDPESSJUR       = EL.IDPESSJUR)'
      '')
    ValidateWithMask = True
    Left = 489
    Top = 279
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '3010'
      end>
  end
  object qryHistContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HSM.IDPESSOA, R.CODHIERARQUIA, R.NOME, R.INDICEREAJUSTE,'
      '       HSM.MESREFERENCIA AS MESANO,'
      '       HSM.MESREFERENCIA,'
      '       HSM.VALORINDICE,'
      '       HSM.MESREFERENCIA AS MESANO1,'
      
        '       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRREAL, -HSM.VLRREAL))' +
        ' AS VALCONTRIB,'
      
        '       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS' +
        ')) AS COTASCREDIT'
      'FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM'
      'WHERE (HSM.IDPESSJUR     = :IDPESSJUR)'
      'AND   (HSM.IDPLANOPREV   = :IDPLANOPREV)'
      'AND   (HSM.IDPESSOA      = :IDPESSOA)'
      'AND   (HSM.SEQPROPOSTA   = :SEQPROPOSTA)'
      
        'AND   (HSM.MESREFERENCIA >= :MESREFATU AND HSM.MESREFERENCIA <= ' +
        ':MESREFFUT)'
      'AND   (HSM.IDPESSOA      = :IDPESSOA)'
      'AND   (HSM.IDPLANOPREV   = R.IDPLANOPREV)'
      'AND   (HSM.IDTIPORESERVA = R.IDTIPORESERVA)'
      'AND   (R.FLGCOLETIVA     = 0)'
      'AND   (R.FLGCONTROLE     = 0)'
      
        'GROUP BY HSM.IDPESSOA, R.CODHIERARQUIA, R.NOME, R.INDICEREAJUSTE' +
        ', HSM.VALORINDICE,'
      '         HSM.MESREFERENCIA'
      'ORDER BY HSM.MESREFERENCIA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 212
    Top = 390
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFATU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFFUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object MSDataView: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Consulta'
    Colunas.Strings = (
      'NAME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'IDDATAVIEW'
      'NAME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 495
    Top = 341
  end
  object qrySaldoAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VLR.VALORREAL) VALORREAL,'
      #9' SUM(VLR.VALORCOTAS) VALORCOTAS,'
      #9' SUM(VLR.COTVALOR) VALORINDICE'
      'FROM'
      '  (SELECT 0.0 COTVALOR,'
      
        '         SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOT' +
        'AS) * COT.COTVALOR) AS VALORREAL,'
      
        '         SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOT' +
        'AS)) AS VALORCOTAS'
      '  FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM, COTACAOMOEDA COT'
      '  WHERE HSM.MESREFERENCIA <= '#39'2000/13'#39
      '  AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)'
      
        '  AND   (TO_CHAR(COT.COTDATA,'#39'YYYY/MM'#39') = TO_CHAR(HSM.DATAALIMEN' +
        'TACAO,'#39'YYYY/MM'#39')   )'
      '  AND   HSM.IDPESSOA = :IDPESSOA'
      '  AND   (HSM.IDPLANOPREV    = 3)'
      '  AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)'
      '  AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)'
      '  AND   (R.FLGCOLETIVA     = 0)'
      '  AND   (R.FLGCONTROLE     = 0)'
      '  AND   (R.FLGTRANSFERENCIA = 0)'
      '  AND   (R.FLGTITULARCOLET  = :FLGTITULAR)'
      ''
      '  UNION'
      ''
      '  SELECT COT.COTVALOR, 0 VALORREAL, 0 VALORCOTAS'
      '  FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM, COTACAOMOEDA COT'
      '  WHERE HSM.MESREFERENCIA = '#39'2000/13'#39
      '  AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)'
      
        '  AND   (TO_CHAR(COT.COTDATA,'#39'YYYY/MM'#39') = TO_CHAR(HSM.DATAALIMEN' +
        'TACAO,'#39'YYYY/MM'#39')   )'
      '  AND   HSM.IDPESSOA = :IDPESSOA'
      '  AND   (HSM.IDPLANOPREV    = 3)'
      '  AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)'
      '  AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)'
      '  AND   (R.FLGCOLETIVA     = 0)'
      '  AND   (R.FLGCONTROLE     = 0)'
      '  AND   (R.FLGTRANSFERENCIA = 0)'
      '  AND   (R.FLGTITULARCOLET  = :FLGTITULAR)) VLR'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGTITULAR'
        ParamType = ptUnknown
      end>
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 199
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'PP.INSCRICAONUMERO'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome do Participante'
      'Cpf'
      'Inscrição No.'
      'Plano Atual')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARTPREVPLAN PP'
      'PESSOA P'
      'ELEGPATRO EL'
      'PLANPREV PL')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'P.NOME'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PP.IDPLANOPREV')
    Filtro.Strings = (
      'P.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PL.IDPLANOPREV = PP.IDPLANOPREV'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '40'
      '12'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 157
    Top = 162
  end
  object qrySaldoAnterior2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(H.MESREFERENCIA) AS MESREFERENCIA,'
      
        '       SUM(DECODE(H.FLGENTRADA,1,H.VLRCOTAS,-H.VLRCOTAS)) AS SAL' +
        'DOCOTAS,'
      
        '        ROUND(SUM(DECODE(H.FLGENTRADA,1,H.VLRCOTAS,-H.VLRCOTAS))' +
        '*'
      '                MAX(HVI.VALORINDICE),2) AS SALDOREAL,'
      '       MAX(HVI.VALORINDICE) AS VALORINDICE'
      'FROM   HISTMOVRESERVA H, RESERVAXPLANO R,'
      '(SELECT DISTINCT H2.IDTIPORESERVA, H2.VALORINDICE'
      ' FROM HISTMOVRESERVA H2'
      ' WHERE H2.IDPESSOA      = :IDPESSOA'
      '   AND H2.SEQPROPOSTA   = :SEQPROPOSTA'
      '   AND H2.IDPESSJUR     = :IDPESSJUR'
      '   AND H2.IDPLANOPREV   = :IDPLANOPREV'
      '   AND H2.MESREFERENCIA = (SELECT MAX(H1.MESREFERENCIA)'
      '                           FROM HISTMOVRESERVA H1'
      '                           WHERE H1.IDPESSOA      = :IDPESSOA'
      '                             AND H1.SEQPROPOSTA   = :SEQPROPOSTA'
      '                             AND H1.IDPESSJUR     = :IDPESSJUR'
      '                             AND H1.IDPLANOPREV   = :IDPLANOPREV'
      '                             AND H1.MESREFERENCIA < :ANOMESINI'
      
        '                             AND H1.IDTIPORESERVA = H2.IDTIPORES' +
        'ERVA)) HVI'
      'WHERE  H.IDPESSOA         = :IDPESSOA'
      'AND    H.SEQPROPOSTA      = :SEQPROPOSTA'
      'AND    H.IDPESSJUR        = :IDPESSJUR'
      'AND    H.IDPLANOPREV      = :IDPLANOPREV'
      'AND    H.MESREFERENCIA    < :ANOMESINI'
      'AND    R.IDPLANOPREV      = H.IDPLANOPREV'
      'AND    R.IDTIPORESERVA    = H.IDTIPORESERVA'
      'AND    R.FLGCOLETIVA      = 0'
      'AND    R.FLGCONTROLE      = 0'
      'AND    R.FLGTRANSFERENCIA = 0'
      'AND    R.FLGTITULARCOLET  = :FLGTITULAR'
      'AND    HVI.IDTIPORESERVA  = H.IDTIPORESERVA'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QrySituacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS FLGCONSIDERA, SP.IDSITPART, SP.DESCRICAO, SP.FLGINTERNO'
      'FROM'
      '  CM.SITPART SP'
      'ORDER BY'
      '  SP.DESCRICAO'
      ' '
      ' '
      ' ')
    UpdateObject = UpdSituacao
    ControlType.Strings = (
      'FLGCONSIDERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 353
    Top = 234
  end
  object DsSituacao: TwwDataSource
    DataSet = QrySituacao
    Left = 383
    Top = 234
  end
  object UpdSituacao: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.SITPART'
      'set'
      '  FLGCONSIDERA = :FLGCONSIDERA,'
      '  IDSITPART = :IDSITPART,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  FLGCONSIDERA = :OLD_FLGCONSIDERA and'
      '  IDSITPART = :OLD_IDSITPART and'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'insert into CM.SITPART'
      '  (FLGCONSIDERA, IDSITPART, DESCRICAO)'
      'values'
      '  (:FLGCONSIDERA, :IDSITPART, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CM.SITPART'
      'where'
      '  FLGCONSIDERA = :OLD_FLGCONSIDERA and'
      '  IDSITPART = :OLD_IDSITPART and'
      '  DESCRICAO = :OLD_DESCRICAO')
    Left = 413
    Top = 234
  end
end
