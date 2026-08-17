inherited frmCadComposicaoFundo: TfrmCadComposicaoFundo
  Left = 469
  Top = 342
  HelpContext = 790056
  Caption = 'Cadastro'
  ClientHeight = 403
  ClientWidth = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 515
    Height = 317
    object Bevel1: TBevel [0]
      Left = 1
      Top = 42
      Width = 513
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 44
      Width = 513
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Investimento: TLabel
        Left = 19
        Top = 6
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 19
        Top = 22
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento'#9'F'
          'DESCTIPOFUNDOINV'#9'10'#9'Tipo de Fundo'#9'F')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 101
      Width = 513
      Height = 215
      Tabs.Strings = (
        'Composição do Fundo')
      inherited pgctrlDetalhe: TPageControl
        Width = 415
        Height = 156
        inherited tbsDet: TTabSheet
          Caption = 'Eventos'
          inherited dbgrdDet: TwwDBGrid
            Width = 407
            Height = 128
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'50'#9'Fundo de Investimento'
              'DESCTIPOFUNDOINV'#9'13'#9'Tipo de Fundo'#9'F')
            Font.Color = clBlack
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 407
            Height = 128
            object Label3: TLabel
              Left = 8
              Top = 18
              Width = 130
              Height = 13
              Caption = 'Fundo de Investimento'
            end
            object dblComposicao: TwwDBLookupCombo
              Left = 8
              Top = 34
              Width = 366
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimentos'#9'F'
                'DESCTIPOFUNDOINV'#9'15'#9'Tipo de Fundo'#9'F')
              DataField = 'IDFUNDOINVESTCOMP'
              DataSource = dsDet
              LookupTable = qryFundoInvestComp
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 505
      end
      inherited Dock974: TDock97
        Left = 419
        Height = 156
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 513
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 254
        Height = 24
        Caption = 'Composição dos Fundos'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited Dock972: TDock97
    Width = 515
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 515
    inherited tb97Fundo: TToolbar97
      Left = 245
      DockPos = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 76
      DockPos = 76
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 400
    Top = 2
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    Left = 277
    Top = 200
  end
  inherited ds: TwwDataSource
    Left = 159
    Top = 106
  end
  inherited upd: TUpdateSQL
    Left = 131
    Top = 106
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Tipo de Fundo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'COMPOSICAOFUNDO'
      'FUNDOINVEST'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'COMPOSICAOFUNDO.IDFUNDOINVEST')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST = COMPOSICAOFUNDO.IDFUNDOINVEST'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVES' +
        'T')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '20')
    UsaDistinct = True
    Left = 323
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 361
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 254
    Top = 2
  end
  inherited qry: TwwQuery
    UpdateObject = nil
    Left = 103
    Top = 106
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 288
    Top = 3
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'CF.IDCOMPOSICAOFUNDO,'
      'CF.IDFUNDOINVEST,'
      'CF.IDFUNDOINVESTCOMP,'
      'CF.TRGDTINCLUSAO,'
      'CF.TRGUSERINCLUSAO,'
      'FI.DESCFUNDOINVEST,'
      'TF.DESCTIPOFUNDOINV'
      ''
      'FROM   COMPOSICAOFUNDO CF, FUNDOINVEST FI, TIPOFUNDOINVEST TF'
      'WHERE'
      '       CF.IDFUNDOINVEST = :IDFUNDOINVEST            AND'
      '       FI.IDFUNDOINVEST     = CF.IDFUNDOINVESTCOMP  AND'
      '       TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST  '
      ''
      ' ')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 221
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object qryDetalheDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 50
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryDetalheDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 13
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryDetalheIDCOMPOSICAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOMPOSICAOFUNDO'
      Origin = 'COMPOSICAOFUNDO.IDCOMPOSICAOFUNDO'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'COMPOSICAOFUNDO.IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDFUNDOINVESTCOMP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVESTCOMP'
      Origin = 'COMPOSICAOFUNDO.IDFUNDOINVESTCOMP'
      Visible = False
    end
    object qryDetalheTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'COMPOSICAOFUNDO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetalheTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'COMPOSICAOFUNDO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update COMPOSICAOFUNDO'
      'set'
      '  IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  IDFUNDOINVESTCOMP = :IDFUNDOINVESTCOMP,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  IDCOMPOSICAOFUNDO = :OLD_IDCOMPOSICAOFUNDO')
    InsertSQL.Strings = (
      'insert into COMPOSICAOFUNDO'
      
        '  (IDCOMPOSICAOFUNDO, IDFUNDOINVEST, IDFUNDOINVESTCOMP, TRGDTINC' +
        'LUSAO, '
      '   TRGUSERINCLUSAO)'
      'values'
      
        '  (:IDCOMPOSICAOFUNDO, :IDFUNDOINVEST, :IDFUNDOINVESTCOMP, :TRGD' +
        'TINCLUSAO, '
      '   :TRGUSERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from COMPOSICAOFUNDO'
      'where'
      '  IDCOMPOSICAOFUNDO = :OLD_IDCOMPOSICAOFUNDO')
    Left = 249
    Top = 200
  end
  object qryInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST,DESCFUNDOINVEST, DESCTIPOFUNDOINV'
      'FROM'
      '       FUNDOINVEST, TIPOFUNDOINVEST'
      'WHERE'
      ''
      
        '       FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUN' +
        'DOINVEST AND '
      '       TIPOFUNDOINVEST.IDTIPOINVEST  = :IDTIPOINVEST'
      ''
      'ORDER BY DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 335
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryInvestDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 10
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object dsInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryInvest
    Left = 371
    Top = 72
  end
  object qryFundoInvestComp: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST,DESCFUNDOINVEST, DESCTIPOFUNDOINV'
      'FROM'
      '       FUNDOINVEST, TIPOFUNDOINVEST'
      'WHERE'
      ''
      
        '       FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUN' +
        'DOINVEST AND '
      '       TIPOFUNDOINVEST.IDTIPOINVEST  = :IDTIPOINVEST'
      ''
      'ORDER BY DESCFUNDOINVEST'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 326
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qryFundoInvestCompDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestCompDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 15
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryFundoInvestCompIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
  end
end
