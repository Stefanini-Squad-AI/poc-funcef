inherited FrmPRelTotSuplemInt: TFrmPRelTotSuplemInt
  Left = 153
  Top = 265
  HelpContext = 180087
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relatório de Totais de Suplementação Integral'
  ClientHeight = 151
  ClientWidth = 524
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 524
    Height = 112
    object pnlVersao: TPanel
      Left = 1
      Top = 1
      Width = 522
      Height = 110
      Align = alClient
      TabOrder = 0
      object lblVersao: TLabel
        Left = 10
        Top = 13
        Width = 40
        Height = 13
        Caption = 'Versão'
      end
      object lblPatro: TLabel
        Left = 10
        Top = 45
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblPlano: TLabel
        Left = 10
        Top = 77
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object dblkVersao: TwwDBLookupCombo
        Left = 98
        Top = 9
        Width = 410
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryHistorico
        LookupField = 'IDHSTFOLHABENEF'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkVersaoChange
      end
      object dblkPatrocinadora: TwwDBLookupCombo
        Left = 98
        Top = 41
        Width = 271
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Patrocinadora'#9'F')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkPatrocinadoraChange
      end
      object dblkPlano: TwwDBLookupCombo
        Left = 98
        Top = 73
        Width = 271
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Plano Previdenciário'#9'F')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkPlanoChange
      end
      object ChkConsolidar: TCheckBox
        Left = 382
        Top = 43
        Width = 97
        Height = 17
        Caption = 'Consolidar'
        TabOrder = 3
      end
      object ChkConsolidaPlano: TCheckBox
        Left = 382
        Top = 75
        Width = 81
        Height = 17
        Caption = 'Consolidar'
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 112
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 352
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 131
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO  AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 8
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  P.IDPESSOA,'
      '  P.NOME'
      ''
      'FROM'
      '  PESSOA P,'
      '  PATRO PT'
      ''
      'WHERE'
      '  P.IDPESSOA = PT.IDPESSOA'
      ''
      'ORDER BY'
      '  P.NOME')
    ValidateWithMask = True
    Left = 213
    Top = 37
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV,'
      '  NOME'
      ''
      'FROM'
      '  PLANPREV ')
    ValidateWithMask = True
    Left = 277
    Top = 77
  end
end
