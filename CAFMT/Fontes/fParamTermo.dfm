inherited frmParamTermo: TfrmParamTermo
  Left = 160
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Termo de Responsabilidade'
  ClientHeight = 275
  ClientWidth = 426
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 426
    Height = 236
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 409
      Height = 161
      Caption = 'Seleção por'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Label3: TLabel
        Left = 16
        Top = 112
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object dblkcmbLocal: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'45'#9'DESCRIÇÃO')
        LookupTable = qryLocalizacao
        LookupField = 'IDLOCALIZACAO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblkcmbLocalExit
      end
      object dblkcmbResp: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryResponsavel
        LookupField = 'IDPESSOA'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblkcmbRespExit
      end
      object dblkcmbConjunto: TwwDBLookupCombo
        Left = 16
        Top = 128
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCONJUNTO'#9'200'#9'Descrição')
        LookupTable = qryConjunto
        LookupField = 'IDCONJUNTO'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblkcmbConjuntoExit
      end
    end
    object rdgTermo: TRadioGroup
      Left = 8
      Top = 8
      Width = 409
      Height = 49
      Caption = 'Bens Ordenado por'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Tombamento'
        'Descrição')
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 426
    inherited tb97Fundo: TToolbar97
      Left = 256
      DockPos = 256
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 88
      DockPos = 88
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 459
  end
  object qryLocalizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDLOCALIZACAO'
      'FROM LOCALIZACAO '
      'WHERE (IDPESSOA = :PIDPESSOA)'
      'ORDER BY NOME')
    Params.Data = {0100010009504944504553534F410006080000000000000000000000}
    ValidateWithMask = True
    Left = 320
    Top = 80
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
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.IDPESSOA'
      'FROM PESSOA P, RESPONSAVEL R '
      'WHERE (P.IDPESSOA = R.IDRESPONSAVEL) '
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 320
    Top = 128
    object qryResponsavelNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryResponsavelIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object qryConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCONJUNTO, IDCONJUNTO'
      'FROM CONJUNTO'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      'ORDER BY DESCCONJUNTO')
    Params.Data = {0100010009504944504553534F4100030400000000000000}
    ValidateWithMask = True
    Left = 320
    Top = 176
    object qryConjuntoDESCCONJUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 200
      FieldName = 'DESCCONJUNTO'
      Origin = 'CONJUNTO.DESCCONJUNTO'
      Size = 200
    end
    object qryConjuntoIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
      Visible = False
    end
  end
end
