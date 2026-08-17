inherited frmEscolhaFundacao: TfrmEscolhaFundacao
  Left = 238
  Top = 147
  Caption = 'Escolha a Fundação que deseja trabalhar ... '
  ClientHeight = 148
  ClientWidth = 453
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 453
    Height = 109
    object Label1: TLabel
      Left = 27
      Top = 33
      Width = 169
      Height = 13
      Caption = 'Trabalhar com a Fundação ...'
    end
    object dblkpcmbFundacao: TwwDBLookupCombo
      Left = 27
      Top = 51
      Width = 394
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Fundação'#9'F')
      LookupTable = qryFundacao
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 283
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 116
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 21
    Top = 247
  end
  object qryFundacao: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, FUNDACAO F'
      'WHERE P.IDPESSOA = F.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 369
    Top = 65529
    object qryFundacaoNOME: TStringField
      DisplayLabel = 'Fundação'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFundacaoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
end
