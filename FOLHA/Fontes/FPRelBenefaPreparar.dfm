inherited FrmPRelBenefaPreparar: TFrmPRelBenefaPreparar
  Left = 187
  Top = 33
  HelpContext = 180083
  Caption = 'Relatório de Benefícios a Preparar'
  ClientHeight = 496
  ClientWidth = 510
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 510
    Height = 457
    object rdoTipoFolha: TRadioGroup
      Left = 1
      Top = 1
      Width = 508
      Height = 44
      Align = alTop
      Caption = 'Selecione o Tipo de Folha'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Abono'
        'Antecipação do Abono')
      ParentFont = False
      TabOrder = 0
    end
    object pnlPatroePlano: TPanel
      Left = 1
      Top = 100
      Width = 508
      Height = 161
      Align = alTop
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 250
        Top = 1
        Width = 7
        Height = 159
        Cursor = crHSplit
      end
      object pnlPatro: TPanel
        Left = 1
        Top = 1
        Width = 249
        Height = 159
        Align = alLeft
        TabOrder = 0
        object lblPatro: TLabel
          Left = 1
          Top = 1
          Width = 247
          Height = 22
          Align = alClient
          Alignment = taCenter
          Caption = 'Patrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object chklstPatro: TCheckListBox
          Left = 1
          Top = 23
          Width = 247
          Height = 135
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnClick = chklstPatroClick
        end
        object cboxPatro: TCheckBox
          Left = 8
          Top = 1
          Width = 17
          Height = 22
          TabOrder = 1
          OnClick = cboxPatroClick
        end
      end
      object pnlPlano: TPanel
        Left = 257
        Top = 1
        Width = 250
        Height = 159
        Align = alClient
        TabOrder = 1
        object lblPlano: TLabel
          Left = 1
          Top = 1
          Width = 248
          Height = 22
          Align = alClient
          Alignment = taCenter
          Caption = 'Plano Previdenciário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object chklstPlano: TCheckListBox
          Left = 1
          Top = 23
          Width = 248
          Height = 135
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnClick = chklstPlanoClick
        end
        object cboxPlano: TCheckBox
          Left = 8
          Top = 1
          Width = 17
          Height = 22
          TabOrder = 1
          OnClick = cboxPlanoClick
        end
      end
    end
    object pnlBeneficios: TPanel
      Left = 1
      Top = 261
      Width = 508
      Height = 147
      Align = alTop
      TabOrder = 2
      object lblBeneficio: TLabel
        Left = 1
        Top = 1
        Width = 506
        Height = 24
        Align = alClient
        Alignment = taCenter
        Caption = 'Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object chklstBeneficios: TCheckListBox
        Left = 1
        Top = 25
        Width = 506
        Height = 121
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnClick = chklstBeneficiosClick
      end
      object cboxBeneficios: TCheckBox
        Left = 8
        Top = 3
        Width = 17
        Height = 21
        TabOrder = 1
        OnClick = cboxBeneficiosClick
      end
    end
    object grbConsolidar: TGroupBox
      Left = 1
      Top = 45
      Width = 508
      Height = 55
      Align = alTop
      TabOrder = 3
      object lblMesRef: TLabel
        Left = 8
        Top = 12
        Width = 103
        Height = 15
        Caption = 'Mês de Referência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblAnoRef: TLabel
        Left = 154
        Top = 12
        Width = 46
        Height = 15
        Caption = 'Ano Ref.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbMes: TComboBox
        Left = 8
        Top = 27
        Width = 137
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object speAno: TSpinEdit
        Left = 154
        Top = 27
        Width = 71
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
      object rdoInformacoes: TRadioGroup
        Left = 238
        Top = 7
        Width = 254
        Height = 43
        Caption = 'Informações'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Individual'
          'Consolidado')
        ParentFont = False
        TabOrder = 2
        OnClick = rdoInformacoesClick
      end
    end
    object rdoTipoOrdem: TRadioGroup
      Left = 5
      Top = 412
      Width = 386
      Height = 40
      Caption = 'Ordenação do Beneficiário'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Matrícula'
        'Inscrição'
        'Beneficiário')
      TabOrder = 4
    end
    object grbCor: TGroupBox
      Left = 392
      Top = 412
      Width = 113
      Height = 40
      Caption = 'Escolha a Cor'
      TabOrder = 5
      object lblCor: TLabel
        Left = 8
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Cor :'
      end
      object ccbEscolheCor: TfcColorCombo
        Left = 51
        Top = 14
        Width = 37
        Height = 21
        ButtonStyle = cbsEllipsis
        Color = clWhite
        ColorDialog = dlgColor
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        DropDownCount = 8
        ReadOnly = False
        SelectedColor = clWhite
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 457
    Width = 510
    inherited tb97Fundo: TToolbar97
      Left = 338
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 451
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 142
    Top = 138
  end
  object dlgColor: TColorDialog
    Ctl3D = True
    Left = 360
    Top = 412
  end
end
