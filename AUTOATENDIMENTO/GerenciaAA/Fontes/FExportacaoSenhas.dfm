inherited frmExportacaoSenhas: TfrmExportacaoSenhas
  Left = 153
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exportação de Senhas'
  ClientHeight = 433
  ClientWidth = 559
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 559
    Height = 394
    object grpOpcoesExportacao: TGroupBox
      Left = 21
      Top = 16
      Width = 516
      Height = 161
      Caption = 'Exportar senhas...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rbTodos: TRadioButton
        Left = 8
        Top = 21
        Width = 233
        Height = 17
        Caption = '...para todos os registros.'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbTodosClick
      end
      object rbLOGINPESSOAL: TRadioButton
        Left = 8
        Top = 47
        Width = 105
        Height = 17
        Caption = '...para o login:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rbLOGINPESSOALClick
      end
      object edtLOGINPESSOAL: TEdit
        Left = 114
        Top = 45
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object rbQuery: TRadioButton
        Left = 8
        Top = 72
        Width = 305
        Height = 17
        Caption = '...para os login'#39's retornados pela seguinte query:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = rbQueryClick
      end
      object memQuery: TMemo
        Left = 39
        Top = 88
        Width = 466
        Height = 57
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object rgrpTipoArquivo: TRadioGroup
      Left = 21
      Top = 184
      Width = 516
      Height = 49
      Caption = 'Tipo do Arquivo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Planilha do Microsoft Excel'
        'Arquivo texto')
      TabOrder = 1
      OnClick = rgrpTipoArquivoClick
    end
    object ProgressBar: TProgressBar
      Left = 21
      Top = 358
      Width = 516
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 3
    end
    object TGroupBox
      Left = 21
      Top = 244
      Width = 516
      Height = 104
      Caption = 'Dados Exportados (além de login e senha)'
      TabOrder = 2
      object chkIdPessoa: TCheckBox
        Left = 8
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Id. Pessoa'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkNome: TCheckBox
        Left = 8
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Nome'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkLogradouro: TCheckBox
        Left = 8
        Top = 80
        Width = 97
        Height = 17
        Caption = 'Logradouro'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object chkNumero: TCheckBox
        Left = 143
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Número'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkComplemento: TCheckBox
        Left = 143
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Complemento'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chkBairro: TCheckBox
        Left = 143
        Top = 80
        Width = 97
        Height = 17
        Caption = 'Bairro'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object chkCidade: TCheckBox
        Left = 284
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Cidade'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object chkEstado: TCheckBox
        Left = 284
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Estado'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object chkCEP: TCheckBox
        Left = 284
        Top = 80
        Width = 97
        Height = 17
        Caption = 'CEP'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object chkNumSeed: TCheckBox
        Left = 404
        Top = 24
        Width = 103
        Height = 17
        Caption = 'Número SEED'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 559
    inherited tb97Fundo: TToolbar97
      Left = 389
      DockPos = 469
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 0
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 222
      DockPos = 302
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 475
    Top = 59
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dlgSalvar: TSaveDialog
    Left = 509
    Top = 24
  end
  object cdsWebAcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 507
    Top = 55
  end
  object cdsWebConfiguracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 472
    Top = 24
    object cdsWebConfiguracaoIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
    object cdsWebConfiguracaoNOMEBASE: TStringField
      FieldName = 'NOMEBASE'
      Size = 10
    end
    object cdsWebConfiguracaoSENHAMIN: TFloatField
      FieldName = 'SENHAMIN'
    end
    object cdsWebConfiguracaoSENHAMAX: TFloatField
      FieldName = 'SENHAMAX'
    end
    object cdsWebConfiguracaoSENHACASE: TStringField
      FieldName = 'SENHACASE'
      Size = 1
    end
    object cdsWebConfiguracaoSENHACRIPTO: TStringField
      FieldName = 'SENHACRIPTO'
      Size = 1
    end
    object cdsWebConfiguracaoSENHAMASTER: TStringField
      FieldName = 'SENHAMASTER'
    end
    object cdsWebConfiguracaoLOGINMASTER: TStringField
      FieldName = 'LOGINMASTER'
    end
  end
end
