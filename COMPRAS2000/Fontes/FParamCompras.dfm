inherited FrmParamCompras: TFrmParamCompras
  Left = 62
  Top = 44
  Caption = 'Parametros do Sistema'
  ClientHeight = 454
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 684
    Height = 368
    object Label9: TLabel
      Left = 16
      Top = 128
      Width = 81
      Height = 13
      Caption = 'Taxa de Juros'
    end
    object Label10: TLabel
      Left = 168
      Top = 128
      Width = 156
      Height = 13
      Caption = 'Tipo de Documento Padrão'
    end
    object GrpOC: TGroupBox
      Left = 16
      Top = 168
      Width = 489
      Height = 185
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
        Top = 136
        Width = 89
        Height = 13
        Caption = 'Assinatura Nº 3'
        FocusControl = edAssinat1
      end
      object Label3: TLabel
        Left = 8
        Top = 80
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
        Top = 96
        Width = 204
        Height = 21
        DataField = 'ASSINATURA2'
        DataSource = ds
        TabOrder = 1
      end
      object edAssinat3: TDBEdit
        Left = 8
        Top = 152
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
        Height = 117
        DataField = 'INSTRUCAOOC'
        DataSource = ds
        TabOrder = 3
        WantTabs = True
      end
      object chkImpAparte: TDBCheckBox
        Left = 224
        Top = 160
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
      Left = 328
      Top = 16
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
      Left = 328
      Top = 32
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
      Left = 328
      Top = 48
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
      Left = 328
      Top = 64
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
      Height = 113
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
        Top = 64
        Width = 118
        Height = 13
        Caption = 'Prazo de Pagamento'
      end
      object Label8: TLabel
        Left = 152
        Top = 64
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
          '      0,00')
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
          '      0,00')
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
        Top = 80
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
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
        Top = 80
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
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
      Top = 144
      Width = 120
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
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
      Left = 328
      Top = 80
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
      Top = 144
      Width = 497
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'
        'CODTIPDOC'#9'10'#9'Código')
      DataField = 'CODTIPDOC'
      DataSource = ds
      LookupTable = qryTipoDoc
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
      Top = 168
      Width = 153
      Height = 185
      Caption = ' Imprimi OC Automático '
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
      Left = 328
      Top = 96
      Width = 345
      Height = 17
      Caption = 'Verifica a aprovação da SCI na Atribuição de Comprador'
      DataField = 'FLGVERIFRAD'
      DataSource = ds
      TabOrder = 10
      ValueChecked = 'A'
      ValueUnchecked = 'O'
    end
  end
  inherited Dock972: TDock97
    Width = 684
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
    Top = 415
    Width = 684
    inherited tb97Fundo: TToolbar97
      Left = 433
      DockPos = 433
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 265
      DockPos = 265
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDPESSOA,'
      '      TXJUROS,'
      '      PESOPRECO,'
      '      PESOPRAZOENT,'
      '      PESOPRAZOPGTO,'
      '      PESOAVALIACAO,'
      '      COMPRARALEMSC,'
      '      NUMAVALIACOES,'
      '      INSTRUCAOOC,'
      '      IMPOBSAPARTE,'
      '      ASSINATURA1,'
      '      ASSINATURA2,'
      '      ASSINATURA3,'
      '      IMPLOGO,'
      '      TRASOBS,'
      '      FLGORCAMENTO,'
      '      FLGOBSSCIOC,'
      '      CODTIPDOC,'
      '      MODELOIMPOC,'
      '      FLGVERIFRAD'
      'FROM'
      '    PARAMCOMPRAS'
      'WHERE'
      '    (IDPESSOA = :pIDPESSOA)'
      ' '
      ' '
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMCOMPRAS.IDPESSOA'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'PARAMCOMPRAS.TXJUROS'
    end
    object qryPESOPRECO: TFloatField
      FieldName = 'PESOPRECO'
      Origin = 'PARAMCOMPRAS.PESOPRECO'
    end
    object qryPESOPRAZOENT: TFloatField
      FieldName = 'PESOPRAZOENT'
      Origin = 'PARAMCOMPRAS.PESOPRAZOENT'
    end
    object qryPESOPRAZOPGTO: TFloatField
      FieldName = 'PESOPRAZOPGTO'
      Origin = 'PARAMCOMPRAS.PESOPRAZOPGTO'
    end
    object qryPESOAVALIACAO: TFloatField
      FieldName = 'PESOAVALIACAO'
      Origin = 'PARAMCOMPRAS.PESOAVALIACAO'
    end
    object qryCOMPRARALEMSC: TFloatField
      FieldName = 'COMPRARALEMSC'
      Origin = 'PARAMCOMPRAS.COMPRARALEMSC'
    end
    object qryNUMAVALIACOES: TFloatField
      FieldName = 'NUMAVALIACOES'
      Origin = 'PARAMCOMPRAS.NUMAVALIACOES'
    end
    object qryINSTRUCAOOC: TMemoField
      FieldName = 'INSTRUCAOOC'
      Origin = 'PARAMCOMPRAS.INSTRUCAOOC'
      BlobType = ftMemo
      Size = 1
    end
    object qryIMPOBSAPARTE: TFloatField
      FieldName = 'IMPOBSAPARTE'
      Origin = 'PARAMCOMPRAS.IMPOBSAPARTE'
    end
    object qryASSINATURA1: TStringField
      FieldName = 'ASSINATURA1'
      Origin = 'PARAMCOMPRAS.ASSINATURA1'
      Size = 25
    end
    object qryASSINATURA2: TStringField
      FieldName = 'ASSINATURA2'
      Origin = 'PARAMCOMPRAS.ASSINATURA2'
      Size = 25
    end
    object qryASSINATURA3: TStringField
      FieldName = 'ASSINATURA3'
      Origin = 'PARAMCOMPRAS.ASSINATURA3'
      Size = 25
    end
    object qryIMPLOGO: TStringField
      FieldName = 'IMPLOGO'
      Origin = 'PARAMCOMPRAS.IMPLOGO'
      Size = 1
    end
    object qryTRASOBS: TStringField
      FieldName = 'TRASOBS'
      Origin = 'PARAMCOMPRAS.TRASOBS'
      Size = 1
    end
    object qryFLGORCAMENTO: TStringField
      FieldName = 'FLGORCAMENTO'
      Origin = 'PARAMCOMPRAS.FLGORCAMENTO'
      Size = 1
    end
    object qryFLGOBSSCIOC: TStringField
      FieldName = 'FLGOBSSCIOC'
      Origin = 'PARAMCOMPRAS.FLGOBSSCIOC'
      Size = 1
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'PARAMCOMPRAS.CODTIPDOC'
    end
    object qryMODELOIMPOC: TFloatField
      FieldName = 'MODELOIMPOC'
      Origin = 'BASEDADOS.PARAMCOMPRAS.MODELOIMPOC'
    end
    object qryFLGVERIFRAD: TStringField
      FieldName = 'FLGVERIFRAD'
      Origin = 'BASEDADOS.PARAMCOMPRAS.FLGVERIFRAD'
      FixedChar = True
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCOMPRAS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  TXJUROS = :TXJUROS,'
      '  PESOPRECO = :PESOPRECO,'
      '  PESOPRAZOENT = :PESOPRAZOENT,'
      '  PESOPRAZOPGTO = :PESOPRAZOPGTO,'
      '  PESOAVALIACAO = :PESOAVALIACAO,'
      '  COMPRARALEMSC = :COMPRARALEMSC,'
      '  NUMAVALIACOES = :NUMAVALIACOES,'
      '  INSTRUCAOOC = :INSTRUCAOOC,'
      '  IMPOBSAPARTE = :IMPOBSAPARTE,'
      '  ASSINATURA1 = :ASSINATURA1,'
      '  ASSINATURA2 = :ASSINATURA2,'
      '  ASSINATURA3 = :ASSINATURA3,'
      '  IMPLOGO = :IMPLOGO,'
      '  TRASOBS = :TRASOBS,'
      '  FLGORCAMENTO = :FLGORCAMENTO,'
      '  FLGOBSSCIOC = :FLGOBSSCIOC,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  MODELOIMPOC = :MODELOIMPOC,'
      '  FLGVERIFRAD = :FLGVERIFRAD'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMCOMPRAS'
      '  (IDPESSOA, TXJUROS, PESOPRECO, PESOPRAZOENT, PESOPRAZOPGTO, '
      'PESOAVALIACAO, '
      '   COMPRARALEMSC, NUMAVALIACOES, INSTRUCAOOC, IMPOBSAPARTE, '
      'ASSINATURA1, '
      '   ASSINATURA2, ASSINATURA3, IMPLOGO, TRASOBS, FLGORCAMENTO, '
      'FLGOBSSCIOC, '
      '   CODTIPDOC, MODELOIMPOC, FLGVERIFRAD)'
      'values'
      
        '  (:IDPESSOA, :TXJUROS, :PESOPRECO, :PESOPRAZOENT, :PESOPRAZOPGT' +
        'O, '
      ':PESOAVALIACAO, '
      '   :COMPRARALEMSC, :NUMAVALIACOES, :INSTRUCAOOC, :IMPOBSAPARTE, '
      ':ASSINATURA1, '
      
        '   :ASSINATURA2, :ASSINATURA3, :IMPLOGO, :TRASOBS, :FLGORCAMENTO' +
        ', '
      ':FLGOBSSCIOC, '
      '   :CODTIPDOC, :MODELOIMPOC, :FLGVERIFRAD)')
    DeleteSQL.Strings = (
      'delete from PARAMCOMPRAS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 366
    Top = 10
  end
  object qryTipoDoc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      '      CODTIPDOC,'
      '      Descricao '
      'From '
      '    TipoDocRecPag '
      'Where '
      '           (RecPag = '#39'P'#39') '
      '  AND (DEBCRE = '#39'C'#39')')
    ControlType.Strings = (
      'DEBCRE;CheckBox;Yes;No')
    ValidateWithMask = True
    Left = 467
    Top = 2
  end
end
