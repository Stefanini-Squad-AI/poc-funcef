inherited FrmDifInterfaceAdmPrev: TFrmDifInterfaceAdmPrev
  Caption = 'Diferenças Interface x AdmPrev'
  ClientHeight = 296
  ClientWidth = 352
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 257
    object Label1: TLabel
      Left = 37
      Top = 95
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label2: TLabel
      Left = 37
      Top = 144
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label6: TLabel
      Left = 38
      Top = 193
      Width = 72
      Height = 13
      Caption = 'Contribuição'
    end
    object grpMesAnoRef: TGroupBox
      Left = 36
      Top = 22
      Width = 273
      Height = 64
      Caption = 'Mês e Ano de Cobrança'
      TabOrder = 0
      object cmbMesRef: TComboBox
        Left = 6
        Top = 21
        Width = 187
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro '
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spedAnoRef: TSpinEdit
        Left = 198
        Top = 21
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
      end
    end
    object dblkpcmbPatro: TwwDBLookupCombo
      Left = 37
      Top = 111
      Width = 249
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnCloseUp = dblkpcmbPatroCloseUp
    end
    object dblkpcmbPlano: TwwDBLookupCombo
      Left = 37
      Top = 160
      Width = 249
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Plano Previdenciário')
      LookupTable = qryPlanPREV
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnCloseUp = dblkpcmbPlanoCloseUp
    end
    object dblkpcmbContribuicao: TwwDBLookupCombo
      Left = 38
      Top = 208
      Width = 249
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Contribuição')
      LookupTable = qryContribuicao
      LookupField = 'IDCONTRIBUICAO'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 257
    Width = 352
    inherited tb97Fundo: TToolbar97
      Left = 182
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 15
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPREV: TwwQuery
    AfterScroll = qryPlanPREVAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM PLANPREV PL, PLANPREVPATRO PP'
      'WHERE PP.IDPESSJUR = :IDPESSJUR'
      'AND PP.IDPLANOPREV = PL.IDPLANOPREV')
    ValidateWithMask = True
    Left = 304
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.*'
      'FROM CONTRIBUICAO C, CONTPREV CP'
      'WHERE CP.IDPLANOPREV = :idPlanoPrev AND'
      '               CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND'
      '               CP.FLGPAGADOR in ('#39'C'#39','#39'P'#39')'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 227
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPlanoPrev'
        ParamType = ptUnknown
      end>
  end
end
