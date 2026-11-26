inherited frmPedeSituacoesAnt: TfrmPedeSituacoesAnt
  Left = 226
  Top = 149
  Caption = 'Situações de Retorno'
  ClientWidth = 411
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 411
    object GroupBox1: TGroupBox
      Left = 24
      Top = 16
      Width = 361
      Height = 137
      Caption = 'Informe as situações para as quais o participante retornará :'
      TabOrder = 0
      object Label13: TLabel
        Left = 12
        Top = 94
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
      end
      object lblSitNovaPatro: TLabel
        Left = 12
        Top = 19
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
      end
      object Label2: TLabel
        Left = 12
        Top = 55
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
      end
      object dblkpcmbSitPart: TwwDBLookupCombo
        Left = 12
        Top = 107
        Width = 341
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
        LookupTable = qrySitPart
        LookupField = 'IDSITPART'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkpcmbSitFunc: TwwDBLookupCombo
        Left = 12
        Top = 32
        Width = 341
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Situação do Participante na Patrocinadora')
        LookupTable = qrySitFunc
        LookupField = 'IDSITFUNC'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
        Left = 12
        Top = 68
        Width = 341
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
        LookupTable = qrySitPlanoPrev
        LookupField = 'IDSITPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object grpEvento: TGroupBox
      Left = 24
      Top = 160
      Width = 361
      Height = 65
      Caption = 'As situações acima correspondem ao evento :'
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 20
        Width = 183
        Height = 13
        Caption = 'Evento Gerador Correspondente'
      end
      object dblkpcmbEvento: TwwDBLookupCombo
        Left = 12
        Top = 36
        Width = 341
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Evento Gerador')
        LookupTable = qryEvento
        LookupField = 'IDEVENTOGERADOR'
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
    Width = 411
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 73
      DockPos = 73
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 243
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSI' +
        'T'
      'FROM   SITFUNC SIT'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 375
    Top = 6
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM SITPART SIT'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 377
    Top = 64
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      'FROM SITPLANOPREV SIT'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 370
    Top = 102
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR,NOME'
      'FROM EVENTOGERADOR'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 374
    Top = 160
  end
end
N
