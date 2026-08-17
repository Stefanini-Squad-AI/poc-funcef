inherited frmCadRegHon: TfrmCadRegHon
  Left = 25
  Top = 83
  HelpContext = 1110016
  Caption = 'Registro de Honorários do Processo'
  ClientHeight = 461
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 375
    inherited pnlMestre: TPanel
      Width = 742
      object Label1: TLabel
        Left = 9
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label30: TLabel
        Left = 257
        Top = 4
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      object Label2: TLabel
        Left = 9
        Top = 55
        Width = 118
        Height = 13
        Caption = 'Data do Ajuizamento'
      end
      object Label19: TLabel
        Left = 138
        Top = 55
        Width = 115
        Height = 13
        Caption = 'Data da Notificação'
      end
      object dbedNumero: TDBEdit
        Left = 9
        Top = 19
        Width = 120
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NUMPROCTRAB'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object rgSituacao: TDBRadioGroup
        Left = 138
        Top = 4
        Width = 115
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Aberto'
          'Encerrado')
        ReadOnly = True
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object dbedNumJCJ: TDBEdit
        Left = 257
        Top = 19
        Width = 148
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PROCJCJNUM'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbrgMateria: TDBRadioGroup
        Left = 411
        Top = 4
        Width = 320
        Height = 35
        Caption = 'Matéria'
        Columns = 4
        DataField = 'INDMATERIA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Civil'
          'Comercial'
          'Tributária'
          'Penal')
        ReadOnly = True
        TabOrder = 3
        Values.Strings = (
          '4'
          '5'
          '6'
          '7'
          ''
          '')
      end
      object dbedDataAju: TCMDateTimePicker
        Left = 9
        Top = 70
        Width = 120
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
        ButtonStyle = cbsCustom
        DataField = 'DATAJUIZO'
        DataSource = ds
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
        ReadOnly = True
        ShowButton = True
        TabOrder = 4
      end
      object dbedDataNot: TCMDateTimePicker
        Left = 138
        Top = 70
        Width = 115
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
        ButtonStyle = cbsCustom
        DataField = 'DATANOTIF'
        DataSource = ds
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
        ReadOnly = True
        ShowButton = True
        TabOrder = 5
      end
      object rgAtivo: TDBRadioGroup
        Left = 257
        Top = 54
        Width = 148
        Height = 37
        Caption = 'Somos a Parte'
        Columns = 2
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Ativa'
          'Passiva')
        ReadOnly = True
        TabOrder = 6
        Values.Strings = (
          '1'
          '0')
      end
      object CMProcuraRequerente: TCMProcuraSubTipo
        Left = 411
        Top = 44
        Width = 320
        Height = 50
        Caption = 'Contraparte'
        Enabled = False
        TabOrder = 7
        CampoEdit = ceRazaoSocial
        MostraMensagens = False
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stFornecedor
        FiltraSubTipo = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 742
      Height = 267
      Tabs.Strings = (
        'Honorários Pagos'
        'Contabilização e Contas a Pagar')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 644
        Height = 208
        inherited tbsDet: TTabSheet
          Caption = 'Honorários Pagos'
          inherited dbgrdDet: TwwDBGrid
            Width = 636
            Height = 180
            Selected.Strings = (
              'DATAPAGTOHONOR'#9'10'#9'Data de Pagamento'
              'NOME'#9'60'#9'Favorecido'
              'VALORHONOR'#9'10'#9'Valor')
          end
          inherited pnlControlesDet: TPanel
            Width = 636
            Height = 180
            object Label5: TLabel
              Left = 10
              Top = 36
              Width = 95
              Height = 13
              Caption = 'Data Pagamento'
            end
            object Label7: TLabel
              Left = 127
              Top = 36
              Width = 64
              Height = 13
              Caption = 'Favorecido'
            end
            object Label8: TLabel
              Left = 486
              Top = 36
              Width = 107
              Height = 13
              Caption = 'Valor do Honorário'
            end
            object dbedDataPgto: TCMDateTimePicker
              Left = 10
              Top = 51
              Width = 95
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPAGTOHONOR'
              DataSource = dsDet
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
              TabOrder = 0
            end
            object dblcFavor: TwwDBLookupCombo
              Left = 127
              Top = 51
              Width = 340
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDFORNSERV'
              DataSource = dsDet
              LookupTable = qryAdvog
              LookupField = 'IDPESSOA'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedValHon: TDBRealEdit
              Left = 488
              Top = 51
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORHONOR'
              DataSource = dsDet
            end
          end
        end
        object tbshCAP: TTabSheet
          Caption = 'Contabilização e Contas a Pagar'
          object gbxCAP: TGroupBox
            Left = 10
            Top = 70
            Width = 620
            Height = 60
            TabOrder = 0
            object Label47: TLabel
              Left = 16
              Top = 15
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object Label48: TLabel
              Left = 321
              Top = 15
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object dblcTipoDoc: TwwDBLookupCombo
              Left = 16
              Top = 29
              Width = 280
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoDoc
              LookupField = 'CODTIPDOC'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcTipoDesemb: TwwDBLookupCombo
              Left = 321
              Top = 29
              Width = 280
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoDesemb
              LookupField = 'CODTIPRECDES'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
          object gbxContabilizacao: TGroupBox
            Left = 10
            Top = 8
            Width = 620
            Height = 53
            Caption = 'Tipo de Operação (Contabilização)'
            TabOrder = 1
            object dblcTipOper: TwwDBLookupCombo
              Left = 122
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              LookupTable = qryTipoOper
              LookupField = 'TIPCODIGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 734
      end
      inherited Dock974: TDock97
        Left = 648
        Height = 208
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 752
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT * FROM PROCESSOTRAB'
      'WHERE NUMPROCTRAB = :NumProcTrab')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryHonor
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  NUMPROCTRAB = :NUMPROCTRAB,'
      '  IDRECLAMANTE = :IDRECLAMANTE,'
      '  IDADVOGRECTE = :IDADVOGRECTE,'
      '  CODTIPOSENT = :CODTIPOSENT,'
      '  CODIGOTRT = :CODIGOTRT,'
      '  JCJ = :JCJ,'
      '  QTDERECTES = :QTDERECTES,'
      '  DATANOTIF = :DATANOTIF,'
      '  DATAPOST = :DATAPOST,'
      '  PROCTRTNUM = :PROCTRTNUM,'
      '  PROCTSTNUM = :PROCTSTNUM,'
      '  DATAPREVENCER = :DATAPREVENCER,'
      '  DATAEFETENC = :DATAEFETENC,'
      '  CUSTOPROC = :CUSTOPROC,'
      '  TIPOENCER = :TIPOENCER,'
      '  FLGSITPROC = :FLGSITPROC,'
      '  QTDEPARCACOR = :QTDEPARCACOR,'
      '  IDADVOGRECDA = :IDADVOGRECDA,'
      '  IDASSISTTECN = :IDASSISTTECN,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  PROCJCJNUM = :PROCJCJNUM,'
      '  IDTIPOPROC = :IDTIPOPROC,'
      '  INDMATERIA = :INDMATERIA,'
      '  IDENTPASTA = :IDENTPASTA,'
      '  DATAJUIZO = :DATAJUIZO,'
      '  IDTIPOACAO = :IDTIPOACAO,'
      '  IDVARAJUSTICA = :IDVARAJUSTICA,'
      '  IDCIDADES = :IDCIDADES,'
      '  IDADVOGCASA = :IDADVOGCASA,'
      '  FLGPARTEATIVA = :FLGPARTEATIVA,'
      '  IDLITISCONSORTE = :IDLITISCONSORTE,'
      '  IDPROCVINCULADO = :IDPROCVINCULADO,'
      '  FLGVINCULADO = :FLGVINCULADO,'
      '  DESPESAPROC = :DESPESAPROC,'
      '  NUMVARAJUSTICA = :NUMVARAJUSTICA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      
        '  (NUMPROCTRAB, IDRECLAMANTE, IDADVOGRECTE, CODTIPOSENT, CODIGOT' +
        'RT, JCJ, '
      
        '   QTDERECTES, DATANOTIF, DATAPOST, PROCTRTNUM, PROCTSTNUM, DATA' +
        'PREVENCER, '
      
        '   DATAEFETENC, CUSTOPROC, TIPOENCER, FLGSITPROC, QTDEPARCACOR, ' +
        'IDADVOGRECDA, '
      
        '   IDASSISTTECN, TRGDTINCLUSAO, TRGUSERINCLUSAO, PROCJCJNUM, IDT' +
        'IPOPROC, '
      
        '   INDMATERIA, IDENTPASTA, DATAJUIZO, IDTIPOACAO, IDVARAJUSTICA,' +
        ' IDCIDADES, '
      
        '   IDADVOGCASA, FLGPARTEATIVA, IDLITISCONSORTE, IDPROCVINCULADO,' +
        ' FLGVINCULADO, '
      '   DESPESAPROC, NUMVARAJUSTICA)'
      'values'
      
        '  (:NUMPROCTRAB, :IDRECLAMANTE, :IDADVOGRECTE, :CODTIPOSENT, :CO' +
        'DIGOTRT, '
      
        '   :JCJ, :QTDERECTES, :DATANOTIF, :DATAPOST, :PROCTRTNUM, :PROCT' +
        'STNUM, '
      
        '   :DATAPREVENCER, :DATAEFETENC, :CUSTOPROC, :TIPOENCER, :FLGSIT' +
        'PROC, :QTDEPARCACOR, '
      
        '   :IDADVOGRECDA, :IDASSISTTECN, :TRGDTINCLUSAO, :TRGUSERINCLUSA' +
        'O, :PROCJCJNUM, '
      
        '   :IDTIPOPROC, :INDMATERIA, :IDENTPASTA, :DATAJUIZO, :IDTIPOACA' +
        'O, :IDVARAJUSTICA, '
      
        '   :IDCIDADES, :IDADVOGCASA, :FLGPARTEATIVA, :IDLITISCONSORTE, :' +
        'IDPROCVINCULADO, '
      '   :FLGVINCULADO, :DESPESAPROC, :NUMVARAJUSTICA)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      '')
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA (+)'
      'PROCESSOTRAB.INDMATERIA       > 3')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    Left = 557
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryHonor: TwwQuery
    CachedUpdates = True
    AfterInsert = qryHonorAfterInsert
    BeforeEdit = qryHonorBeforeEdit
    BeforePost = qryHonorBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select H.NUMPROCTRAB, H.DATAPAGTOHONOR,H.IDFORNSERV, '
      '           H.VALORHONOR, P.NOME'
      'from PESSOA P, HONORARIOS H'
      'where (H.NUMPROCTRAB = :NUMPROC)'
      'and     (P.IDPESSOA = H.IDFORNSERV)'
      'order by H.NUMPROCTRAB, H.DATAPAGTOHONOR,H.IDFORNSERV')
    UpdateObject = UpdHonor
    ValidateWithMask = True
    Left = 415
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
    object qryHonorNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Origin = 'HONORARIOS.NUMPROCTRAB'
    end
    object qryHonorDATAPAGTOHONOR: TDateTimeField
      FieldName = 'DATAPAGTOHONOR'
      Origin = 'HONORARIOS.DATAPAGTOHONOR'
    end
    object qryHonorIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = 'HONORARIOS.IDFORNSERV'
    end
    object qryHonorVALORHONOR: TFloatField
      FieldName = 'VALORHONOR'
      Origin = 'HONORARIOS.VALORHONOR'
      DisplayFormat = '###,###,##0.00'
    end
    object qryHonorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
  object UpdHonor: TUpdateSQL
    ModifySQL.Strings = (
      'update HONORARIOS'
      'set'
      '  NUMPROCTRAB = :NUMPROCTRAB,'
      '  DATAPAGTOHONOR = :DATAPAGTOHONOR,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  VALORHONOR = :VALORHONOR'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  DATAPAGTOHONOR = :OLD_DATAPAGTOHONOR and'
      '  IDFORNSERV = :OLD_IDFORNSERV')
    InsertSQL.Strings = (
      'insert into HONORARIOS'
      '  (NUMPROCTRAB, DATAPAGTOHONOR, IDFORNSERV, VALORHONOR)'
      'values'
      '  (:NUMPROCTRAB, :DATAPAGTOHONOR, :IDFORNSERV, :VALORHONOR)')
    DeleteSQL.Strings = (
      'delete from HONORARIOS'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  DATAPAGTOHONOR = :OLD_DATAPAGTOHONOR and'
      '  IDFORNSERV = :OLD_IDFORNSERV')
    Left = 465
    Top = 8
  end
  object qryAdvog: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME'
      'from PESSOA,PROCESSOTRAB '
      'where NUMPROCTRAB = :NUMPROC AND'
      '((IDPESSOA = IDADVOGRECDA) OR'
      '(IDPESSOA = IDASSISTTECN))'
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 498
    Top = 141
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,  DESCRICAO, PLACONTACREDITO, PLANO,'
      '               PLACONTA'
      'FROM TIPORECEBDESEMB '
      'WHERE (ANASINT  = '#39'A'#39') AND '
      '      (RECPAG   = '#39'P'#39')'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 488
    Top = 318
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  (RECPAG = '#39'P'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 488
    Top = 334
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.CODDOCUMENTO, D.PLANO, D.PLACONTA, L.PLNCODIGO, L.NUMLANCTO,'
      
        '  R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES, R.VALOR, D.COD' +
        'PORTFORMA,'
      '  L.DEBCRE, 1 PORTFORMAPARTICIP, R.CODCENTROCUSTO, D.RECPAG'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO)  AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      'ORDER BY'
      '  D.PLACONTA, R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 487
    Top = 347
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'DOCUMENTO.CODPORTFORMA'
    end
    object qryDocumentosDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'LANCTODOCUM.DEBCRE'
      Size = 1
    end
    object qryDocumentosPORTFORMAPARTICIP: TFloatField
      FieldName = 'PORTFORMAPARTICIP'
    end
    object qryDocumentosCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryDocumentosRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  PORTFORMAPARTICIP = :PORTFORMAPARTICIP,'
      '  RECPAG = :RECPAG'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      '   CODTIPRECDES, VALOR, PORTFORMAPARTICIP, RECPAG)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      
        '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :PORTFORMAPARTICIP, ' +
        ':RECPAG)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 487
    Top = 360
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 607
    Top = 188
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 37
    Top = 219
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TIPCODIGO,'
      '  TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY UPPER(TIPDESCRICAO)')
    ValidateWithMask = True
    Left = 569
    Top = 248
  end
end
