inherited frmConfDeptRev: TfrmConfDeptRev
  Left = 149
  ActiveControl = dbNomeLinha
  Caption = 'Configuração das Linhas de Departmental Revenue'
  ClientHeight = 430
  ClientWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 344
    inherited pnlMestre: TPanel
      Width = 541
      Height = 108
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 541
        Height = 108
        Align = alClient
        Caption = ' Linha de Totalização '
        TabOrder = 0
        object Label3: TLabel
          Left = 22
          Top = 18
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 25
          Top = 71
          Width = 119
          Height = 13
          Caption = 'Posição no Relatório'
        end
        object dbNomeLinha: TwwDBEdit
          Left = 23
          Top = 37
          Width = 490
          Height = 21
          DataField = 'NOMELINHA'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbPosRel: TwwDBSpinEdit
          Left = 156
          Top = 68
          Width = 57
          Height = 21
          Increment = 1
          MaxValue = 15
          MinValue = 1
          Value = 1
          DataField = 'POSICAORELAT'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          OnExit = dbPosRelExit
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 113
      Width = 541
      Height = 226
      Tabs.Strings = (
        'Linha x Demonstrativo')
      inherited pgctrlDetalhe: TPageControl
        Width = 443
        Height = 167
        inherited tbsDet: TTabSheet
          Caption = 'Linha x Demonstrativo'
          inherited pnlControlesDet: TPanel [0]
            Width = 435
            Height = 139
            object Label4: TLabel
              Left = 24
              Top = 9
              Width = 82
              Height = 13
              Caption = 'Demonstrativo'
            end
            object Label5: TLabel
              Left = 24
              Top = 56
              Width = 156
              Height = 13
              Caption = 'Elemento do Demonstrativo'
            end
            object Label1: TLabel
              Left = 24
              Top = 107
              Width = 113
              Height = 13
              Caption = 'Coluna no Relatório'
            end
            object dbDemonst: TwwDBLookupCombo
              Left = 23
              Top = 26
              Width = 394
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
              LookupTable = qryDemonst
              LookupField = 'IDDEMONSTRATIVO'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dbDemonstExit
            end
            object dblkElemDemo: TwwDBLookupCombo
              Left = 23
              Top = 72
              Width = 394
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'ELEDESCELEM'#9'60'#9'Descrição')
              DataField = 'IDELEMDEMONSTRAT'
              DataSource = dsDet
              LookupTable = qryElemDemo
              LookupField = 'IDELEMDEMONSTRAT'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbcbColuna: TwwDBComboBox
              Left = 151
              Top = 103
              Width = 98
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              ShowMatchText = True
              DataField = 'COLUNA'
              DataSource = dsDet
              DropDownCount = 10
              ItemHeight = 0
              Items.Strings = (
                'Hoje'#9'H'
                'Acumulado'#9'A'
                'Orçado'#9'O')
              Sorted = False
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object dbckRateio: TDBCheckBox
              Left = 280
              Top = 105
              Width = 97
              Height = 17
              Caption = 'Utiliza Rateio'
              DataField = 'FLGRATEIO'
              DataSource = dsDet
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 435
            Height = 139
            Selected.Strings = (
              'ELEDESCELEM'#9'44'#9'Elemento'
              'COLGRID'#9'9'#9'Coluna')
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 533
      end
      inherited Dock974: TDock97
        Left = 447
        Height = 167
      end
    end
  end
  inherited Dock972: TDock97
    Width = 551
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 551
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select IDGRUPODEPTREV, IDHOTEL, NOMELINHA, POSICAORELAT'
      'from GRUPODEPTREV'
      'WHERE IDGRUPODEPTREV = :IDGRUPODEPTREV'
      'ORDER BY POSICAORELAT')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPODEPTREV'
        ParamType = ptUnknown
      end>
    object qryIDGRUPODEPTREV: TFloatField
      FieldName = 'IDGRUPODEPTREV'
    end
    object qryIDHOTEL: TFloatField
      FieldName = 'IDHOTEL'
    end
    object qryNOMELINHA: TStringField
      FieldName = 'NOMELINHA'
      Size = 60
    end
    object qryPOSICAORELAT: TFloatField
      FieldName = 'POSICAORELAT'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 135
    Top = 183
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPODEPTREV'
      'set'
      '  IDGRUPODEPTREV = :IDGRUPODEPTREV,'
      '  IDHOTEL = :IDHOTEL,'
      '  NOMELINHA = :NOMELINHA,'
      '  POSICAORELAT = :POSICAORELAT'
      'where'
      '  IDGRUPODEPTREV = :OLD_IDGRUPODEPTREV')
    InsertSQL.Strings = (
      'insert into GRUPODEPTREV'
      '  (IDGRUPODEPTREV, IDHOTEL, NOMELINHA, POSICAORELAT)'
      'values'
      '  (:IDGRUPODEPTREV, :IDHOTEL, :NOMELINHA, :POSICAORELAT)')
    DeleteSQL.Strings = (
      'delete from GRUPODEPTREV'
      'where'
      '  IDGRUPODEPTREV = :OLD_IDGRUPODEPTREV')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPODEPTREV.NOMELINHA'
      'GRUPODEPTREV.POSICAORELAT')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome da Linha'
      'Linha Relativa')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPODEPTREV')
    CamposChave.Strings = (
      'GRUPODEPTREV.IDGRUPODEPTREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    Left = 349
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
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select I.IDITEMDEPTREV, I.IDGRUPODEPTREV, I.IDELEMDEMONSTRAT,'
      '       I.COLUNA, I.FLGRATEIO, E.ELEDESCELEM,'
      
        '       DECODE(I.COLUNA, '#39'H'#39','#39'Hoje'#39','#39'A'#39','#39'Acumulado'#39','#39'O'#39','#39'Orçado'#39')' +
        ' AS COLGRID'
      'from   ITEMDEPTREV I, ELEMDEMONSTRATIVO E'
      'where  I.IDGRUPODEPTREV = :IDGRUPODEPTREV'
      '  and  E.IDELEMDEMONSTRAT = I.IDELEMDEMONSTRAT'
      'order by E.ELEDESCELEM')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 184
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPODEPTREV'
        ParamType = ptUnknown
      end>
    object qryDetELEDESCELEM: TStringField
      DisplayLabel = 'Elemento'
      DisplayWidth = 44
      FieldName = 'ELEDESCELEM'
      Size = 60
    end
    object qryDetCOLGRID: TStringField
      DisplayLabel = 'Coluna'
      DisplayWidth = 9
      FieldName = 'COLGRID'
      Size = 9
    end
    object qryDetCOLUNA: TStringField
      DisplayLabel = 'Coluna'
      DisplayWidth = 5
      FieldName = 'COLUNA'
      Visible = False
      Size = 1
    end
    object qryDetFLGRATEIO: TStringField
      FieldName = 'FLGRATEIO'
      Size = 1
    end
    object qryDetIDELEMDEMONSTRAT: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 40
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryDetIDITEMDEPTREV: TFloatField
      FieldName = 'IDITEMDEPTREV'
      Visible = False
    end
    object qryDetIDGRUPODEPTREV: TFloatField
      FieldName = 'IDGRUPODEPTREV'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMDEPTREV'
      'set'
      '  IDITEMDEPTREV = :IDITEMDEPTREV,'
      '  IDGRUPODEPTREV = :IDGRUPODEPTREV,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  COLUNA = :COLUNA,'
      '  FLGRATEIO = :FLGRATEIO'
      'where'
      '  IDITEMDEPTREV = :OLD_IDITEMDEPTREV')
    InsertSQL.Strings = (
      'insert into ITEMDEPTREV'
      
        '  (IDITEMDEPTREV, IDGRUPODEPTREV, IDELEMDEMONSTRAT, COLUNA, FLGR' +
        'ATEIO)'
      'values'
      
        '  (:IDITEMDEPTREV, :IDGRUPODEPTREV, :IDELEMDEMONSTRAT, :COLUNA, ' +
        ':FLGRATEIO)')
    DeleteSQL.Strings = (
      'delete from ITEMDEPTREV'
      'where'
      '  IDITEMDEPTREV = :OLD_IDITEMDEPTREV')
    Left = 238
    Top = 182
  end
  object qryColisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  IDGRUPODEPTREV, POSICAORELAT '
      'from GRUPODEPTREV'
      'where IDHOTEL = :IDHOTEL')
    ValidateWithMask = True
    Left = 490
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
  end
  object qryElemDemo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDELEMDEMONSTRAT, ELEDESCELEM, IDDEMONSTRATIVO'
      'from ELEMDEMONSTRATIVO'
      'where IDDEMONSTRATIVO = :IDDEMO'
      'order by IDELEMDEMONSTRAT')
    ValidateWithMask = True
    Left = 485
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDEMO'
        ParamType = ptUnknown
      end>
    object qryElemDemoIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'ELEMDEMONSTRATIVO.IDELEMDEMONSTRAT'
    end
    object qryElemDemoELEDESCELEM: TStringField
      FieldName = 'ELEDESCELEM'
      Origin = 'ELEMDEMONSTRATIVO.ELEDESCELEM'
      Size = 60
    end
    object qryElemDemoIDDEMONSTRATIVO: TFloatField
      FieldName = 'IDDEMONSTRATIVO'
      Origin = 'ELEMDEMONSTRATIVO.IDDEMONSTRATIVO'
    end
  end
  object qryDemonst: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDDEMONSTRATIVO,'
      '       D.DEMDESCDEMONSTRAT'
      'FROM   DEMONSTRATIVO D'
      'WHERE'
      '      (D.IDPESSOA    = :IDPESSOA)'
      'ORDER BY D.DEMDESCDEMONSTRAT'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 489
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDemonstIDDEMONSTRATIVO: TFloatField
      FieldName = 'IDDEMONSTRATIVO'
      Origin = 'DEMONSTRATIVO.IDDEMONSTRATIVO'
    end
    object qryDemonstDEMDESCDEMONSTRAT: TStringField
      FieldName = 'DEMDESCDEMONSTRAT'
      Origin = 'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      Size = 60
    end
  end
end
