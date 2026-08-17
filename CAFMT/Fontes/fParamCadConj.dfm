inherited frmParamCadConj: TfrmParamCadConj
  Left = 310
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Conjuntos - Rateio de Custos'
  ClientHeight = 187
  ClientWidth = 353
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 148
    object Label8: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label5: TLabel
      Left = 16
      Top = 80
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object cmbLocalizacao: TwwDBLookupCombo
      Left = 16
      Top = 40
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'45'#9'Descrição')
      LookupTable = qryLocalizacao
      LookupField = 'IDLOCALIZACAO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = cmbLocalizacaoExit
    end
    object cmbResponsavel: TwwDBLookupCombo
      Left = 16
      Top = 96
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      LookupTable = qryResponsavel
      LookupField = 'IDRESPONSAVEL'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = cmbResponsavelExit
    end
  end
  inherited Dock971: TDock97
    Top = 148
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 176
      DockPos = 176
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 8
      DockPos = 8
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 427
    Top = 451
  end
  object qryLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 264
    Top = 16
    object qryLocalizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryLocalizacaoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.LOCALIZACAO".IDLOCALIZACAO'
    end
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, R.IDRESPONSAVEL'
      'FROM PESSOA P,'
      '     RESPONSAVEL R'
      'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 264
    Top = 72
    object qryResponsavelNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.RESPONSAVEL".IDRESPONSAVEL'
    end
  end
end
