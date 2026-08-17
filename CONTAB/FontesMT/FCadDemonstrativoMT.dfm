inherited FrmCadDemonstrativoMT: TFrmCadDemonstrativoMT
  Left = 216
  Top = 155
  Caption = 'Cadastro de Demonstrativos'
  ClientHeight = 399
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 402
    Height = 313
    object lblFormaRecPag: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 320
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Incremento'
    end
    object Label1: TLabel
      Left = 16
      Top = 57
      Width = 152
      Height = 13
      Caption = 'Descrição Complementar 1'
    end
    object Label2: TLabel
      Left = 16
      Top = 96
      Width = 152
      Height = 13
      Caption = 'Descrição Complementar 2'
    end
    object dbeDesc: TDBEdit
      Left = 16
      Top = 32
      Width = 289
      Height = 21
      DataField = 'DEMDESCDEMONSTRAT'
      DataSource = ds
      TabOrder = 0
    end
    object spnIncrementos: TwwDBSpinEdit
      Left = 320
      Top = 32
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 50
      DataField = 'DEMSEQUENCIA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dbeDescCompl1: TDBEdit
      Left = 16
      Top = 71
      Width = 369
      Height = 21
      DataField = 'DEMTITULOCOMPL'
      DataSource = ds
      TabOrder = 2
    end
    object dbeDescCompl2: TDBEdit
      Left = 16
      Top = 112
      Width = 369
      Height = 21
      DataField = 'DEMTITULOCOMPL2'
      DataSource = ds
      TabOrder = 3
    end
    object rgNatureza: TDBRadioGroup
      Left = 16
      Top = 144
      Width = 369
      Height = 41
      Caption = 'Natureza'
      Columns = 3
      DataField = 'DEMNATUREZA'
      DataSource = ds
      Items.Strings = (
        'Devedora'
        'Credora'
        'Nenhuma')
      TabOrder = 4
      Values.Strings = (
        'D'
        'C'
        'N')
    end
    object dbrgLinhaAcima: TDBRadioGroup
      Left = 16
      Top = 192
      Width = 177
      Height = 97
      Caption = 'Traço Acima do Cabeçalho'
      DataField = 'FLGTRACOACIMA'
      DataSource = ds
      Items.Strings = (
        'Não Passa'
        'Completo'
        'Acima do Valor'
        'Acima da Descrição')
      TabOrder = 5
      Values.Strings = (
        'N'
        'C'
        'V'
        'T')
    end
    object dbrgTracoAbaixo: TDBRadioGroup
      Left = 208
      Top = 192
      Width = 177
      Height = 97
      Caption = 'Traço Abaixo do Cabeçalho'
      DataField = 'FLGTRACOABAIXO'
      DataSource = ds
      Items.Strings = (
        'Não Passa'
        'Completo'
        'Abaixo do Valor'
        'Abaixo da Descrição')
      TabOrder = 6
      Values.Strings = (
        'N'
        'C'
        'V'
        'T')
    end
  end
  inherited Dock972: TDock97
    Width = 402
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 230
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 351
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 328
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'DEMONSTRATIVO')
    CamposChave.Strings = (
      'DEMONSTRATIVO.IDDEMONSTRATIVO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Top = 39
  end
end
