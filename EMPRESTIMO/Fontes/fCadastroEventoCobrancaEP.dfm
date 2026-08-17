inherited frmCadastroEventoCobrancaEP: TfrmCadastroEventoCobrancaEP
  Left = 763
  Top = 386
  Caption = 'Eventos de Cobrança'
  ClientHeight = 415
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 329
    TabOrder = 1
    inherited pnlControles: TPanel
      Width = 758
      Height = 327
      TabOrder = 0
      object Label1: TLabel
        Left = 125
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 61
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Código'
        Enabled = False
      end
      object Label3: TLabel
        Left = 154
        Top = 164
        Width = 46
        Height = 13
        Caption = 'Período'
      end
      object Label4: TLabel
        Left = 240
        Top = 164
        Width = 92
        Height = 13
        Caption = 'Tipo do período'
      end
      object lblSaldoTotal: TLabel
        Left = 506
        Top = 60
        Width = 128
        Height = 13
        Caption = 'Saldo total a partir de:'
      end
      object lblRepetir: TLabel
        Left = 58
        Top = 216
        Width = 180
        Height = 13
        Caption = 'Repetir até confirmação de AR:'
      end
      object edtDescEvento: TwwDBEdit
        Left = 122
        Top = 32
        Width = 546
        Height = 21
        DataField = 'DESCEVENTOCOB'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit1: TwwDBEdit
        Left = 61
        Top = 32
        Width = 54
        Height = 21
        Color = clWhite
        DataField = 'IDTIPOEVENTOCOBEMPTMO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveBorder
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBComboBox1: TwwDBComboBox
        Left = 239
        Top = 181
        Width = 145
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Dia(s)'#9'D'
          'Mês(es)'#9'M')
        ItemIndex = 0
        Sorted = False
        TabOrder = 10
        UnboundDataType = wwDefault
        OnExit = wwDBComboBox1Exit
      end
      object CBAPartirde: TCheckBox
        Left = 59
        Top = 181
        Width = 89
        Height = 17
        Caption = 'A partir de:'
        TabOrder = 8
      end
      object wwDbeSaldoTotal: TwwDBEdit
        Left = 507
        Top = 76
        Width = 162
        Height = 21
        DataField = 'SALDOTOTAL'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
      object dbrgrpTipoEvento: TDBRadioGroup
        Left = 59
        Top = 69
        Width = 185
        Height = 82
        Caption = 'Tipo do Evento'
        DataField = 'TIPOEVENTO'
        DataSource = ds
        Items.Strings = (
          'Inadimplência anterior'
          'Inadimplência mensal'
          'Adimplência')
        TabOrder = 1
        Values.Strings = (
          'I'
          'M'
          'A')
      end
      object dbrgrpLancEvento: TDBRadioGroup
        Left = 283
        Top = 69
        Width = 185
        Height = 60
        Caption = 'Lançamento do Evento'
        DataField = 'TIPOBASELANCAMENTO'
        DataSource = ds
        Items.Strings = (
          'Inadimplência total'
          'Parcela individual')
        TabOrder = 2
        Values.Strings = (
          'T'
          'I')
      end
      object pnlLayout: TPanel
        Left = 58
        Top = 252
        Width = 628
        Height = 57
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 15
        object lblDepEv: TLabel
          Left = 15
          Top = 8
          Width = 114
          Height = 13
          Caption = 'Depende do Evento'
        end
      end
      object wdblkpcmbDependeEvento: TwwDBLookupCombo
        Left = 73
        Top = 276
        Width = 437
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCEVENTOCOB'#9'40'#9'Descrição'#9'F'
          'IDTIPOEVENTOCOBEMPTMO'#9'10'#9'Código'#9'F')
        DataField = 'DEPENDEVENTO'
        DataSource = ds
        LookupTable = qryEventoEmptmo
        LookupField = 'IDTIPOEVENTOCOBEMPTMO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 12
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object seContConfAR: TSpinEdit
        Left = 245
        Top = 213
        Width = 45
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 11
        Value = 0
      end
      object seEdtPeriodo: TSpinEdit
        Left = 153
        Top = 181
        Width = 67
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = 0
        OnKeyPress = seEdtPeriodoKeyPress
      end
      object dbchkAcordoJudicial: TDBCheckBox
        Left = 508
        Top = 108
        Width = 161
        Height = 17
        Caption = 'Acordo Judicial'
        DataField = 'FLGACORDOJUDICIAL'
        DataSource = ds
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkLancManual: TDBCheckBox
        Left = 508
        Top = 135
        Width = 161
        Height = 17
        Caption = 'Lançamento Manual'
        DataField = 'FLGMANUAL'
        DataSource = ds
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkCancPresc: TDBCheckBox
        Left = 508
        Top = 161
        Width = 161
        Height = 17
        Caption = 'Cancelar por Prescrição'
        DataField = 'FLGCANCELPRESCRITO'
        DataSource = ds
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkEventoDesativ: TDBCheckBox
        Left = 508
        Top = 188
        Width = 161
        Height = 17
        Caption = 'Evento Desativado'
        DataField = 'FLGDESATIVADO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkConfAR: TDBCheckBox
        Left = 548
        Top = 275
        Width = 105
        Height = 16
        Caption = 'Confirma AR'
        DataField = 'FLGCONFIRMSITAR'
        DataSource = ds
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 697
      Top = 5
      Width = 771
      Height = 327
      Selected.Strings = (
        'DESCEVENTOCOB'#9'20'#9'Evento'
        'DESCDEPENDEVENTO'#9'20'#9'Depende do Evento'
        'DESCTIPOEVENTO'#9'20'#9'Tipo do Evento'
        'DESCPERIODO'#9'11'#9'Período'
        'SALDOTOTAL'#9'11'#9'Saldo Total'
        'DESCACORDOJUDICIAL'#9'8'#9'Acordo Jud.'
        'DESCMANUAL'#9'6'#9'Manual')
      Align = alNone
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      TabOrder = 1
      OnCalcCellColors = dbGrdCalcCellColors
    end
  end
  inherited Dock972: TDock97
    Width = 760
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 376
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 678
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 419
      DockPos = 509
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 416
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 339
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOEVENTOCOBEMPTMO'
      'set'
      '  DESCEVENTOCOB = :DESCEVENTOCOB,'
      '  PERIODO = :PERIODO,'
      '  TIPOPERIODO = :TIPOPERIODO,'
      '  DEPENDEVENTO = :DEPENDEVENTO,'
      '  FLGSOMENTEADIMP = :FLGSOMENTEADIMP,'
      '  FLGPARTIRDE = :FLGPARTIRDE,'
      '  FLGSOMENTEINADMES = :FLGSOMENTEINADMES,'
      '  SALDOTOTAL = :SALDOTOTAL,'
      '  FLGMANUAL = :FLGMANUAL, '
      '  FLGACORDOJUDICIAL = :FLGACORDOJUDICIAL,'
      '  TIPOEVENTO = :TIPOEVENTO,'
      '  TIPOBASELANCAMENTO = :TIPOBASELANCAMENTO,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  FLGCONFIRMSITAR = :FLGCONFIRMSITAR,'
      '  REPETIRSEMAR = :REPETIRSEMAR,'
      '  FLGCANCELPRESCRITO = :FLGCANCELPRESCRITO '
      'where'
      '  IDTIPOEVENTOCOBEMPTMO = :OLD_IDTIPOEVENTOCOBEMPTMO')
    InsertSQL.Strings = (
      'insert into TIPOEVENTOCOBEMPTMO'
      '  (IDTIPOEVENTOCOBEMPTMO, DESCEVENTOCOB, '
      '   PERIODO, TIPOPERIODO, DEPENDEVENTO, FLGSOMENTEADIMP, '
      'FLGPARTIRDE, FLGSOMENTEINADMES, SALDOTOTAL, FLGMANUAL, '
      
        '   FLGACORDOJUDICIAL, TIPOEVENTO, TIPOBASELANCAMENTO, FLGDESATIV' +
        'ADO,'
      '   FLGCONFIRMSITAR, REPETIRSEMAR, FLGCANCELPRESCRITO)'
      'values'
      '  (:IDTIPOEVENTOCOBEMPTMO, :DESCEVENTOCOB, :PERIODO,'
      '   :TIPOPERIODO, :DEPENDEVENTO, :FLGSOMENTEADIMP, '
      '   :FLGPARTIRDE, :FLGSOMENTEINADMES, :SALDOTOTAL, :FLGMANUAL, '
      
        '   :FLGACORDOJUDICIAL, :TIPOEVENTO, :TIPOBASELANCAMENTO, :FLGDES' +
        'ATIVADO,'
      '   :FLGCONFIRMSITAR, :REPETIRSEMAR, :FLGCANCELPRESCRITO )')
    DeleteSQL.Strings = (
      'delete from TIPOEVENTOCOBEMPTMO'
      'where'
      '  IDTIPOEVENTOCOBEMPTMO = :OLD_IDTIPOEVENTOCOBEMPTMO')
    Left = 379
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 541
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 257
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 452
    Top = 6
  end
  inherited qry: TwwQuery
    BeforeInsert = qryBeforeInsert
    AfterInsert = qryAfterInsert
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT DESCEVENTOCOB, -- nome do evento'
      '       (select t.desceventocob'
      '          from TIPOEVENTOCOBEMPTMO t'
      
        '         where t.idtipoeventocobemptmo = TIPOEVENTOCOBEMPTMO.dep' +
        'endevento) as descdependevento,-- evento dependente'
      
        '       DECODE(TIPOEVENTO,'#39'A'#39','#39'Adimplência'#39',DECODE(TIPOEVENTO,'#39'I'#39 +
        ','#39'Inadimplência Anterior'#39', '#39'M'#39', '#39'Inadimplência Mensal'#39')) as DESC' +
        'TIPOEVENTO, -- tipo do evento'
      '       TIPOEVENTO,'
      
        '       decode(periodo,null,null,(periodo||'#39' '#39'||decode(tipoperiod' +
        'o,'#39'D'#39','#39'Dia(s)'#39','#39'Mês(es)'#39'))) Descperiodo, -- periodo'
      
        '       to_char(SALDOTOTAL,'#39'999999999D99'#39') SALDOTOTAL,  -- saldo ' +
        'total'
      
        '       decode(FLGACORDOJUDICIAL, 1, '#39'Sim'#39', '#39'Não'#39') DESCACORDOJUDI' +
        'CIAL, -- acordo judicial'
      '       decode(FLGMANUAL, 1, '#39'Sim'#39', '#39'Não'#39') DESCMANUAL, -- manual'
      '       FLGACORDOJUDICIAL, '
      '       FLGMANUAL, '
      '       FLGCANCELPRESCRITO,'
      '       FLGDESATIVADO,'
      '       FLGCONFIRMSITAR,'
      '       TIPOBASELANCAMENTO,'
      '       REPETIRSEMAR,'
      '       PERIODO,'
      '       ROWID,'
      '       IDTIPOEVENTOCOBEMPTMO,'
      '       tipoperiodo,'
      '       flgpartirde,'
      '       flgsomenteadimp,'
      '       flgsomenteinadmes,'
      '       DEPENDEVENTO'
      'FROM TIPOEVENTOCOBEMPTMO')
    Left = 298
    Top = 6
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOEVENTOCOBEMPTMO'
      'WHERE ROWID <> :PROWID')
    ValidateWithMask = True
    Left = 668
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PROWID'
        ParamType = ptUnknown
      end>
  end
  object qryEventoEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOEVENTOCOBEMPTMO,'
      '       DESCEVENTOCOB'
      '  FROM TIPOEVENTOCOBEMPTMO'
      'union'
      'SELECT null  ,'
      '       '#39'   '#39'  '
      '  FROM TIPOEVENTOCOBEMPTMO where rownum = 1 '
      ''
      'order by 2')
    ValidateWithMask = True
    Left = 729
    Top = 7
    object qryEventoEmptmoDESCEVENTOCOB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCEVENTOCOB'
      Origin = 'BASEDADOS.TIPOEVENTOCOBEMPTMO.DESCEVENTOCOB'
      Size = 100
    end
    object qryEventoEmptmoIDTIPOEVENTOCOBEMPTMO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDTIPOEVENTOCOBEMPTMO'
      Origin = 'BASEDADOS.TIPOEVENTOCOBEMPTMO.IDTIPOEVENTOCOBEMPTMO'
    end
  end
  object qryAuxSerasa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 636
    Top = 247
  end
end
