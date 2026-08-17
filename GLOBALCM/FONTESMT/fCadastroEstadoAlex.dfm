inherited frmCadastroEstadoAlex: TfrmCadastroEstadoAlex
  Caption = 'frmCadastroEstadoAlex'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 77
      Height = 13
      Caption = 'CODESTADO'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 32
      Top = 88
      Width = 87
      Height = 13
      Caption = 'NOMEESTADO'
      FocusControl = DBEdit2
    end
    object lblPais: TLabel
      Left = 32
      Top = 128
      Width = 27
      Height = 13
      Caption = 'País'
      OnClick = bbtnCancelarClick
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 64
      Width = 25
      Height = 21
      DataField = 'CODESTADO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 104
      Width = 214
      Height = 21
      DataField = 'NOMEESTADO'
      DataSource = ds
      TabOrder = 1
    end
    object dbLkPais: TwwDBLookupCombo
      Left = 32
      Top = 144
      Width = 217
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPAIS'#9'30'#9'País'#9'F'
        'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F')
      DataField = 'IDPAIS'
      DataSource = ds
      LookupTable = cdsPais
      LookupField = 'IDPAIS'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 82
    Top = 47
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ESTADO.NOMEESTADO'
      'ESTADO.CODESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Estado'
      'UF'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'ESTADO.IDESTADO')
    Filtro.Strings = (
      'ESTADO.IDPAIS = PAIS.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '30')
    OperComparador.Strings = (
      '-1'
      '1'
      '-1')
    RepeteConsulta = True
    ExibePergunta = False
  end
  object cdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 175
  end
end
