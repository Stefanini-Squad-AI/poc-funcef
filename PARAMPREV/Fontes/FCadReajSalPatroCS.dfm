inherited frmCadReajSalPatroCS: TfrmCadReajSalPatroCS
  Left = 269
  Top = 100
  HelpContext = 160133
  Caption = 'Reajuste Salarial da Patrocinadora'
  ClientHeight = 502
  ClientWidth = 591
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 591
    Height = 416
    inherited pnlMestre: TPanel
      Width = 589
      Height = 89
      object lblPatro: TLabel
        Left = 9
        Top = 6
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblPlano: TLabel
        Left = 9
        Top = 45
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbedPatrocinadora: TwwDBEdit
        Left = 9
        Top = 19
        Width = 307
        Height = 21
        Color = clSilver
        DataField = 'PATROCINADORA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedPlano: TwwDBEdit
        Left = 9
        Top = 60
        Width = 307
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 90
      Width = 589
      Height = 325
      Tabs.Strings = (
        'Reajustes da Patrocinadora')
      inherited pgctrlDetalhe: TPageControl
        Width = 491
        Height = 266
        inherited tbsDet: TTabSheet
          Caption = 'Reajustes da Patrocinadora'
          inherited dbgrdDet: TwwDBGrid
            Width = 483
            Height = 238
            Selected.Strings = (
              'MESREAJ'#9'7'#9'Ano/Mês ~de Reajuste'
              'PERCENTUAL'#9'12'#9'Percentual'
              'NOMEREGRA'#9'47'#9'Regra de Reajuste'#9'F')
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 483
            Height = 238
            object lblAnoMesReaj: TLabel
              Left = 3
              Top = 3
              Width = 132
              Height = 13
              Caption = 'Ano / Mês do Reajuste'
            end
            object grpPercentual: TGroupBox
              Left = 3
              Top = 153
              Width = 158
              Height = 61
              TabOrder = 3
              object Percentual: TLabel
                Left = 8
                Top = 16
                Width = 62
                Height = 13
                Caption = 'Percentual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label2: TLabel
                Left = 134
                Top = 35
                Width = 10
                Height = 13
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedPercentual: TDBRealEdit
                Left = 8
                Top = 32
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERCENTUAL'
                DataSource = dsDet
              end
            end
            object grpRegra: TGroupBox
              Left = 3
              Top = 88
              Width = 349
              Height = 61
              TabOrder = 2
              object lblRegra: TLabel
                Left = 8
                Top = 16
                Width = 224
                Height = 13
                Caption = 'Regra de Reajuste utilizada no período'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dblkpcmbRegra: TwwDBLookupCombo
                Left = 8
                Top = 32
                Width = 329
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEREGRA'#9'60'#9'Regra')
                DataField = 'IDRGREAJ'
                DataSource = dsDet
                LookupTable = qryRegra
                LookupField = 'IDREGRA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object dbedMesReaj: TwwDBEdit
              Left = 3
              Top = 18
              Width = 121
              Height = 21
              DataField = 'MESREAJ'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object rgrpReajuste: TRadioGroup
              Left = 3
              Top = 41
              Width = 349
              Height = 43
              Caption = ' Reajustar Utilizando ...'
              Columns = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'Regra'
                'Percentual'
                'Ambos')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              OnClick = rgrpReajusteClick
            end
            object rgrpTpReajuste: TDBRadioGroup
              Left = 168
              Top = 153
              Width = 183
              Height = 59
              Caption = ' Aplicar Reajuste sobre ... '
              Columns = 2
              DataField = 'FLGTPREAJUSTE'
              DataSource = dsDet
              Items.Strings = (
                'Salário'
                'Cargo')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 581
      end
      inherited Dock974: TDock97
        Left = 495
        Height = 266
      end
    end
  end
  inherited Dock972: TDock97
    Width = 591
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
    Top = 463
    Width = 591
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 454
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 417
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 336
    Top = 7
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME, IDPLANOPREV)'
      'values'
      '  (:NOME, :IDPLANOPREV)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 299
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Patrocinadora e Plano Previdenciário'
    Colunas.Strings = (
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Patrocinadora'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PLANPREV PL'
      'PLANPREVPATRO PLP')
    CamposChave.Strings = (
      'PLP.IDPESSJUR'
      'PLP.IDPLANOPREV')
    Filtro.Strings = (
      'P.IDPESSOA = PLP.IDPESSJUR'
      'PL.IDPLANOPREV = PLP.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    ExibePergunta = False
    Left = 377
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 2
    Top = 463
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 510
    Top = 7
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   P.NOME AS PATROCINADORA,'
      '   PL.NOME,'
      '   PLP.IDPESSJUR,'
      '   PLP.IDPLANOPREV'
      'FROM'
      '   PESSOA P,'
      '   PLANPREV PL,'
      '   PLANPREVPATRO PLP'
      'WHERE'
      '    (PLP.IDPESSJUR    = :IDPESSJUR)'
      'AND (PLP.IDPLANOPREV  = :IDPLANOPREV)'
      'AND ( P.IDPESSOA      = PLP.IDPESSJUR )'
      'AND ( PL.IDPLANOPREV  = PLP.IDPLANOPREV )'
      ' ')
    Left = 261
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 458
    Top = 7
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT RJ.MESREAJ, RJ.IDRGREAJ,RJ.IDPESSJUR, RJ.PERCENTUAL, RJ.I' +
        'DPLANOPREV,'
      '       R.NOMEREGRA, RJ.FLGTPREAJUSTE'
      'FROM   REAJSALPATRO RJ, REGRA R'
      'WHERE  RJ.IDPESSJUR   = :IDPESSJUR'
      'AND    RJ.IDPLANOPREV = :IDPLANOPREV'
      'AND    RJ.IDRGREAJ    = R.IDREGRA(+)'
      'ORDER  BY RJ.MESREAJ DESC'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 419
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryDetMESREAJ: TStringField
      DisplayLabel = 'Ano/Mês ~de Reajuste'
      DisplayWidth = 7
      FieldName = 'MESREAJ'
      Origin = 'BASEDADOS.REAJSALPATRO.MESREAJ'
      EditMask = '!9999/99;1;_'
      FixedChar = True
      Size = 7
    end
    object qryDetPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.REAJSALPATRO.PERCENTUAL'
    end
    object qryDetNOMEREGRA: TStringField
      DisplayLabel = 'Regra de Reajuste'
      DisplayWidth = 47
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryDetIDRGREAJ: TFloatField
      DisplayLabel = 'Regra'
      DisplayWidth = 10
      FieldName = 'IDRGREAJ'
      Origin = 'BASEDADOS.REAJSALPATRO.IDRGREAJ'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.REAJSALPATRO.IDPESSJUR'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.REAJSALPATRO.IDPLANOPREV'
      Visible = False
    end
    object qryDetFLGTPREAJUSTE: TFloatField
      FieldName = 'FLGTPREAJUSTE'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update REAJSALPATRO'
      'set'
      '  IDRGREAJ = :IDRGREAJ,'
      '  PERCENTUAL = :PERCENTUAL,'
      'FLGTPREAJUSTE = :FLGTPREAJUSTE'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into REAJSALPATRO'
      
        '  (MESREAJ, IDPESSJUR, IDPLANOPREV, IDRGREAJ, PERCENTUAL, FLGTPR' +
        'EAJUSTE)'
      'values'
      
        '  (:MESREAJ, :IDPESSJUR, :IDPLANOPREV, :IDRGREAJ, :PERCENTUAL, :' +
        'FLGTPREAJUSTE)'
      ' ')
    DeleteSQL.Strings = (
      'delete from REAJSALPATRO'
      'where'
      '  MESREAJ = :OLD_MESREAJ and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 464
    Top = 55
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 517
    Top = 55
  end
end
