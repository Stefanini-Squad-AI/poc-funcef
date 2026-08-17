inherited frmCadPeso: TfrmCadPeso
  Left = 191
  Top = 155
  Caption = 'Pesos Grupos x Fatores de Avaliação'
  ClientHeight = 321
  ClientWidth = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 235
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 568
      Height = 34
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label10: TLabel
        Left = 138
        Top = 9
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedMat: TwwDBEdit
        Left = 51
        Top = 7
        Width = 71
        Height = 21
        Color = clGray
        DataField = 'CODGRPFUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 199
        Top = 7
        Width = 361
        Height = 21
        Color = clGray
        DataField = 'DESCGRPFUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 38
      Width = 568
      Height = 193
      Tabs.Strings = (
        'Pesos x Fatores')
      inherited pgctrlDetalhe: TPageControl
        Width = 470
        Height = 134
        inherited tbsDet: TTabSheet
          Caption = 'Pesos x Fatores'
          inherited dbgrdDet: TwwDBGrid
            Width = 462
            Height = 106
            Selected.Strings = (
              'IDFATORAVAL'#9'10'#9'Código'
              'DESCRFATORAVAL'#9'30'#9'Fator de Avaliação'
              'PESO'#9'10'#9'Peso')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 462
            Height = 106
            object Label2: TLabel
              Left = 79
              Top = 5
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label4: TLabel
              Left = 79
              Top = 72
              Width = 29
              Height = 13
              Caption = 'Peso'
              FocusControl = DBEdit2
            end
            object dblcFatorAval: TwwDBLookupCombo
              Left = 79
              Top = 24
              Width = 319
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = qryAval
              LookupField = 'IDFATORAVAL'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcFatorAvalChange
            end
            object DBEdit2: TDBEdit
              Left = 79
              Top = 90
              Width = 52
              Height = 21
              DataField = 'PESO'
              DataSource = dsDet
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 560
      end
      inherited Dock974: TDock97
        Left = 474
        Height = 134
      end
    end
  end
  inherited Dock972: TDock97
    Width = 576
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
    Top = 282
    Width = 576
    inherited tb97Fundo: TToolbar97
      Left = 406
      DockPos = 406
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
      DockPos = 238
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODGRPFUNC, DESCGRPFUNC'
      'FROM'
      '  GRUPFUNC'
      'WHERE'
      '  (CODGRPFUNC = :CODGRPFUNC)  '
      'ORDER BY'
      '  CODGRPFUNC')
    Left = 279
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRPFUNC'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 487
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPFUNC'
      'set'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  DESCGRPFUNC = :DESCGRPFUNC'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC')
    InsertSQL.Strings = (
      'insert into GRUPFUNC'
      '  (CODGRPFUNC, DESCGRPFUNC)'
      'values'
      '  (:CODGRPFUNC, :DESCGRPFUNC)')
    DeleteSQL.Strings = (
      'delete from GRUPFUNC'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC')
    Left = 251
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos Funcionais'
    Colunas.Strings = (
      'CODGRPFUNC'
      'DESCGRPFUNC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'GRUPFUNC')
    CamposChave.Strings = (
      'CODGRPFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 349
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 307
    Top = 2
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
      'SELECT'
      '  PG.CODGRPFUNC, PG.IDFATORAVAL,'
      '  FA.DESCRFATORAVAL, PG.PESO'
      'FROM'
      '  PESOFATGRP PG, FATORAVAL FA'
      'WHERE'
      '  (PG.CODGRPFUNC  = :CODGRPFUNC) AND'
      '  (PG.IDFATORAVAL = FA.IDFATORAVAL)'
      'ORDER BY'
      '  IDFATORAVAL')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 450
    Top = 1
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRPFUNC'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PESOFATGRP'
      'set'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  IDFATORAVAL = :IDFATORAVAL,'
      '  PESO = :PESO'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL and'
      '  PESO = :OLD_PESO')
    InsertSQL.Strings = (
      'insert into PESOFATGRP'
      '  (CODGRPFUNC, IDFATORAVAL, PESO)'
      'values'
      '  (:CODGRPFUNC, :IDFATORAVAL, :PESO)')
    DeleteSQL.Strings = (
      'delete from PESOFATGRP'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL and'
      '  PESO = :OLD_PESO')
    Left = 414
    Top = 1
  end
  object qryAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDFATORAVAL, DESCRFATORAVAL from FATORAVAL'
      'order by DESCRFATORAVAL')
    ValidateWithMask = True
    Left = 536
    Top = 2
  end
end
