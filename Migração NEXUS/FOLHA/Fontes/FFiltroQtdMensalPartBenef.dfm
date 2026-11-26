inherited FrmFiltroQtdMensalPartBenef: TFrmFiltroQtdMensalPartBenef
  Left = 221
  Top = 160
  HelpContext = 180088
  Caption = 'Filtro do Relatório de Quantidade de Participantes por Benefício'
  ClientHeight = 236
  ClientWidth = 482
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 482
    Height = 197
    object Label1: TLabel [0]
      Left = 21
      Top = 144
      Width = 56
      Height = 13
      Caption = 'Benefício'
    end
    inherited RdoTipoFolha: TRadioGroup
      Left = 24
      Top = 245
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Top = 6
      Width = 465
      Height = 32
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 43
      Width = 465
      inherited PnlMesPagto: TPanel
        Left = 4
        Width = 457
        inherited CmbMes: TComboBox
          Left = 121
        end
        inherited SpnedAno: TSpinEdit
          Left = 274
        end
      end
      inherited PnlLoteouVersao: TPanel
        Left = 4
        Width = 457
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Width = 376
        end
      end
    end
    object dblkBeneficios: TwwDBLookupCombo
      Left = 83
      Top = 138
      Width = 388
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'45'#9'Benefício'#9'F')
      LookupTable = qryBenef
      LookupField = 'IDBENEFICIO'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblkBeneficiosChange
    end
    object chkreferencia: TCheckBox
      Left = 23
      Top = 170
      Width = 226
      Height = 17
      Caption = 'Incluir os benefícios de referência'
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 197
    Width = 482
    inherited tb97Fundo: TToolbar97
      Left = 310
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 141
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 152
    Top = 5
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 328
    Top = 5
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  BN.IDBENEFICIO, '
      '  BN.NOME '
      'FROM BENEFICIO BN'
      'ORDER BY BN.NOME ASC')
    ValidateWithMask = True
    Left = 392
    Top = 136
  end
end
