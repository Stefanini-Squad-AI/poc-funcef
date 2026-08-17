inherited FrmRelAutPag1: TFrmRelAutPag1
  Left = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Aviso de Recebimento - AR'
  ClientHeight = 216
  ClientWidth = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 419
    Height = 177
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 417
      Height = 175
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Selecionar um único Documento'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 409
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
          Width = 409
          Height = 107
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
          Width = 98
          Height = 13
          Caption = 'Data da Inclusão'
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
            'CODCENTRORESPON'#9'10'#9'Código'#9'F')
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
          Caption = ' &Status do Documento '
          ItemIndex = 1
          Items.Strings = (
            'Documentos Autorizados'
            'Documentos Não Autorizados'
            'todos')
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 177
    Width = 419
    inherited tb97Fundo: TToolbar97
      Left = 247
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
    Left = 256
    Top = 120
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
        Caption = 'Doc'
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
        MostraComboCompara = False
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
        Caption = 'Centro Responsabilidade'
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
        MostraComboCompara = False
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
        Caption = 'Data Inclusao'
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
        MostraComboCompara = False
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
        Caption = 'Status do Documento'
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
        MostraComboCompara = False
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
    Top = 24
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
    Left = 216
    Top = 72
  end
  object CdsCentroRespon: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 93
    Data = {
      880A00009619E0BD0100000018000000040089000000030000000B010F434F44
      43454E54524F524553504F4E0100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00044E4F4D45010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002001E000F414E414C495449434F53494E54455401004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020001000E434F4443454E54524F435553544F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      0100044C43494404000100090800000040043032313005534547455201410000
      043033303805434F50415201410430333038004002303108436F6E73656C686F
      01530040043031303115436F6E73656C686F2044656C69626572617469766F01
      41004004303130320F436F6E73656C686F2046697363616C0141004004303130
      3305474541554401410040023032055052455349015300400430323031055052
      45534901410040043032303205434F534F4301410040043032303305434F5345
      430141004004303230340547454A555201410040043032303505534547455201
      41004002303305444952494E01530040043033303105444952494E0141004004
      303330320547454F4649014100400430333033054745414E4901410040043033
      30340A5445534F5552415249410141004002303405444942454E015300400430
      34303105444942454E0141004004303430320547454341500141004004303430
      3305474550414301410040043034303405434F52454C01410040023035054449
      504543015300400430353031054449504543014100400430353032054745434F
      50014100400430353033054745434F5201410040023036054449504152015300
      400430363031054449504152014100400430363032054745494D4F0141004004
      3036303305474550415201410040043036303405434F414E4901410040023037
      0544494154490153004004303730310544494154490141004004303730320547
      45414D4901410040043037303305474553495301410040043034303505474550
      52450141004002303109436F6E73656C686F7301530040043031303115436F6E
      73656C686F2044656C69626572617469766F0141004004303130320F436F6E73
      656C686F2046697363616C014100400430313033054745415544014100400230
      3205505245534901530040043032303105505245534901410040043032303205
      53454745520141004004303230330547454A5552014100400230330544494245
      4E01530040043033303105444942454E01410040043033303205474552415401
      4100400630333032303205434F454D4601410040043033303305474553454701
      410040043033303405474550414201410040043033303506434F505245560141
      0040023034054449415449015300400430343031054449415449014100400430
      3430320547454150450141004004303430330547455449460141004002303505
      4449504152015300400430353031054449504152014100400430353032054745
      504152014100400430353033054745494D4F01410040043035303405434F454E
      4101410040043035303505434F414E4901410040023036054449504543015300
      400430363031054449504543014100400430363032054745434F500141004004
      30363033054745434F520141004002303705444952494E015300400430373031
      05444952494E014100400430373032054745414E490141004004303730330547
      454F464901410040043037303405434F44454E01410040043037303505434F50
      45430141004004303730360A5445534F555241524941014100400A3939393939
      39393939391A432E20526573706F6E736162696C696461646520506164723F6F
      0141004002303109436F6E73656C686F7301530040043031303104432E412E01
      410040043031303204432E462E01410040023032055052455349015300400430
      32303105434F53454301410040043032303205434F534F430141004004303230
      340D4745434F4E2D494E415449564F0153004004303230350F4745414D49202D
      20496E617469766F014100400430323036054745534953014100400230330544
      4946494E01530040043033303105444946494E0141004004303330320547454F
      464901410040043033303305474543494E014100400430333034054745414E49
      01410040043033303507474550524F2049014100400430333036074745414349
      20490141004002303405444942454E01530040043034303105444942454E0141
      00400230350D44494143492D494E415449564F0153004004303530310D444941
      43492D494E415449564F01410040023036054745524547015300400430363032
      0847455245472043450141004004303230330547454A55520141004004303430
      3205474550524501410040043034303305474543415001410000043034303405
      4745504143014104303430340040043036303308474552454720444601410040
      043036303408474552454720455301410040043036303508474552454720474F
      014100400430363036084745524547204D470141004004303630370847455245
      4720504501410040043036303908474552454720524A01410040043036313008
      4745524547205253014100400430363131084745524547205343014100400430
      3631320847455245472053500141004004303230380550524553490141004004
      303130330547454155440141004004303530320D47455349532D494E41544956
      4F0141004004303530330D4745414D492D494E415449564F0141004004303130
      3405434F4D494E0141004004303330370A5465736F7572617269610141000002
      393918486F6D6F6C6F6761E7E36F20496E76657374696D656E746F0153043939
      39380000043939303118486F6D6F6C6F6761E7E36F20496E76657374696D656E
      746F014104393939380040043036313308474552454720504201410000063032
      3034303115436F6E74726F6C61646F7269612D496E617469766F014106303230
      3430310000063032303430321B4745434F4E2F436F6E746162696C6964616465
      2D496E617469766F0141063032303430320000063032303430331E4745434F4E
      2F436F6E74726F6C6520496E76657374692D496E617469766F01410630323034
      30330000063032303430341E4745434F4E2F436F6E74726F6C6520496E746572
      6E6F2D496E617469766F0141063032303430340010023037054449434F4E0230
      3700000230380544494D4F42015302303800000430343036054745414D490141
      0430343036004004303830310544494D4F420141004004303830320F47455052
      4F202D20496E617469766F0141004004303830330F4745414349202D20496E61
      7469766F014100400430373031054449434F4E01410040043037303205474543
      4F50014100400430373033054745434F52014100000430343035054745534953
      0141043034303500400430383034054745415245014100400430383035054745
      494D4F01410000043034303705434F52454C0141043034303700400430363031
      0847455245472042410141004004303630380847455245472050520141000105
      434F50415201410430333038}
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODEXTERNO AS CODCENTRORESPON,'
      '  NOME,'
      '  ANALITICOSINTET,'
      '  CODCENTROCUSTO'
      'FROM'
      '  CENTRESPON'
      ' ')
    ClientDataSet = CdsCentroRespon
    Left = 49
    Top = 117
  end
  object CdsUpd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 85
  end
  object SqlUpd: TCMSqlParams
    ClientDataSet = CdsUpd
    Left = 153
    Top = 117
  end
end
