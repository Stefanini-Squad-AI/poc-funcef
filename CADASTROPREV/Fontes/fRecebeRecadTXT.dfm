inherited frmRecebeRecadTXT: TfrmRecebeRecadTXT
  Left = 206
  Top = 144
  HelpContext = 160104
  Caption = 'Recebimento de Recadastramento via TXT'
  ClientHeight = 328
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 289
    object pnlResult: TPanel
      Left = 1
      Top = 69
      Width = 434
      Height = 219
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Label7: TLabel
        Left = 0
        Top = 8
        Width = 99
        Height = 13
        Caption = 'Log da Operação'
      end
      object memResult: TMemo
        Left = 1
        Top = 24
        Width = 320
        Height = 185
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object bbtnSalvar: TBitBtn
        Left = 327
        Top = 29
        Width = 91
        Height = 38
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
      object BtnVoltar: TBitBtn
        Left = 327
        Top = 93
        Width = 91
        Height = 38
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnVoltarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
    object pnlFront: TPanel
      Left = 1
      Top = 69
      Width = 434
      Height = 219
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblMensagem: TLabel
        Left = 8
        Top = 144
        Width = 400
        Height = 30
        AutoSize = False
        Caption = 'lblMensagem'
        WordWrap = True
      end
      object btnImportarDados: TBitBtn
        Left = 8
        Top = 176
        Width = 145
        Height = 33
        Caption = 'Importar dados'
        Enabled = False
        TabOrder = 0
        OnClick = btnImportarDadosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 0
        Width = 401
        Height = 137
        Caption = ' Teste de primeira linha '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Matrícula:'
        end
        object Label3: TLabel
          Left = 8
          Top = 48
          Width = 77
          Height = 13
          Caption = 'Nome Titular:'
        end
        object Label4: TLabel
          Left = 8
          Top = 72
          Width = 66
          Height = 13
          Caption = 'Data Carta:'
        end
        object Label5: TLabel
          Left = 8
          Top = 96
          Width = 69
          Height = 13
          Caption = 'Data Limite:'
        end
        object Label6: TLabel
          Left = 8
          Top = 120
          Width = 110
          Height = 13
          Caption = 'Data Recebimento:'
        end
        object lblMatricula: TLabel
          Left = 136
          Top = 24
          Width = 66
          Height = 13
          Caption = 'lblMatricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 136
          Top = 48
          Width = 46
          Height = 13
          Caption = 'lblNome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataCarta: TLabel
          Left = 136
          Top = 72
          Width = 71
          Height = 13
          Caption = 'lblDataCarta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDatalimite: TLabel
          Left = 136
          Top = 96
          Width = 70
          Height = 13
          Caption = 'lblDatalimite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataRecebimento: TLabel
          Left = 136
          Top = 120
          Width = 115
          Height = 13
          Caption = 'lblDataRecebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 434
      Height = 68
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 135
        Height = 13
        Caption = 'Arquivo a ser importado'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 59
        Width = 425
        Height = 5
      end
      object edtEndArquivo: TEdit
        Left = 16
        Top = 32
        Width = 233
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object btnAbreDialogo: TButton
        Left = 248
        Top = 32
        Width = 18
        Height = 22
        Caption = '...'
        TabOrder = 1
        OnClick = btnAbreDialogoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 289
    Width = 436
    inherited tb97Fundo: TToolbar97
      Left = 264
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 731
    Top = 515
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object odArqImportar: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Aqruivo de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Arquivo a ser lido'
    Left = 336
    Top = 8
  end
  object qryPesquisa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       BF.NUMEROPROCESSO,EL.MATRICULA, PE.NOME, BF.DATAEMISSAORE' +
        'CAD, BF.DATALIMITERECAD'
      'FROM PESSOA    PE,'
      '     ELEGPATRO EL,'
      '     BENEFBFCIARIO BF'
      'WHERE (EL.MATRICULA = :MATRICULA)'
      '  AND (EL.IDPESSOA = PE.IDPESSOA)'
      '  AND (PE.IDPESSOA = BF.IDTITULAR)'
      '  AND (BF.IDSITBENEFICIO IN (1,2))'
      '  AND (BF.FLGSTATUS = '#39'P'#39')'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 54
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  BENEFBFCIARIO'
      'SET     DATARECEBRECAD =:DATARECEB,'
      '        FLGSTATUS  = '#39'N'#39
      'WHERE (IDTITULAR   = :IDTITULAR)'
      '  AND (IDPESSOA    = :IDPESSOA)'
      '  AND (IDBENEFICIO = :IDBENEFICIO)'
      '  AND (IDSITBENEFICIO IN (1,2))'
      '  AND (FLGSTATUS   = '#39'P'#39')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 147
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATARECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,'
      '       BT.IDTITULAR,'
      '       BF.IDPESSOA,'
      '       BT.IDRESPONSAVEL,'
      '       BF.IDBENEFICIO,'
      '       PT.NOME AS NOMETITULAR,'
      '       PR.NOME AS NOMERECEBEDOR'
      'FROM PESSOA           PT,'
      '     PESSOA           PR,'
      '     PESSOAFISICA     PF,'
      '     PARTPREVPLAN     PP,'
      '     ELEGPATRO        EL,'
      '     BENEFBFCIARIO    BF,'
      '     BFCIARIOTITPLAN  BT'
      'WHERE PP.IDPESSOA      = EL.IDPESSOA'
      '  AND PP.IDPESSJUR     = EL.IDPESSJUR'
      '  AND PP.FLGDESATIVADO = 0'
      '  AND EL.MATRICULA     = :MATRICULA'
      '  AND PP.IDPLANOPREV   = BF.IDPLANOORIGEM'
      '  AND PP.IDPESSJUR     = BF.IDPESSJUR'
      '  AND PP.SEQPROPOSTA   = BF.SEQPROPOSTA'
      '  AND PP.IDPESSOA      = BF.IDTITULAR'
      '  AND BF.FLGSTATUS     = '#39'P'#39
      '  AND BF.IDPESSJUR     = BT.IDPESSJUR'
      '  AND BF.IDTITULAR     = BT.IDTITULAR'
      '  AND BF.IDPLANOORIGEM = BT.IDPLANOORIGEM'
      '  AND BF.IDPESSOA      = BT.IDPESSOA'
      '  AND BF.SEQPROPOSTA   = BT.SEQPROPOSTA'
      '  AND BF.IDPLANOPREV   = BT.IDPLANOPREV'
      '  AND BF.IDBENEFICIO   = BT.IDBENEFICIO'
      '  AND BT.IDRESPONSAVEL = PF.IDPESSOA'
      '  AND PF.DATANASC      = :DATANASCIMENTO'
      '  AND BT.IDTITULAR     = PT.IDPESSOA'
      '  AND BT.IDRESPONSAVEL = PR.IDPESSOA')
    ValidateWithMask = True
    Left = 336
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATANASCIMENTO'
        ParamType = ptUnknown
      end>
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'LogReceb'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Salvar Log do recebimento'
    Left = 336
    Top = 193
  end
end
