inherited frmCadEstadoMtTeste: TfrmCadEstadoMtTeste
  Left = 219
  Top = 195
  Caption = 'Cadastro de Estados - Teste'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 17
      Height = 13
      Caption = 'UF'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 27
      Height = 13
      Caption = 'País'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 152
      Width = 64
      Height = 13
      Caption = 'Cód. Fiscal'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 25
      Height = 21
      DataField = 'CODESTADO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 72
      Width = 214
      Height = 21
      DataField = 'NOMEESTADO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 168
      Width = 74
      Height = 21
      DataField = 'CODFISCAL'
      DataSource = ds
      TabOrder = 2
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 8
      Top = 120
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPAIS'#9'30'#9'NOMEPAIS'#9'F')
      DataField = 'IDPAIS'
      DataSource = ds
      LookupTable = cdsPais
      LookupField = 'IDPAIS'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited ds: TwwDataSource
    Top = 63
  end
  inherited ImlPadrao: TImageList
    Left = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    CommandText = 'select * from ESTADO'
    Top = 111
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Consulta Estados'
    Colunas.Strings = (
      'ESTADO.NOMEESTADO'
      'ESTADO.CODESTADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Estado'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ESTADO')
    CamposChave.Strings = (
      'ESTADO.IDESTADO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '3')
  end
  object cdsPais: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 132
    Top = 159
    Data = {
      8E0100009619E0BD010000001800000009000200000003000000270106494450
      4149530800040000000000084E4F4D4550414953010049000000010005574944
      5448020002001E00114E4F4D454E4143494F4E414C4944414445010049000000
      0100055749445448020002001E0011434F44524543454954414645444552414C
      080004000000000010434F44494E5445524E4143494F4E414C01004900000001
      000557494454480200020003000E4D41534341524143504F5354414C01004900
      0000010005574944544802000200140009434F4452454749414F080004000000
      00000D5452474454494E434C5553414F08000800000000000F54524755534552
      494E434C5553414F0100490000000100055749445448020002001E000100044C
      434944040001000908000000001400000000000000F03F0642726173696C0A42
      726173696C6569726100000000000024400342524100ECE93581ABCC4202434D
      0000150000000000000000400554455354450554455354450000000000000000
      0080CDA115C0CC4209434D31353333363631}
  end
end
