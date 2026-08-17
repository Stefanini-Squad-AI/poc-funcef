inherited frmCadRatAdmPlanoPatroMT: TfrmCadRatAdmPlanoPatroMT
  Left = 78
  Top = 98
  Caption = 'Cadastro do Rateio Administrativo por Plano e Patrocinadora'
  ClientHeight = 398
  ClientWidth = 566
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 566
    Height = 312
    inherited pnlMestre: TPanel
      Width = 564
      Height = 116
      object lblPlanoPrev: TLabel
        Left = 14
        Top = 61
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object lblDescricao: TLabel
        Left = 14
        Top = 16
        Width = 117
        Height = 13
        Caption = 'Descrição do Rateio'
      end
      object lblPatro: TLabel
        Left = 276
        Top = 61
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dbeDescricao: TwwDBEdit
        Left = 14
        Top = 31
        Width = 515
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcPlanoPrev: TwwDBLookupCombo
        Left = 14
        Top = 76
        Width = 257
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano Previdenciário'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPatro: TwwDBLookupCombo
        Left = 276
        Top = 76
        Width = 257
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Patrocinadora'#9'F')
        DataField = 'IDPATRO'
        DataSource = ds
        LookupTable = cdsPatro
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 117
      Width = 564
      Height = 194
      Tabs.Strings = (
        'Percentuais para Rateio')
      inherited pgctrlDetalhe: TPageControl
        Width = 466
        Height = 135
        inherited tbsDet: TTabSheet
          Caption = 'Percentuais para Rateio'
          ImageIndex = 1
          inherited pnlControlesDet: TPanel
            Width = 458
            Height = 107
            Caption = #39
            object lblPerc: TLabel
              Left = 278
              Top = 21
              Width = 80
              Height = 13
              Caption = '% para Rateio'
            end
            object lblPlanoDet: TLabel
              Left = 10
              Top = 21
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object lblPatroDet: TLabel
              Left = 10
              Top = 66
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object dbePercRateio: TDBRealEdit
              Left = 278
              Top = 36
              Width = 86
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'PERCRATEIO'
              DataSource = dsDet
            end
            object dblcPlanoPrevDet: TwwDBLookupCombo
              Left = 10
              Top = 36
              Width = 257
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano Previdenciário'#9'F')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = cdsPlanoPrevDet
              LookupField = 'IDPLANOPREV'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPatroDet: TwwDBLookupCombo
              Left = 10
              Top = 80
              Width = 257
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora'#9'F')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = cdsPatroDet
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 458
            Height = 107
            Selected.Strings = (
              'PERCRATEIO'#9'10'#9'% Rateio'
              'NOMEPLANO'#9'30'#9'Plano'
              'NOMEPATRO'#9'30'#9'Patrocinadora')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 556
      end
      inherited Dock974: TDock97
        Left = 470
        Height = 135
      end
    end
  end
  inherited Dock972: TDock97
    Width = 566
  end
  inherited Dock971: TDock97
    Top = 359
    Width = 566
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEditMSWord'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 274
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 223
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RATADMPLANPATRO.DESCRICAO'
      'PLANPREVCONTABIL.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Rateio'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RATADMPLANPATRO'
      'PLANPREVCONTABIL'
      'PESSOA')
    CamposChave.Strings = (
      'RATADMPLANPATRO.IDRATADMPLANPATRO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA= RATADMPLANPATRO.IDPATRO'
      'PLANPREVCONTABIL.IDPLANOPREV= RATADMPLANPATRO.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '50'
      '60')
    Left = 412
    Top = 18
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 338
    Top = 18
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 296
    Top = 306
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 306
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 117
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 355
    Top = 133
  end
  object cdsPlanoPrevDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 261
  end
  object cdsPatroDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 325
  end
end
