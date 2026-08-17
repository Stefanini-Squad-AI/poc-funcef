inherited FrmMTParamCompras: TFrmMTParamCompras
  Left = 164
  Top = 58
  Caption = 'Parametros do Sistema'
  ClientHeight = 520
  ClientWidth = 685
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 685
    Height = 434
    object Label9: TLabel
      Left = 16
      Top = 146
      Width = 81
      Height = 13
      Caption = 'Taxa de Juros'
    end
    object Label10: TLabel
      Left = 168
      Top = 146
      Width = 156
      Height = 13
      Caption = 'Tipo de Documento Padrão'
    end
    object Label11: TLabel
      Left = 16
      Top = 186
      Width = 126
      Height = 13
      Caption = '% de Margem para OC'
    end
    object Label12: TLabel
      Left = 168
      Top = 186
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label13: TLabel
      Left = 357
      Top = 142
      Width = 303
      Height = 13
      Caption = 'Responsabilidade no Lançamento do Caixa Pequeno.'
    end
    object GrpOC: TGroupBox
      Left = 16
      Top = 226
      Width = 489
      Height = 165
      Caption = ' Ordem de Compra '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 89
        Height = 13
        Caption = 'Assinatura Nº 1'
        FocusControl = edAssinat1
      end
      object Label2: TLabel
        Left = 8
        Top = 104
        Width = 89
        Height = 13
        Caption = 'Assinatura Nº 3'
        FocusControl = edAssinat1
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 89
        Height = 13
        Caption = 'Assinatura Nº 2'
        FocusControl = edAssinat1
      end
      object Label4: TLabel
        Left = 224
        Top = 24
        Width = 113
        Height = 13
        Caption = 'Observação Padrão'
        FocusControl = edAssinat1
      end
      object edAssinat1: TDBEdit
        Left = 8
        Top = 40
        Width = 204
        Height = 21
        DataField = 'ASSINATURA1'
        DataSource = ds
        TabOrder = 0
      end
      object edAssinat2: TDBEdit
        Left = 8
        Top = 80
        Width = 204
        Height = 21
        DataField = 'ASSINATURA2'
        DataSource = ds
        TabOrder = 1
      end
      object edAssinat3: TDBEdit
        Left = 8
        Top = 120
        Width = 204
        Height = 21
        DataField = 'ASSINATURA3'
        DataSource = ds
        TabOrder = 2
      end
      object memObs: TDBMemo
        Left = 224
        Top = 40
        Width = 247
        Height = 84
        DataField = 'INSTRUCAOOC'
        DataSource = ds
        TabOrder = 3
        WantTabs = True
      end
      object chkImpAparte: TDBCheckBox
        Left = 224
        Top = 128
        Width = 249
        Height = 17
        Caption = 'Imprimir a observação em folha à parte'
        DataField = 'IMPOBSAPARTE'
        DataSource = ds
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object chkOrcamento: TDBCheckBox
      Left = 337
      Top = 6
      Width = 175
      Height = 17
      Caption = 'Integração com Orçamento'
      DataField = 'FLGORCAMENTO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object chkCompraAlem: TDBCheckBox
      Left = 337
      Top = 22
      Width = 152
      Height = 17
      Caption = 'Comprar além do limite'
      DataField = 'COMPRARALEMSC'
      DataSource = ds
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object chkImpLogo: TDBCheckBox
      Left = 337
      Top = 38
      Width = 169
      Height = 17
      Caption = 'Imprime Logo da Empresa'
      DataField = 'IMPLOGO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object chkTrasObs: TDBCheckBox
      Left = 337
      Top = 54
      Width = 187
      Height = 17
      Caption = 'Traz Obs. do Produto na SCI'
      DataField = 'TRASOBS'
      DataSource = ds
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 305
      Height = 103
      Caption = ' Pesos '
      TabOrder = 5
      object Label5: TLabel
        Left = 16
        Top = 16
        Width = 34
        Height = 13
        Caption = 'Preço'
      end
      object Label6: TLabel
        Left = 152
        Top = 16
        Width = 99
        Height = 13
        Caption = 'Prazo de Entrega'
      end
      object Label7: TLabel
        Left = 16
        Top = 55
        Width = 118
        Height = 13
        Caption = 'Prazo de Pagamento'
      end
      object Label8: TLabel
        Left = 152
        Top = 55
        Width = 143
        Height = 13
        Caption = 'Avaliação do Fornecedor'
      end
      object edPreco: TDBRealEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PESOPRECO'
        DataSource = ds
      end
      object edPrazoEnt: TDBRealEdit
        Left = 152
        Top = 32
        Width = 121
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
        DataField = 'PESOPRAZOENT'
        DataSource = ds
      end
      object edAvaliForn: TDBRealEdit
        Left = 152
        Top = 71
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMAVALIACOES'
        DataSource = ds
      end
      object edPrazoPag: TDBRealEdit
        Left = 16
        Top = 71
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PESOPRAZOPGTO'
        DataSource = ds
      end
    end
    object edTaxaJur: TDBRealEdit
      Left = 16
      Top = 162
      Width = 120
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '1,50')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'TXJUROS'
      DataSource = ds
    end
    object chkOBSCIOC: TDBCheckBox
      Left = 337
      Top = 70
      Width = 257
      Height = 17
      Caption = 'Traz Obs. da SCI na Ordem de Compra'
      DataField = 'FLGOBSSCIOC'
      DataSource = ds
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbclTipoDocumento: TwwDBLookupCombo
      Left = 168
      Top = 162
      Width = 497
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'
        'CODTIPDOC'#9'10'#9'Código')
      DataField = 'CODTIPDOC'
      DataSource = ds
      LookupTable = cdsTipoDoc
      LookupField = 'codtipdoc'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object RgImOC: TDBRadioGroup
      Left = 512
      Top = 306
      Width = 153
      Height = 85
      Caption = 'Imprimir OC Automático '
      DataField = 'MODELOIMPOC'
      DataSource = ds
      Items.Strings = (
        'Não'
        'Modelo Padrão'
        'Modelo 1'
        'Modelo 2')
      TabOrder = 9
      Values.Strings = (
        '0'
        '1'
        '2'
        '3')
    end
    object chkVerifRAD: TDBCheckBox
      Left = 337
      Top = 86
      Width = 345
      Height = 17
      Caption = 'Verifica a aprovação da SCI na Atribuição de Comprador'
      DataField = 'FLGVERIFRAD'
      DataSource = ds
      TabOrder = 10
      ValueChecked = 'A'
      ValueUnchecked = 'O'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 512
      Top = 226
      Width = 153
      Height = 73
      Caption = 'Opções de Destinos'
      DataField = 'OPDESTINO'
      DataSource = ds
      Items.Strings = (
        'Estoque'
        'Custo'
        'Ambos')
      TabOrder = 11
      Values.Strings = (
        'E'
        'C'
        'A')
    end
    object DBRealEdit1: TDBRealEdit
      Left = 16
      Top = 200
      Width = 129
      Height = 21
      Hint = 
        'Indique o percentual para margem de quebra referente ao valor da' +
        ' OC em relação à Reserva Orçamentária'
      Alignment = taRightJustify
      Lines.Strings = (
        '90,00')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'FLGMARGEMOC'
      DataSource = ds
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 168
      Top = 200
      Width = 497
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Centro de Responsabilidade'#9'F')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = cdsCentRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 13
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object chkCriticaEmissao: TDBCheckBox
      Left = 337
      Top = 106
      Width = 273
      Height = 17
      Caption = 'Critica a data de emissão na compra avulsa'
      DataField = 'FLGDATAEMISSAO'
      DataSource = ds
      TabOrder = 14
      ValueChecked = '1'
      ValueUnchecked = 'O'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 337
      Top = 126
      Width = 304
      Height = 17
      Caption = 'Ativa o relacionamendo Usuários x Centro de '
      DataField = 'FLGACESSLANCDOC'
      DataSource = ds
      TabOrder = 15
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 685
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Images = nil
        NumGlyphs = 3
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 481
    Width = 685
    inherited tb97Fundo: TToolbar97
      Left = 513
      DockPos = 583
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 344
      DockPos = 414
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 754
    Top = 65527
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 776
    Top = 65519
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 260
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 432
    Top = 7
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 71
  end
  object cdsCentRespon: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 215
    Data = {
      F70200009619E0BD010000001800000002002800000003000000AC000F434F44
      43454E54524F524553504F4E0100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00044E4F4D45010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002001E0002000D44454641554C545F4F5244455202008200010000
      000200044C434944040001000908000000000439303039054153434F4D000004
      393031310541534A555200000439303130054153504C41000004393031320541
      5544494E0000043930313605434F42454E0000043930303205434F44454C0000
      043930303305434F4649530000043930333205434F494E560000043930313905
      434F5041520000043930323405434F52454F0000043930333605434F52494100
      00043930323705434F52494C0000043930333005444946494E00000439303037
      0544495052450000043930323205444952414400000439303134054449534547
      0000043930343407456C656E696365000004393038330546494C484F00000439
      3038340E46494C484F20444F2046494C484F00000439303432054745414E4900
      0004393033390547454154550000043930313705474542454E00000439303230
      0547454341500000043930333805474543415200000439303337054745434F46
      00000439303433054745434F4E00000439303334054745494D4F000004393032
      38054745494E4600000439303333054745494E56000004393034300547454F52
      4700000439303431054745504F4C000004393032350547455245480000043930
      3038055345434558000004393035390554455354450000043931303805544553
      5445000004393034360754657374652031000004393131381754455354452041
      4E454C495341204520434C4155444941000004393039330E5445535445204445
      2046494C484F000004393038311254455354452046494C484F20524553504F4E
      000004393037381374657374652070616920616E616CED7469636F}
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     U.CODCENTRORESPON,'
      '     U.NOME'
      'FROM'
      ' ('
      '  (SELECT'
      '        CR.CODCENTRORESPON,'
      '        CR.NOME'
      '   FROM'
      '        CENTRESPON CR,'
      '        PESSOAXCRESP PR'
      '   WHERE'
      '         (CR.CODCENTRORESPON = PR.CODCENTRORESPON)'
      '     AND (CR.IDPESSOA = PR.IDPESSOA)'
      '     AND (CR.IDPESSOA = 2)'
      '     AND (CR.ATIVO    = '#39'S'#39')'
      '     AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '     AND (PR.IDPESSOAACESSO = 510))'
      '  UNION ALL'
      '    (SELECT'
      '          CR.CODCENTRORESPON,'
      '          CR.NOME'
      '     FROM'
      '          CENTRESPON CR'
      '     WHERE'
      '           (CR.IDPESSOA = 2)'
      '       AND (CR.ATIVO    = '#39'S'#39')'
      '       AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '       AND (NOT EXISTS (SELECT 1'
      '                        FROM PESSOAXCRESP PR'
      '                        WHERE (PR.IDPESSOA = 2)'
      '                          AND (PR.IDPESSOAACESSO = 510)))'
      '     )'
      '  ) U'
      'ORDER BY U.NOME'
      '')
    Left = 512
    Top = 215
  end
end
