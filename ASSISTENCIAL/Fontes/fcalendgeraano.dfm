inherited frmCalendGeraAno: TfrmCalendGeraAno
  Left = 48
  Top = 155
  Caption = 'Gerar Datas do Calendário'
  ClientHeight = 392
  ClientWidth = 731
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 353
    object Label1: TLabel
      Left = 18
      Top = 12
      Width = 61
      Height = 13
      Caption = 'Calendário'
    end
    object Label12: TLabel
      Left = 418
      Top = 12
      Width = 23
      Height = 13
      Caption = 'Ano'
    end
    object dblkpcmbCalend: TwwDBLookupCombo
      Left = 18
      Top = 28
      Width = 295
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Calendário')
      LookupTable = qryCalendario
      LookupField = 'IDCALENDARIO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object Panel1: TPanel
      Left = 5
      Top = 64
      Width = 721
      Height = 284
      Align = alBottom
      TabOrder = 1
      object Label18: TLabel
        Left = 1
        Top = 1
        Width = 719
        Height = 24
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Valores Padrão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 25
        Width = 719
        Height = 258
        ActivePage = tbsAT
        Align = alClient
        TabOrder = 0
        object tbsAT: TTabSheet
          Caption = 'Ativos'
          object PageControl2: TPageControl
            Left = 0
            Top = 8
            Width = 711
            Height = 222
            ActivePage = tbsCobranca
            Align = alBottom
            TabOrder = 0
            object tbsCobranca: TTabSheet
              Caption = 'Cobrança'
              object pnlNormalAT: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label4: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox1: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedNormalAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilNormalAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntNormalAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesNormalAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAtrasoAT: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label5: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança em Atraso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox3: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAtrasoAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAtrasoAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAtrasoAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAtrasoAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlDevolucaoAT: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label7: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento da Devolução'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox4: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label8: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedDevolucaoAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilDevolucaoAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntDevolucaoAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesDevolucaoAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
            object tbsBenefAT: TTabSheet
              Caption = 'Benefício'
              object pnlAntBenefAT: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label9: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox2: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label10: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntBenefAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntBenefAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntBenefAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntBenefAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlBenefAT: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label11: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox5: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label13: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedBenefAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilBenefAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntBenefAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesBenefAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAbonoAT: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label14: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox6: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label15: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAbonoAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAbonoAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAbonoAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAbonoAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAntAbonoAT: TPanel
                Left = 352
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Label16: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox7: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label17: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntAbonoAT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntAbonoAT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntAbonoAT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntAbonoAT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tbsMA: TTabSheet
          Caption = 'Mantidos'
          object PageControl3: TPageControl
            Left = 0
            Top = 8
            Width = 711
            Height = 222
            ActivePage = tbsCobMA
            Align = alBottom
            TabOrder = 0
            object tbsCobMA: TTabSheet
              Caption = 'Cobrança'
              object pnlNormalMA: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label2: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox8: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label19: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedNormalMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilNormalMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntNormalMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesNormalMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAtrasoMA: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label20: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança em Atraso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox9: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label21: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAtrasoMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAtrasoMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAtrasoMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAtrasoMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlDevolucaoMA: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label22: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento da Devolução'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox10: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label23: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedDevolucaoMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilDevolucaoMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntDevolucaoMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesDevolucaoMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
            object tbsBenefMA: TTabSheet
              Caption = 'Benefício'
              object pnlAntBenefMA: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label24: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox11: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label25: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntBenefMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntBenefMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntBenefMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntBenefMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlBenefMA: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label26: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox12: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label27: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedBenefMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilBenefMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntBenefMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesBenefMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAbonoMA: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label28: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox13: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label29: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAbonoMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAbonoMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAbonoMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAbonoMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAntAbonoMA: TPanel
                Left = 352
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Label30: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox14: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label31: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntAbonoMA: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntAbonoMA: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntAbonoMA: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntAbonoMA: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tbsMP: TTabSheet
          Caption = 'Mantidos Parciais'
          object PageControl4: TPageControl
            Left = 0
            Top = 8
            Width = 711
            Height = 222
            ActivePage = tbsCobMP
            Align = alBottom
            TabOrder = 0
            object tbsCobMP: TTabSheet
              Caption = 'Cobrança'
              object pnlNormalMP: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label32: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox15: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label33: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedNormalMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilNormalMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntNormalMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesNormalMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAtrasoMP: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label34: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança em Atraso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox16: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label35: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAtrasoMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAtrasoMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAtrasoMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAtrasoMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlDevolucaoMP: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label36: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento da Devolução'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox17: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label37: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedDevolucaoMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilDevolucaoMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntDevolucaoMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesDevolucaoMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
            object tbsBenefMP: TTabSheet
              Caption = 'Benefício'
              object pnlAntBenfMP: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label38: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox18: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label39: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntBenefMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntBenefMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntBenefMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntBenefMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlBenefMP: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label40: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox19: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label41: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedBenefMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilBenefMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntBenefMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesBenefMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAbonoMP: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label42: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox20: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label43: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAbonoMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAbonoMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAbonoMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAbonoMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAntAbonoMP: TPanel
                Left = 352
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Label44: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox21: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label45: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntAbonoMP: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntAbonoMP: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntAbonoMP: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntAbonoMP: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tbsAS: TTabSheet
          Caption = 'Assistido'
          object PageControl5: TPageControl
            Left = 0
            Top = 8
            Width = 711
            Height = 222
            ActivePage = tbsCobAS
            Align = alBottom
            TabOrder = 0
            object tbsCobAS: TTabSheet
              Caption = 'Cobrança'
              object pnlNormalAS: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label46: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox22: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label47: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedNormalAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilNormalAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntNormalAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesNormalAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAtrasoAS: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label48: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança em Atraso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox23: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label49: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAtrasoAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAtrasoAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAtrasoAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAtrasoAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlDevolucaoAS: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label50: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento da Devolução'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox24: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label51: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedDevolucaoAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilDevolucaoAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntDevolucaoAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesDevolucaoAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
            object tbsBenefAS: TTabSheet
              Caption = 'Benefício'
              object pnlAntBenefAS: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label52: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox25: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label53: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntBenefAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntBenefAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntBenefAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntBenefAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlBenefAS: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label54: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox26: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label55: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedBenefAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilBenefAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntBenefAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesBenefAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAbonoAS: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label56: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox27: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label57: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAbonoAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAbonoAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAbonoAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAbonoAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAntAbonoAS: TPanel
                Left = 352
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Label58: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox28: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label59: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntAbonoAS: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntAbonoAS: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntAbonoAS: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntAbonoAS: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tbsPT: TTabSheet
          Caption = 'Patrocinadora'
          object PageControl6: TPageControl
            Left = 0
            Top = 8
            Width = 711
            Height = 222
            ActivePage = tbsCobPT
            Align = alBottom
            TabOrder = 0
            object tbsCobPT: TTabSheet
              Caption = 'Cobrança'
              object pnlNormalPT: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label60: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança Normal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox29: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label61: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedNormalPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilNormalPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntNormalPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesNormalPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAtrasoPT: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label62: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Recebimento da Cobrança em Atraso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox30: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label63: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAtrasoPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAtrasoPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAtrasoPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAtrasoPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlDevolucaoPT: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label64: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento da Devolução'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox31: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label65: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedDevolucaoPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilDevolucaoPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntDevolucaoPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesDevolucaoPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
            object tbsBenefPT: TTabSheet
              Caption = 'Benefício'
              object pnlAntBenefPT: TPanel
                Left = 0
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label66: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox32: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label67: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntBenefPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntBenefPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntBenefPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntBenefPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlBenefPT: TPanel
                Left = 0
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object Label68: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox33: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label69: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedBenefPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilBenefPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntBenefPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesBenefPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAbonoPT: TPanel
                Left = 352
                Top = 20
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label70: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox34: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label71: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAbonoPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAbonoPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAbonoPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAbonoPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
              object pnlAntAbonoPT: TPanel
                Left = 352
                Top = 107
                Width = 350
                Height = 85
                BevelOuter = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Label72: TLabel
                  Left = 1
                  Top = 1
                  Width = 348
                  Height = 17
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Dia de Antecipação de Pagamento de Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object GroupBox35: TGroupBox
                  Left = 6
                  Top = 24
                  Width = 60
                  Height = 57
                  TabOrder = 0
                  object Label73: TLabel
                    Left = 6
                    Top = 9
                    Width = 20
                    Height = 13
                    Caption = 'Dia'
                  end
                  object spedAntAbonoPT: TSpinEdit
                    Left = 6
                    Top = 21
                    Width = 40
                    Height = 22
                    MaxValue = 31
                    MinValue = 1
                    TabOrder = 0
                    Value = 1
                  end
                end
                object rgrpUtilAntAbonoPT: TRadioGroup
                  Left = 160
                  Top = 24
                  Width = 75
                  Height = 57
                  Caption = ' Dia Útil ? '
                  ItemIndex = 0
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 1
                end
                object rgrpAntAntAbonoPT: TRadioGroup
                  Left = 240
                  Top = 24
                  Width = 102
                  Height = 57
                  Caption = ' Utilizar dia útil '
                  ItemIndex = 0
                  Items.Strings = (
                    'Anterior'
                    'Posterior')
                  TabOrder = 2
                end
                object rgrpMesAntAbonoPT: TRadioGroup
                  Left = 70
                  Top = 24
                  Width = 85
                  Height = 57
                  Caption = ' Mês '
                  ItemIndex = 1
                  Items.Strings = (
                    'Anterior'
                    'Corrente'
                    'Posterior')
                  TabOrder = 3
                end
              end
            end
          end
        end
      end
    end
    object spedAnoRef: TSpinEdit
      Left = 418
      Top = 28
      Width = 55
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 0
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 561
      DockPos = 565
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 394
      DockPos = 398
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryCalendario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCALENDARIO, NOME'
      'FROM'
      ' CALENDPREV'
      'ORDER BY UPPER(NOME)')
    ValidateWithMask = True
    Left = 676
    Top = 6
    object qryCalendarioIDCALENDARIO: TFloatField
      FieldName = 'IDCALENDARIO'
    end
    object qryCalendarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryInsCalendDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CALENDDATAS'
      '(IDCALENDARIO, FLGINTERNO, ANOMESREF,'
      ' DATACOBNORMAL, DATACOBATRASO, DATACOBDEVOLUCAO,'
      ' DATAPAGBENEF, DATAPAGABONO, DATAPAGANTBENEF,'
      ' DATAPAGANTABONO)'
      'VALUES'
      '(:IDCALENDARIO, :FLGINTERNO, :ANOMESREF,'
      ' :DATACOBNORMAL, :DATACOBATRASO, :DATACOBDEVOLUCAO,'
      ' :DATAPAGBENEF, :DATAPAGABONO, :DATAPAGANTBENEF,'
      ' :DATAPAGANTABONO)')
    ValidateWithMask = True
    Left = 595
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCALENDARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGINTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOBNORMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOBATRASO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOBDEVOLUCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGABONO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGANTBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGANTABONO'
        ParamType = ptUnknown
      end>
  end
  object qryConsCalendDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCALENDARIO, ANOMESREF, FLGINTERNO'
      'FROM'
      ' CALENDDATAS'
      'WHERE'
      ' (IDCALENDARIO    = :IDCALENDARIO) AND'
      ' (SUBSTR(ANOMESREF,1,4) = :ANO)')
    ValidateWithMask = True
    Left = 490
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCALENDARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANO'
        ParamType = ptUnknown
      end>
    object qryConsCalendDatasIDCALENDARIO: TFloatField
      FieldName = 'IDCALENDARIO'
      Origin = '"CM.CALENDDATAS".IDCALENDARIO'
    end
  end
end
