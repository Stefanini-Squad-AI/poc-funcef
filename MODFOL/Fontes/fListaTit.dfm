inherited frmListaTit: TfrmListaTit
  Left = 54
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 
    'Lista de Titulares a alterar o número de dependentes que Constam' +
    ' para Sal. Fam. e IRRF'
  ClientHeight = 245
  ClientWidth = 708
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 708
    Height = 206
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 2
    object dbgdListaTit: TwwDBGrid
      Left = 6
      Top = 6
      Width = 695
      Height = 194
      Selected.Strings = (
        'NOME'#9'40'#9'Nome'
        'NUMDEPIRRF'#9'10'#9'IRRF (Cadastro)'
        'NUM_IRRF'#9'10'#9'IRRF (Calculado)'
        'NUMDEPSALF'#9'10'#9'Sal. Fam. (Cadastro)'
        'NUM_SAL_FAM'#9'10'#9'Sal. Fam. (Calculado)'
        'MUDANUM'#9'7'#9'Altera ?')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTitular
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgdListaTitCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgdListaTitTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 206
    Width = 708
    inherited tb97Fundo: TToolbar97
      Left = 460
      DockPos = 548
      inherited sep1: TToolbarSep97
        Left = 242
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 162
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 405
    Top = 66
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTitular: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, P.NOME,'
      '  NVL(PF.NUMDEPTOT,0)  AS NUMDEPTOT,  DEPENDENTE.NUM_TOT,'
      '  NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, DEPENDENTE.NUM_IRRF,'
      '  NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, DEPENDENTE.NUM_SAL_FAM,'
      '  0 AS MUDANUM'
      'FROM'
      '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F,'
      '  (SELECT'
      '     DP.IDTITULAR, COUNT(*) NUM_TOT,'
      
        '     SUM(DP.FLGCONTAIMPOSTOR) NUM_IRRF, SUM(DP.FLGCONTASALARIOF)' +
        ' NUM_SAL_FAM'
      '   FROM'
      '     DEPENTIT DP, DEPEN D'
      '   WHERE'
      '     (DP.IDTITULAR      = 10329) AND'
      '     (DP.IDDEPENDENCIA <> '#39'PRP'#39') AND'
      '     (DP.IDDEPENDENCIA  = D.IDDEPENDENCIA)'
      '   GROUP BY'
      '     DP.IDTITULAR) DEPENDENTE'
      'WHERE'
      '  (F.IDPESSOA = 10329)       AND'
      '  (F.IDPESSOA = PF.IDPESSOA) AND'
      '  (F.IDPESSOA = P.IDPESSOA)  AND'
      '  (F.IDPESSOA = DEPENDENTE.IDTITULAR)'
      'ORDER BY'
      '  UPPER(NOME)')
    UpdateObject = updSQLTitular
    ControlType.Strings = (
      'MUDANUM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 316
    Top = 66
  end
  object dsTitular: TwwDataSource
    DataSet = qryTitular
    Left = 359
    Top = 66
  end
  object updSQLTitular: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      '  (NUMDEPTOT, NUMDEPIRRF, NUMDEPSALF)'
      'values'
      '  (:NUMDEPTOT, :NUMDEPIRRF, :NUMDEPSALF)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 258
    Top = 66
  end
end
