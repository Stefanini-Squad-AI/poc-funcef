inherited frmCadastroFormaCalcImob: TfrmCadastroFormaCalcImob
  Left = 242
  Top = 300
  HelpContext = 640090
  Caption = 'Cadastro de Formas de Cálculo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid [0]
      Selected.Strings = (
        'NOME'#9'66'#9'Nome')
    end
    inherited pnlControles: TPanel [1]
      object Label1: TLabel
        Left = 16
        Top = 15
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbmDescricao
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 31
        Width = 465
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object dbmDescricao: TDBMemo
        Left = 16
        Top = 80
        Width = 465
        Height = 113
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMACALCIMOB.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FORMACALCIMOB')
    CamposChave.Strings = (
      'FORMACALCIMOB.IDFORMACALCIMOB')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 469
    Top = 4
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from formacalcimob'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 445
    Top = 4
  end
end
