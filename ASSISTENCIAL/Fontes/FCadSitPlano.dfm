inherited frmCadSitPlano: TfrmCadSitPlano
  Left = 131
  Top = 128
  Width = 540
  Height = 272
  Caption = 'Cadastro da Situação do Participante no Plano'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 159
    inherited pnlControles: TPanel
      Width = 522
      Height = 149
      object Label3: TLabel
        Left = 18
        Top = 22
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 18
        Top = 82
        Width = 51
        Height = 13
        Caption = 'Situação'
      end
      object Label2: TLabel
        Left = 414
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedDescricao: TwwDBEdit
        Left = 18
        Top = 36
        Width = 391
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
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object cbFlgInterno: TComboBox
        Left = 18
        Top = 96
        Width = 279
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'Normal'
          'Cancelado'
          'Cancelado por Inadimplência'
          'Inadimplente'
          'Transferência de Plano')
      end
      object DBEdit1: TDBEdit
        Left = 414
        Top = 36
        Width = 67
        Height = 21
        Color = clSilver
        DataField = 'IDSITPLANOASS'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 522
      Height = 149
      Selected.Strings = (
        'IDSITPLANOPREV'#9'10'#9'Código'
        'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
    end
  end
  inherited Dock972: TDock97
    Width = 532
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 206
    Width = 532
    inherited dbnav: TDBNavigator [0]
      Top = 300
      Hints.Strings = ()
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 194
      DockPos = 194
    end
    inherited tb97Fundo: TToolbar97 [2]
      Left = 362
      DockPos = 362
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
  end
  inherited ds: TwwDataSource
    DataSet = qry
    OnStateChange = dsStateChange
    Left = 270
    Top = 4
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 132
    Top = 90
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 208
    Top = 91
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  object qry: TwwQuery
    BeforePost = qryBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDSITPLANOASS,DESCRICAO,FLGINTERNO'
      'FROM SITPLANOASS'
      'ORDER BY DESCRICAO')
    PictureMasks.Strings = (
      'DESCRICAO'#9'*50[?, ]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 327
    Top = 4
  end
  object qryAux: TwwQuery
    BeforePost = qryBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS,DESCRICAO,FLGINTERNO'
      'FROM SITPLANOASS'
      'ORDER BY DESCRICAO')
    PictureMasks.Strings = (
      'DESCRICAO'#9'*50[?, ]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 383
    Top = 4
  end
end
