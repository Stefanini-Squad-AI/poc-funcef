inherited frmLerSituacaoPlano: TfrmLerSituacaoPlano
  Left = 298
  Top = 185
  Caption = 'Situação do Participante no Plano'
  ClientHeight = 178
  ClientWidth = 449
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 139
    object Label7: TLabel
      Left = 18
      Top = 30
      Width = 139
      Height = 13
      Caption = 'Nova Situação no Plano'
    end
    object Label12: TLabel
      Left = 18
      Top = 81
      Width = 163
      Height = 13
      Caption = 'Nova Situação na Fundação'
    end
    object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
      Left = 18
      Top = 44
      Width = 303
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
      DataField = 'IDSITPLANOPREV'
      LookupTable = qrySitPlanoPrev
      LookupField = 'IDSITPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkpcmbSitPart: TwwDBLookupCombo
      Left = 18
      Top = 95
      Width = 304
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
      DataField = 'IDSITPART'
      LookupTable = qrySitPart
      LookupField = 'IDSITPART'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 139
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 279
      DockPos = 279
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
      DockPos = 111
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 379
    Top = 11
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.IDSITPLANOPREV, S.DESCRICAO, S.FLGINTERNO'
      'FROM   SITPLANOPREV S, EVENTOXSITPLAPREV E'
      'WHERE  E.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    E.IDSITPLANOPREV  = S.IDSITPLANOPREV'
      'ORDER BY S.DESCRICAO')
    ValidateWithMask = True
    Left = 381
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      '('
      
        'SELECT 1 AS TIPO, '#39'<Manter Situação Atual>'#39' AS DESCRICAO, -1 AS ' +
        'IDSITPART, '#39'XX'#39' AS FLGINTERNO FROM DUAL'
      'UNION'
      'SELECT 2 AS TIPO, SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM   SITPART SIT , EVENTOXSITPART E'
      'WHERE  SIT.IDSITPART = E.IDSITPART'
      'AND    E.IDEVENTOGERADOR = :IDEVENTO'
      ')'
      'ORDER BY TIPO, DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 381
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
end
