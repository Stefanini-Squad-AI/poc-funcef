inherited frmCadParam: TfrmCadParam
  Left = 267
  Top = 184
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 333
  ClientWidth = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 344
    Height = 247
    BorderWidth = 2
    object Label12: TLabel
      Left = 15
      Top = 101
      Width = 314
      Height = 13
      Caption = 'Indice Padrão de Atualização Monetária dos Processos'
    end
    object dblcMoeda: TwwDBLookupCombo
      Left = 15
      Top = 115
      Width = 314
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição'
        'MOESIGLA'#9'10'#9'Sigla')
      DataField = 'MOEDAPROCTRAB'
      DataSource = ds
      LookupTable = CdsMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dbrgIntegraCAP: TDBRadioGroup
      Left = 15
      Top = 145
      Width = 314
      Height = 40
      Caption = 'Faz Integração com Contas a Pagar/Receber?'
      Columns = 2
      DataField = 'FLGINTEGRACAP'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgIntegraContChange
    end
    object dbrgIntegraCont: TDBRadioGroup
      Left = 15
      Top = 10
      Width = 314
      Height = 83
      Caption = 'Faz Integração Contábil?'
      DataField = 'FLGINTEGRACONT'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgIntegraContChange
    end
    object dbrgSubConta: TDBRadioGroup
      Left = 204
      Top = 19
      Width = 118
      Height = 70
      Hint = 
        'Se optar por Sim, o sistema irá criar uma subconta contábil para' +
        ' cada contraparte dos processos'
      Caption = 'Criar Sub Conta?'
      DataField = 'FLGCRIASUBCONTA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgPercProb: TDBRadioGroup
      Left = 15
      Top = 196
      Width = 314
      Height = 40
      Caption = 'Estimativa Atual dos Objetos é Calculada com Base'
      Columns = 2
      DataField = 'FLGPERCPROB'
      DataSource = ds
      Items.Strings = (
        'No Valor Reclamado'
        'Na Estimativa Original')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgIntegraContChange
    end
  end
  inherited Dock972: TDock97
    Width = 344
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
    Top = 294
    Width = 344
    inherited tb97Fundo: TToolbar97
      Left = 172
      DockPos = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 3
      DockPos = 38
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 192
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 192
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 128
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 128
    Top = 1
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 306
    Top = 1
  end
end
