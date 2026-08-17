inherited frmParamContrato: TfrmParamContrato
  Left = 311
  Top = 279
  Caption = 'Parâmetros'
  ClientHeight = 292
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 206
    object pcParametros: TPageControl
      Left = 5
      Top = 5
      Width = 522
      Height = 196
      ActivePage = tsParametrosGerais
      Align = alClient
      TabOrder = 0
      object tsParametrosGerais: TTabSheet
        Caption = 'Geral'
        object Label1: TLabel
          Left = 8
          Top = 104
          Width = 226
          Height = 13
          Caption = 'Número de dias para Aviso de Correção'
        end
        object dbcbUtilizaTRD: TDBCheckBox
          Left = 8
          Top = 44
          Width = 185
          Height = 17
          Caption = 'Utilizar Tipo de Desembolso'
          DataField = 'FLGTIPODESEMB'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbcbEngItens: TDBCheckBox
          Left = 8
          Top = 20
          Width = 305
          Height = 17
          Caption = 'Englobar itens contratuais ao efetuar lançamento'
          DataField = 'FLGENGLOBA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edrNumDiasAvisoCorr: TDBRealEdit
          Left = 241
          Top = 101
          Width = 56
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'NUMDIASAVISOCORR'
          DataSource = ds
        end
        object dbcbImpNFImpFis: TDBCheckBox
          Left = 8
          Top = 68
          Width = 241
          Height = 17
          Caption = 'Imprime Fatura em Impressora Fiscal'
          DataField = 'FLGNFIMPFISCAL'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsImpostosNF: TTabSheet
        Caption = 'Impostos para Impressão de Fatura/NF'
        ImageIndex = 1
        object pnlDisponiveis: TPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 168
          Align = alLeft
          TabOrder = 0
          object pnlTitDisponiveis: TPanel
            Left = 1
            Top = 1
            Width = 215
            Height = 24
            Align = alTop
            Caption = 'Disponíveis'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgDisponiveis: TwwDBGrid
            Left = 1
            Top = 25
            Width = 215
            Height = 142
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDisponiveis
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object Panel2: TPanel
          Left = 217
          Top = 0
          Width = 56
          Height = 168
          Align = alLeft
          TabOrder = 1
          object btnAdiciona: TSpeedButton
            Left = 8
            Top = 58
            Width = 40
            Height = 34
            Hint = 'Adiciona'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
              66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
              66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
              660878F888778888887887E666F66666608887F88878888887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAdicionaClick
          end
          object BtnRemove: TSpeedButton
            Left = 8
            Top = 102
            Width = 40
            Height = 34
            Hint = 'Remove'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
              66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
              66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
              660878F888877F88887887E66666F666608887F88888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnRemoveClick
          end
        end
        object pnlSelecionados: TPanel
          Left = 273
          Top = 0
          Width = 241
          Height = 168
          Align = alClient
          TabOrder = 2
          object pnlTitSelecionados: TPanel
            Left = 1
            Top = 1
            Width = 239
            Height = 24
            Align = alTop
            Caption = 'Selecionados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgSelecionados: TwwDBGrid
            Left = 1
            Top = 25
            Width = 239
            Height = 142
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSelecionados
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 532
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 253
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 362
      DockPos = 362
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 194
      DockPos = 194
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM PARAMCONTRATO')
    Left = 248
    Top = 8
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 416
    Top = 8
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCONTRATO'
      'set'
      '  IDPARAMCONTRATO = :IDPARAMCONTRATO,'
      '  FLGTIPODESEMB = :FLGTIPODESEMB,'
      '  FLGENGLOBA = :FLGENGLOBA,'
      '  NUMDIASAVISOCORR = :NUMDIASAVISOCORR,'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGNFIMPFISCAL = :FLGNFIMPFISCAL'
      'where'
      '  IDPARAMCONTRATO = :OLD_IDPARAMCONTRATO')
    InsertSQL.Strings = (
      'insert into PARAMCONTRATO'
      
        '  (IDPARAMCONTRATO, FLGTIPODESEMB, FLGENGLOBA, NUMDIASAVISOCORR,' +
        ' IDPESSOA, '
      '   FLGNFIMPFISCAL)'
      'values'
      
        '  (:IDPARAMCONTRATO, :FLGTIPODESEMB, :FLGENGLOBA, :NUMDIASAVISOC' +
        'ORR, :IDPESSOA, '
      '   :FLGNFIMPFISCAL)')
    DeleteSQL.Strings = (
      'delete from PARAMCONTRATO'
      'where'
      '  IDPARAMCONTRATO = :OLD_IDPARAMCONTRATO')
    Left = 312
    Top = 8
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P.IDPARAMCONTRATO'
      'P.FLGTIPODESEMB'
      'P.DATAINI'
      'P.DATAFIM')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      ''
      ''
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMCONTRATO  P')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '10'
      '10')
    Left = 456
    Top = 8
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 360
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 496
    Top = 8
  end
  object qryDisponiveis: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TA.*'
      'FROM'
      '   TIPOALTERADOR TA'
      'WHERE'
      '   (TA.IDPESSOA = :IdPessoa) AND '
      '   (TA.RECPAG = '#39'R'#39') AND'
      '   (NOT EXISTS(SELECT I.CODALTERADOR'
      '               FROM IMPOSTOIMPNF I'
      #9#9#9'   WHERE (I.IDPESSOA = TA.IDPESSOA) AND'
      #9#9#9'         (I.CODALTERADOR = TA.CODALTERADOR)))'
      'ORDER BY TA.DESCRICAO'
      ' '
      ' ')
    UpdateObject = updDisponiveis
    ValidateWithMask = True
    Left = 56
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptInput
        Value = '500'
      end>
  end
  object dsDisponiveis: TwwDataSource
    DataSet = qryDisponiveis
    Left = 56
    Top = 192
  end
  object updDisponiveis: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOALTERADOR'
      'set'
      '  CODALTERADOR = :CODALTERADOR,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into TIPOALTERADOR'
      '  (CODALTERADOR, IDPESSOA)'
      'values'
      '  (:CODALTERADOR, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from TIPOALTERADOR'
      'where'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 128
    Top = 168
  end
  object qrySelecionados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TA.DESCRICAO,'
      '   I.*'
      'FROM'
      '   TIPOALTERADOR TA,'
      '   IMPOSTOIMPNF I'
      'WHERE'
      '   (I.IDPESSOA = :IdPessoa) AND'
      '   (I.IDPESSOA = TA.IDPESSOA) AND'
      '   (I.CODALTERADOR = TA.CODALTERADOR)'
      'ORDER BY TA.DESCRICAO'
      ' ')
    UpdateObject = updSelecionados
    ValidateWithMask = True
    Left = 328
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptInput
        Value = '500'
      end>
  end
  object dsSelecionados: TwwDataSource
    DataSet = qrySelecionados
    Left = 328
    Top = 192
  end
  object updSelecionados: TUpdateSQL
    ModifySQL.Strings = (
      'update IMPOSTOIMPNF'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODALTERADOR = :CODALTERADOR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into IMPOSTOIMPNF'
      '  (IDPESSOA, CODALTERADOR)'
      'values'
      '  (:IDPESSOA, :CODALTERADOR)')
    DeleteSQL.Strings = (
      'delete from IMPOSTOIMPNF'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 408
    Top = 168
  end
end
