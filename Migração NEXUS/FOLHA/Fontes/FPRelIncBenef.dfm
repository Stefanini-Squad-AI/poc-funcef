inherited frmfprelincbenef: Tfrmfprelincbenef
  Left = 107
  Top = 168
  Caption = 'Relação de Inclusões de Benefícios no Mês da Folha'
  ClientHeight = 104
  ClientWidth = 580
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 580
    Height = 65
    object grpMesRef: TGroupBox
      Left = 10
      Top = 7
      Width = 559
      Height = 45
      Caption = 'Histórico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dblkfolha: TwwDBLookupCombo
        Left = 7
        Top = 15
        Width = 525
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHist
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 65
    Width = 580
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHSTFOLHABENEF,HISTORICO '
      'FROM HSTFOLHABENEF'
      'ORDER BY 1 DESC')
    ValidateWithMask = True
    Left = 236
    Top = 33
    object qryHistHISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistIDHSTFOLHABENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
  object qryMesRef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDHSTFOLHABENEF,MESREFERENCIA'
      'FROM   HSTFOLHABENEF'
      'WHERE   IDHSTFOLHABENEF=:IDHSTF')
    ValidateWithMask = True
    Left = 412
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTF'
        ParamType = ptUnknown
      end>
  end
  object qryMesAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  MAX(IDHSTFOLHABENEF),MAX(MESREFERENCIA) AS MESANTER'
      'FROM    HSTFOLHABENEF'
      'WHERE   IDHSTFOLHABENEF < :IDHSTREF'
      '        AND MESREFERENCIA < :MESREF')
    ValidateWithMask = True
    Left = 348
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
      end>
  end
end
