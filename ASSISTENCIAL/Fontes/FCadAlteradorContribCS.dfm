inherited frmCadAlteradorContribCS: TfrmCadAlteradorContribCS
  Left = 130
  Top = 61
  Caption = 'Cadastro de Alteradores por Contribuição'
  ClientHeight = 456
  ClientWidth = 518
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 518
    Height = 370
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Width = 508
      Height = 262
      Tabs.Strings = (
        'Alteradores da Contribuição')
      inherited Dock973: TDock97 [0]
        Width = 500
      end
      inherited pgctrlDetalhe: TPageControl [1]
        Width = 410
        Height = 203
        inherited tbsDet: TTabSheet
          Caption = 'Alteradores da Contribuição'
          inherited dbgrdDet: TwwDBGrid
            Width = 402
            Height = 175
            Selected.Strings = (
              'CODALTERADOR'#9'6'#9'Código'
              'DESCRICAO'#9'24'#9'Alterador'
              'NUMORDEM'#9'7'#9'Ordem'
              'FLGCOBRA'#9'5'#9'Cobrar'
              'FLGATRASO'#9'5'#9'Atraso'
              'FLGDEVOL'#9'8'#9'Devolução')
            FixedCols = 1
          end
          inherited pnlControlesDet: TPanel
            Width = 402
            Height = 175
            object Label4: TLabel
              Left = 14
              Top = 54
              Width = 52
              Height = 13
              Caption = 'Alterador'
            end
            object dbrgrpAtrasoDevol: TDBRadioGroup
              Left = 14
              Top = 3
              Width = 267
              Height = 49
              Caption = 'Utilizar em caso de '
              Columns = 2
              DataField = 'FLGATRASO'
              DataSource = dsDet
              Items.Strings = (
                'Atraso'
                'Devolução')
              TabOrder = 0
              Values.Strings = (
                '1'
                '0')
              OnClick = dbrgrpAtrasoDevolClick
            end
            object dblkpcmbAlterador: TwwDBLookupCombo
              Left = 14
              Top = 69
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Alterador')
              DataField = 'CODALTERADOR'
              DataSource = dsDet
              LookupTable = qryAlterador
              LookupField = 'CODALTERADOR'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbchkDesativa: TDBCheckBox
              Left = 290
              Top = 146
              Width = 88
              Height = 17
              Caption = 'Ativado'
              DataField = 'FLGCOBRA'
              DataSource = dsDet
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object GroupBox3: TGroupBox
              Left = 13
              Top = 99
              Width = 267
              Height = 67
              Caption = 'Regra'
              TabOrder = 3
              object dblkpcmbRegra: TwwDBLookupCombo
                Left = 6
                Top = 40
                Width = 256
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEREGRA'#9'60'#9'NOMEREGRA')
                DataField = 'IDREGRACALCULO'
                DataSource = dsDet
                LookupTable = qryRegra
                LookupField = 'IDREGRA'
                Enabled = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object wwDBLookupCombo3: TwwDBLookupCombo
                Left = 6
                Top = 16
                Width = 256
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCREGRA'#9'60'#9'Descrição')
                LookupTable = qryTipoRegra
                LookupField = 'IDTIPOREGRA'
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
                OnCloseUp = wwDBLookupCombo3CloseUp
              end
            end
          end
        end
      end
      inherited Dock974: TDock97
        Left = 414
        Height = 203
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 508
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 72
        Height = 13
        Caption = 'Contribuição'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 16
        Top = 24
        Width = 393
        Height = 21
        Color = clSilver
        DataField = 'NOMEPLANO'
        DataSource = ds
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 16
        Top = 64
        Width = 393
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 518
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 518
    inherited tb97Fundo: TToolbar97
      Left = 348
      DockPos = 348
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
      DockPos = 180
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT PL.NOME AS NOMEPLANO, C.NOME, CP.IDPLANASS,'
      '       CP.IDCONTASS'
      'FROM   PLANASS PL, CONTRIBASS CP, CONTRIBUICAO C'
      'WHERE  PL.IDPLANASS = :IDPLANASS'
      'AND    CP.IDCONTASS = :IDCONTRIBUICAO'
      'AND    CP.IDPLANASS = PL.IDPLANASS'
      'AND    CP.IDCONTASS = C.IDCONTRIBUICAO')
    Left = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 370
    Top = 231
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 429
    Top = 65524
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANASS'
      'set'
      '  IDPLANASS = :IDPLANASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS')
    InsertSQL.Strings = (
      'insert into PLANASS'
      '  (IDPLANASS)'
      'values'
      '  (:IDPLANASS)')
    DeleteSQL.Strings = (
      'delete from PLANASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS')
    Left = 305
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANASS.NOME'
      'CONTRIBUICAO.NOME'
      'CONTRIBASS.PAGADOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Plano Assistencial'
      'Contribuição'
      'Pagador')
    Tabelas.Strings = (
      'PLANASS'
      'CONTRIBUICAO'
      'CONTRIBASS')
    CamposChave.Strings = (
      'CONTRIBASS.IDPLANASS'
      'CONTRIBASS.IDCONTASS')
    Filtro.Strings = (
      'CONTRIBASS.IDCONTASS=CONTRIBUICAO.IDCONTRIBUICAO'
      'CONTRIBASS.IDPLANASS=PLANASS.IDPLANASS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '1')
    Left = 431
    Top = 85
  end
  inherited ds: TwwDataSource
    Left = 261
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' A.IDPLANASS, A.IDCONTRIBUICAO, A.CODALTERADOR,'
      ' A.IDREGRACALCULO, A.FLGCOBRA, A.FLGATRASO, A.FLGDEVOL,'
      ' TA.DESCRICAO'
      'FROM'
      ' ALTERXCONTRIBASS A, TIPOALTERADOR TA'
      'WHERE'
      ' (A.IDPLANASS = :IDPLANASS) AND'
      ' (A.IDCONTRIBUICAO = :IDCONTRIBUICAO) AND'
      ' (A.CODALTERADOR = TA.CODALTERADOR)')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0'
      'FLGATRASO;CheckBox;1;0'
      'FLGDEVOL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 325
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERXCONTRIBASS'
      'set'
      '  IDPLANASS = :IDPLANASS,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  FLGCOBRA = :FLGCOBRA,'
      '  FLGATRASO = :FLGATRASO,'
      '  FLGDEVOL = :FLGDEVOL'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into ALTERXCONTRIBASS'
      '  (IDPLANASS, IDCONTRIBUICAO, CODALTERADOR, IDREGRACALCULO, '
      'FLGCOBRA, FLGATRASO, '
      '   FLGDEVOL)'
      'values'
      '  (:IDPLANASS, :IDCONTRIBUICAO, :CODALTERADOR, :IDREGRACALCULO, '
      ':FLGCOBRA, '
      '   :FLGATRASO, :FLGDEVOL)')
    DeleteSQL.Strings = (
      'delete from ALTERXCONTRIBASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 480
    Top = 9
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' NOMEREGRA, IDREGRA'
      'FROM'
      ' REGRA'
      'WHERE'
      ' (IDTIPOREGRA = :IDTIPOREGRA)'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 307
    Top = 331
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR,DESCRICAO'
      'FROM   TIPOALTERADOR'
      'WHERE (RECPAG = :RECPAG)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 306
    Top = 285
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
  end
  object qryTipoRegra: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ' idtiporegra,descregra'
      'from'
      ' tiporegra'
      'order by descregra')
    ValidateWithMask = True
    Left = 351
    Top = 324
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 446
    Top = 338
  end
end
