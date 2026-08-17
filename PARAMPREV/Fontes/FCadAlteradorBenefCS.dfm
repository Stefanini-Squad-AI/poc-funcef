inherited frmCadAlteradorBenefCS: TfrmCadAlteradorBenefCS
  Left = 293
  Top = 372
  HelpContext = 160139
  Caption = 'Cadastro de Alteradores por Benefício'
  ClientHeight = 456
  ClientWidth = 618
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 370
    inherited pnlMestre: TPanel
      Width = 616
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Benefício'
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
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 616
      Height = 270
      Tabs.Strings = (
        'Alteradores do Benefício')
      object Label7: TLabel [0]
        Left = 23
        Top = 221
        Width = 88
        Height = 13
        Caption = 'Rubrica Normal'
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 518
        Height = 211
        inherited tbsDet: TTabSheet
          Caption = 'Alteradores do Benefício'
          inherited pnlControlesDet: TPanel [0]
            Width = 510
            Height = 183
            object Label4: TLabel
              Left = 6
              Top = 38
              Width = 52
              Height = 13
              Caption = 'Alterador'
            end
            object Label3: TLabel
              Left = 6
              Top = 72
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object Label5: TLabel
              Left = 306
              Top = 38
              Width = 101
              Height = 13
              Caption = 'Ordem de Cálculo'
            end
            object Label6: TLabel
              Left = 6
              Top = 106
              Width = 88
              Height = 13
              Caption = 'Rubrica Normal'
            end
            object Label8: TLabel
              Left = 6
              Top = 140
              Width = 139
              Height = 13
              Caption = 'Rubrica para Devolução'
            end
            object dbrgrpAtrasoDevol: TDBRadioGroup
              Left = 6
              Top = 0
              Width = 267
              Height = 35
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
              Left = 6
              Top = 50
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
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkpcmbRegra: TwwDBLookupCombo
              Left = 6
              Top = 84
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo')
              DataField = 'IDREGRACALCULO'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbedNumOrdem: TwwDBEdit
              Left = 306
              Top = 50
              Width = 121
              Height = 21
              DataField = 'NUMORDEM'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object GroupBox1: TGroupBox
              Left = 306
              Top = 84
              Width = 145
              Height = 65
              TabOrder = 6
              object dbchkDesativa: TDBCheckBox
                Left = 9
                Top = 16
                Width = 88
                Height = 17
                Caption = 'Ativado'
                DataField = 'FLGCOBRA'
                DataSource = dsDet
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbhckResserva: TDBCheckBox
                Left = 9
                Top = 40
                Width = 128
                Height = 17
                Caption = 'Alimenta Reserva'
                DataField = 'FLGCALCRESERVA'
                DataSource = dsDet
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object dblkpcmbRubNormal: TwwDBLookupCombo
              Left = 6
              Top = 119
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'Nome da Rubrica'#9'F'
                'IDPROVENTO'#9'10'#9'Código'#9'F')
              DataField = 'IDRUBNORMAL'
              DataSource = dsDet
              LookupTable = qryRubricaNormal
              LookupField = 'IDPROVENTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkpcmbRubDevol: TwwDBLookupCombo
              Left = 6
              Top = 153
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'Nome da Rubrica'#9'F'
                'IDPROVENTO'#9'10'#9'Código'#9'F')
              DataField = 'IDRUBDEVOLUCAO'
              DataSource = dsDet
              LookupTable = qryRubricaDevol
              LookupField = 'IDPROVENTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 510
            Height = 183
            Selected.Strings = (
              'CODALTERADOR'#9'6'#9'Código'#9'F'
              'DESCRICAO'#9'24'#9'Alterador'#9'F'
              'NUMORDEM'#9'7'#9'Ordem'#9'F'
              'FLGCOBRA'#9'5'#9'Cobrar'#9'F'
              'FLGATRASO'#9'5'#9'Atraso'#9'F'
              'FLGDEVOL'#9'8'#9'Devolução'#9'F')
            FixedCols = 1
          end
        end
      end
      inherited Dock973: TDock97
        Width = 608
      end
      inherited Dock974: TDock97
        Left = 522
        Height = 211
      end
    end
  end
  inherited Dock972: TDock97
    Width = 618
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
    Width = 618
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 449
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 277
      DockPos = 280
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 411
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 261
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIO'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFICIO'
      '  (IDBENEFICIO, NOME)'
      'values'
      '  (:IDBENEFICIO, :NOME)')
    DeleteSQL.Strings = (
      'delete from BENEFICIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 311
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Benefício'
    Colunas.Strings = (
      'B.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Benefício'
      'Plano Previdenciário')
    Tabelas.Strings = (
      'PLANPREV PL'
      'BENEFICIO B'
      'BENEFPLANPREV BP')
    CamposChave.Strings = (
      'BP.IDPLANOPREV'
      'BP.IDBENEFICIO')
    Filtro.Strings = (
      'PL.IDPLANOPREV = BP.IDPLANOPREV'
      'BP.IDBENEFICIO = B.IDBENEFICIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    Left = 560
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 556
    Top = 52
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT PL.NOME AS NOMEPLANO, B.NOME, BP.IDPLANOPREV,'
      '       BP.IDBENEFICIO'
      'FROM   PLANPREV PL, BENEFPLANPREV BP, BENEFICIO B'
      'WHERE  PL.IDPLANOPREV = :IDPLANOPREV'
      'AND    BP.IDBENEFICIO = :IDBENEFICIO'
      'AND    BP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      ' ')
    Left = 361
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 510
    Top = 57
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.IDPLANOPREV,A.IDBENEFICIO,A.CODALTERADOR,A.IDREGRACALCU' +
        'LO,'
      
        '       A.FLGCOBRA,A.FLGATRASO,A.FLGDEVOL, A.NUMORDEM, A.FLGCALCR' +
        'ESERVA,'
      '       A.IDRUBNORMAL, A.IDRUBDEVOLUCAO,'
      '       TA.DESCRICAO'
      'FROM   ALTERADORXBENEF A, TIPOALTERADOR TA'
      'WHERE  A.IDPLANOPREV    = :IDPLANOPREV'
      'AND    A.IDBENEFICIO   = :IDBENEFICIO'
      'AND    A.CODALTERADOR    = TA.CODALTERADOR'
      'ORDER BY A.NUMORDEM'
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0'
      'FLGATRASO;CheckBox;1;0'
      'FLGDEVOL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 460
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERADORXBENEF'
      'set'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  FLGCOBRA = :FLGCOBRA,'
      '  FLGATRASO = :FLGATRASO,'
      '  FLGDEVOL = :FLGDEVOL,'
      '  NUMORDEM = :NUMORDEM,'
      '  FLGCALCRESERVA = :FLGCALCRESERVA,'
      '  IDRUBNORMAL = :IDRUBNORMAL,'
      '  IDRUBDEVOLUCAO = :IDRUBDEVOLUCAO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into ALTERADORXBENEF'
      
        '  (IDPLANOPREV, IDBENEFICIO, CODALTERADOR, IDREGRACALCULO, FLGCO' +
        'BRA, FLGATRASO, '
      
        '   FLGDEVOL, NUMORDEM, FLGCALCRESERVA, IDRUBNORMAL, IDRUBDEVOLUC' +
        'AO)'
      'values'
      
        '  (:IDPLANOPREV, :IDBENEFICIO, :CODALTERADOR, :IDREGRACALCULO, :' +
        'FLGCOBRA, '
      
        '   :FLGATRASO, :FLGDEVOL, :NUMORDEM, :FLGCALCRESERVA, :IDRUBNORM' +
        'AL, :IDRUBDEVOLUCAO)')
    DeleteSQL.Strings = (
      'delete from ALTERADORXBENEF'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 510
    Top = 6
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 573
    Top = 297
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR,DESCRICAO'
      'FROM   TIPOALTERADOR'
      'WHERE (RECPAG = :RECPAG)'
      'AND   (IDPESSOA = :IDFUNDACAO)'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 564
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaNormal: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO'
      'FROM   PROVDESC'
      'WHERE  FLGDESCONTO = :FLGDESCONTO'
      'AND    FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 575
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaDevol: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO'
      'FROM   PROVDESC'
      'WHERE  FLGDESCONTO = :FLGDESCONTO'
      'AND    FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 563
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptUnknown
      end>
  end
end
