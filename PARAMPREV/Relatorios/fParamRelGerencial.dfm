inherited frmParamRelGerencial: TfrmParamRelGerencial
  Left = 109
  Top = 101
  Caption = 'Parâmetros para o Relatório Gerencial Previdenciário'
  ClientHeight = 321
  ClientWidth = 557
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 557
    Height = 282
    object GroupBox1: TGroupBox
      Left = 9
      Top = 72
      Width = 265
      Height = 201
      Caption = ' Patrocinadoras ... '
      TabOrder = 0
      object wwDBGrid1: TwwDBGrid
        Left = 3
        Top = 15
        Width = 253
        Height = 178
        Selected.Strings = (
          'CONSIDERA'#9'4'#9'CONSIDERA'#9'F'
          'NOME'#9'60'#9'NOME')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = dsPatro
        Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    end
    object GroupBox2: TGroupBox
      Left = 279
      Top = 72
      Width = 265
      Height = 201
      Caption = ' Planos Previdenciários ... '
      TabOrder = 1
      object wwDBGrid2: TwwDBGrid
        Left = 3
        Top = 15
        Width = 253
        Height = 178
        Selected.Strings = (
          'CONSIDERA'#9'4'#9'CONSIDERA'#9'F'
          'NOME'#9'50'#9'NOME')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = dsPlano
        Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 8
      Width = 535
      Height = 57
      Caption = ' Posição no Mês ...'
      TabOrder = 2
      object cmbMesCob: TComboBox
        Left = 15
        Top = 21
        Width = 187
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 207
        Top = 21
        Width = 55
        Height = 22
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 1998
      end
    end
  end
  inherited Dock971: TDock97
    Top = 282
    Width = 557
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 251
  end
  object qryPatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS CONSIDERA, P.IDPESSOA AS IDPESSJUR, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    UpdateObject = updPatro
    ControlType.Strings = (
      'CONSIDERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 60
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS CONSIDERA, IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV'
      '                      FROM PLANPREVPATRO PLP, PATRO PT'
      '                      WHERE PT.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ' '
      ' ')
    UpdateObject = updPlano
    ControlType.Strings = (
      'CONSIDERA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 117
    Top = 267
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 69
    Top = 272
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 153
    Top = 282
  end
  object updPatro: TUpdateSQL
    ModifySQL.Strings = (
      'update PATRO'
      'set'
      '  IDFUNDACAO = :IDFUNDACAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PATRO'
      '  (IDFUNDACAO)'
      'values'
      '  (:IDFUNDACAO)')
    DeleteSQL.Strings = (
      'delete from PATRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 72
    Top = 288
  end
  object updPlano: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 120
    Top = 288
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 441
  end
end
