inherited FrmParamRelResRubrica: TFrmParamRelResRubrica
  Left = 165
  Top = 57
  HelpContext = 180107
  Caption = 'Resumo de Rubricas'
  ClientHeight = 488
  ClientWidth = 408
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 449
    inherited RdoTipoFolha: TRadioGroup
      Left = 1
      Top = 1
      Width = 406
      Align = alTop
    end
    inherited RdoTipoFiltro: TRadioGroup
      Left = 1
      Top = 34
      Width = 406
      Align = alTop
    end
    inherited PnlPreviaouEfetivada: TPanel
      Left = 1
      Top = 67
      Width = 406
      Height = 184
      Align = alTop
      inherited PnlMesPagto: TPanel
        Left = 2
        Top = 147
        Width = 402
        Align = alBottom
        inherited CmbMes: TComboBox
          OnChange = CmbMesChange
        end
        inherited SpnedAno: TSpinEdit
          OnChange = CmbMesChange
        end
      end
      inherited PnlLoteouVersao: TPanel
        Left = 2
        Top = 2
        Width = 402
        Height = 145
        Align = alClient
        inherited LblLoteouVersao: TLabel
          Left = 1
          Top = 1
          Width = 400
          Align = alTop
          Alignment = taCenter
          Layout = tlCenter
        end
        object ChkLstLoteouVersao: TCheckListBox [1]
          Left = 1
          Top = 14
          Width = 390
          Height = 104
          OnClickCheck = ChkLstLoteouVersaoClickCheck
          ItemHeight = 13
          TabOrder = 1
        end
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Left = 337
          Width = 24
          Height = 19
          Visible = False
        end
        object ChkConsolidaLoteouVersao: TCheckBox
          Left = 67
          Top = 123
          Width = 255
          Height = 17
          Caption = 'Mostra Relatório Consolidado por Versão'
          TabOrder = 2
        end
      end
    end
    object GrpPatrocinadora: TGroupBox
      Left = 1
      Top = 251
      Width = 406
      Height = 43
      Align = alTop
      Caption = ' Patrocinadora '
      TabOrder = 3
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 271
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbcmbPatrocinadoraChange
      end
      object ChkConsolidar: TCheckBox
        Left = 295
        Top = 16
        Width = 86
        Height = 17
        Caption = 'Consolidar'
        TabOrder = 1
      end
    end
    object GrpPlano: TGroupBox
      Left = 1
      Top = 294
      Width = 406
      Height = 96
      Align = alTop
      Caption = ' Plano...'
      TabOrder = 4
      object lblPlanoPrev: TLabel
        Left = 10
        Top = 17
        Width = 82
        Height = 13
        Caption = 'Previdenciário'
      end
      object lblPlanoContab: TLabel
        Left = 10
        Top = 56
        Width = 47
        Height = 13
        Caption = 'Contábil'
      end
      object dbcmbPlano: TwwDBLookupCombo
        Left = 10
        Top = 69
        Width = 271
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbcmbPlanoChange
      end
      object chkConsolidaPlano: TCheckBox
        Left = 295
        Top = 71
        Width = 86
        Height = 17
        Caption = 'Consolidar'
        TabOrder = 1
      end
      object dbcmbPlanoPrev: TwwDBLookupCombo
        Left = 10
        Top = 29
        Width = 271
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F')
        LookupTable = qryPlanoPrev
        LookupField = 'IDPLANOPREV'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbcmbPlanoPrevChange
      end
    end
    object RdoTipoOrdem: TRadioGroup
      Left = 5
      Top = 400
      Width = 204
      Height = 41
      Caption = 'Ordenação da Rubrica'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Código'
        'Descrição')
      TabOrder = 5
    end
    object chkMostraEstornado: TCheckBox
      Left = 216
      Top = 412
      Width = 180
      Height = 17
      Caption = 'Mostra Pessoas Estornadas'
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 236
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 395
  end
  inherited qryPreviaouEfetivada: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDLOTE,'
      '  DESCRICAO AS LOTE'
      ''
      'FROM'
      '  CTRLINTERFACE'
      ''
      'WHERE'
      '  FLGPREPARADO = 1'
      ' ')
    Left = 272
    Top = 122
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Top = 122
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO'
      'WHERE (P.IDPESSOA = PATRO.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 86
    Top = 179
    object qryPatroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREVCONTABIL'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 190
    Top = 176
    object qryPlanoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
      Visible = False
    end
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 23
    Top = 177
  end
end
