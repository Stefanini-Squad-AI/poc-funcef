inherited frmCadGrupoArquivo: TfrmCadGrupoArquivo
  Left = 129
  Caption = 'Cadastro de Grupo de Arquivos'
  ClientHeight = 221
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 488
  end
  inherited pnlFundo: TPanel [1]
    Width = 488
    Height = 135
    BorderWidth = 2
    object Label3: TLabel
      Left = 14
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Setor'
    end
    object Label2: TLabel
      Left = 14
      Top = 49
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label1: TLabel
      Left = 14
      Top = 9
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object dbedCodigo: TwwDBEdit
      Left = 14
      Top = 24
      Width = 121
      Height = 21
      DataField = 'CODGRUPOARQUIVO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescr: TwwDBEdit
      Left = 14
      Top = 63
      Width = 459
      Height = 21
      DataField = 'DESCGRUPOARQUIVO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 14
      Top = 102
      Width = 185
      Height = 21
      DataField = 'SETORGRUPOS'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 182
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 318
      DockPos = 318
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 150
      DockPos = 150
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 437
    Top = 29
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 437
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 437
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    FieldDefs = <
      item
        Name = 'CODGRUPOARQUIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DESCGRUPOARQUIVO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SETORGRUPOS'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <
      item
        Name = 'CdsIndex'
        CaseInsFields = 'DESCGRUPOARQUIVO'
        Fields = 'DESCGRUPOARQUIVO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsIndex'
    StoreDefs = True
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos de Arquivos'
    Colunas.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO'
      'GRPARQUIVO.DESCGRUPOARQUIVO'
      'GRPARQUIVO.SETORGRUPOS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Setor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRPARQUIVO')
    CamposChave.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '40'
      '12')
    ExibePergunta = False
    Left = 361
    Top = 1
  end
end
