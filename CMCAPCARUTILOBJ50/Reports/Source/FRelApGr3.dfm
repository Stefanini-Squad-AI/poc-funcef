inherited FrmRelApGr3: TFrmRelApGr3
  Left = 343
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Autorização de Pagamento'
  ClientHeight = 234
  ClientWidth = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 195
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 419
      Height = 193
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Selecionar um único Documento'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 411
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 3
            Top = 20
            Width = 197
            Height = 13
            Caption = 'Dados do Documento Selecionado'
          end
          object bbtnSeleciona: TBitBtn
            Left = 295
            Top = 4
            Width = 97
            Height = 31
            Hint = 'Selecionar &Documento'
            Caption = 'Procurar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnSelecionaClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777777777777700000007777
              7777777777777000000077777777777777777000000070000000007777777000
              000070FFFFF0207777777000000070F77702200000077000000070FFF0222222
              22077000000070F88702200000077000000070FFFFF0207777777000000070F8
              8777007777777000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
          end
        end
        object MemDocs: TMemo
          Left = 0
          Top = 40
          Width = 411
          Height = 125
          Align = alClient
          BorderStyle = bsNone
          Color = clSilver
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Selecionar mais de um documento'
        object lblCentroRespon: TLabel
          Left = 19
          Top = 10
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label1: TLabel
          Left = 19
          Top = 66
          Width = 115
          Height = 13
          Caption = 'Data do lançamento'
        end
        object dblcCentroRespon: TwwDBLookupCombo
          Left = 19
          Top = 26
          Width = 360
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'ANALITICOSINTET'#9'1'#9'T'
            'CODCENTRORESPON'#9'10'#9'Código')
          LookupTable = CdsCentroRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object DateEdit1: TCMDateTimePicker
          Left = 19
          Top = 82
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
          TabOrder = 1
        end
        object RadioGroup1: TRadioGroup
          Left = 170
          Top = 56
          Width = 209
          Height = 71
          Caption = 'Emissão da AP'
          ItemIndex = 1
          Items.Strings = (
            'AP emitida'
            'AP não emitida'
            'Todas')
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 195
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 248
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
        Kind = bkOK
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 979
    Top = 65534
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 248
    Top = 144
  end
  object msDoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAEMISSAO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'LANCTODOCUM.VALOR'
      'PORTADORFORMA.DESCRICAO'
      'LANCTODOCUM.DATALANCTO'
      'LANCTODOCUM.HISTORICOCOMPL'
      'PESSOA .RAZAOSOCIAL'
      'DOCUMENTO.NUMAPGR'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'D'
      'N'
      'C'
      'D'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Documento'
      'Compl'
      'Emissao'
      'Vencimento'
      'Programada'
      'Valor'
      'Portador x Forma'
      'Data Lançamento'
      'Histórico'
      'Fornecedor'
      'Nº Autorização'
      'Módulo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA '
      'DOCUMENTO '
      'LANCTODOCUM '
      'PORTADORFORMA '
      'MODULO'
      'TIPODOCRECPAG')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'DOCUMENTO.OPERACAO'
      'DOCUMENTO.DATAEMISSAO'
      'LANCTODOCUM.VALOR'
      'DOCUMENTO.NODOCUMENTO'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO .NUMAPGR'
      'DOCUMENTO .NODOCUMENTO'
      'MODULO.IDMODULO')
    Filtro.Strings = (
      'DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA'
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO'
      'DOCUMENTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA(+)'
      'DOCUMENTO.OPERACAO IN (2,3,10,11,13,14,15,16,17)'
      'LANCTODOCUM.ESTORNO IS NULL'
      'DOCUMENTO.IDMODULO = MODULO.IDMODULO'
      'DOCUMENTO.CODTIPDOC = TIPODOCRECPAG.CODTIPDOC'
      
        'TIPODOCRECPAG.FLGIMPRIMEAP IS NULL OR TIPODOCRECPAG.FLGIMPRIMEAP' +
        ' = '#39'S'#39)
    Mascaras.Strings = (
      '#0'
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      '#,##0.00'
      ''
      'DD/MM/YYYY'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '10'
      '10'
      '18'
      '10'
      '10'
      '50'
      '10'
      '60'
      '60'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 367
    Top = 150
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      LT.OPERACAO,'
      '      LT.NUMFATURA,'
      '      LT.CODDOCUMENTO,'
      '      LT.NUMAPGR,'
      '      LT.REFERENCIA,'
      '      LT.NODOCUMENTO,'
      '      LT.COMPLDOCUMENTO,'
      '      LT.DATAVENCTO,'
      '      LT.DATAEMISSAO,'
      '      LT.DATAPROGRAMADA,'
      '      LT.NUMDOCUMENTO,'
      '      LT.VALOR,'
      '      LT.VALOROUTRAMOEDA,'
      '      LT.RAZAOSOCIAL,'
      '      LT.DESCRICAO,'
      ''
      '      LT.PLAREDUZ,'
      '      LT.PLACONTA,'
      '      LT.VALORCONTAB,'
      '      LT.LACDEBCRE,'
      '      LT.HISTORICO,'
      ''
      '      LT.OBS,'
      '      LT.FLGDOCBANCARIO,'
      '      LT.VLACRE,'
      '      LT.VLDEC,'
      '      LT.VLIMP,'
      '      LT.VLLIQ,'
      '      LT.TRGUSERINCLUSAO,'
      '      LT.TRGDTINCLUSAO,'
      '      LT.IDFORCLI,'
      '      LT.TIPODOC,'
      '      SALDO.VALSALDO'
      'FROM'
      '  (SELECT'
      
        '     SUM(DECODE(DEBCRE,'#39'C'#39',VALOR,VALOR * -1)) AS VALSALDO, CODDO' +
        'CUMENTO'
      '   FROM'
      '    LANCTODOCUM'
      '   WHERE CODDOCUMENTO = :pCODDOCUMENTO'
      '   GROUP BY CODDOCUMENTO) SALDO,'
      '  ('
      '    SELECT'
      '      L.OPERACAO,'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      L.VALOR,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      PNC.PLAREDUZ,'
      '      LT.PLACONTA,'
      '      LT.LACVALOR AS VALORCONTAB,'
      '      LT.LACDEBCRE,'
      
        '      (LT.LACHIST1 || '#39' '#39' || LT.LACHIST2 || '#39' '#39' || LT.LACHIST3 |' +
        '| '#39' '#39' || LT.LACHIST4 || '#39' '#39' ||'
      'LT.LACHIST5) AS HISTORICO,'
      ''
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      D.IDFORCLI,'
      '      TD.DESCRICAO AS TIPODOC'
      '    FROM'
      '      PESSOA P,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      FORMARECPAG F,'
      '      TIPODOCRECPAG TD,'
      '      PORTADORFORMA PF,'
      '      LANCAMENTO LT,'
      '      PLANOCONTA PNC'
      '    WHERE'
      '-- #ADF1'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '      (L.PLNCODIGO = LT.PLNCODIGO(+)) AND'
      '      (PNC.PLANO(+) = LT.PLANO) AND'
      '      (PNC.PLACONTA(+) = LT.PLACONTA) AND'
      ''
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      -- (D.OPERACAO = L.OPERACAO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (TD.CODTIPDOC = D.CODTIPDOC)         AND'
      '      (PF.CODPORTFORMA(+) = D.CODPORTFORMA)'
      '    UNION'
      '      SELECT'
      '        Q1.OPERACAO,'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      ''
      '        Q2.PLAREDUZ,'
      '        Q2.PLACONTA,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORCONTAB,'
      '        Q2.LACDEBCRE,'
      '        Q2.HISTORICO,'
      ''
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q1.IDFORCLI,'
      '        Q1.DESCRICAO AS TIPODOC'
      '      FROM'
      '        ('
      '          SELECT'
      '            LAN.OPERACAO,'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            LAN.VALOR,'
      '            LAN.VALOROUTRAMOEDA,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI,'
      '            TD.DESCRICAO AS TIPODOC'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F,'
      '            PORTADORFORMA PF,'
      '            TIPODOCRECPAG TD'
      '          WHERE'
      '-- #ADF2'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI) AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(DOC.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '            (PF.CODPORTFORMA(+) = DOC.CODPORTFORMA)         AND'
      '            (TD.CODTIPDOC = DOC.CODTIPDOC)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            PNC.PLAREDUZ,'
      '            LT.PLACONTA,'
      '            LT.LACVALOR AS VALOR,'
      '            LT.LACDEBCRE,'
      
        '            (LT.LACHIST1 || '#39' '#39' ||  LT.LACHIST2 || '#39' '#39' || LT.LAC' +
        'HIST3 || '#39' '#39' || LT.LACHIST4 || '#39' '#39' || LT.LACHIST5) AS HISTORICO'
      '          FROM'
      '            DOCUMENTO D,'
      '            LANCTODOCUM L,'
      '            LANCAMENTO LT,'
      '            PLANOCONTA PNC'
      '          WHERE'
      '-- #ADF3'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            (D.RECPAG = :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '             -- (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (L.PLNCODIGO = LT.PLNCODIGO(+)) AND'
      '            (PNC.PLANO(+) = LT.PLANO) AND'
      '            (PNC.PLACONTA(+) = LT.PLACONTA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            SUM(LT.LACVALOR) AS VALOR'
      '          FROM'
      '            LANCTODOCUM L,'
      '            DOCUMENTO D,'
      '            LANCAMENTO LT'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (L.PLNCODIGO = LT.PLNCODIGO(+)) AND'
      '            (RTRIM(D.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            -- (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.OPERACAO,'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      ''
      '        Q2.PLAREDUZ,'
      '        Q2.PLACONTA,'
      '        Q2.LACDEBCRE,'
      '        Q2.HISTORICO,'
      ''
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q1.IDFORCLI,'
      '        Q1.DESCRICAO'
      '  ) LT'
      ' '
      '')
    ClientDataSet = CdsAux
    Left = 153
    Top = 77
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 9
    Top = 45
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODEXTERNO AS CODCENTRORESPON,'
      '  NOME,'
      '  ANALITICOSINTET,'
      '  CODCENTROCUSTO'
      'FROM'
      '  CENTRESPON')
    ClientDataSet = CdsCentroRespon
    Left = 153
    Top = 133
  end
  object CdsCentroRespon: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 133
    Data = {
      FF0F00009619E0BD010000001800000004007A000000030000000B010F434F44
      43454E54524F524553504F4E0100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00044E4F4D45010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002001E000F414E414C495449434F53494E54455401004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020001000E434F4443454E54524F435553544F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      0100044C43494404000100090800000000043133303005434F41444501410431
      3330300000043134303005434F4745430141043134303000000431323030054A
      55524944014104313230300000043731303005434F5345470141043731303000
      00043732303005434F494E46014104373230300000043831303005434F415449
      014104383130300000043832303005434F524941014104383230300000043832
      30331E4765722E416EE16C2E436F6E74722E496E766573742E202D2047454143
      4901410438323033000001390544495241440153013400000339393910476162
      696E657465202D20444952414401410334303000400430313033054153434F4D
      014100400430313034054153504C410141004004303130350541534A55520141
      0040043031303605415544494E0141004002303219544F54414C20434F4E534F
      4C494441444F202D204449534547015300400430323031054449534547014100
      40043032303219544F54414C20434F4E534F4C494441444F202D20434F42454E
      015300400630323032303105434F42454E014100400630323032303205474542
      454E01410040043032303319544F54414C20434F4E534F4C494441444F202D20
      434F504152015300400630323033303105434F50415201410040063032303330
      320547454341500141004002303319544F54414C20434F4E534F4C494441444F
      202D204449524144015300400430333031054449524144014100400430333032
      19544F54414C20434F4E534F4C494441444F202D20434F52454F015300400630
      333032303105434F52454F014100400630333032303205474552454801410040
      043033303319544F54414C20434F4E534F4C494441444F202D20434F52494C01
      5300400630333033303105434F52494C0141004006303330333032054745494E
      460141004002303419544F54414C20434F4E534F4C494441444F202D20444941
      464901530040043034303105444946494E01410040043034303219544F54414C
      20434F4E534F4C494441444F202D20434F494E56015300400630343032303105
      434F494E560141004006303430323032054745494E5601410040063034303230
      33054745494D4F01410040043034303319544F54414C20434F4E534F4C494441
      444F202D20434F524941015300400630343033303105434F5249410141004006
      303430333032054745434F4601410000033833301E436F6F72642E646520496E
      76657374696D656E746F73202D20434F494E5601530432333132000004383330
      3005434F494E56014103323331000004383330311E4765722E646520496E7665
      732E496D6F62696C6961722E2D204745494D4F0141043233313200400A393939
      393939393939391A432E20526573706F6E736162696C69646164652050616472
      3F6F0153000001311644697265746F726961202D20507265736964656E746501
      530131000001321444697265746F7269612046696E616E636569726101530132
      000001331744697265746F726961206465205365677572696461646501530133
      000001341E44697265746F7269612046696E616E6365697261202D2053454D20
      55534F015301320000033131331B41756469746F72696120496E7465726E6120
      2D2053454D2055534F0141033131330000033231311E4173736573736F726961
      206465204F7263616D656E746F20652043757374014103323131000003323132
      1D4173736573736F72696120646520416E616C69736520646520496E762E0141
      033231320000033232311D446570617274616D656E746F20646520436F6E7461
      62696C69646164650141033232310000033232321C446570617274616D656E74
      6F2041646D2E2046696E616E63656972610141033232320000033232331D4465
      70617274616D656E746F20646520496E76657374696D656E746F730141033232
      330000033330311E43656E7472616C206465204174656E64696D656E746F202D
      2053454D2055014103333031000003333131194173732E20646520446573656E
      762E202D2053454D2055534F0141033331310000033332311E44657061727461
      6D656E746F2064652041646D2E2042656E65662E2D5345014103333231000003
      3332321E446570746F2064652052656C2E20436F6E74726F6C652D53454D2055
      534F0141033332320000033431311D4173736573736F726961206465204F2026
      204D202D2053454D2055534F0141033431310000033432311D44657061727461
      6D656E746F2041646D2E20496D6F62696C696172696101410334323100000334
      32321D446570617274616D656E746F2064652041646D696E6973747261E7E36F
      0141033432320000033432331C446570617274616D656E746F20646520524820
      2D2053454D2055534F0141033432330000033432341B446570617274616D656E
      746F20646520496E666F726D6174696361014103343234000001351A44697265
      746F7269612046697363616C202D2053454D2055534F01530135000001360943
      6F6E73656C686F73015301360000033630311E436F6E73656C686F2044656C69
      626572617469766F2D2053454D2055534F01410336303100000336303219436F
      6E73656C686F2046697363616C202D2053454D2055534F014103363032000003
      3131321E446570746F2E20436F6D756E2E536F632E204D61726B2D53454D2055
      534F0141033131320000033131311E446570617274616D656E746F20204A7572
      696469636F2D53454D2055534F0141033131310000033131341B476162696E65
      746520646F204469707265202D2053454D2055534F0141033130300000033332
      3318476162696E657465204469736567202D2053454D2055534F014103333030
      00000332323418476162696E65746520446966696E202D2053454D2055534F01
      410332323500000334323518476162696E657465204469726164202D2053454D
      2055534F0141033430300000033232351D4173736573736F726961206465204F
      2026204D202D2053454D2055534F0141033231330000033232361A446570746F
      2E2064652041646D2E20496D6F62696C69617269610141033232340000033232
      371D446570617274616D656E746F2064652041646D696E6973747261E7E36F01
      41033232350000033232381E446570617274616D656E746F20646520522E2048
      2E2D2053454D2055534F0141033232360000033232391D446570617274616D65
      6E746F20646520496E666F726D6174696361202D014103323237000003313135
      1D446570746F2E20506C616E656A2E206520436F6E742D53454D2055534F0141
      0331313400000331393913507265736964EA6E636961202D2044495052450141
      033139390000033131301341756420496E7465726E61202D20415544494E0141
      033131300000033132301A4A7572ED6469636F202D204A55524944202D205345
      4D2055534F015303313230000004313230311C436F6E74656E63696F736F204A
      7572ED6469636F202D20434F4E544501410431323031000004313230321B436F
      6E73756C7469766F204A7572ED6469636F202D20434F4E535501410431323032
      00000331333005434F414445014103313330000004313330311E4765722E2050
      6C616E2E2065204F72E7616D656E746F202D204745504C4F0141043133303100
      0004313330321E4765722E436F6D756E2E20456D70726573617269616C202D20
      4745434F45014104313330320000033134301D436F6F72642E47657374E36F20
      436C69656E746573202D20434F474543015303313430000004313430311D4765
      722E446573656E762E50726F64732E4E65672E202D20474550454E0141043134
      3031000004313430321D4765722E4174656E642E496E742E436C69656E746520
      2D204745415449014104313430320000033631301D436F6E73656C686F204465
      6C69626572617469766F202D20434F44454C0141033631300000033632301743
      6F6E73656C686F2046697363616C202D20434F46495301410336323000000137
      05444942454F0153013700000138054449464944015301380000033739391D44
      69722E42656E65662E65206465204F706572612E202D20444942454F01410337
      39390000033731301C436F6F72642E2064652053656775726964616465202D20
      434F534547015303373130000004373130311D4765722E20436164617374726F
      205061727469632E202D20474543415001410437313031000004373130321C47
      65722E2041646D2E2042656E6566ED63696F73202D2047454142450141043731
      3032000004373130331A4765722E20436F6E74722E2041727265632E202D2047
      45434152014104373130330000033732301E436F6F72642E20496E6672612D65
      7374727574757261202D20434F494E46015303373230000004373230311D4765
      722E2041706F696F2041646D696E697374722E202D2047454150410141043732
      3031000004373230321C4765722E2041706F696F204C6F67ED737469636F202D
      2047454C4F47014104373230320000033839391E4469722E2046696E616E632E
      206520446573656E762E202D2044494649440141033839390000033831301E43
      6F6F72642E416E616C2E547261742E496E666F722E202D20434F415449015303
      383130000004383130311D4765722E5465636E6F6C6F67696120496E666F722E
      202D20474554454301410438313031000004383130321D4765722E416E616C2E
      4573742E417475617269616C202D204745415455014104383130320000033832
      301C436F6F72642E20436F6E74726F6C61646F726961202D20434F5249410153
      03383230000004383230311D4765722E20646520496E76657374696D656E746F
      73202D204745494E5601410438323031000004383230321E4765722E20436F6E
      74722E2046696E616E636569726F202D204745434F4601410438323032004002
      303909434F4E53454C484F5301530040043039303105434F44454C0141004004
      3039303205434F46495301410040043031303205534543455801410040023031
      19544F54414C20434F4E534F4C494441444F202D204449505245015300400430
      313031054449505245014100000339333010476162696E657465202D20444952
      4144014103343330004006303230323033054745434152014100400630323033
      303305474541545501410040063033303230330547454F524701410040063033
      30333033054745504F4C0141004006303430323034054745414E490141004006
      303430333033054745434F4E01410000043031303707456C656E696365014103
      313532}
  end
end
