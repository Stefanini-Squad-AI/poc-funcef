inherited FrmAlteracaoLoteDataVencimento: TFrmAlteracaoLoteDataVencimento
  Left = 401
  Top = 142
  Caption = 'Alteração em Lote da Data de Vencimento '
  ClientHeight = 431
  ClientWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 713
    Height = 392
    object Label2: TLabel
      Left = 16
      Top = 13
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object Label1: TLabel
      Left = 457
      Top = 363
      Width = 139
      Height = 13
      Caption = 'Alterar Data Vencimento'
    end
    object gBarradeProgresso: TGauge
      Left = 16
      Top = 360
      Width = 433
      Height = 20
      Progress = 0
      Visible = False
    end
    object edtArquivo: TEdit
      Left = 120
      Top = 11
      Width = 526
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnAbreArquivo: TBitBtn
      Left = 649
      Top = 9
      Width = 24
      Height = 22
      Hint = 'Seleciona o arquivo para gravação do log de exceções.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAbreArquivoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000008888888888888888880000008888888888888888880000008800
        00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
        000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
        8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
        BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
        0000880000088888888888000000888888888888888888000000888888888888
        888888000000888888888888888888000000}
    end
    object btnLimpaArquivo: TBitBtn
      Left = 673
      Top = 9
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnLimpaArquivoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object memArquivo: TMemo
      Left = 16
      Top = 35
      Width = 681
      Height = 318
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'Estrutura necessária para importação dos dados:'
        
          '----------------------------------------------------------------' +
          '---------------------------------------------------------'
        '- Primeira linha será desconsiderada (cabeçalho)'
        '- Primeira coluna deve ter valor'
        
          '- As informações abaixo são obrigatórias, e as colunas devem est' +
          'ar nomeadas conforme o indicado:'
        ''
        'Contrato........... IDCONTRATOEMPTMO ou CONTRATO'
        'Item.................. IDITEM ou  ITEM'
        'Data Prevista... DATAPREVISTA ou DATA PREVISTA')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edtDataVencimento: TCMDateTimePicker
      Left = 600
      Top = 360
      Width = 97
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 713
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Confirmar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = btnLimpaArquivoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 27
    TargetsData = (
      1
      5
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 91
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 432
    Top = 91
  end
  object OpenDialog: TOpenDialog
    Left = 448
    Top = 160
  end
  object qryUpdate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 155
  end
  object qryInsert: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 123
  end
  object tblArquivo: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FileName = 'C:\ProjetosCM7\CAF\Extras\Coletor CMNET\Enviados\LOCAIS.csv'
    Schema.Strings = (
      'Matricula'
      'Contrato '
      'Nome '
      'Matricula'
      'CPF'
      'DataAssinatura '
      'TaxaJuros'
      'SaldoVincendoAnterior'
      'SaldoVincendoUltimo '
      'SaldoVencidoAnterior '
      'SaldoVencidoUltimo'
      'PagosUltimoPrestacao '
      'PagosUltimoQuitacao '
      'TotalPagoUltimo ')
    Delimiter = ','
    FirstLineAsSchema = True
    Left = 392
    Top = 8
  end
  object QryConsulta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 400
    Top = 187
  end
end
