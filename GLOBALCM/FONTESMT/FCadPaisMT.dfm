inherited FrmCadPais: TFrmCadPais
  Left = 544
  Top = 156
  HelpContext = 20010
  Caption = 'Cadastro de País'
  ClientHeight = 317
  ClientWidth = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 333
    Height = 231
    object Label1: TLabel
      Left = 15
      Top = 10
      Width = 27
      Height = 13
      Caption = 'País'
    end
    object Label2: TLabel
      Left = 15
      Top = 52
      Width = 82
      Height = 13
      Caption = 'Nacionalidade'
    end
    object Label3: TLabel
      Left = 15
      Top = 97
      Width = 134
      Height = 13
      Caption = 'Código Receita Federal'
    end
    object Label4: TLabel
      Left = 180
      Top = 97
      Width = 118
      Height = 13
      Caption = 'Código Internacional'
    end
    object Label5: TLabel
      Left = 15
      Top = 143
      Width = 148
      Height = 13
      Caption = 'Máscara do código Postal'
      FocusControl = DbEdMascara
    end
    object Label6: TLabel
      Left = 179
      Top = 143
      Width = 102
      Height = 13
      Caption = 'Código de Região'
      FocusControl = DbEdCodRegiao
    end
    object Label7: TLabel
      Left = 15
      Top = 183
      Width = 104
      Height = 13
      Caption = 'Código de eSocial'
      FocusControl = DbEdMascara
    end
    object dbedPais: TwwDBEdit
      Left = 15
      Top = 25
      Width = 301
      Height = 21
      DataField = 'NOMEPAIS'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNacional: TwwDBEdit
      Left = 15
      Top = 67
      Width = 301
      Height = 21
      DataField = 'NOMENACIONALIDADE'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCodReceita: TwwDBEdit
      Left = 15
      Top = 112
      Width = 150
      Height = 21
      DataField = 'CODRECEITAFEDERAL'
      DataSource = ds
      MaxLength = 3
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCodInter: TwwDBEdit
      Left = 180
      Top = 112
      Width = 136
      Height = 21
      DataField = 'CODINTERNACIONAL'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdMascara: TwwDBEdit
      Left = 15
      Top = 158
      Width = 150
      Height = 21
      Hint = 'Use "9", "-" e "." para formar a máscara do Código Postal'
      DataField = 'MASCARACPOSTAL'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdCodRegiao: TwwDBEdit
      Left = 179
      Top = 158
      Width = 138
      Height = 21
      Hint = 'Digite o Código da Região'
      DataField = 'CODREGIAO'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edteSocial: TwwDBEdit
      Left = 16
      Top = 202
      Width = 146
      Height = 21
      DataField = 'CODIGOESOCIAL'
      DataSource = ds
      MaxLength = 3
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = edteSocialKeyPress
    end
  end
  inherited Dock972: TDock97
    Width = 333
  end
  inherited Dock971: TDock97
    Top = 278
    Width = 333
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 110
    Top = 99
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 124
    Top = 47
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 268
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 160
    Top = 99
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'País')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PAIS')
    CamposChave.Strings = (
      'PAIS.IDPAIS')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 232
    Top = 83
  end
end
