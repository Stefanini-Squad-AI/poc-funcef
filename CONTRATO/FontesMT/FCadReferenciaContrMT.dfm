inherited frmCadReferenciaContrMT: TfrmCadReferenciaContrMT
  Left = 359
  Top = 190
  HelpContext = 120025
  Caption = 'Cadastro de Referências Contratuais'
  ClientHeight = 270
  ClientWidth = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 355
    Height = 184
    object Label2: TLabel
      Left = 17
      Top = 16
      Width = 117
      Height = 13
      Caption = 'Nome da Referência'
      FocusControl = dbeNomeReferencia
    end
    object dbeNomeReferencia: TDBEdit
      Left = 17
      Top = 32
      Width = 321
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object gbCalcAtrasados: TGroupBox
      Left = 16
      Top = 64
      Width = 321
      Height = 105
      Caption = 'Condições '
      TabOrder = 1
      object dbcbSabados: TDBCheckBox
        Left = 8
        Top = 26
        Width = 169
        Height = 17
        Caption = 'Considerar Sábados'
        DataField = 'FLGSABADOS'
        DataSource = ds
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbDomingos: TDBCheckBox
        Left = 8
        Top = 50
        Width = 169
        Height = 17
        Caption = 'Considerar Domingos'
        DataField = 'FLGDOMINGOS'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbFeriados: TDBCheckBox
        Left = 8
        Top = 74
        Width = 169
        Height = 17
        Caption = 'Considerar Feriados'
        DataField = 'FLGFERIADOS'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 355
  end
  inherited Dock971: TDock97
    Top = 231
    Width = 355
    inherited tb97Fundo: TToolbar97
      Left = 183
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 14
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 458
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 142
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 264
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 68
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REFERENCIACONTR.NOME'
      'REFERENCIACONTR.IDREFCONTR')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Referência'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REFERENCIACONTR')
    CamposChave.Strings = (
      'REFERENCIACONTR.IDREFCONTR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    Left = 320
    Top = 65535
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'select * from REFERENCIACONTR')
    ClientDataSet = Cds
    Left = 208
    Top = 56
  end
end
