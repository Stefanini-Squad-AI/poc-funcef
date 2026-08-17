inherited frmCadTpPeriodicidade: TfrmCadTpPeriodicidade
  Left = 176
  Top = 113
  Width = 496
  Height = 253
  Caption = 'Cadastro de Periodicidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 140
    inherited dbGrd: TwwDBGrid [0]
      Width = 478
      Height = 130
      Selected.Strings = (
        'NOME'#9'38'#9'Nome'
        'QTDEMESES'#9'16'#9'Quantidade Meses')
    end
    inherited pnlControles: TPanel [1]
      Width = 478
      Height = 130
      object Label1: TLabel
        Left = 29
        Top = 19
        Width = 78
        Height = 13
        Caption = 'Periodicidade'
      end
      object Label2: TLabel
        Left = 29
        Top = 74
        Width = 174
        Height = 13
        Caption = 'Periodicidade em Nº de Meses'
      end
      object dbedDescPeriodicidade: TwwDBEdit
        Left = 29
        Top = 34
        Width = 238
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedQtdeMeses: TwwDBEdit
        Left = 29
        Top = 89
        Width = 121
        Height = 21
        DataField = 'QTDEMESES'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 488
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 318
      DockPos = 318
    end
    inherited dbnav: TDBNavigator [1]
      Top = 300
      Hints.Strings = ()
    end
    inherited TB97oKCancelar: TToolbar97 [2]
      Left = 150
      DockPos = 150
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    OnStateChange = dsStateChange
    Left = 254
    Top = 6
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 344
    Top = 88
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Caption = 'Procura de Periodicidade'
    DataSet = qry
    FieldNames.Strings = (
      'NOME')
    DisplayLabels.Strings = (
      'Periodicidade')
    Left = 82
    Top = 177
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  object qry: TwwQuery
    AfterInsert = qryAfterInsert
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDTPPERIODICIDADE,NOME,QTDEMESES'
      'FROM TPPERIODICIDADE'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 295
    Top = 6
  end
  object qryAux: TwwQuery
    ValidateWithMask = True
    Left = 366
    Top = 6
  end
end
