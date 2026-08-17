inherited FrmDuplicaRegrasTabuaServico: TFrmDuplicaRegrasTabuaServico
  Left = 432
  Top = 373
  Caption = 'Duplica as regra da Tábua de Serviço'
  ClientHeight = 288
  ClientWidth = 576
  Constraints.MaxHeight = 315
  Constraints.MaxWidth = 584
  Constraints.MinHeight = 315
  Constraints.MinWidth = 584
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 249
    object grpDe: TGroupBox
      Left = 6
      Top = 3
      Width = 565
      Height = 116
      Anchors = [akLeft, akTop, akRight]
      Caption = ' De '
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 20
        Width = 106
        Height = 13
        Caption = 'Rotina de Cálculo:'
      end
      object Label2: TLabel
        Left = 12
        Top = 64
        Width = 163
        Height = 13
        Caption = 'Versão da Tábua de Serviço'
      end
      object edRotina: TEdit
        Left = 12
        Top = 35
        Width = 542
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object edVersao: TEdit
        Left = 12
        Top = 79
        Width = 542
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
    end
    object grpPara: TGroupBox
      Left = 5
      Top = 124
      Width = 565
      Height = 116
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Para '
      TabOrder = 1
      object Label3: TLabel
        Left = 12
        Top = 64
        Width = 163
        Height = 13
        Caption = 'Versão da Tábua de Serviço'
      end
      object Label4: TLabel
        Left = 12
        Top = 20
        Width = 106
        Height = 13
        Caption = 'Rotina de Cálculo:'
      end
      object dblkpVersao: TCMDBLookupCombo
        Left = 12
        Top = 79
        Width = 542
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_VERSAO_COMUTACAO'#9'100'#9'DS_VERSAO_COMUTACAO'#9'F')
        DataField = 'CD_GRUPO_FORMULA'
        DataSource = ds
        LookupTable = qryVersaoTabuaServico
        LookupField = 'SQ_VERSAO_COMUTACAO'
        Options = [loColLines, loRowLines]
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkpRotina: TCMDBLookupCombo
        Left = 12
        Top = 35
        Width = 542
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_GRUPO_FORMULA'#9'80'#9'DS_GRUPO_FORMULA'#9'F')
        DataField = 'SQ_VERSAO_COMUTACAO'
        DataSource = ds
        LookupTable = qryRotinaCalculo
        LookupField = 'CD_GRUPO_FORMULA'
        Options = [loColLines, loRowLines]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblkpRotinaChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 249
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 254
  end
  object ds: TwwDataSource
    Left = 42
    Top = 255
  end
  object qryVersaoTabuaServico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SQ_VERSAO_COMUTACAO, DS_VERSAO_COMUTACAO '
      'FROM FI_TABUA_COMUTACAO'
      'WHERE CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 108
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end>
    object qryVersaoTabuaServicoDS_VERSAO_COMUTACAO: TStringField
      DisplayWidth = 100
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object qryVersaoTabuaServicoSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
  end
  object qryRotinaCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT G.CD_GRUPO_FORMULA, G.DS_GRUPO_FORMULA '
      'FROM FI_GRUPO_FORMULA G,'
      '     FI_TABUA_COMUTACAO T'
      'WHERE G.CD_GRUPO_FORMULA = T.CD_GRUPO_FORMULA '
      '  AND T.IR_VERSAO_COMUTACAO <> '#39'P'#39' ')
    ValidateWithMask = True
    Left = 81
    Top = 255
    object qryRotinaCalculoDS_GRUPO_FORMULA: TStringField
      DisplayWidth = 80
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object qryRotinaCalculoCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.CD_GRUPO_FORMULA'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 137
    Top = 255
  end
end
