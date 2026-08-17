inherited frmParamCtaMovGrp: TfrmParamCtaMovGrp
  Left = 217
  Top = 167
  HelpContext = 540094
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parametrização Contábil'
  ClientHeight = 162
  ClientWidth = 428
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 123
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Plano de Conta'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object edPlanoConta: TEdit
      Left = 16
      Top = 32
      Width = 393
      Height = 21
      TabOrder = 0
    end
    object dblckCmbGrupo: TwwDBLookupCombo
      Left = 16
      Top = 80
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'NOME'
        'CLASSE'#9'15'#9'CÓDIGO')
      LookupTable = qryGrupo
      LookupField = 'IDGRUPO'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblckCmbGrupoExit
    end
  end
  inherited Dock971: TDock97
    Top = 123
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 252
      DockPos = 252
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
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
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE TIPO = '#39'A'#39
      '  AND FLGIMOVEL = 1'
      'ORDER BY CLASSE'
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 56
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE (PLANO = :PPLANO)')
    ValidateWithMask = True
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'PLANO.PLANO'
    end
    object qryPlanoDESCPLANO: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 20
      FieldName = 'DESCPLANO'
      Origin = 'PLANO.DESCPLANO'
    end
    object qryPlanoMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
  end
end
