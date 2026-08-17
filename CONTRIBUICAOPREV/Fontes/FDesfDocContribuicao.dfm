inherited frmDesfDocContribuicao: TfrmDesfDocContribuicao
  Left = 229
  Top = 201
  Caption = 'Interface do Desfazer Documento'
  ClientHeight = 343
  ClientWidth = 921
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 921
    Height = 304
    object PnlGrid: TPanel
      Left = 1
      Top = 59
      Width = 919
      Height = 244
      Align = alClient
      TabOrder = 0
      object dbGrid: TwwDBGrid
        Left = 1
        Top = 1
        Width = 917
        Height = 226
        Selected.Strings = (
          'SELECAO'#9'8'#9'Seleção'
          'CODDOCUMENTOPREV'#9'25'#9'Código do Documento'
          'VALOR'#9'20'#9'Valor'
          'HSTCOMPL'#9'70'#9'Histórico de Lançamento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsGrid
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object prbReproc: TProgressBar
        Left = 1
        Top = 227
        Width = 917
        Height = 16
        Align = alBottom
        Min = 0
        Max = 100
        Smooth = True
        Step = 1
        TabOrder = 1
        Visible = False
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 1
      Width = 919
      Height = 58
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 8
        Width = 126
        Height = 13
        Caption = 'Código do Documento'
      end
      object BtBusca: TSpeedButton
        Left = 177
        Top = 25
        Width = 42
        Height = 25
        Hint = 'Posiciona o código do documento na grid'
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = BtBuscaClick
      end
      object BtDesfazer: TSpeedButton
        Left = 312
        Top = 25
        Width = 42
        Height = 25
        Hint = 'Desmarcar todos.'
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF007777CCCC7777
          7777777C4444CC777C7777C4777744C8CC7777C47777774CCC7777C4777777CC
          CC7777C477777CCCCC77777C4777777777777777777777777777777777777774
          C77777CCCCC777774C7777CCCC7777774C7777CCC47777774C7777CC8C447777
          4C7777C777CC4444C77777777777CCCC77777777777777777777}
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = BtDesfazerClick
      end
      object BtAll: TSpeedButton
        Left = 359
        Top = 25
        Width = 42
        Height = 25
        Hint = 'Marcar todos.'
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000013000000130000000100
          040000000000E400000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333000003333422433333333333000003334222243333333333000003342
          2222243333333330000034222A2222433333333000003222A2A2224333333330
          00003A2A222A222433333330000034A22222A2224333333000004222A2222A22
          243333300000222A3A2224A2224333300000A2A333A2224A2224333000003A33
          333A2224A2224330000033333333A2224A2243300000333333333A2224A22330
          00003333333333A2224A3330000033333333333A222433300000333333333333
          A224333000003333333333333A223330000033333333333333A333300000}
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = BtAllClick
      end
      object edCodDoc: TEdit
        Left = 28
        Top = 27
        Width = 141
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 921
    object lbMensagem: TLabel [0]
      Left = 10
      Top = 15
      Width = 5
      Height = 13
    end
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited ToolbarSep971: TToolbarSep97
        Left = 149
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 149
        Caption = '&Desfazer Documento'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 152
        Visible = False
        Kind = bkCancel
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 235
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryGrid: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT '#39'N'#39' AS SELECAO,'
      '       HC.CODDOCUMENTOPREV, '
      
        '      (SUM(DECODE(HC.FLGDEVOLUCAO, 0, HC.VALORESPERADO, 0)) - SU' +
        'M(DECODE(HC.FLGDEVOLUCAO, 1, HC.VALORESPERADO, 0))) AS VALOR, DE' +
        'CODE(l.operacao,2,l.historicocompl,'#39#39') HSTCOMPL'
      ' FROM HSTCONTRIBPREV HC, DOCUMENTO D, LANCTODOCUM L'
      ' WHERE'
      
        '       (HC.DATAPREVISAORECE = TO_DATE('#39'20/09/2010'#39','#39'DD/MM/YYYY'#39')' +
        ' )'
      '   AND (HC.IDPLANOPREV  IN (74, 110, 66, 79, 19, 2) )'
      '   AND (HC.CODDOCUMENTOPREV IS NOT NULL)'
      '   AND (D.CODDOCUMENTO  = HC.CODDOCUMENTOPREV)'
      '   AND (L.CODDOCUMENTO  = HC.CODDOCUMENTOPREV)'
      '   AND (D.STATUS       <> 2)'
      
        '   AND (NOT EXISTS (SELECT 1 FROM LANCTODOCUM LA WHERE (RTRIM(LA' +
        '.OPERACAO) = '#39'5'#39') AND (LA.CODDOCUMENTO = D.CODDOCUMENTO)))'
      
        '   AND (NVL(L.CODALTERADOR,0) NOT IN (SELECT DISTINCT NVL(P1.COD' +
        'ALTBAIXANPAGO,0)'
      '                                      FROM PLANPREV P1'
      
        '                                      WHERE (P1.IDPLANOPREV = HC' +
        '.IDPLANOPREV)) )'
      
        ' GROUP BY HC.CODDOCUMENTOPREV, DECODE(l.operacao,2,l.historicoco' +
        'mpl,'#39#39')'
      ' ')
    UpdateObject = updGrid
    ControlType.Strings = (
      'SELECAO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 109
    Top = 138
    object qryGridSELECAO: TStringField
      DisplayLabel = 'Seleção'
      DisplayWidth = 8
      FieldName = 'SELECAO'
      FixedChar = True
      Size = 1
    end
    object qryGridCODDOCUMENTOPREV: TFloatField
      DisplayLabel = 'Código do Documento'
      DisplayWidth = 25
      FieldName = 'CODDOCUMENTOPREV'
    end
    object qryGridVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryGridHSTCOMPL: TStringField
      DisplayLabel = 'Histórico de Lançamento'
      DisplayWidth = 70
      FieldName = 'HSTCOMPL'
      Size = 100
    end
  end
  object dsGrid: TwwDataSource
    DataSet = qryGrid
    Left = 105
    Top = 193
  end
  object updGrid: TUpdateSQL
    Left = 168
    Top = 163
  end
  object spDesfazerDoc: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'PR_DESFAZERDOCHSTCONTRIBPREV'
    ValidateWithMask = True
    Left = 241
    Top = 163
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POUTERRO'
        ParamType = ptOutput
      end>
  end
end
