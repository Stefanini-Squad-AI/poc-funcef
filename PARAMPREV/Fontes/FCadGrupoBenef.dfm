inherited frmCadGrupoBenef: TfrmCadGrupoBenef
  Left = 330
  Top = 462
  HelpContext = 160114
  Caption = 'Cadastro de Grupos de Benefício'
  ClientHeight = 380
  ClientWidth = 692
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 294
    inherited pnlMestre: TPanel
      Width = 690
      Height = 53
      object Label1: TLabel
        Left = 9
        Top = 9
        Width = 112
        Height = 13
        Caption = 'Grupo de Benefício'
      end
      object Label2: TLabel
        Left = 478
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedDescricao: TDBEdit
        Left = 9
        Top = 24
        Width = 457
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dbedCodigo: TDBEdit
        Left = 478
        Top = 24
        Width = 64
        Height = 21
        Color = clSilver
        DataField = 'IDGRUPOBENEF'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Width = 690
      Height = 239
      Tabs.Strings = (
        'Benefícios do Grupo')
      inherited pgctrlDetalhe: TPageControl
        Width = 592
        Height = 180
        inherited tbsDet: TTabSheet
          Caption = 'Benefícios do Grupo'
          inherited dbgrdDet: TwwDBGrid
            Width = 584
            Height = 152
            Selected.Strings = (
              'NOMEPLANO'#9'40'#9'Plano'
              'NOMEBENEFICIO'#9'40'#9'Benefício'
              'FLGPRINCIPAL'#9'9'#9'Principal ~do Grupo')
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 584
            Height = 152
            object Label3: TLabel
              Left = 9
              Top = 12
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object Label4: TLabel
              Left = 12
              Top = 60
              Width = 56
              Height = 13
              Caption = 'Benefício'
            end
            object dblkpcmbPlano: TwwDBLookupCombo
              Left = 9
              Top = 30
              Width = 331
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano Previdenciário')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = qryPlano
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbPlanoCloseUp
            end
            object dblkpcmbBeneficio: TwwDBLookupCombo
              Left = 12
              Top = 75
              Width = 328
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Benefício')
              DataField = 'IDBENEFICIO'
              DataSource = dsDet
              LookupTable = qryBeneficio
              LookupField = 'IDBENEFICIO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object rgrpPrincipal: TDBRadioGroup
              Left = 354
              Top = 24
              Width = 185
              Height = 73
              Caption = ' Principal do Grupo '
              DataField = 'FLGPRINCIPAL'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 682
      end
      inherited Dock974: TDock97
        Left = 596
        Height = 180
      end
    end
  end
  inherited Dock972: TDock97
    Width = 692
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 692
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 431
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 252
    Top = 5
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOBENEF'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  IDFUNDACAO = :IDFUNDACAO'
      'where'
      '  IDGRUPOBENEF = :OLD_IDGRUPOBENEF')
    InsertSQL.Strings = (
      'insert into GRUPOBENEF'
      '  (IDGRUPOBENEF, DESCRICAO, IDFUNDACAO)'
      'values'
      '  (:IDGRUPOBENEF, :DESCRICAO, :IDFUNDACAO)')
    DeleteSQL.Strings = (
      'delete from GRUPOBENEF'
      'where'
      '  IDGRUPOBENEF = :OLD_IDGRUPOBENEF')
    Left = 297
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IDGRUPOBENEF'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOBENEF')
    CamposChave.Strings = (
      'IDGRUPOBENEF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
    Left = 387
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDGRUPOBENEF, DESCRICAO, IDFUNDACAO'
      'FROM GRUPOBENEF'
      'WHERE IDGRUPOBENEF = :IDGRUPOBENEF')
    Left = 342
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOBENEF'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BG.IDGRUPOBENEF, BG.IDBENEFICIO, BG.IDPLANOPREV, BG.FLGPR' +
        'INCIPAL, B.NOME AS NOMEBENEFICIO,'
      '       PL.NOME AS NOMEPLANO'
      'FROM   BENEFXGRUPO BG, BENEFICIO B, PLANPREV PL'
      'WHERE  BG.IDGRUPOBENEF = :IDGRUPOBENEF'
      'AND    BG.IDPLANOPREV  = PL.IDPLANOPREV'
      'AND    BG.IDBENEFICIO  = B.IDBENEFICIO')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGPRINCIPAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 476
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOBENEF'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFXGRUPO'
      'set'
      '  IDGRUPOBENEF = :IDGRUPOBENEF,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  FLGPRINCIPAL = :FLGPRINCIPAL'
      'where'
      '  IDGRUPOBENEF = :OLD_IDGRUPOBENEF and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into BENEFXGRUPO'
      '  (IDGRUPOBENEF, IDBENEFICIO, IDPLANOPREV, FLGPRINCIPAL)'
      'values'
      '  (:IDGRUPOBENEF, :IDBENEFICIO, :IDPLANOPREV, :FLGPRINCIPAL)')
    DeleteSQL.Strings = (
      'delete from BENEFXGRUPO'
      'where'
      '  IDGRUPOBENEF = :OLD_IDGRUPOBENEF and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 521
    Top = 5
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME'
      'FROM BENEFPLANPREV BP, BENEFICIO B'
      'WHERE BP.IDPLANOPREV = :IDPLANOPREV'
      'AND BP.IDBENEFICIO = B.IDBENEFICIO')
    ValidateWithMask = True
    Left = 590
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    AfterScroll = qryPlanoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 642
    Top = 69
  end
end
