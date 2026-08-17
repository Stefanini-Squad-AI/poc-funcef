inherited frmInterfaceEnvio: TfrmInterfaceEnvio
  Left = 268
  Top = 165
  HelpContext = 320005
  Caption = 'Interface de Envio para a Patrocinadora'
  ClientHeight = 445
  ClientWidth = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    Height = 406
    object Label1: TLabel
      Left = 12
      Top = 44
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label2: TLabel
      Left = 11
      Top = 89
      Width = 91
      Height = 13
      Caption = 'Arquivo Destino'
    end
    object spSelecionarArquivo: TSpeedButton
      Left = 597
      Top = 86
      Width = 22
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = spSelecionarArquivoClick
    end
    object lblDataRef: TLabel
      Left = 345
      Top = 44
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
    end
    object lblDataCobranca: TLabel
      Left = 486
      Top = 44
      Width = 104
      Height = 13
      Caption = 'Data de Cobrança'
    end
    object Label4: TLabel
      Left = 11
      Top = 7
      Width = 98
      Height = 13
      Caption = 'Lay-Out de envio'
    end
    object Label5: TLabel
      Left = 11
      Top = 113
      Width = 98
      Height = 13
      Caption = 'Opções de Envio'
    end
    object pnlGeral: TPanel
      Left = 1
      Top = 131
      Width = 628
      Height = 274
      Align = alBottom
      BevelOuter = bvLowered
      BorderWidth = 6
      TabOrder = 4
      object Splitter1: TSplitter
        Left = 247
        Top = 7
        Width = 3
        Height = 260
        Cursor = crHSplit
        Align = alRight
      end
      object scrlOpcoes: TScrollBox
        Left = 7
        Top = 7
        Width = 240
        Height = 260
        Align = alClient
        Color = clWindow
        ParentColor = False
        TabOrder = 0
        object clbOpcoes: TCheckListBox
          Left = 0
          Top = 0
          Width = 236
          Height = 256
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 13
          Items.Strings = (
            'Benefícios - Auxílio doença'
            'Contribuições Assistenciais'
            'Prestações de Empréstimo'
            'Inscritos'
            'Taxas ou Valores das Contribuições mensais'
            'Desligados')
          TabOrder = 0
        end
      end
      object pgctrlInterface: TPageControl
        Left = 250
        Top = 7
        Width = 371
        Height = 260
        ActivePage = tbsContrib
        Align = alRight
        TabOrder = 1
        object tbsContrib: TTabSheet
          Caption = 'Contribuições'
          object SplitterContrib: TSplitter
            Left = 0
            Top = 126
            Width = 363
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object scrllContrib: TScrollBox
            Left = 0
            Top = 0
            Width = 363
            Height = 126
            Align = alTop
            TabOrder = 0
            object pgctrlPlanos: TPageControl
              Left = 0
              Top = 0
              Width = 359
              Height = 122
              ActivePage = tbsPlanos
              Align = alClient
              TabOrder = 0
              object tbsPlanos: TTabSheet
                Caption = 'Planos'
                object scrlPlanos: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 351
                  Height = 94
                  Align = alClient
                  Color = clWindow
                  ParentColor = False
                  TabOrder = 0
                  object clbPlanos: TCheckListBox
                    Left = 0
                    Top = 4
                    Width = 348
                    Height = 198
                    BorderStyle = bsNone
                    ItemHeight = 13
                    TabOrder = 0
                    OnClick = clbPlanosClick
                    OnKeyDown = clbPlanosKeyDown
                  end
                end
              end
            end
          end
          object scrllContribuicoesPlano: TScrollBox
            Left = 0
            Top = 129
            Width = 363
            Height = 103
            Align = alClient
            TabOrder = 1
            object pgctrlContrib: TPageControl
              Left = 0
              Top = 0
              Width = 359
              Height = 99
              ActivePage = tbsContribuicoesPlano
              Align = alClient
              TabOrder = 0
              object tbsContribuicoesPlano: TTabSheet
                Caption = 'Contribuições do Plano'
                object dbGrdContrib: TwwDBGrid2
                  Left = 0
                  Top = 0
                  Width = 351
                  Height = 71
                  Selected.Strings = (
                    'NOME'#9'60'#9'Nome'
                    'NOMEBASE'#9'60'#9'Valor Base')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsContrib
                  Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ReadOnly = True
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
            end
          end
        end
      end
    end
    object edTxt: TEdit
      Left = 110
      Top = 86
      Width = 482
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'C:\envio.txt'
    end
    object deDataRef: TCMDateTimePicker
      Left = 345
      Top = 59
      Width = 135
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
      TabOrder = 1
    end
    object deDataCob: TCMDateTimePicker
      Left = 486
      Top = 58
      Width = 132
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
      TabOrder = 2
    end
    object dblookupPatrocinadora: TCMDBLookupCombo
      Left = 10
      Top = 59
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblookupPatrocinadoraChange
      OnCloseUp = dblookupPatrocinadoraCloseUp
    end
    object CMDBLookupCombo1: TCMDBLookupCombo
      Left = 11
      Top = 21
      Width = 606
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição do lay-out'#9'F')
      LookupTable = QryLayout
      LookupField = 'IDLAYOUTENVIO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 630
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 247
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
      DockPos = 78
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    FileName = 'Envio.txt'
    Filter = 
      'Arquivos  texto (*.txt)|*.txt|Arquivos DAT (*.dat)|*.dat|Arquivo' +
      's DOC (*.doc)|*.doc|Todos os Arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Seleção de arquivo para Envio'
    OnCanClose = odTxtCanClose
    Left = 552
    Top = 80
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'P.IDPESSOA,'
      #9'P.NOME'
      ''
      'FROM'#9'PESSOA P,'
      #9'PATRO PT'
      'WHERE'#9'(PT.IDPESSOA'#9'= P.IDPESSOA)'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER'#9'BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
      Visible = False
    end
  end
  object qryHeader: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsLayout
    SQL.Strings = (
      'SELECT P.TAMANHO, P.IDENTIFICADOR, P.ORDEM, P.IDCAMPO, C.NOME, '
      '       P.CONTEUDO, P.FORMATO, P.TIPO, P.ORDEM'
      'FROM PARAMENVIO P,'
      '     CAMPOINTERFENVIO C'
      'WHERE '
      '  P.IDLAYOUTENVIO = :IDLAYOUTENVIO'
      'AND P.LINHA = 0'
      'AND P.IDCAMPO = C.IDCAMPO')
    ValidateWithMask = True
    Left = 144
    Top = 280
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  object qryFooter: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsLayout
    SQL.Strings = (
      'SELECT P.TAMANHO, P.IDENTIFICADOR, P.ORDEM, P.IDCAMPO, C.NOME,'
      '       P.CONTEUDO, P.FORMATO, P.TIPO, P.ORDEM'
      'FROM PARAMENVIO P,'
      '     CAMPOINTERFENVIO C'
      'WHERE'
      '  P.IDLAYOUTENVIO = :IDLAYOUTENVIO'
      'AND P.LINHA = 2'
      'AND P.IDCAMPO = C.IDCAMPO'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  object qryIds: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsLayout
    SQL.Strings = (
      'SELECT'#9'DISTINCT'#9'IDENTIFICADOR'
      ''
      'FROM'#9'PARAMENVIO'
      'WHERE'#9
      '  IDLAYOUTENVIO = :IDLAYOUTENVIO'
      ''
      'AND'#9'LINHA'#9#9'=1'
      ''
      'ORDER'#9'BY IDENTIFICADOR'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  object qryDetalhes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'IDCAMPO, TIPO,  CONTEUDO,      FORMATO,'
      #9'TAMANHO, ORDEM, IDENTIFICADOR, FLGSEPARADOR,'
      '        FLGCOMPBRANCOS, FLGVALOR'
      ' '
      'FROM'#9'PARAMENVIO'
      ''
      'WHERE'#9'(IDLAYOUTENVIO'#9'= :IDLAYOUTENVIO)'
      'AND'#9'(IDENTIFICADOR'#9'= :IDENTIFICADOR)'
      ''
      'ORDER'#9'BY'
      #9#9'IDENTIFICADOR,'
      #9#9'ORDEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoReserva: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatro
    SQL.Strings = (
      'SELECT'#9'EL.MATRICULA,'
      #9'PP.INSCRICAONUMERO,'
      #9'RP.VALORRESERVA,'
      #9'R.NOME'
      ''
      'FROM'#9'ELEGPATRO'#9'EL,'
      #9'PARTPREVPLAN'#9'PP,'
      #9'RESERVAPART'#9'RP,'
      #9'RESERVAXPLANO'#9'R'
      ''
      'WHERE'#9'(PP.IDPESSJUR'#9#9'= :IDPESSOA)'
      'AND'#9'(PP.IDPESSOA'#9#9'= EL.IDPESSOA)'
      'AND'#9'(PP.IDPESSJUR'#9#9'= EL.IDPESSJUR)'
      'AND'#9'(RP.IDPESSOA'#9#9'= PP.IDPESSOA)'
      'AND'#9'(RP.IDPLANOPREV'#9'= PP.IDPLANOPREV)'
      'AND'#9'(RP.IDPESSJUR'#9#9'= PP.IDPESSJUR)'
      'AND'#9'(R.IDPLANOPREV'#9#9'= RP.IDPLANOPREV)'
      'AND'#9'(R.IDTIPORESERVA'#9'= RP.IDTIPORESERVA)')
    ValidateWithMask = True
    Left = 144
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatro
    SQL.Strings = (
      'SELECT'#9'PPREVPATRO.IDPLANOPREV,'
      #9'PPREVPATRO.IDPESSJUR,'
      #9'PPREV.NOME'
      #9
      'FROM'#9'PLANPREV'#9'PPREV,'
      #9'PLANPREVPATRO'#9'PPREVPATRO'
      ''
      'WHERE'#9'(PPREV.IDPLANOPREV'#9'= PPREVPATRO.IDPLANOPREV)'
      'AND'#9'(PPREVPATRO.IDPESSJUR'#9'= :IDPESSOA)'
      ''
      'ORDER'#9'BY PPREV.NOME'
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPlanosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVPATRO.IDPLANOPREV'
      Visible = False
    end
    object qryPlanosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'PLANPREVPATRO.IDPESSJUR'
      Visible = False
    end
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 24
    Top = 232
  end
  object dsPlanos: TwwDataSource
    DataSet = qryPlanos
    Left = 88
    Top = 304
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPlanos
    SQL.Strings = (
      'SELECT'#9'C.NOME,'
      #9'C.IDCONTRIBUICAO,'
      #9'CONTPREV.VALORBASETAXA AS VALORBASE,'
      #9'DECODE(CONTPREV.VALORBASETAXA'#9', 1, CONTPREV.NOMEVALORBASE1,'
      #9'           2, CONTPREV.NOMEVALORBASE2,'
      #9#9'  3, CONTPREV.NOMEVALORBASE3)'
      #9'AS NOMEBASE , NVL(CP.FLGTPVLR,'#39'N'#39') FLGTPVLR'
      ''
      'FROM'#9'CONTRIBUICAO'#9'C,'
      #9'CONTPREV'#9'CONTPREV    ,'
      '        CONTPLANPATRO  CP'
      ''
      'WHERE'#9'(CONTPREV.IDCONTRIBUICAO'#9'= C.IDCONTRIBUICAO)'
      'AND'#9'(CONTPREV.IDPLANOPREV'#9#9'= :IDPLANOPREV)'
      'AND'#9'(CONTPREV.FLGDESCFOLHA'#9'= 1)'
      'AND     (CP.IDPLANOPREV  = CONTPREV.IDPLANOPREV  )'
      'AND     (CP.IDCONTRIBUICAO = CONTPREV.IDCONTRIBUICAO )'
      'AND     (CP.IDPESSJUR =  :IDPESSJUR  )'
      'ORDER'#9'BY C.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryContribNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'CONTRIBUICAO.NOME'
      Size = 60
    end
    object qryContribNOMEBASE: TStringField
      DisplayLabel = 'Valor Base'
      DisplayWidth = 60
      FieldName = 'NOMEBASE'
      Size = 60
    end
    object qryContribVALORBASE: TFloatField
      FieldName = 'VALORBASE'
      Visible = False
    end
    object qryContribIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryContribFLGTPVLR: TStringField
      FieldName = 'FLGTPVLR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsContrib: TwwDataSource
    DataSet = qryContrib
    Left = 200
    Top = 304
  end
  object qryOpcoes: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPlanos
    SQL.Strings = (
      'SELECT IDPLANOPREV,         MATRICULA, '
      '       INSCRICAONUMERO,              '
      
        '       NVL(VALORBASE1,0) AS VALORBASE1,  NVL(VALORBASE2,0) AS VA' +
        'LORBASE2, NVL(VALORBASE3, 0) AS VALORBASE3, '
      '       FLGDESCONTO,          '
      '       CODPROVDESC,         FLGINTEVENTO, '
      '       IDPESSOA,            SEQPROPOSTA, '
      
        '       IDDESCONTO,          MAX(MESREFERENCIA) AS MESREFERENCIA,' +
        ' SUM(VALOR) AS VALOR, '
      '       PARCELA,             NUMPARCELAS'
      '       ,FLGTIPODESC , VALORINFO, SYSDATE AS DATAINICIO'
      'FROM   TMPDESC'
      'WHERE  FLGDESCFOLHA = '#39'P'#39
      'AND MESCOBRANCA = '#39'2002/09'#39
      'AND FLGTIPODESC IN ('#39'A'#39')'
      
        ' AND ((FLGTIPODESC <> '#39'P'#39') OR (EXISTS (SELECT 1 FROM CONTPLANPAT' +
        'RO                                           WHERE IDPLANOPREV =' +
        ' TMPDESC.IDPLANOPREV                                           A' +
        'ND IDCONTRIBUICAO = TMPDESC.IDDESCONTO                          ' +
        '                 AND IDPESSJUR = TMPDESC.IDPESSJUR              ' +
        '                                   AND FLGTPVLR IN ('#39'V'#39','#39'B'#39') )))'
      'AND IDPESSJUR   = 99'
      'AND IDPLANOPREV = 99'
      'GROUP BY IDPLANOPREV,      MATRICULA, '
      
        '         INSCRICAONUMERO,  NVL(VALORBASE1,0),   NVL(VALORBASE2,0' +
        '),   NVL(VALORBASE3,0), '
      
        '         FLGDESCONTO,      CODPROVDESC, FLGINTEVENTO,           ' +
        '  '
      
        '         IDPESSOA,         SEQPROPOSTA, IDDESCONTO,             ' +
        '  '
      '       PARCELA,             NUMPARCELAS'
      '       ,FLGTIPODESC, VALORINFO ')
    ValidateWithMask = True
    Left = 80
    Top = 232
    object qryOpcoesIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryOpcoesMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryOpcoesINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryOpcoesVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryOpcoesVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryOpcoesVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qryOpcoesFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryOpcoesCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryOpcoesFLGINTEVENTO: TStringField
      FieldName = 'FLGINTEVENTO'
      FixedChar = True
      Size = 2
    end
    object qryOpcoesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryOpcoesSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryOpcoesIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryOpcoesMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryOpcoesVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '######.00'
    end
    object qryOpcoesFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryOpcoesPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qryOpcoesNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryOpcoesVALORINFO: TFloatField
      FieldName = 'VALORINFO'
    end
    object qryOpcoesDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
  end
  object QryLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  L.IDLAYOUTENVIO, L.DESCRICAO'
      'FROM'
      '  LAYOUTENVIO L'
      'ORDER BY'
      '  L.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 320
  end
  object DsLayout: TwwDataSource
    DataSet = QryLayout
    Left = 24
    Top = 304
  end
end
