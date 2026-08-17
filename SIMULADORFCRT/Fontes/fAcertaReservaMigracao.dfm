inherited frmAcertaReservaMigracao: TfrmAcertaReservaMigracao
  Left = 120
  Top = 152
  Caption = 'Acerta Reserva da Migração BrTPREV'
  ClientHeight = 456
  ClientWidth = 835
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 835
    Height = 417
    object pnlOpcoes: TPanel
      Left = 1
      Top = 1
      Width = 833
      Height = 40
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 421
        Top = 13
        Width = 164
        Height = 13
        Caption = 'Data Limite para Atualização'
      end
      object cboxIndividual: TCheckBox
        Left = 744
        Top = 11
        Width = 81
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Individual'
        TabOrder = 0
        OnClick = cboxIndividualClick
      end
      object btnAnalise: TButton
        Left = 3
        Top = 3
        Width = 143
        Height = 34
        Hint = 
          'Verifica as pessoas com as reservas 1.01.05, 1.01.06, 3.02.01 e ' +
          '3.02.02 divergentes em relação ao valor da efetivação da migraçã' +
          'o'
        Caption = 'Analisar Reservas'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnAnaliseClick
      end
      object dtDataLimite: TCMDateTimePicker
        Left = 592
        Top = 9
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Date = 38595
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
        Time = 38595
        ShowButton = True
        TabOrder = 2
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 41
      Width = 833
      Height = 375
      ActivePage = tbsHistorico
      Align = alClient
      TabOrder = 1
      object tbsHistorico: TTabSheet
        Caption = 'Histórico'
        object dbgHistorico: TwwDBGrid
          Left = 121
          Top = 0
          Width = 704
          Height = 347
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matrícula'
            'NOME'#9'20'#9'Reserva'
            'MESREFERENCIA'#9'7'#9'Mês'
            'VLRCOTAS'#9'10'#9'v. Cotas'
            'VLRREAL'#9'10'#9'v. Real'
            'VALORINDICE'#9'10'#9'Índice'
            'SALDOCOTAS'#9'10'#9's. Cotas'
            'SALDOREAL'#9'10'#9's. Real')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistorico
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dbgMatricula: TwwDBGrid
          Left = 0
          Top = 0
          Width = 121
          Height = 347
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matrícula'
            'NOME'#9'20'#9'Reserva'
            'MESREFERENCIA'#9'7'#9'Mês'
            'VLRCOTAS'#9'10'#9'v. Cotas'
            'VLRREAL'#9'10'#9'v. Real'
            'VALORINDICE'#9'10'#9'Índice'
            'SALDOCOTAS'#9'10'#9's. Cotas'
            'SALDOREAL'#9'10'#9's. Real')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alLeft
          DataSource = dsMatricula
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taCenter
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
      object tbsPessoas: TTabSheet
        Caption = 'Pessoas'
        ImageIndex = 1
        inline FrameBenef: TfrmFrameListaBenef
          Width = 825
          Height = 347
          Align = alClient
          inherited Panel3: TPanel
            Width = 825
            inherited Dock971: TDock97
              Width = 823
              inherited TB97oKCancelar: TToolbar97
                inherited lblQuant: TLabel
                  Width = 5
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 825
            Height = 313
          end
        end
      end
      object tbserros: TTabSheet
        Caption = 'Erros'
        ImageIndex = 2
        object mmErros: TMemo
          Left = 0
          Top = 0
          Width = 825
          Height = 347
          Align = alClient
          TabOrder = 0
        end
      end
      object tbsNaoAtualiza: TTabSheet
        Caption = 'Não atualiza'
        ImageIndex = 3
        object mmNaoAtualiza: TMemo
          Left = 0
          Top = 0
          Width = 825
          Height = 347
          Align = alClient
          TabOrder = 0
        end
      end
      object tbsAtualiza: TTabSheet
        Caption = 'Atualiza'
        ImageIndex = 4
        object mmAtualiza: TMemo
          Left = 0
          Top = 0
          Width = 825
          Height = 347
          Align = alClient
          TabOrder = 0
        end
      end
      object tbsManual: TTabSheet
        Caption = 'com Registro Manual'
        ImageIndex = 5
        object mmManual: TMemo
          Left = 0
          Top = 0
          Width = 825
          Height = 347
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 835
    inherited tb97Fundo: TToolbar97
      Left = 415
      DockPos = 415
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 228
      DockPos = 228
      inherited ToolbarSep971: TToolbarSep97
        Left = 99
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 99
        Hint = 
          'Atualiza as reservas 1.01.05, 1.01.06, 3.02.01 e 3.02.02 com o v' +
          'alor original da Migração de Plano. Deve-se posteriormente execu' +
          'tar a rotina de reajuste de reservas por índice no Admprev'
        Caption = '&Atualizar'
        Enabled = False
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 102
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 355
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsMatricula: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 9
  end
  object sqlpMatricula: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'TODAS     '#39' AS MATRICULA,'
      '       0 AS IDPESSOA,'
      '       0.0000000000 AS RESERVA16,'
      '       0.0000000000 AS RESERVA17,'
      '       0.0000000000 AS RESERVA41,'
      '       0.0000000000 AS RESERVA42'
      'FROM DUAL'
      ' ')
    ClientDataSet = cdsMatricula
    Left = 425
    Top = 56
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 129
  end
  object sqlpHistorico: TCMSqlParams
    SQL.Strings = (
      'SELECT H.*, R.NOME, E.MATRICULA'
      'FROM HISTMOVRESERVA H, RESERVAXPLANO R, ELEGPATRO E'
      'WHERE R.IDPLANOPREV = H.IDPLANOPREV'
      'AND R.IDTIPORESERVA = H.IDTIPORESERVA'
      'AND E.IDPESSOA = H.IDPESSOA'
      'AND E.IDPESSJUR = H.IDPESSJUR'
      'AND 1 = 2')
    ClientDataSet = cdsHistorico
    Left = 425
    Top = 176
  end
  object dsHistorico: TwwDataSource
    DataSet = cdsHistorico
    Left = 485
    Top = 129
  end
  object dsMatricula: TwwDataSource
    DataSet = cdsMatricula
    Left = 369
    Top = 9
  end
  object qrybrtprev: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 717
    Top = 105
  end
  object qryprevia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 717
    Top = 169
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 717
    Top = 233
  end
  object qryHistReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 717
    Top = 297
  end
  object qryReservaxPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 637
    Top = 105
  end
  object qryIndices: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA, COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :MOECODIGO'
      'AND    COTDATA > :ULTIMADATA'
      'AND    COTDATA <= :DATALIMITE'
      'ORDER BY COTDATA')
    ValidateWithMask = True
    Left = 637
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ULTIMADATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALIMITE'
        ParamType = ptUnknown
      end>
  end
end
