inherited frmCadInformeMT: TfrmCadInformeMT
  Left = 347
  Top = 146
  HelpContext = 240024
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro das Linhas do Informe de Rendimento (Cédula C)'
  ClientHeight = 577
  ClientWidth = 1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1088
    Height = 491
    object lblNome: TLabel
      Left = 21
      Top = 14
      Width = 150
      Height = 13
      Caption = 'Nome da Linha do Informe'
    end
    object Label1: TLabel
      Left = 469
      Top = 12
      Width = 179
      Height = 13
      Caption = 'Código da Linha para o Informe'
    end
    object Label3: TLabel
      Left = 176
      Top = 72
      Width = 745
      Height = 33
      AutoSize = False
      Caption = 
        'Para os códigos dirf 6 e 16 o valor das rubricas informativas é ' +
        'somados ao valor das rubricas de desconto. Para o resto dos códi' +
        'gos o critério é o inverso, ou seja, o valor das rubricas inform' +
        'ativas é somado ao valor das rubricas de provento.'
      WordWrap = True
    end
    object lbAnoVigencia: TLabel
      Left = 720
      Top = 12
      Width = 94
      Height = 13
      Caption = 'Ano de Vigência'
    end
    object dbedNome: TwwDBEdit
      Left = 21
      Top = 29
      Width = 439
      Height = 21
      DataField = 'NOMEINFORME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCodInforme: TwwDBEdit
      Left = 469
      Top = 27
      Width = 178
      Height = 21
      DataField = 'CODINFORME'
      DataSource = ds
      MaxLength = 4
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgNatureza: TDBRadioGroup
      Left = 23
      Top = 59
      Width = 132
      Height = 54
      Caption = ' Natureza da Linha '
      DataField = 'FLGNATUREZA'
      DataSource = ds
      Items.Strings = (
        '&Positiva'
        '&Negativa')
      TabOrder = 2
      Values.Strings = (
        'P'
        'N')
    end
    object dbckRendimentoBruto: TDBCheckBox
      Left = 21
      Top = 123
      Width = 356
      Height = 17
      Caption = 'Linha se refere a Rendimento Bruto para Base de IR'
      DataField = 'FLGBASE'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = dbckRendimentoBrutoClick
    end
    object dbckIRRF: TDBCheckBox
      Left = 389
      Top = 123
      Width = 178
      Height = 17
      Caption = 'Linha se refere a IRRF'
      DataField = 'FLGIRRF'
      DataSource = ds
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = dbckIRRFClick
    end
    object dbrgDirf: TDBRadioGroup
      Left = 5
      Top = 145
      Width = 1076
      Height = 336
      Caption = ' Linha para DIRF '
      Columns = 3
      DataField = 'CODDIRF'
      DataSource = ds
      Items.Strings = (
        '1 - &Não vai para Dirf'
        '2 - &Rendimento Bruto'
        '3 - &IRRF'
        '4 - &Deduções'
        '5 - 13º. &Salário - Rendimento'
        '6 - 13º. S&alário - Deduções'
        '7 - 13º. Sa&lário - IRRF'
        '8 - &Compensação por decisão judicial'
        '9 - Rendimentos - &Exigibilidade suspensa'
        '10 - 13º. Salário - &por decisão judicial'
        '11 - 13º. Salár&io - exigibilidade suspensa'
        '12 - Por decisão judicial - Anos anteriores'
        '13 - Ded&uções - exigibilidade suspensa'
        '14 - IRRF - exigibilidade suspensa'
        '15 - 13º Salá&rio - decisão judicial anos anteriores'
        '16 - 13º Salá&rio - Ded&uções exigibilidade suspensa'
        '17 - 13º Salá&rio - IRRF exigibilidade suspensa'
        '18 - Contribuição Oficial'
        '19 - Dedução de Dependente'
        '20 - Pensão Alimentícia'
        '21 - Contribuição Previdência Privada'
        '22 - 13º Contribuição Oficial'
        '23 - 13º Dedução de Dependente'
        '24 - 13º Pensão Alimentícia'
        '25 - 13º Contribuição Previdência Privada'
        '26 - Imposto de Renda Informativo'
        '27 - Isenção 65 anos'
        '28 - Molestia Grave'
        '30 - 13º. Imposto de Renda Informativo'
        '31 - 13º. Salário Isenção 65 anos'
        '32 - 13º. Salário Molestia Grave'
        '34 - Ajuda de Custo/Diarias'
        '35 - Indenizações, Recisões e Acidente Trabalho'
        '36 - Abono Pecuniario'
        '37 - RRA - Rendimento Bruto'
        '38 - RRA - IRRF'
        '39 - RRA - Moléstia Grave'
        '40 - RRA - Pensão Alimentícia'
        '41 - RRA - 13º Rendimento'
        '42 - RRA - 13º Rendimento - Molestia Grave'
        '43 - IN 1343'
        '44 - 13º IN 1343'
        '45 - Resgate s/ deduçao de IR'
        '46 - Benefício Regressivo'
        '47 - Outros - Rendimentos Isentos Ação Judicial/Pecúlio'
        '48 - Contrib. Equacionamento - Exigibilidade Suspensa'
        '49 - 13º Contrib. Equacionamento - Exigibilidade Susp.'
        '50 - IRRF - Contr. Equacionamento - Exigibilidade Susp.'
        '51 - 13º IRRF - Cont. Equacionamento - Exigib. Susp.'
        '52 - IRRF - Dedução - Desc.simplificado - FUNCEF'
        '53 - 13º IRRF - Dedução - Desc.simplificado - FUNCEF'
        '54 - IRRF - Dedução - Desc.Simplificado - INSS'
        '55 - 13º IRRF - Dedução - Desc.Simplificado - INSS')
      TabOrder = 5
      Values.Strings = (
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
        '17'
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
        '30'
        '31'
        '32'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55')
    end
    object spedAnoVigencia: TwwDBSpinEdit
      Left = 720
      Top = 27
      Width = 57
      Height = 21
      Increment = 1
      MaxValue = 2999
      MinValue = 1990
      DataField = 'ANOVIGENCIA'
      DataSource = ds
      TabOrder = 6
      UnboundDataType = wwDefault
    end
    object DBCheckBox1: TDBCheckBox
      Left = 543
      Top = 124
      Width = 178
      Height = 17
      Caption = 'Linha se refere a IRRF'
      DataField = 'FLGIRRF'
      DataSource = ds
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = dbckIRRFClick
    end
  end
  inherited Dock972: TDock97
    Width = 1088
  end
  inherited Dock971: TDock97
    Top = 538
    Width = 1088
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 240021
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 578
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 842
    Top = 33
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 296
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 348
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'INFORME.CODINFORME'
      'INFORME.NOMEINFORME'
      'INFORME.ANOVIGENCIA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Informe'
      'Nome do Informe'
      'Ano de Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INFORME')
    CamposChave.Strings = (
      'INFORME.IDINFORME'
      'INFORME.ANOVIGENCIA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '4')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 392
    Top = 7
  end
end
