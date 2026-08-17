inherited frmCadRegrasContabMT: TfrmCadRegrasContabMT
  Left = 161
  Top = 184
  Caption = 'Cadastro de Regras Contábeis'
  ClientHeight = 322
  ClientWidth = 552
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 236
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 89
      Height = 13
      Caption = 'Nome da Regra'
      FocusControl = dbeREGDESC
    end
    object dbeREGDESC: TDBEdit
      Left = 10
      Top = 25
      Width = 326
      Height = 21
      DataField = 'REGDESC'
      DataSource = ds
      TabOrder = 0
    end
    object dbmREGSCRIPT: TDBMemo
      Left = 10
      Top = 65
      Width = 326
      Height = 121
      DataField = 'REGSCRIPT'
      DataSource = ds
      TabOrder = 1
    end
    object btnChecaScript: TBitBtn
      Left = 15
      Top = 195
      Width = 111
      Height = 25
      Caption = 'Checar Sintaxe'
      TabOrder = 2
      OnClick = btnChecaScriptClick
    end
    object DBCheckBox1: TDBCheckBox
      Left = 360
      Top = 25
      Width = 97
      Height = 17
      Caption = 'Ativa'
      DataField = 'REGATIVA'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object ScriptControl: TScriptControl
      Left = 151
      Top = 192
      Width = 32
      Height = 32
      ControlData = {
        2143341208000000ED030000ED030000D2F1594E010000002400000010270000
        0100080056004200530063007200690070007400}
    end
  end
  inherited Dock972: TDock97
    Width = 552
  end
  inherited Dock971: TDock97
    Top = 283
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 90
    Top = 287
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 374
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 287
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 432
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 332
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REGRASCONTAB.REGDESC')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'REGRASCONTAB')
    CamposChave.Strings = (
      'REGRASCONTAB.REGCODIGO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 272
    Top = 7
  end
end
