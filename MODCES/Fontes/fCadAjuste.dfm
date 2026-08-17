inherited frmCadAjuste: TfrmCadAjuste
  Left = 208
  Top = 147
  Caption = 'Fatores de Ajuste da Pesquisa por Empresa'
  ClientHeight = 331
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 245
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 544
      Height = 54
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 88
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 434
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object dbedCodPesqui: TDBEdit
        Left = 14
        Top = 22
        Width = 55
        Height = 21
        Color = clGray
        DataField = 'IDPESQSALAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDescricao: TDBEdit
        Left = 88
        Top = 22
        Width = 328
        Height = 21
        Color = clGray
        DataField = 'NOMEPESQSALAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedData: TDBEdit
        Left = 434
        Top = 22
        Width = 97
        Height = 21
        Color = clGray
        DataField = 'DATAREFPESQ'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 58
      Width = 544
      Height = 183
      Tabs.Strings = (
        'Fatores de Ajuste')
      inherited pgctrlDetalhe: TPageControl
        Width = 446
        Height = 124
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 438
            Height = 96
            Selected.Strings = (
              'NOME'#9'60'#9'Empresa ou Entidade'#9'F'
              'FATOR'#9'10'#9'Fator de Ajuste')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 438
            Height = 96
            object Label4: TLabel
              Left = 41
              Top = 12
              Width = 121
              Height = 13
              Caption = 'Empresa ou Entidade'
              FocusControl = dbedFator
            end
            object Label5: TLabel
              Left = 41
              Top = 69
              Width = 87
              Height = 13
              Caption = 'Fator de Ajuste'
              FocusControl = dbedFator
            end
            object dblcEntid: TwwDBLookupCombo
              Left = 41
              Top = 26
              Width = 368
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDEMPRESAPARTIC'
              DataSource = dsDet
              LookupTable = qryEntid
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcEntidChange
            end
            object dbedFator: TDBEdit
              Left = 41
              Top = 84
              Width = 85
              Height = 21
              DataField = 'FATOR'
              DataSource = dsDet
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 536
      end
      inherited Dock974: TDock97
        Left = 450
        Height = 124
      end
    end
  end
  inherited Dock972: TDock97
    Width = 552
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 292
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 438
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 215
      DockPos = 271
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDPESQSALAR, NOMEPESQSALAR, DATAREFPESQ'
      'FROM'
      '  PESQISAL'
      'WHERE'
      '  (IDPESQSALAR = :IDPESQSALAR)')
    Left = 269
    Top = 1
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'IDPESQSALAR'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 454
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 498
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESQISAL'
      'set'
      '  IDPESQSALAR = :IDPESQSALAR,'
      '  NOMEPESQSALAR = :NOMEPESQSALAR,'
      '  DATAREFPESQ = :DATAREFPESQ'
      'where'
      '  DATAREFPESQ = :OLD_DATAREFPESQ')
    InsertSQL.Strings = (
      'insert into PESQISAL'
      '  (IDPESQSALAR, NOMEPESQSALAR, DATAREFPESQ)'
      'values'
      '  (:IDPESQSALAR, :NOMEPESQSALAR, :DATAREFPESQ)')
    DeleteSQL.Strings = (
      'delete from PESQISAL'
      'where'
      '  DATAREFPESQ = :OLD_DATAREFPESQ')
    Left = 241
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pesquisa Salarial'
    Colunas.Strings = (
      'IDPESQSALAR'
      'NOMEPESQSALAR')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESQISAL')
    CamposChave.Strings = (
      'IDPESQSALAR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 335
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 297
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 498
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 494
    Top = 101
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 494
    Top = 89
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  AJ.IDPESQSALAR, AJ.IDEMPRESAPARTIC, AJ.FATOR, PJ.NOME'
      'FROM'
      '  PESSOA PJ, AJUSTPESQ AJ'
      'WHERE'
      '  (IDPESQSALAR = :IDPESQSALAR) AND'
      '  (AJ.IDEMPRESAPARTIC = PJ.IDPESSOA)'
      'ORDER BY'
      '  IDPESQSALAR')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 422
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESQSALAR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update AJUSTPESQ'
      'set'
      '  IDEMPRESAPARTIC = :IDEMPRESAPARTIC,'
      '  FATOR = :FATOR'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDEMPRESAPARTIC = :OLD_IDEMPRESAPARTIC and'
      '  FATOR = :OLD_FATOR')
    InsertSQL.Strings = (
      'insert into AJUSTPESQ'
      '  (IDPESQSALAR, IDEMPRESAPARTIC, FATOR)'
      'values'
      '  (:IDPESQSALAR, :IDEMPRESAPARTIC, :FATOR)')
    DeleteSQL.Strings = (
      'delete from AJUSTPESQ'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDEMPRESAPARTIC = :OLD_IDEMPRESAPARTIC and'
      '  FATOR = :OLD_FATOR')
    Left = 386
    Top = 1
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, NOME'
      'FROM'
      '  PESSOA'
      'WHERE'
      '  (TIPO = '#39'J'#39')'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 366
    Top = 49
  end
end
