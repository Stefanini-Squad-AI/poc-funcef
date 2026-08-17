inherited frmCadParam: TfrmCadParam
  Left = 170
  Top = 39
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 508
  ClientWidth = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 485
    Height = 422
    BorderWidth = 2
    object gbxAvalMax: TGroupBox
      Left = 5
      Top = 17
      Width = 300
      Height = 50
      Caption = ' Valor Máximo das Avaliações Escalonadas '
      TabOrder = 0
      object dbspeAvalMax: TwwDBSpinEdit
        Left = 107
        Top = 19
        Width = 86
        Height = 21
        Increment = 1
        DataField = 'VALMAXAVALTRN'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
    object gbxFatorAvalAlunos: TDBRadioGroup
      Left = 5
      Top = 88
      Width = 300
      Height = 50
      Caption = ' Avaliação por Fatores Também para Alunos? '
      Columns = 2
      DataField = 'FLGAVALALUNO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgFatorCurso: TDBRadioGroup
      Left = 5
      Top = 159
      Width = 300
      Height = 50
      Caption = ' Fatores de Avaliação Variam para Cada Curso? '
      Columns = 2
      DataField = 'FLGCURSOXAVAL'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
    end
    object grpEmail: TGroupBox
      Left = 8
      Top = 224
      Width = 473
      Height = 193
      Caption = 'Aviso de Cobrança do Comprovante de Pagamento de Cursos'
      TabOrder = 3
      object Label1: TLabel
        Left = 216
        Top = 33
        Width = 149
        Height = 13
        Caption = 'Dia do Aviso da Cobrança'
      end
      object Label2: TLabel
        Left = 8
        Top = 81
        Width = 166
        Height = 13
        Caption = 'Texto de E-Mail de Cobrança'
      end
      object ckbAtivaAviso: TDBCheckBox
        Left = 11
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Ativa o Aviso'
        DataField = 'flgavisoativo'
        DataSource = ds
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object mmObservacaoMail: TDBMemo
        Left = 2
        Top = 96
        Width = 469
        Height = 95
        Align = alBottom
        DataField = 'corpoemail'
        DataSource = ds
        MaxLength = 2000
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object edtDiaCobranca: TwwDBSpinEdit
        Left = 371
        Top = 27
        Width = 46
        Height = 21
        Increment = 1
        MaxValue = 31
        DataField = 'diaavisocobranca'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 485
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 469
    Width = 485
    inherited tb97Fundo: TToolbar97
      Left = 313
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 144
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 453
    Top = 28
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 453
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    Left = 318
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 453
    Top = 73
  end
end
