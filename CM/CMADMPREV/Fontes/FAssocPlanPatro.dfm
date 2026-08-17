inherited frmAssocPlanPatro: TfrmAssocPlanPatro
  Left = 137
  Top = 75
  HelpContext = 160128
  Caption = 'Associação de Plano Previdenciário por Patrocinadora'
  ClientHeight = 445
  ClientWidth = 613
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 172
    Width = 613
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 611
      Height = 232
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbPlanoNao: TLabel
        Left = 321
        Top = 6
        Width = 223
        Height = 49
        AutoSize = False
        Caption = 'Planos Previdenciários não Associados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object sbtnAssocia: TSpeedButton
        Left = 285
        Top = 80
        Width = 25
        Height = 26
        Hint = 'Associar plano selecionado'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 285
        Top = 110
        Width = 25
        Height = 26
        Hint = 'Associar todos os planos'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 285
        Top = 140
        Width = 25
        Height = 26
        Hint = 'Desativar plano selecionado'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 285
        Top = 170
        Width = 25
        Height = 25
        Hint = 'Desativar todos os planos'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object lblPlanPatro: TLabel
        Left = 6
        Top = 7
        Width = 283
        Height = 52
        AutoSize = False
        Caption = 'Planos Previdenciários da Patriconadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object dblkplistPlano: TDBLookupListBox
        Left = 321
        Top = 60
        Width = 277
        Height = 160
        KeyField = 'IDPLANOPREV'
        ListField = 'NOME'
        ListSource = dsPlano
        TabOrder = 0
        OnDragDrop = dblkplistPlanoDragDrop
        OnDragOver = dblkplistPlanoDragOver
        OnMouseDown = dblkplistPlanoMouseDown
      end
      object dbgrdPlanPatro: TwwDBGrid
        Left = 6
        Top = 60
        Width = 268
        Height = 160
        Hint = 'Clique no botão da direita para Ativar/Desativar Plano'
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        DataSource = dsPlanPatro
        Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        PopupMenu = pmenu
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgrdPlanPatroCalcCellColors
        OnDragDrop = dbgrdPlanPatroDragDrop
        OnDragOver = dbgrdPlanPatroDragOver
        OnMouseDown = dbgrdPlanPatroMouseDown
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 613
    inherited tb97Fundo: TToolbar97
      Left = 436
      DockPos = 436
      inherited sep1: TToolbarSep97
        Left = 77
      end
      inherited bbtnSair: TBitBtn
        Width = 77
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 79
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 613
    Height = 172
    Align = alTop
    TabOrder = 0
    object lbPatro: TLabel
      Left = 6
      Top = 3
      Width = 108
      Height = 19
      Caption = 'Patrocinadoras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object dbgrdPatro: TDBGrid
      Left = 9
      Top = 33
      Width = 589
      Height = 136
      DataSource = dsPatro
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'RAZAOSOCIAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Fantasia'
          Visible = True
        end>
    end
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 60
    Top = 64
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 30
    Top = 64
  end
  object dsPlanPatro: TwwDataSource
    DataSet = qryPlanPatro
    Left = 28
    Top = 275
  end
  object qryPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.IDPESSJUR,'
      'PP.IDPLANOPREV,'
      'PP.IDCALENDARIO,'
      'PP.IDREGRAVALIDAAFA,'
      'PP.FLGATIVO,'
      'PP.IDREGRAMANUTENCAO,'
      'PP.IDREGRAMANUTPARC,'
      'PP.IDREGRATEMPOCONT,'
      'PP.NUMCONTRATO,'
      'PP.DATAINSC,'
      'PP.IDREGRASALAUXDOE,'
      'PP.IDRGSALMANUT,'
      'PP.IDRGSALMANUTPART,'
      'PP.IDREGRAMANUTSALD,'
      'PP.FLGUSARUBRICA,'
      'PP.FLGRECALCMP,'
      'PP.PLANO,'
      'PP.PLACONTALIQFLHBEN,'
      'PP.FLGRECECONTPATRO,'
      'PP.IDRGELEGAFAST,'
      'PP.IDRGENQUADRAMENTO,'
      'PP.TRGDTINCLUSAO,'
      'PP.TRGUSERINCLUSAO,'
      'PL.NOME,'
      'PP.FLGTODASRUBMANUT'
      'FROM   PLANPREVPATRO PP, PLANPREV PL'
      'WHERE  PP.IDPESSJUR = :IDPESSOA AND'
      '       PP.IDPLANOPREV  = PL.IDPLANOPREV'
      'ORDER BY PL.NOME'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGATIVO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 99
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 2
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '
      'PL.IDPLANOPREV,'
      'PL.RECPAGIRRF,'
      'PL.IDFAVORECIDOIRRF,'
      'PL.RECPAG,'
      'PL.IDEMPRESAPROPIRRF,'
      'PL.IDEMPRESAPROP,'
      'PL.CODTIPRECDESIRRF,'
      'PL.CODTIPRECDES,'
      'PL.IDREGRACOBATRASO,'
      'PL.TIPCODIGOIRRF,'
      'PL.CODPORTFORMAIRRF,'
      'PL.IDFUNDACAO,'
      'PL.UNIDNEGOCIOIRRF,'
      'PL.CODCENTRESPIRRF,'
      'PL.CODSUBCONTAIRRF,'
      'PL.CODTIPDOCIRRF,'
      'PL.CODTIPDOC,'
      'PL.CODCENTCUSTDIRRF,'
      'PL.IDEMPRESAIRRF,'
      'PL.CODCENTCUSTCIRRF,'
      'PL.IDREGRACANCELAME,'
      'PL.NOME,'
      'PL.PLACONTADIRRF,'
      'PL.IDREGRAADMISSAO,'
      'PL.PLANOIRRF,'
      'PL.PLACONTACIRRF,'
      'PL.IDREGRADESISTENC,'
      'PL.FLGAUTONUMINSC,'
      'PL.NUMINSCINICIAL,'
      'PL.FLGRECALCCONTRIB,'
      'PL.IDREGRATRANSFPLA,'
      'PL.IDREGRACANCDESC,'
      'PL.TRGDTINCLUSAO,'
      'PL.TRGUSERINCLUSAO,'
      'PL.IDTETOSALPART,'
      'PL.PATROLIMITE,'
      'PL.RESULTLIMITE,'
      'PL.FLGCALCULALIMITE,'
      'PL.MENSCOBR,'
      'PL.MENSCOBR2,'
      'PL.FLGRESERVAULTCOT,'
      'PL.CODDESEMBIRRF,'
      'PL.FLGUSAEVOLFUNC,'
      'PL.IDREGRAELEGREINS,'
      'PL.IDRELATBENEFICIO,'
      'PL.ORIGEMCMBENEFICIO'
      'FROM PLANPREV PL'
      'WHERE          NOT EXISTS(SELECT PP.IDPLANOPREV'
      '               FROM     PLANPREVPATRO PP'
      '               WHERE  PP.IDPESSJUR       = :IDPESSOA  AND'
      #9'               PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'ORDER BY PL.NOME'
      ' ')
    ValidateWithMask = True
    Left = 389
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'TpPrevidencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 339
    Top = 287
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 219
    Top = 402
  end
  object pmenu: TPopupMenu
    Left = 94
    Top = 400
    object AtivarPlano1: TMenuItem
      Caption = 'Ativar Plano'
      OnClick = AtivarPlano1Click
    end
    object DesativarPlano1: TMenuItem
      Caption = 'Desativar Plano'
      OnClick = DesativarPlano1Click
    end
    object mnuAlterarRegras: TMenuItem
      Caption = 'Alterar Regras'
      OnClick = mnuAlterarRegrasClick
    end
  end
  object qryContPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDPLANOPREV, CP.IDCONTRIBUICAO, CP.FLGPAGADOR,'
      '       C.QTDEPARCELAS, TP.QTDEMESES, TP.IDTPPERIODICIDADE'
      
        'FROM   CONTPREV CP, PLANPREV PL, CONTRIBUICAO C, TPPERIODICIDADE' +
        ' TP'
      'WHERE  CP.IDPLANOPREV =:iIdPlanoPrev AND'
      '       PL.IDPLANOPREV = CP.IDPLANOPREV AND'
      '       CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO AND'
      '       C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE'
      ''
      '')
    ValidateWithMask = True
    Left = 348
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 281
    Top = 404
  end
end
