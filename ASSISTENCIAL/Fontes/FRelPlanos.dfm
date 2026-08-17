inherited frmPlanAssist: TfrmPlanAssist
  Left = 99
  Top = 75
  Caption = 'Associação de Plano Previdenciário à Planos Assistenciais'
  ClientHeight = 447
  ClientWidth = 611
  Scaled = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 398
    Width = 611
    Height = 10
    TabOrder = 4
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 611
    inherited tb97Fundo: TToolbar97
      Left = 441
      DockPos = 441
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 273
      DockPos = 273
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 37
    Width = 611
    Height = 172
    Align = alTop
    TabOrder = 0
    object p: TLabel
      Left = 11
      Top = 5
      Width = 162
      Height = 16
      Caption = 'Planos Previdenciários'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 24
      Width = 606
      Height = 144
      DataSource = dsprev
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid1CellClick
      OnEnter = DBGrid1Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end>
    end
  end
  object Panel5: TPanel [3]
    Left = 0
    Top = 209
    Width = 611
    Height = 189
    Align = alTop
    TabOrder = 1
    object Label10: TLabel
      Left = 350
      Top = 9
      Width = 251
      Height = 16
      AutoSize = False
      Caption = 'Planos Assistenciais Disponíveis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object sbtnAssocia: TSpeedButton
      Left = 308
      Top = 35
      Width = 25
      Height = 25
      Hint = 'Associar plano selecionado'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaClick
    end
    object sbtnAssociaTodos: TSpeedButton
      Left = 308
      Top = 65
      Width = 25
      Height = 25
      Hint = 'Associar todos os planos'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociaTodosClick
    end
    object sbtnDesassocia: TSpeedButton
      Left = 308
      Top = 95
      Width = 25
      Height = 25
      Hint = 'Desassociar plano selecionado'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaClick
    end
    object sbtnDesassociaTodos: TSpeedButton
      Left = 307
      Top = 125
      Width = 26
      Height = 25
      Hint = 'Desassociar todos os planos'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnDesassociaTodosClick
    end
    object Label1: TLabel
      Left = 41
      Top = 8
      Width = 272
      Height = 17
      AutoSize = False
      Caption = 'Planos Assistenciais Associados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object spbverde: TSpeedButton
      Left = 6
      Top = 52
      Width = 25
      Height = 25
      Hint = 'Desativa um plano para inscrições.'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333000003333333333377777333333333002222200
        3333333778888877333333022222222203333378888888887333302222222222
        2033378888888888873330222222222220333788888888888733022222277222
        2203788888888888887302222272772222037888888888888873022222222722
        2203788888888888887302222822222222037888888888888873022222882222
        2203788888888888887330222222222220333788888888888733302222222222
        2033378888888888873333022222222203333378888888887333333002222200
        3333333778888877333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spbverdeClick
    end
    object spbvermelho: TSpeedButton
      Left = 6
      Top = 77
      Width = 25
      Height = 25
      Hint = 'Ativa um plano para inscrições .'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333000003333333333377777333333333009999900
        3333333778888877333333099999999903333378888888887333309999999999
        9033378888888888873330999999999990333788888888888733099999977999
        9903788888888888887309999979779999037888888888888873099999999799
        9903788888888888887309999899999999037888888888888873099999889999
        9903788888888888887330999999999990333788888888888733309999999999
        9033378888888888873333099999999903333378888888887333333009999900
        3333333778888877333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spbvermelhoClick
    end
    object DBLookupListrel: TDBLookupListBox
      Left = 37
      Top = 32
      Width = 259
      Height = 147
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'NOME'
      ListField = 'NOME'
      ListSource = dsrel
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 0
      OnClick = DBLookupListrelClick
      OnDragDrop = dblkplistPlanRelDragDrop
      OnDragOver = dblkplistPlanRelDragOver
      OnEnter = DBLookupListrelEnter
      OnMouseDown = dblkplistPlanRelMouseDown
    end
    object dblkplistPlanoAss: TDBLookupListBox
      Left = 346
      Top = 32
      Width = 259
      Height = 147
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'IDPLANASS'
      ListField = 'NOME'
      ListSource = dsassist
      ParentFont = False
      TabOrder = 1
      OnClick = dblkplistPlanoAssClick
      OnDragDrop = dblkplistPlanoAssDragDrop
      OnDragOver = dblkplistPlanoAssDragOver
      OnEnter = dblkplistPlanoAssEnter
      OnMouseDown = dblkplistPlanoAssMouseDown
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 0
    Width = 611
    Height = 37
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 11
      Top = 10
      Width = 107
      Height = 16
      Caption = 'Patrocinadora :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 136
      Top = 8
      Width = 337
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qrypessjur
      LookupField = 'NOME'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wwDBLookupCombo1Change
      OnEnter = wwDBLookupCombo1Enter
      OnExit = wwDBLookupCombo1Exit
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 571
  end
  object qryprev: TwwQuery
    AfterScroll = qryprevAfterScroll
    DatabaseName = 'BaseDados'
    DataSource = dspessjur
    SQL.Strings = (
      
        ' SELECT P.CODCENTCUSTCIRRF,P.CODCENTCUSTDIRRF,P.CODCENTRESPIRRF,' +
        'P.CODPORTFORMAIRRF,'
      
        '       P.CODSUBCONTAIRRF,P.CODTIPDOC,P.CODTIPDOCIRRF,P.CODTIPREC' +
        'DES,'
      '       P.CODTIPRECDESIRRF,'
      '       P.FLGAUTONUMINSC,P.FLGCALCULALIMITE,'
      '       P.FLGRECALCCONTRIB,P.IDEMPRESAIRRF,P.IDEMPRESAPROP,'
      '       P.IDEMPRESAPROPIRRF,P.IDFAVORECIDOIRRF,P.IDFUNDACAO,'
      '       P.IDPLANOPREV,P.IDREGRAADMISSAO,'
      
        '       P.IDREGRACANCDESC,P.IDREGRACANCELAME,P.IDREGRACOBATRASO,P' +
        '.IDREGRADESISTENC,'
      '       P.IDREGRATRANSFPLA,'
      '       P.IDTETOSALPART,P.MENSCOBR,'
      '       P.MENSCOBR2,P.NOME,P.NUMINSCINICIAL,P.PATROLIMITE,'
      
        '       P.PLACONTACIRRF,P.PLACONTADIRRF,P.PLANOIRRF,P.RECPAG,P.RE' +
        'CPAGIRRF,'
      '       P.RESULTLIMITE,P.TIPCODIGOIRRF,P.UNIDNEGOCIOIRRF,'
      '       PP.DATAINSC,'
      '       PP.FLGATIVO,'
      '       PP.FLGRECALCMP,PP.FLGRECECONTPATRO,PP.FLGUSARUBRICA,'
      '       PP.IDCALENDARIO,PP.IDPESSJUR,'
      '       PP.IDPLANOPREV,PP.IDREGRAMANUTENCAO,'
      '       PP.IDREGRAMANUTPARC,PP.IDREGRAMANUTSALD,'
      '       PP.IDREGRASALAUXDOE,PP.IDREGRATEMPOCONT,'
      '       PP.IDREGRAVALIDAAFA,PP.IDRGSALMANUT,PP.IDRGSALMANUTPART,'
      '       PP.NUMCONTRATO,PP.PLACONTALIQFLHBEN,'
      '       PP.PLANO'
      'FROM   PLANPREV P, PLANPREVPATRO PP'
      'WHERE  (P.IDPLANOPREV  = PP.IDPLANOPREV)'
      'AND    (PP.IDPESSJUR = :IDPESSOA)'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 79
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsprev: TwwDataSource
    DataSet = qryprev
    Left = 112
    Top = 90
  end
  object dsassist: TwwDataSource
    DataSet = qryassist
    Left = 426
    Top = 277
  end
  object dsrel: TwwDataSource
    DataSet = qryrel
    Left = 89
    Top = 247
  end
  object qryrel: TwwQuery
    BeforeOpen = qryrelBeforeOpen
    AfterScroll = qryrelAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   PA.NOME,PA.IDPLANASS,'
      
        '         PV.CODALTERADORCORR,PV.CODALTERADORJUROS,PV.CODCENTROCU' +
        'STOC,'
      
        '         PV.CODCENTROCUSTOD,PV.CODCENTRORESPON,PV.CODSUBCONTA,PV' +
        '.FLGATIVO,'
      
        '         PV.FLGAUTONUMINSC,PV.IDEMPRESA,PV.IDPESSJUR,PV.IDPESSOA' +
        ',PV.IDPLANASS,'
      
        '         PV.IDPLANOPREV,PV.NUMINSCINICIAL,PV.PLACONTAC,PV.PLACON' +
        'TAD,PV.PLANO,'
      '         PV.TIPCODIGO,PV.UNIDNEGOC,PV.IDCALENDARIO'
      'FROM     PLANASS PA,PLANPREVASS PV'
      'WHERE    (PV.IDPLANOPREV = :IDPLANOPREV)'
      'AND      (PV.IDPESSJUR = :IDPESSJUR)'
      'AND      (PV.IDPLANASS =  PA.IDPLANASS)'
      'ORDER BY PA.NOME'
      '')
    ValidateWithMask = True
    Left = 75
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryassist: TwwQuery
    BeforeOpen = qryassistBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PA.NOME,PA.IDPLANASS'
      'FROM   PLANASS PA'
      'WHERE  (IDPLANASS NOT IN (SELECT PV.IDPLANASS'
      '                          FROM   PLANPREVASS PV'
      '                          WHERE  (PV.IDPLANOPREV = :IDPLANOPREV)'
      '                          AND    (PV.IDPESSJUR = :IDPESSJUR)))'
      'ORDER BY PA.NOME')
    ValidateWithMask = True
    Left = 356
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 167
  end
  object qrypessjur: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME '
      'FROM PATRO PT, PESSOA P '
      'WHERE PT.IDPESSOA = P.IDPESSOA')
    ValidateWithMask = True
    Left = 242
    Top = 87
  end
  object dspessjur: TwwDataSource
    DataSet = qrypessjur
    Left = 305
    Top = 110
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 152
    Top = 313
    object Ativo1: TMenuItem
      Caption = 'Ativo'
      Checked = True
      OnClick = Ativo1Click
    end
    object Detalhes1: TMenuItem
      Caption = 'Detalhes'
      OnClick = Detalhes1Click
    end
  end
  object qrycontribass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTASS '
      'FROM   CONTRIBASS'
      'WHERE  (IDPLANASS = :IDPLANASS)')
    ValidateWithMask = True
    Left = 437
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
end
