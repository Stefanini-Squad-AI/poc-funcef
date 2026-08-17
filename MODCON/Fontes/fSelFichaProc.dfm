inherited frmSelFichaProc: TfrmSelFichaProc
  Left = 234
  Top = 128
  HelpContext = 760027
  Caption = 'Seleção para Ficha do Processo'
  ClientHeight = 296
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 11
    Top = 60
    Width = 44
    Height = 13
    Caption = 'Número'
  end
  object Label2: TLabel [1]
    Left = 101
    Top = 60
    Width = 68
    Height = 13
    Caption = 'Reclamante'
  end
  inherited pnlFundo: TPanel
    Height = 257
    inherited PageControl1: TPageControl
      Height = 247
      ActivePage = TabSheet1
      object TabSheet1: TTabSheet [0]
        Caption = 'Seleção da Impressão'
        object sbtnProcurar: TSpeedButton
          Left = 139
          Top = 27
          Width = 114
          Height = 35
          Hint = 'Procurar por registro|'
          AllowAllUp = True
          GroupIndex = 1
          Caption = '&Procurar Processo'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
            33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
            8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
            F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
            F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
            0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
            B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
            B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
            333333333777733333333333FBFBFB3333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sbtnProcurarClick
        end
        object Label3: TLabel
          Left = 6
          Top = 75
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label4: TLabel
          Left = 91
          Top = 75
          Width = 68
          Height = 13
          Caption = 'Reclamante'
        end
        object dbedNumero: TDBEdit
          Left = 6
          Top = 89
          Width = 77
          Height = 21
          Color = clGray
          DataField = 'NUMPROCTRAB'
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
        object dbedRecl: TDBEdit
          Left = 91
          Top = 89
          Width = 296
          Height = 21
          Color = clGray
          DataField = 'NOME'
          DataSource = ds2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object rgRateio: TRadioGroup
          Left = 4
          Top = 131
          Width = 128
          Height = 85
          Caption = 'Imprime os Rateios'
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object rgObserv: TRadioGroup
          Left = 149
          Top = 131
          Width = 235
          Height = 40
          Caption = 'Imprime as Observações das Etapas'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
        end
        object rgHonor: TRadioGroup
          Left = 148
          Top = 176
          Width = 235
          Height = 40
          Caption = 'Imprime os Honorários'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
        end
      end
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 91
        end
        inherited BitBtn2: TBitBtn
          Left = 91
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 257
    inherited tb97Fundo: TToolbar97
      Left = 80
      DockPos = 88
      inherited bbtnSair: TBitBtn
        Visible = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = True
      end
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 24
    Top = 140
  end
  object tblProcesso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB'
    TableName = 'CM.PROCESSOTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 350
    Top = 10
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDRECLAMANTE'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 30
    Top = 12
  end
  object ds: TwwDataSource
    DataSet = tblProcesso
    Left = 291
    Top = 12
  end
  object ds2: TwwDataSource
    DataSet = tblPessoal
    Left = 93
    Top = 15
  end
  object MontaSelectProc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.JCJ'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.CODIGOTRT'
      'TRT.DESCRICAO'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'ADVOG.NOME'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Reclamante'
      'Data de Notificação'
      'Número da Vara'
      'Número Proc. na VT'
      'Código do TRT'
      'Nome do TRT'
      'Número Proc. no TRT'
      'Número Proc. no TST'
      'Nosso Escritório/Adv.'
      'Número Proc. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'TRT'
      'PESSOA ADVOG')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB'
      'ADVOG.NOME')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.CODIGOTRT        = TRT.CODIGOTRT(+)'
      'PROCESSOTRAB.INDMATERIA       = 1'
      'PROCESSOTRAB.IDADVOGRECDA = ADVOG.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '15'
      '15'
      '40'
      '15'
      '15'
      '50'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 294
    Top = 58
  end
end
