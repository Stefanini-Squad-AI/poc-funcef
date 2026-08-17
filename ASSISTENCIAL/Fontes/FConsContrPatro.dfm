inherited frmConsContrPatro: TfrmConsContrPatro
  Left = 81
  Top = 107
  Caption = 'Consulta de Contribuições da Patrocinadora por Plano'
  ClientHeight = 419
  ClientWidth = 640
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 6
    Top = 106
    Width = 104
    Height = 13
    Caption = 'Plano Assistencial'
  end
  object Splitter1: TSplitter [1]
    Left = 0
    Top = 153
    Width = 640
    Height = 7
    Cursor = crVSplit
    Align = alTop
  end
  inherited pnlFundo: TPanel
    Left = 8
    Top = 241
    Width = 640
    Height = 63
    Align = alNone
    TabOrder = 4
  end
  inherited Dock971: TDock97
    Top = 380
    Width = 640
    inherited tb97Fundo: TToolbar97
      Left = 470
      DockPos = 470
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 151
      DockPos = 151
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited pnlPesquisa: TPanel
    Width = 640
    Height = 153
    inherited Panel4: TPanel
      Left = 477
      Top = 90
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 3
      Width = 257
      Height = 141
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object LABEL1: TLabel
        Left = 6
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label3: TLabel
        Left = 6
        Top = 54
        Width = 85
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object Label4: TLabel
        Left = 7
        Top = 97
        Width = 32
        Height = 13
        Caption = 'Motivo'
      end
      object DBCMBPATRO: TwwDBLookupCombo
        Left = 6
        Top = 23
        Width = 235
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qrypatro
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = DBCMBPATROEnter
      end
      object DBLkpCmbplanass: TwwDBLookupCombo
        Left = 6
        Top = 68
        Width = 235
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'NOME')
        LookupTable = qryplanass
        LookupField = 'IDPLANASS'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = DBLkpCmbplanassEnter
      end
    end
    object grpData: TGroupBox
      Left = 262
      Top = 3
      Width = 205
      Height = 141
      Caption = 'Mês de Referência'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object GroupBox3: TGroupBox
        Left = 6
        Top = 16
        Width = 192
        Height = 113
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 12
          Width = 27
          Height = 13
          Caption = 'Início'
        end
        object Label6: TLabel
          Left = 16
          Top = 52
          Width = 16
          Height = 13
          Caption = 'Fim'
        end
        object cmb1: TComboBox
          Left = 79
          Top = 27
          Width = 109
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'JANEIRO'
            'FEVEREIRO'
            'MARÇO'
            'ABRIL'
            'MAIO'
            'JUNHO'
            'JULHO'
            'AGOSTO'
            'SETEMBRO'
            'OUTUBRO'
            'NOVEMBRO'
            'DEZEMBRO')
        end
        object cmb2: TComboBox
          Left = 78
          Top = 66
          Width = 110
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            'JANEIRO'
            'FEVEREIRO'
            'MARÇO'
            'ABRIL'
            'MAIO'
            'JUNHO'
            'JULHO'
            'AGOSTO'
            'SETEMBRO'
            'OUTUBRO'
            'NOVEMBRO'
            'DEZEMBRO')
        end
        object spin1: TSpinEdit
          Left = 5
          Top = 27
          Width = 73
          Height = 22
          EditorEnabled = False
          MaxValue = 2100
          MinValue = 1997
          TabOrder = 0
          Value = 1997
        end
        object spin2: TSpinEdit
          Left = 4
          Top = 66
          Width = 73
          Height = 22
          EditorEnabled = False
          MaxValue = 2100
          MinValue = 1997
          TabOrder = 2
          Value = 1997
        end
      end
    end
  end
  object cmbmotivo: TwwDBLookupCombo [5]
    Left = 6
    Top = 114
    Width = 235
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCRICAO'#9'50'#9'DESCRICAO')
    LookupTable = qrymotivo
    LookupField = 'IDMOTIVO'
    ParentFont = False
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
    OnEnter = cmbmotivoEnter
  end
  inherited tsetResult: TTabSet
    Top = 361
    Width = 640
  end
  inherited grpResultado: TGroupBox
    Top = 160
    Width = 640
    Height = 201
    inherited Panel1: TPanel
      Width = 636
      Height = 174
      inherited dbgrdResultado: TwwDBGrid
        Width = 636
        Height = 174
        Selected.Strings = (
          'MES'#9'10'#9'Mês'
          'NOME_1'#9'25'#9'Patrocinadora'
          'NOME'#9'25'#9'Plano Assistencial'
          'VALORESPERADO'#9'10'#9'Valor Esperado'
          'DATAESPERADA'#9'10'#9'Data Esperada'
          'VALORRECEBIDO'#9'10'#9'Valor Recebido'
          'DATARECEBIMENTO'#9'10'#9'Data de Recebimento'
          'CODPORTFORMA'#9'10'#9'Forma de Pagamento '
          'DESCRICAO'#9'25'#9'Motivo'
          'NOMEREGRA'#9'25'#9'Regra')
      end
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryhistpatr
  end
  object qryhistpatr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select  hp.* , pl.nome , p.nome , mt.descricao  , regra.nomeregr' +
        'a'
      'from  histpatr hp , pessoa p , planass pl , motivo mt, regra '
      'where hp.idplanoassist = pl.idplanass  and '
      'hp.idmotivo = mt.idmotivo  and '
      'p.idpessoa   = hp.idpessjur     '
      'order by hp.mes')
    ValidateWithMask = True
    Left = 98
    Top = 263
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 149
    Top = 230
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nome, idpessoa  FROM PESSOA'
      'WHERE FLGPATROCINADORA = 1   '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 186
    Top = 230
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME'
      'FROM PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 522
    Top = 214
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 536
    Top = 256
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from motivo'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 306
    Top = 231
  end
end
