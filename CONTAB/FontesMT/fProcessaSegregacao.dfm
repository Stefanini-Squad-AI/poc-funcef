inherited frmProcessaSegregacao: TfrmProcessaSegregacao
  Left = 103
  Top = 55
  HelpContext = 10146
  Caption = 'Processa Segregação de Recursos'
  ClientHeight = 331
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 292
    inherited PagControle: TPageControl
      Width = 630
      Height = 290
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 622
          Caption = 'Segregação de Recursos [ Seleção ]'
        end
        object Label3: TLabel
          Left = 5
          Top = 39
          Width = 55
          Height = 13
          Caption = 'Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 109
          Top = 39
          Width = 46
          Height = 13
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 280
          Top = 39
          Width = 101
          Height = 13
          Caption = 'Data Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 137
          Width = 142
          Height = 13
          Caption = 'Critério para Segregação'
        end
        object dblkExerc: TwwDBLookupCombo
          Left = 5
          Top = 55
          Width = 89
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          LookupTable = cdsExercicio
          LookupField = 'PEREXERCICIO'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblkExercChange
          OnCloseUp = dblkExercCloseUp
        end
        object dblkPeriodo: TwwDBLookupCombo
          Left = 110
          Top = 55
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PERNOME'#9'25'#9'PERNOME')
          LookupTable = CdsPeriodo
          LookupField = 'PERNUMERO'
          Style = csDropDownList
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblkPeriodoChange
          OnCloseUp = dblkPeriodoCloseUp
          OnEnter = dblkPeriodoEnter
        end
        object edDataProc: TCMDateTimePicker
          Left = 280
          Top = 55
          Width = 103
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
          Enabled = False
          ShowButton = True
          TabOrder = 2
        end
        object dbCboSegregaCriter: TwwDBLookupCombo
          Left = 7
          Top = 152
          Width = 378
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          LookupTable = cdsSegregaCriter
          LookupField = 'IDSEGREGACRITER'
          Options = [loColLines]
          DropDownCount = 5
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object cmContaSegreg: TCMProcuraMaskContabil
          Left = 6
          Top = 193
          Width = 379
          Height = 69
          Caption = ' Conta para Ajuste Contábil da Segregação'
          TabOrder = 5
          MostraMensagens = True
          MostraDescricao = True
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          Mensagens.Sintetica = 'Chave não pode ser sintética'
          Mensagens.Analitica = 'Chave não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scSoAtiva
        end
        object Panel1: TPanel
          Left = 392
          Top = 24
          Width = 230
          Height = 256
          Align = alRight
          BevelOuter = bvLowered
          TabOrder = 6
          object chkExclui: TCheckBox
            Left = 8
            Top = 32
            Width = 190
            Height = 17
            Caption = 'Exclui processamento anterior'
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 0
          end
          object ChkProcessa: TCheckBox
            Left = 8
            Top = 88
            Width = 182
            Height = 17
            Caption = 'Processa Segregação'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkIgnoraProvaZero: TCheckBox
            Left = 8
            Top = 144
            Width = 209
            Height = 17
            Caption = 'Ignora Crítica Regra Prova Zero'
            TabOrder = 2
          end
        end
        object rdgPlano: TRadioGroup
          Left = 8
          Top = 89
          Width = 377
          Height = 36
          Caption = ' Plano a Segregar '
          Columns = 2
          Items.Strings = (
            'Comum'
            'Administrativo')
          TabOrder = 3
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 622
          Caption = 'Segregação de Recursos [ Resultados ]'
        end
        object meErros: TwwDBRichEdit
          Left = 0
          Top = 24
          Width = 622
          Height = 256
          Align = alClient
          AutoURLDetect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 0
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            730000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 292
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 220
      inherited sep1: TToolbarSep97
        Left = 325
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 83
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 219
      end
      inherited bbtnSair: TBitBtn
        Left = 244
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 327
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 85
        Caption = 'Confirmar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 166
        Width = 53
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 40
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 40
  end
  object cdsSegregaCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 53
    Top = 152
  end
  object sqlProvaZero: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+RULE*/'
      '   DISTINCT PLNCODIGO'
      'FROM'
      '(SELECT'
      
        '  P.PLNCODIGO, L.IDSEGREGACRITER, L.DATASEGREGACRITER, L.IDPLANO' +
        'PREV, L.IDPATRO,'
      
        '  SUM (DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, L.LACVALOR*(-1))) AS' +
        ' TOT_SALDO'
      'FROM'
      '  LANCAMENTO L, PLANILHA P '
      'WHERE'
      '  P.PEREXERCICIO = :PEREXERCICIO'
      '  AND P.PERNUMERO = :PERNUMERO'
      '  AND L.PLNCODIGO = P.PLNCODIGO'
      'GROUP BY'
      
        '  P.PLNCODIGO, L.IDSEGREGACRITER, L.DATASEGREGACRITER, L.IDPLANO' +
        'PREV, L.IDPATRO'
      'HAVING '
      
        '  SUM (DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, L.LACVALOR*(-1))) <>' +
        ' 0 )'
      ' ')
    ClientDataSet = cdsProvaZero
    Left = 537
    Top = 27
  end
  object PopupMenu1: TPopupMenu
    Left = 545
    Top = 227
    object mnuSalvar: TMenuItem
      Caption = 'Salvar'
      OnClick = mnuSalvarClick
    end
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirClick
    end
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 537
    Top = 104
  end
  object cdsProvaZero: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 8
    Data = {
      390000009619E0BD010000001800000001000000000003000000390009504C4E
      434F4449474F08000400000000000100044C4349440400010009080000}
  end
  object sqlContaSegrega: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+RULE*/ DISTINCT'
      '  L.PLACONTA, '#39'                  '#39' AS SEGREGACONTA'
      'FROM'
      '  LANCAMENTO L, PLANILHA P'
      'WHERE'
      '  L.IDPLANOPREV = :IDPLANOPREV'
      '  AND L.IDPATRO = :IDPATRO'
      '  AND L.IDSEGREGACRITER IS NOT NULL'
      '  AND P.PEREXERCICIO = :PEREXERCICIO'
      '  AND P.PERNUMERO = :PERNUMERO'
      '  AND L.PLNCODIGO = P.PLNCODIGO'
      '  AND L.IDSEGREGACONTR IS NULL'
      'ORDER BY'
      '  L.PLACONTA'
      ''
      ''
      ' ')
    ClientDataSet = cdsContaSegrega
    Left = 457
    Top = 27
  end
  object cdsContaSegrega: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 457
    Top = 11
  end
  object CdsSegregaCriterSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 152
  end
end
