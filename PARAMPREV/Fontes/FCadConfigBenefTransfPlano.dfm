inherited frmCadConfigBenefTransfPlano: TfrmCadConfigBenefTransfPlano
  Left = 178
  Top = 11
  HelpContext = 160119
  Caption = 'Configuração das Opções de Transferência de Plano'
  ClientHeight = 454
  ClientWidth = 733
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 368
    inherited pnlMestre: TPanel
      Width = 731
      Height = 69
      Align = alClient
      object Label2: TLabel
        Left = 97
        Top = 14
        Width = 141
        Height = 13
        Caption = 'Evento de Transferência'
      end
      object lblCodigo: TLabel
        Left = 12
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedTitulo: TwwDBEdit
        Left = 97
        Top = 28
        Width = 386
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCodigoCargoExt: TDBEdit
        Left = 11
        Top = 28
        Width = 73
        Height = 21
        Color = clSilver
        DataField = 'IDEVENTOGERADOR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 70
      Width = 731
      Height = 297
      Align = alBottom
      Tabs.Strings = (
        'Configuração DE-PARA de Benefícios para Transferência de Plano')
      inherited pgctrlDetalhe: TPageControl
        Width = 633
        Height = 238
        inherited tbsDet: TTabSheet
          Caption = 'Configuração DE-PARA de Benefícios para Transferência de Plano'
          inherited dbgrdDet: TwwDBGrid
            Width = 625
            Height = 210
            Selected.Strings = (
              'PLANOORIGEM'#9'20'#9'Plano~Origem'
              'BENEFICIOORIGEM'#9'30'#9'Benef. ~Origem'
              'PLANODESTINO'#9'20'#9'Plano ~Destino'
              'BENEFICIODESTINO'#9'30'#9'Benef.~Destino'#9'F')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 625
            Height = 210
            BevelInner = bvLowered
            object Label1: TLabel
              Left = 15
              Top = 15
              Width = 94
              Height = 13
              Caption = 'Plano de Origem'
            end
            object Label3: TLabel
              Left = 15
              Top = 66
              Width = 171
              Height = 13
              Caption = 'Benefício no Plano de Origem'
            end
            object Label4: TLabel
              Left = 333
              Top = 15
              Width = 80
              Height = 13
              Caption = 'Plano Destino'
            end
            object Label5: TLabel
              Left = 333
              Top = 66
              Width = 154
              Height = 13
              Caption = 'Benefíco no Plano Destino'
            end
            object Label6: TLabel
              Left = 333
              Top = 114
              Width = 277
              Height = 13
              Caption = 'Regra de Cálculo do Benefício no Plano Destino'
            end
            object Label7: TLabel
              Left = 333
              Top = 156
              Width = 307
              Height = 13
              Caption = 'Regra de Elegibilidade do Benefício no Plano Destino'
            end
            object dblkpcmbPlanoDestino: TwwDBLookupCombo
              Left = 333
              Top = 33
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano'#9'F')
              DataField = 'IDPLANODEST'
              DataSource = dsDet
              LookupTable = qryPlano
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbPlanoDestinoCloseUp
            end
            object dblkpcmbPlanoOrigem: TwwDBLookupCombo
              Left = 15
              Top = 33
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano'#9'F')
              DataField = 'IDPLANOORIGEM'
              DataSource = dsDet
              LookupTable = qryPlano
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbPlanoOrigemCloseUp
            end
            object dblkpcmbBeneficioOrigem: TwwDBLookupCombo
              Left = 15
              Top = 81
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Benefício'#9'F')
              DataField = 'IDBENEFORIGEM'
              DataSource = dsDet
              LookupTable = qryBenefOrigem
              LookupField = 'IDBENEFICIO'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbBeneficioDestino: TwwDBLookupCombo
              Left = 333
              Top = 81
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Benefício'#9'F')
              DataField = 'IDBENEFDEST'
              DataSource = dsDet
              LookupTable = qryBenefDestino
              LookupField = 'IDBENEFICIO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbRegraCalculo: TwwDBLookupCombo
              Left = 333
              Top = 129
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F')
              DataField = 'IDRGCALCBENEFICIO'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 333
              Top = 171
              Width = 250
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F')
              DataField = 'IDRGELEGBENEFICIO'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 723
      end
      inherited Dock974: TDock97
        Left = 637
        Height = 238
      end
    end
  end
  inherited Dock972: TDock97
    Width = 733
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
    Top = 415
    Width = 733
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 609
    Top = 489
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 385
    Top = 134
  end
  inherited ds: TwwDataSource
    Left = 429
    Top = 45
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOGERADOR'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    InsertSQL.Strings = (
      'insert into EVENTOGERADOR'
      '  (IDEVENTOGERADOR, NOME)'
      'values'
      '  (:IDEVENTOGERADOR, :NOME)')
    DeleteSQL.Strings = (
      'delete from EVENTOGERADOR'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    Left = 473
    Top = 45
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Evento Gerador'
    Colunas.Strings = (
      'EVENTOGERADOR.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Evento Gerador')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'EVENTOGERADOR')
    CamposChave.Strings = (
      'EVENTOGERADOR.IDEVENTOGERADOR')
    Filtro.Strings = (
      'EVENTOGERADOR.FLGINTERNO = '#39'TP'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 289
    Top = 1
  end
  object qryPlano: TwwQuery [8]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME')
    ValidateWithMask = True
    Left = 545
    Top = 55
  end
  object updDet: TUpdateSQL [9]
    ModifySQL.Strings = (
      'update BENEFTRANSFPLANO'
      'set'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  IDBENEFORIGEM = :IDBENEFORIGEM,'
      '  IDPLANODEST = :IDPLANODEST,'
      '  IDBENEFDEST = :IDBENEFDEST,'
      '  IDRGCALCBENEFICIO = :IDRGCALCBENEFICIO,'
      '  IDRGELEGBENEFICIO = :IDRGELEGBENEFICIO'
      'where'
      '  IDBENEFTRANSFPLAN = :OLD_IDBENEFTRANSFPLAN')
    InsertSQL.Strings = (
      'insert into BENEFTRANSFPLANO'
      
        '  (IDBENEFTRANSFPLAN, IDEVENTOGERADOR, IDPLANOORIGEM, IDBENEFORI' +
        'GEM, IDPLANODEST, '
      '   IDBENEFDEST, IDRGCALCBENEFICIO, IDRGELEGBENEFICIO)'
      'values'
      
        '  (:IDBENEFTRANSFPLAN, :IDEVENTOGERADOR, :IDPLANOORIGEM, :IDBENE' +
        'FORIGEM, '
      
        '   :IDPLANODEST, :IDBENEFDEST, :IDRGCALCBENEFICIO, :IDRGELEGBENE' +
        'FICIO)')
    DeleteSQL.Strings = (
      'delete from BENEFTRANSFPLANO'
      'where'
      '  IDBENEFTRANSFPLAN = :OLD_IDBENEFTRANSFPLAN')
    Left = 450
    Top = 143
  end
  inherited ImlPadrao: TImageList
    Left = 516
    Top = 489
  end
  object qryDet: TwwQuery [11]
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BT.IDBENEFTRANSFPLAN, BT.IDEVENTOGERADOR, BT.IDPLANOORIGE' +
        'M, BT.IDBENEFORIGEM,'
      
        '       BT.IDPLANODEST, BT.IDBENEFDEST, BT.IDRGCALCBENEFICIO, BT.' +
        'IDRGELEGBENEFICIO,'
      '       PLO.NOME AS PLANOORIGEM, PLD.NOME AS PLANODESTINO,'
      '       BO.NOME AS BENEFICIOORIGEM, BO.NOME AS BENEFICIODESTINO'
      
        'FROM   BENEFTRANSFPLANO BT, BENEFICIO BO, BENEFICIO BD, PLANPREV' +
        ' PLO, PLANPREV PLD'
      'WHERE  BT.IDEVENTOGERADOR    = :IDEVENTOGERADOR'
      'AND    PLO.IDPLANOPREV       = BT.IDPLANOORIGEM'
      'AND    BO.IDBENEFICIO        = BT.IDBENEFORIGEM'
      'AND    PLD.IDPLANOPREV       = BT.IDPLANODEST'
      'AND    BD.IDBENEFICIO        = BT.IDBENEFDEST'
      'ORDER BY BT.IDPLANOORIGEM, BT.IDBENEFORIGEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 334
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 376
    Top = 1
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT E.IDEVENTOGERADOR ,E.NOME'
      'FROM   EVENTOGERADOR E'
      'WHERE  E.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    E.FLGINTERNO = '#39'TP'#39)
    Left = 429
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 277
    Top = 142
  end
  object qryBenefOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME'
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    B.IDBENEFICIO  = BP.IDBENEFICIO'
      'ORDER BY B.NOME'
      ' ')
    ValidateWithMask = True
    Left = 539
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBenefDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME'
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    B.IDBENEFICIO  = BP.IDBENEFICIO'
      'ORDER BY B.NOME'
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA FROM REGRA ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 533
    Top = 4
  end
end
