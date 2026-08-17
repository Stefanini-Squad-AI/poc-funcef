inherited frmAgrupaDocumentosMT: TfrmAgrupaDocumentosMT
  Left = 73
  Top = 113
  HelpContext = 640002
  Caption = 'Agrupa Documentos'
  ClientHeight = 436
  ClientWidth = 738
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 397
    inherited PagControle: TPageControl
      Width = 736
      Height = 395
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 728
          Caption = 'Agrupa Documentos [ Seleção ]'
        end
        object Label22: TLabel
          Left = 176
          Top = 202
          Width = 111
          Height = 13
          Caption = 'Forma de Cobrança'
        end
        inline molContrato: TmolContrato
          Left = 168
          Top = 93
        end
        inline MolResponsavel: TmolResponsavel
          Left = 168
          Top = 40
          Width = 385
          TabOrder = 1
          inherited btnAbrePessoa: TBitBtn
            Left = 256
            Visible = False
          end
        end
        object DBcboPortadorForma: TwwDBLookupCombo
          Left = 176
          Top = 216
          Width = 370
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          LookupTable = cdsPortadorForma
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        inline molLocatario: TmolLocatario
          Left = 168
          Top = 148
          TabOrder = 3
          inherited btnAbrePessoa: TBitBtn
            Left = 232
            Visible = False
          end
        end
        object gbDatas: TGroupBox
          Left = 176
          Top = 256
          Width = 369
          Height = 70
          Caption = ' Data Programada '
          TabOrder = 4
          object Label5: TLabel
            Left = 32
            Top = 20
            Width = 35
            Height = 13
            Caption = 'Inicial'
          end
          object Label1: TLabel
            Left = 160
            Top = 20
            Width = 28
            Height = 13
            Caption = 'Final'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 32
            Top = 36
            Width = 105
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
          object edtDataFim: TCMDateTimePicker
            Left = 160
            Top = 36
            Width = 105
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
          end
        end
        object chkEmisBloq: TCheckBox
          Left = 176
          Top = 336
          Width = 305
          Height = 17
          Caption = 'Considera documentos com boleto emitido'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object chkAgrupaReceita: TCheckBox
          Left = 176
          Top = 360
          Width = 214
          Height = 17
          Caption = 'Discrimina receitas agrupadas em '
          TabOrder = 6
        end
        object cboMes: TComboBox
          Left = 392
          Top = 358
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
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
        object spnAno: TSpinEdit
          Left = 541
          Top = 357
          Width = 62
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 8
          Value = 0
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 357
          Caption = 'Agrupa Documentos [ Mensagens ]'
        end
        object Label2: TLabel
          Left = 83
          Top = 289
          Width = 523
          Height = 13
          Caption = 
            'Para o modelo discriminado, as linhas iniciais serão substituida' +
            's pela descrição das receitas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = bbtnSairClick
        end
        object grbMsgBoleto: TGroupBox
          Left = 10
          Top = 64
          Width = 705
          Height = 213
          Caption = ' Mensagem do Boleto '
          TabOrder = 0
          object Label32: TLabel
            Left = 16
            Top = 20
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label33: TLabel
            Left = 16
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label34: TLabel
            Left = 16
            Top = 62
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label35: TLabel
            Left = 16
            Top = 83
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label36: TLabel
            Left = 16
            Top = 104
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label37: TLabel
            Left = 16
            Top = 125
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label38: TLabel
            Left = 16
            Top = 146
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label39: TLabel
            Left = 16
            Top = 167
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label40: TLabel
            Left = 16
            Top = 188
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object edtln1: TEdit
            Left = 72
            Top = 16
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
          object edtln2: TEdit
            Left = 72
            Top = 37
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 1
            Text = 'Não receber após vencimento'
          end
          object edtln4: TEdit
            Left = 72
            Top = 79
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 3
          end
          object edtln5: TEdit
            Left = 72
            Top = 100
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtln6: TEdit
            Left = 72
            Top = 121
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtln7: TEdit
            Left = 72
            Top = 142
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtln3: TEdit
            Left = 72
            Top = 58
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtln8: TEdit
            Left = 72
            Top = 163
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtln9: TEdit
            Left = 72
            Top = 184
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
        end
        object cbMsgContrato: TCheckBox
          Left = 8
          Top = 32
          Width = 353
          Height = 17
          Caption = 'Utilizar Mensagem de boleto padrão definida no contrato'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbMsgContratoClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object Panel5: TPanel
          Left = 0
          Top = 39
          Width = 728
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Documentos a Agrupar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 728
          Height = 39
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object fcLabel2: TfcLabel
            Left = 0
            Top = 0
            Width = 512
            Height = 24
            Align = alTop
            Caption = 'Agrupa Documentos [ Documentos Selecionados ]'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 66
          Width = 728
          Height = 319
          ControlType.Strings = (
            'FLGAGRUPAR;CheckBox;1;0')
          Selected.Strings = (
            'FLGAGRUPAR'#9'9'#9'Agrupar'#9'F'
            'CONTRATO_EXTENSO'#9'55'#9'Contrato'#9'F'
            'DESCCUSTORECIMO'#9'43'#9'Receita '#9'F'
            'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'F'
            'VALOR_LANC'#9'13'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDocumentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 323
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 411
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsDocumentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 453
    Top = 327
  end
  object sqlDocumentos: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+index(D,XIE5DOCUMENTO) */ DISTINCT'
      ''
      '    C.IDLOCATARIO,'
      ''
      '    L.IDCONTRATOIMOVEL,'
      ''
      '    D.CODDOCUMENTO,'
      ''
      '    D.CODPORTFORMA,'
      ''
      '    C.CONNUMERO, '
      ''
      '    C.CONNOME, '
      ''
      '    D.DATAPROGRAMADA AS DATAVENCIMENTO, '
      ''
      
        '    DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'#39' - '#39'||C.C' +
        'ONNOME) AS CONTRATO_EXTENSO, '
      ''
      '    T.DESCCUSTORECIMO, '
      ''
      '    LD.VALOR AS VALOR_LANC, '
      ''
      '    1 AS FLGAGRUPAR '
      ''
      'FROM '
      ''
      '    DOCUMENTO D, '
      ''
      '    LANCAMENTOSIMOVEL L, '
      ''
      '    CONTRATOIMOVEL C, '
      ''
      '    TIPOCUSTORECIMOV T, '
      ''
      '    ( '
      ''
      '     SELECT '
      ''
      '         L.CODDOCUMENTO, '
      ''
      '         SUM(DECODE(DEBCRE,'#39'C'#39',VALOR*-1,VALOR)) AS VALOR '
      ''
      '     FROM '
      ''
      '         DOCUMENTO D, '
      ''
      '         LANCTODOCUM L '
      ''
      '     WHERE '
      ''
      '         L.CODDOCUMENTO    = D.CODDOCUMENTO '
      ''
      '     AND NVL(D.STATUS,'#39'0'#39') <> '#39'2'#39' '
      ''
      '     AND D.IDMODULO        = 64 '
      ''
      
        '     AND D.DATAPROGRAMADA  BETWEEN TO_DATE('#39'01/01/2005'#39','#39'dd/mm/y' +
        'yyy'#39') AND TO_DATE('#39'31/12/2005'#39','#39'dd/mm/yyyy'#39')'
      ''
      '     GROUP BY L.CODDOCUMENTO '
      ''
      '    ) LD '
      ''
      'WHERE '
      ''
      
        '    D.DATAPROGRAMADA  BETWEEN TO_DATE('#39'01/01/2005'#39','#39'dd/mm/yyyy'#39')' +
        ' AND TO_DATE('#39'31/12/2005'#39','#39'dd/mm/yyyy'#39')'
      ''
      'AND D.CODPORTFORMA      = 60'
      ''
      'AND NVL(D.STATUS,'#39'0'#39')   <> '#39'2'#39' '
      ''
      'AND D.IDMODULO          = 64 '
      ''
      'AND L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO '
      ''
      'AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+) '
      ''
      'AND L.CODDOCUMENTO      = D.CODDOCUMENTO '
      ''
      'AND LD.CODDOCUMENTO     = D.CODDOCUMENTO'
      ''
      'order by contrato_extenso')
    ClientDataSet = cdsDocumentos
    Left = 381
    Top = 319
  end
  object cdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 621
    Top = 223
  end
  object sqlPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PORTADORFORMA'
      'WHERE NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39)
    ClientDataSet = cdsPortadorForma
    Left = 621
    Top = 319
  end
  object cdsMensagens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 541
    Top = 7
  end
  object dsDocumentos: TDataSource
    DataSet = cdsDocumentos
    Left = 165
    Top = 399
  end
  object dsPortadorForma: TDataSource
    DataSet = cdsPortadorForma
    Left = 533
    Top = 327
  end
end
