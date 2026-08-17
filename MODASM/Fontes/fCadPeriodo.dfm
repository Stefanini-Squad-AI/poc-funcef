inherited frmCadPeriodo: TfrmCadPeriodo
  Left = 121
  Top = 92
  Caption = 'Periodicidade dos Exames Médicos'
  ClientWidth = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 584
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 576
      Height = 53
      object Label1: TLabel
        Left = 75
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 156
        Top = 5
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodOcorr: TDBEdit
        Left = 75
        Top = 20
        Width = 65
        Height = 21
        Color = clGray
        DataField = 'CODTIPOOCMED'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbedDescricao: TDBEdit
        Left = 156
        Top = 20
        Width = 349
        Height = 21
        Color = clGray
        DataField = 'DESCRTIPOOCMED'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 57
      Width = 576
      Height = 277
      inherited pgctrlDetalhe: TPageControl
        Width = 483
        Height = 218
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 475
            Height = 190
            Selected.Strings = (
              'DESCRICAO'#9'29'#9'Cargo'
              'INDTEMPO'#9'10'#9'Medido Por'
              'LIMINFERIOR'#9'10'#9'Lim. Inferior'
              'LIMSUPERIOR'#9'10'#9'Lim. Superior'
              'PERIODO'#9'12'#9'Lim. Superior')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 475
            Height = 190
            object Label3: TLabel
              Left = 82
              Top = 35
              Width = 156
              Height = 13
              Caption = 'Cargo (ou nada para todos)'
            end
            object Label4: TLabel
              Left = 82
              Top = 95
              Width = 78
              Height = 13
              Caption = 'Limite Inferior'
            end
            object Label5: TLabel
              Left = 299
              Top = 95
              Width = 85
              Height = 13
              Caption = 'Limite Superior'
            end
            object Label6: TLabel
              Left = 82
              Top = 146
              Width = 65
              Height = 13
              Caption = 'Medido Por'
            end
            object Label7: TLabel
              Left = 299
              Top = 147
              Width = 93
              Height = 13
              Caption = 'Período (meses)'
            end
            object dblckCargo: TwwDBLookupCombo
              Left = 82
              Top = 50
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsDet
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblckCargoChange
            end
            object DBEdit2: TDBEdit
              Left = 82
              Top = 110
              Width = 64
              Height = 21
              DataField = 'LIMINFERIOR'
              DataSource = dsDet
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 299
              Top = 110
              Width = 64
              Height = 21
              DataField = 'LIMSUPERIOR'
              DataSource = dsDet
              TabOrder = 2
            end
            object dbcbIndTempo: TwwDBComboBox
              Left = 82
              Top = 161
              Width = 100
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'INDTEMPO'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Idade'#9'1'
                'Exposição'#9'2')
              Sorted = False
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object DBEdit4: TDBEdit
              Left = 299
              Top = 162
              Width = 64
              Height = 21
              DataField = 'PERIODO'
              DataSource = dsDet
              TabOrder = 4
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 568
      end
      inherited Dock974: TDock97
        Left = 487
        Height = 218
      end
    end
  end
  inherited Dock972: TDock97
    Width = 584
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
    Width = 584
    inherited tb97Fundo: TToolbar97
      Left = 414
      DockPos = 422
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 247
      DockPos = 255
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN, FLGTIPOCOR'
      'FROM'
      '  TIPOCMED'
      'WHERE'
      '  (CODTIPOOCMED = :CODTIPOOCMED)')
    Left = 272
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 411
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCMED'
      'set'
      '  CODTIPOOCMED = :CODTIPOOCMED,'
      '  DESCRTIPOOCMED = :DESCRTIPOOCMED,'
      '  AVALMIN = :AVALMIN,'
      '  FLGTIPOCOR = :FLGTIPOCOR'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED')
    InsertSQL.Strings = (
      'insert into TIPOCMED'
      '  (CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN, FLGTIPOCOR)'
      'values'
      '  (:CODTIPOOCMED, :DESCRTIPOOCMED, :AVALMIN, :FLGTIPOCOR)')
    DeleteSQL.Strings = (
      'delete from TIPOCMED'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED')
    Left = 244
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Ocorrência'
    Colunas.Strings = (
      'CODTIPOOCMED'
      'DESCRTIPOOCMED')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'TIPOCMED')
    CamposChave.Strings = (
      'CODTIPOOCMED')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Left = 463
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 300
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 140
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 534
    Top = 13
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 534
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PE.CODTIPOOCMED, PE.NUMSEQ, PE.IDPESSOA, PE.IDCARGO,'
      '  PE.CODCENTROCUSTO, PE.INDTEMPO, PE.LIMINFERIOR, '
      '  PE.LIMSUPERIOR, PE.PERIODO, C.TITULO AS DESCRICAO'
      'FROM'
      '  PEREXAME PE, CARGO C'
      'WHERE'
      '  (CODTIPOOCMED = :CODTIPOOCMED) AND'
      '  (PE.IDCARGO = C.IDCARGO(+))'
      'ORDER BY'
      '  CODTIPOOCMED')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 376
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PEREXAME'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCARGO = :IDCARGO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  INDTEMPO = :INDTEMPO,'
      '  LIMINFERIOR = :LIMINFERIOR,'
      '  LIMSUPERIOR = :LIMSUPERIOR,'
      '  PERIODO = :PERIODO'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into PEREXAME'
      '  (CODTIPOOCMED, NUMSEQ, IDPESSOA, IDCARGO, CODCENTROCUSTO, '
      'INDTEMPO, LIMINFERIOR, '
      '   LIMSUPERIOR, PERIODO)'
      'values'
      
        '  (:CODTIPOOCMED, :NUMSEQ, :IDPESSOA, :IDCARGO, :CODCENTROCUSTO,' +
        ' '
      ':INDTEMPO, '
      '   :LIMINFERIOR, :LIMSUPERIOR, :PERIODO)')
    DeleteSQL.Strings = (
      'delete from PEREXAME'
      'where'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 340
    Top = 1
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARGO, TITULO'
      'FROM'
      '  CARGO'
      'ORDER BY'
      '  TITULO')
    ValidateWithMask = True
    Left = 529
    Top = 79
  end
  object qryMaxDet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MAX(NUMSEQ) AS MAXNUMSEQ'
      'FROM'
      '  PEREXAME PE'
      'WHERE'
      '  (CODTIPOOCMED = :CODTIPOOCMED)')
    ValidateWithMask = True
    Left = 529
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
end
